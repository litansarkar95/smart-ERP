<?php
class Sales extends MX_Controller
{
  public function __construct() {
    parent::__construct();
       $this->load->model("sales_model");
 
}
public function index()
{
 
    $data                 = array();
    $data['active']       = "sales";
    $data['title']        = "Sales List"; 
    $data['allPdt']       = $this->sales_model->getSalesList();
    $data['content']      = $this->load->view("sales-list", $data, TRUE);
    $this->load->view('layout/master', $data);
 }
 
 public function create()
{

  
  $this->form_validation->set_rules("totalAmount", "Total Amount", "required");
  $this->form_validation->set_rules("sales_date", "Sales date", "required");
  $this->form_validation->set_rules("customer_id", "Customer Name", "required");

  if ($this->form_validation->run() == NULL) {
  
  } else {

    //table list
    #####
    #purchase , sales_invoice, purchase_items,purchase_item_serials
    #inv_stock_master ,inv_stock_item_serial, inv_stock_history,
    #acc_general_ledger,business_partner
    #
  $invoice_code   = $this->common_model->xss_clean($this->input->post("invoice_id"));
        $store_id       = $this->common_model->xss_clean($this->input->post("store_id"));
        $branch_id      = $this->session->userdata("loggedin_branch_id");

        $int_no = $this->sales_model->number_generator();
        $invoice_no = 'INV-'.str_pad($int_no,4,"0",STR_PAD_LEFT);

        // Handle customer
        $save_customer = $this->common_model->xss_clean($this->input->post("save_customer"));
        if($save_customer == 1){
            $date = date("Y-m-d H:i:s");
            $data_custome = array(
                "organization_id"   => $this->session->userdata('loggedin_org_id'),
                "name"              => $this->common_model->xss_clean($this->input->post("customer_name")),
                "partner_type"      => "Both",
                "contact_no"        => $this->common_model->xss_clean($this->input->post("mobile_no")),
                "address"           => $this->common_model->xss_clean($this->input->post("address")),
                "customer_group_id" => $this->common_model->xss_clean($this->input->post("customer_group_id")),
                "is_active"         => 1,
                "create_user"       => $this->session->userdata('loggedin_id'),
                "create_date"       => strtotime($date),
            );
            if($this->common_model->save_data("business_partner", $data_custome)){
                $customer_id = $this->common_model->Id;
            }
        } else {
            $customer_id = $this->common_model->xss_clean($this->input->post("customer_id"));
        }

        $date = date("Y-m-d H:i:s");

        // Save main sales record
        $data = array(
            "organization_id"  => $this->session->userdata('loggedin_org_id'),
            "branch_id"        => $branch_id,
            "invoice_code"     => $invoice_code,
            "code_random"      => $int_no,
            "invoice_no"       => $invoice_no,
            "sales_date"       => strtotime($this->common_model->xss_clean($this->input->post("sales_date"))),
            "customer_id"      => $customer_id,
            "store_id"         => $store_id,
            "totalQty"         => $this->common_model->xss_clean($this->input->post("totalOrder")),
            "subTotal"         => $this->common_model->xss_clean($this->input->post("subtotalAmount")),
            "total_discount"   => $this->common_model->xss_clean($this->input->post("totalDiscount")),
            "adjustment"       => $this->common_model->xss_clean($this->input->post("adjustment")),
            "payableAmount"    => $this->common_model->xss_clean($this->input->post("payableAmount")),
            "dueAmount"        => $this->common_model->xss_clean($this->input->post("dueAmount")),
            "paidAmount"       => $this->common_model->xss_clean($this->input->post("paidAmount")),
            "payment_method_id"=> $this->common_model->xss_clean($this->input->post("payment_method_id")),
            "next_due_paid_date"=> strtotime($this->common_model->xss_clean($this->input->post("due_paid_date"))),
            "is_customer"      => $save_customer,
            "customer_name"    => $this->common_model->xss_clean($this->input->post("customer_name")),
            "mobile_no"        => $this->common_model->xss_clean($this->input->post("mobile_no")),
            "address"          => $this->common_model->xss_clean($this->input->post("address")),
            "is_active"        => 1,
            "create_user"      => $this->session->userdata('loggedin_id'),
            "create_date"      => strtotime($date),
        );

        if($this->common_model->save_data("sales", $data)){
            $sales_id = $this->common_model->Id;

            // Approve invoice
            $this->db->where('invoice_code', $invoice_code)->update('sales_invoice', ['status'=>'Approved']);
            $this->db->where('invoice_id', $invoice_code)->update('sales_order_items', ['status'=>'Approved']);

            // Get items from sales order
            $items = $this->sales_model->get_items_by_invoice($invoice_code);

            foreach($items as $item){
                // Save each sales_item
                $pdata = array(
                    "organization_id" => $this->session->userdata('loggedin_org_id'),
                    "branch_id"       => $branch_id,
                    "sales_id"        => $sales_id,
                    "store_id"        => $store_id,
                    "serial_type"     => $item->serial_type,
                    "product_id"      => $item->product_id,
                    "purchase_price"  => $item->purchase_price,
                    "price"           => $item->price,
                    "qty"             => $item->qty,
                    "sub_total"       => $item->sub_total,
                    "discount_percent"=> $item->discount_percent,
                    "discount_amount" => $item->discount_amount,
                    "net_total"       => $item->net_total,
                    "warrenty"        => $item->warrenty,
                    "warrenty_days"   => $item->warrenty_days,
                    "status"          => 'Approved',
                    "create_user"     => $this->session->userdata('loggedin_id'),
                    "create_date"     => strtotime($date),
                );
                $this->common_model->save_data("sales_items", $pdata);
                $sales_item_id = $this->common_model->Id;

                // =======================
                // Common items: Batch FIFO
                // =======================
                if($item->serial_type == 'common'){
                    $sell_qty = $item->qty;
                    $sales_price = $item->price;
                    $discount_amount = $item->discount_amount;

                    $this->db->where('store_id', $store_id);
                    $this->db->where('product_id', $item->product_id);
                    $this->db->where('is_available', 1);
                    $this->db->order_by('id', 'ASC'); // FIFO
                    $batches = $this->db->get('inv_stock_item_batch')->result();

                    foreach($batches as $batch){
                        if($sell_qty <= 0) break;
                        if($batch->quanity <= 0) continue;

                        $deduct = min($sell_qty, $batch->quanity);
                        $purchase_price = $batch->purchase_price;
                       
                        $profit_per_unit =  ( $sales_price - $purchase_price );
                        $total_profit = ( $profit_per_unit * $deduct )  -  $discount_amount;

                        // Save profit/loss
                        $profit_data = array(
                            "organization_id" => $this->session->userdata('loggedin_org_id'),
                            "branch_id"       => $branch_id,
                            "sales_id"        => $sales_id,
                            "sales_item_id"   => $sales_item_id,
                            "product_id"      => $item->product_id,
                            "batch_id"        => $batch->id,
                            "batch_number"    => $batch->batch_number,
                            "qty_sold"        => $deduct,
                            "purchase_price"  => $purchase_price,
                            "sales_price"     => $sales_price,
                            "profit_loss"     => $total_profit,
                            "serial_type"     => $item->serial_type,
                            "sales_date"      => strtotime($this->common_model->xss_clean($this->input->post("sales_date"))),
                            "create_user"     => $this->session->userdata('loggedin_id'),
                            "create_date"     => time()
                        );
                        $this->common_model->save_data("sales_item_batch_profit_loss", $profit_data);

                        // Update batch qty
                        $this->db->where('id', $batch->id);
                        $this->db->update('inv_stock_item_batch', [
                            "quanity"     => ($batch->quanity - $deduct),
                            "update_user" => $this->session->userdata('loggedin_id'),
                            "update_date" => time()
                        ]);

                        $sell_qty -= $deduct;
                    }
                }

                // =======================
                // Unique items: Serial
                // =======================
                if($item->serial_type == 'unique'){
                    $sell_qty = $item->qty;
                    $sales_price = $item->price;
                    if($item->qty > 0 && $item->discount_amount > 0){
                    $discount_amount = $item->discount_amount / $item->qty;
                } else {
                    $discount_amount = 0;
                }

                    $this->db->where('item_id', $item->id);
                    //$this->db->where('is_available', 1);
                    $serials = $this->db->get('sales_order_item_serials')->result();
                 
       
                    foreach($serials as $serial){
                        if($sell_qty <= 0) break;


                        // Find purchase price from inv_stock_item_serial
                        $stock_serial = $this->db->get_where('inv_stock_item_serial', ['serial'=>$serial->serial_number, 'is_available'=>1])->row();
                        if($stock_serial){
                            $purchase_price = $stock_serial->purchase_price;
                            $profit_per_unit = ($sales_price - $purchase_price) - $discount_amount ;
                            $total_profit = $profit_per_unit;

                            // Save profit/loss
                            $profit_data = array(
                                "organization_id" => $this->session->userdata('loggedin_org_id'),
                                "branch_id"       => $branch_id,
                                "sales_id"        => $sales_id,
                                "sales_item_id"   => $sales_item_id,
                                "product_id"      => $item->product_id,
                                "batch_id"        => $stock_serial->id,
                                "batch_number"    => $stock_serial->serial,
                                "qty_sold"        => 1,
                                "purchase_price"  => $purchase_price,
                                "sales_price"     => $sales_price,
                                "profit_loss"     => $total_profit,
                                "serial_type"     => $item->serial_type,
                                "sales_date"      => strtotime($this->common_model->xss_clean($this->input->post("sales_date"))),
                                "create_user"     => $this->session->userdata('loggedin_id'),
                                "create_date"     => time()
                            );
                            $this->common_model->save_data("sales_item_batch_profit_loss", $profit_data);

                            // Mark inv_stock_item_serial as sold
                            $this->db->where('id', $stock_serial->id);
                            $this->db->update('inv_stock_item_serial', ['is_available'=>0]);
                        }

                        $sell_qty -= 1;
                    }
                }

                // =======================
                // Update inv_stock_master
                // =======================
                $this->db->where('store_id', $store_id);
                $this->db->where('product_id', $item->product_id);
                $master_stock = $this->db->get('inv_stock_master')->row();
                if($master_stock){
                    $new_qty = $master_stock->quanity - $item->qty;
                    $this->db->where('id', $master_stock->id);
                    $this->db->update('inv_stock_master', [
                        "quanity"     => $new_qty,
                        "update_user" => $this->session->userdata('loggedin_id'),
                        "update_date" => time()
                    ]);
                }

            } // end foreach $items


    #######################################################################
   ####################### End sales_items #########################
   #####################################################################

      $this->session->set_flashdata('success', 'Record has been successfully saved.');
      }else{
        
     $this->session->set_flashdata('error', 'An error occurred. Please try again.');
      }
    
   redirect(base_url() . "sales/create");
   
    
 
  }

    $data = array();
    $data['active']         = "sales";
    $data['title']          = "Create Sales "; 
    $data['allUnit']        = $this->common_model->view_data("unit", array("is_active" => 1), "name", "ASC");;
    $data['allBrand']       = $this->main_model->getRecordsByOrg("brands");
    $data['allCat']         = $this->main_model->getRecordsByOrg("products_groups");
    $data['allInv']         = $this->main_model->getRecordsByOrg("warehouse");
    $data['allPro']         = $this->sales_model->get_all_products_with_available_stock();
    $data['allGroup']       = $this->main_model->getRecordsByOrg("partner_group");
    $data['allCustomer']    = $this->sales_model->getCustomer();
    $data['allPayment']     = $this->main_model->getRecordsByOrg("payment_method");
    // inv 
    $int_no = $this->sales_model->number_generator();
  	$invoice_no = 'INV-'.str_pad($int_no,4,"0",STR_PAD_LEFT);
    $data['invoice_no'] = $invoice_no; 
    $data['content']        = $this->load->view("sales-create", $data, TRUE);
    $this->load->view('layout/master', $data);
}

public function get_customer_info()
{
    $id = $this->input->post('id');
    $customer = $this->db->where('id', $id)->get('business_partner')->row();

    echo json_encode($customer);
}

 public function get_products_by_group() {
        $group_id = $this->input->post('group_id');
        
        if ($group_id) {
            // Fetch products by group_id
            $products = $this->sales_model->get_products_by_group($group_id);

            // Prepare options for product select
            $options = '<option value="">Select</option>';
            foreach ($products as $product) {
                $options .= "<option value='{$product->id}'>{$product->name}</option>";
            }

            echo $options;
        }
    }


 public function get_unique_serial_by_products()
{
   $product_id = $this->input->post('product_id');
$organization_id = $this->session->userdata('loggedin_org_id');

// get product info
$product = $this->db->get_where('products', ['id' => $product_id])->row();

if ($product->serial_type == 'unique') {

    $sql = "
        SELECT serial 
        FROM inv_stock_item_serial 
        WHERE product_id = ? 
          AND organization_id = ? 
          AND is_available = 1
          AND serial NOT IN (
              SELECT serial_number 
              FROM sales_order_item_serials 
              WHERE is_available = 0
          )
    ";

    $serials = $this->db->query($sql, [$product_id, $organization_id])->result();

    echo '<option value="">Select</option>';
    foreach ($serials as $s) {
        echo '<option value="'.$s->serial.'">'.$s->serial.'</option>';
    }

} else {
    echo 'common';
}

}



    public function get_product_details() {
        $product_id = $this->input->post('product_id');
        
        if ($product_id) {
            // Fetch product details from database
            $product = $this->purchase_model->get_product_by_id($product_id);


             // Latest purchase info
            $last_purchase = $this->purchase_model->get_last_purchase_info($product_id);
            
            if ($product) {
                // Return product details as JSON
                echo json_encode([
                    'price' => $product->purchase_price,  // Example: Purchase Price
                    'sales_price'   => $product->sales_price,
                    'serial_type'   => $product->serial_type,
                    'warrenty'      => $product->warrenty,
                    'warrenty_days' => $product->warrenty_days,

                    // Extra fields for common type
                    'last_price'     => $last_purchase->price ?? 0,
                    'barcode_serial' => $last_purchase->barcode_serial ?? '',
                ]);
            } else {
                echo json_encode([]);
            }
        }
    }
public function add_item_ajax()
{
    $product_id = $this->input->post('product_id');
    $invoice_id = $this->input->post('invoice_id');
    $unique_serial = $this->input->post('unique_serial') ?: '';
    $loggedin_org_id = $this->session->userdata('loggedin_org_id');

     $date = date("Y-m-d H:i:s");

    if (!$product_id || !$invoice_id) {
        echo json_encode(['status' => 'error', 'msg' => 'Missing invoice or product']);
        return;
    }

    // Load product info
    $this->db->select('p.*, u.name as unit_name');
    $this->db->from('products p');
    $this->db->join('unit u', 'u.id = p.unit_id', 'left');
    $this->db->where('p.id', $product_id);
    $product = $this->db->get()->row();

    $serial_type = $product->serial_type ?? 'common';

    // ============================
    //   GET AVAILABLE STOCK
    // ============================
    $available_qty = $this->sales_model->get_total_quantity($product_id,$invoice_id);

    // ============================
    // CHECK IF ITEM ALREADY EXISTS
    // ============================
    $existing_item = $this->db->get_where('sales_order_items', [
        'invoice_id' => $invoice_id,
        'product_id' => $product_id
    ])->row();

    if ($serial_type == "unique") {
        $required_qty = 1;
    } else {
        // common items
        $required_qty = ($existing_item) ? $existing_item->qty + 1 : 1;
    }

    // ============================
    //  STOCK VALIDATION
    // ============================
    if ($required_qty > $available_qty) {
        echo json_encode([
            'status' => 'error',
            'msg' => "স্টকে মাত্র {$available_qty} পিস আছে! আপনি {$required_qty} নিতে পারবেন না।"
        ]);
        return;
    }

    // ============================
    // INVOICE CREATE IF NOT EXISTS
    // ============================
    $is_invoice = $this->db->get_where('sales_invoice', [
        'invoice_code' => $invoice_id,
    ])->row();
    
    if (!$is_invoice) {
       
        $this->db->insert('sales_invoice', [
            'organization_id' => $this->session->userdata('loggedin_org_id'),
            'invoice_code' => $invoice_id,
            'create_user' => $this->session->userdata('loggedin_id'),
            'create_date' => strtotime($date)
        ]);
    }

    // ============================
    // INSERT OR UPDATE ITEM
    // ============================

    $this->db->select('m.*');
    $this->db->from('inv_stock_master m');
    $this->db->where('m.organization_id', $loggedin_org_id);
    $this->db->where('m.product_id', $product_id);
    $stock_master = $this->db->get()->row();


    $qty                    = 1;
    $purchase_price         = $stock_master->purchase_price;
    $price                  = $stock_master->sales_price;
    $sub_total              = $qty * $price;

    if ($existing_item) {

        $new_qty = $existing_item->qty + 1;

        $this->db->where('id', $existing_item->id)->update('sales_order_items', [
            'price'           => $price,
            'qty'             => $new_qty,
            'sub_total'       => $price * $new_qty,
            'net_total'       => $price * $new_qty,
        ]);

        $item_id = $existing_item->id;

    } else {

        $this->db->insert('sales_order_items', [
            'organization_id' => $this->session->userdata('loggedin_org_id'),
            'invoice_id'      => $invoice_id,
            'product_id'      => $product_id,
            'serial_type'     => $serial_type,
            'purchase_price'  => $purchase_price,
            'price'           => $price,
            'qty'             => $qty,
            'sub_total'       => $price * $qty,
            'net_total'       => $price * $qty,
            'warrenty'        => $stock_master->warrenty,
            'warrenty_days'   => $stock_master->warrenty_days,
            "create_user"     => $this->session->userdata('loggedin_id'),
            "create_date"     => strtotime($date)
        ]);

        $item_id = $this->db->insert_id();
    }

        // ADD SERIAL IF UNIQUE
        if ($serial_type == 'unique' && !empty($unique_serial)) {
            $exists = $this->db->get_where('sales_order_item_serials', [
                'serial_number' => $unique_serial,
                'is_available'  => 0 
            ])->row();

            if ($exists) {
                $this->session->set_flashdata('error', "This serial ($unique_serial) is already sold!");
                redirect('sales/add'); 
                return;
            }

            $this->db->insert('sales_order_item_serials', [
                'item_id' => $item_id,
                'serial_number' => $unique_serial,
                'is_available' => 0 
            ]);
        }

    echo json_encode([
        'status' => 'success',
        'item' => [
            'product_name'  => $product->name,
            'unit_name'     => $product->unit_name,
            'warrenty'      => $product->warrenty,
            'warrenty_days' => $product->warrenty_days,
            'serial_type'   => $serial_type,
            'price'         => $price,
            'qty'           => $qty,
            'sub_total'     => $sub_total,
            'stockQty'      => $available_qty,
            'item_id'       => $item_id,
            // NEW FIELD FOR UNIQUE SERIAL LIST
            'serial_list'   => $serial_list
        ]
    ]);
    
}




// Controller: Purchase.php
public function delete_item_ajax()
{
    $item_id = $this->input->post('item_id');

    if (!$item_id) {
        echo json_encode(["status" => "error", "msg" => "Invalid ID"]);
        return;
    }

    $deleted = $this->db->where('id', $item_id)->delete('sales_order_items');
    $deleted = $this->db->where('item_id', $item_id)->delete('sales_order_item_serials');

    if ($deleted) {
        echo json_encode(["status" => "success"]);
    } else {
        echo json_encode(["status" => "error", "msg" => "DB delete failed"]);
    }
}
public function update_item_ajax() {

    $item_id = $this->input->post("item_id");

    if (!$item_id) {
        echo json_encode(["status"=>"error","msg"=>"Invalid Item ID"]);
        return;
    }

    $data = [
        "price"                => $this->input->post("price"),
        "qty"                  => $this->input->post("qty"),
        "sub_total"            => $this->input->post("sub_total"),
        "discount_percent"     => $this->input->post("discount_percent"),
        "discount_amount"      => $this->input->post("discount_amount"),
        "net_total"            => $this->input->post("net_total"),
        "warrenty"             => $this->input->post("warrenty"),
    ];

    $this->db->where("id", $item_id);
    $updated = $this->db->update("sales_order_items", $data);

    if ($updated) {
        echo json_encode(["status"=>"success"]);
    } else {
        echo json_encode(["status"=>"error","msg"=>"DB update failed"]);
    }
}


public function get_supplier_balance()
{
    $supplier_id = $this->input->post('supplier_id');
    $balance = 0;

    if ($supplier_id) {
        $supplier = $this->db->get_where('business_partner', ['id' => $supplier_id])->row();
        if ($supplier) {
            $balance = $supplier->current_balance;
        }
    }

    echo json_encode(['balance' => $balance]);
}


// Fetch serials for an item
public function get_item_serials() {
    $item_id = $this->input->get('item_id');

    $serials = $this->db->select("
            s.id,
            s.serial_number,
            st.serial AS stock_serial,
            st.purchase_date,
            st.warrenty,
            st.warrenty_days,
            st.purchase_price
        ")
        ->from("sales_order_item_serials s")
        ->join("inv_stock_item_serial st", "st.serial = s.serial_number", "left")
        ->where("s.item_id", $item_id)
        ->get()
        ->result_array();

    echo json_encode(['status'=>'success','serials'=>$serials]);
}


// Delete a serial
public function delete_item_serial() {
    $serial_id = $this->input->post('serial_id');
    $item_id = $this->input->post('item_id');

    // delete serial
    $this->db->where('id', $serial_id)->delete('purchase_item_serials');

    // recalc qty
    $new_qty = $this->db->where('item_id', $item_id)
                        ->from('purchase_item_serials')
                        ->count_all_results();

    // update purchase_items table
    $item = $this->db->get_where('purchase_items', ['id'=>$item_id])->row();
    $price = $item->price;
    $total_rebate = $item->total_rebate;

    $new_total_rebate = $item->rebate * $new_qty;
    $new_sub_total = max(0, ($price * $new_qty) - $item->rebate);

    $this->db->where('id', $item_id)->update('purchase_items', [
        'qty' => $new_qty,
        'sub_total' => $new_sub_total
    ]);

    // 🔥 NEW: get updated serial list
    $serial_list = $this->db->select('serial_number')
                            ->where('item_id', $item_id)
                            ->get('purchase_item_serials')
                            ->result_array();

    $serial_string = implode(',', array_column($serial_list, 'serial_number'));

    // return full updated info
     echo json_encode([
    'status' => 'success',
    'item' => [
        'id' => $item_id,
        'qty' => $new_qty,
        'sub_total' => $new_sub_total,
        'total_rebate' => $new_total_rebate,   
        'serial_number' => $serial_string       
    ]
]);


}


public function get_serials()
{
    $item_id = $this->input->post('item_id');

    echo json_encode([
        'success' => true
    ]);
}
public function delete_serial_ajax() {

    $serial_id = $this->input->post('serial_id');

    $serial = $this->db->where('id', $serial_id)->get('sales_order_item_serials')->row();

    if(!$serial){
        echo json_encode(['status'=>'error','msg'=>'Serial not found']);
        return;
    }

    $item_id = $serial->item_id;
    $serial_number = $serial->serial_number;

    // delete serial
    $this->db->where('id', $serial_id)->delete('sales_order_item_serials');

    // update qty
    $item = $this->db->where('id', $item_id)->get('sales_order_items')->row();

    if($item){
        $new_qty = max(0, $item->qty - 1);
        $new_sub_total = $item->price * $new_qty;
        $new_net_total = $new_sub_total - $item->discount_amount;

        $this->db->where('id', $item_id)->update('sales_order_items', [
            'qty' => $new_qty,
            'sub_total' => $new_sub_total,
            'net_total' => $new_net_total
        ]);
    }

    echo json_encode([
        'status' => 'success',
        'item_id' => $item_id,
        'serial_number' => $serial_number,
        'new_qty' => $new_qty,
    ]);
}


public function update_item()
{
    $item_id = $this->input->post('item_id');
    $qty = $this->input->post('qty');
    $price = $this->input->post('price');
    $rebate = $this->input->post('rebate');
    $serial_number = $this->input->post('batch');



    $data = [
        'qty' => $qty,
        'price' => $price,
        'total_rebate' => $rebate,
        'barcode_serial' => $serial_number,
    ];

    $this->db->where('id', $item_id);
    $this->db->update('purchase_items', $data);

    echo json_encode(['success' => true]);
}


public function invoice($id)
{
 
    $data = array();
    $data['active']       = "invoice";
    $data['title']        = "invoice"; 
    $data['allPdt']       = $this->sales_model->getSalesList($id);
    $data['allDets']       = $this->sales_model->SalesItemDetailsList($id);
    $this->load->view('invoice', $data);
 }

}
