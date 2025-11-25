<?php
class Sales extends MX_Controller
{
  public function __construct() {
    parent::__construct();
       $this->load->model("sales_model");
 
}
public function index()
{
 
    $data = array();
    $data['active']    = "purchase";
    $data['title'] = "Purchase List"; 
    $data['allPdt']       = $this->sales_model->getPurchaseList();
    $data['content'] = $this->load->view("purchase-list", $data, TRUE);
    $this->load->view('layout/master', $data);
 }
 
 public function create()
{

  $this->form_validation->set_rules("totalAmount", "Total Amount", "required");
  $this->form_validation->set_rules("purchase_date", "Purchase date", "required");
  $this->form_validation->set_rules("supplier_id", "Supplier", "required");

  if ($this->form_validation->run() == NULL) {
  
  } else {

    //table list
    #####
    #purchase , purchase_invoice, purchase_items,purchase_item_serials
    #inv_stock_master ,inv_stock_item_serial, inv_stock_history,
    #acc_general_ledger,business_partner
    #

   $invoice_code   = $this->common_model->xss_clean($this->input->post("invoice_id"));
   $store_id        = $this->common_model->xss_clean($this->input->post("store_id"));
   $supplier_id     = $this->common_model->xss_clean($this->input->post("supplier_id"));
   $branch_id       = $this->session->userdata("loggedin_branch_id");
   

    $int_no = $this->sales_model->number_generator();
  	$invoice_no = 'INV-'.str_pad($int_no,4,"0",STR_PAD_LEFT);
    
 
  }

    $data = array();
    $data['active']         = "sales";
    $data['title']          = "Create Sales "; 
    $data['allUnit']        = $this->common_model->view_data("unit", array("is_active" => 1), "name", "ASC");;
    $data['allBrand']       = $this->main_model->getRecordsByOrg("brands");
    $data['allCat']         = $this->main_model->getRecordsByOrg("products_groups");
    $data['allInv']         = $this->main_model->getRecordsByOrg("warehouse");
    $data['allPro']         = $this->main_model->getRecordsByOrg("products");
    $data['allSuplier']     = $this->sales_model->getSuplier();
    $data['allPayment']         = $this->main_model->getRecordsByOrg("payment_method");
    // inv 
    $int_no = $this->sales_model->number_generator();
  	$invoice_no = 'INV-'.str_pad($int_no,4,"0",STR_PAD_LEFT);
    $data['invoice_no'] = $invoice_no; 
    $data['content']        = $this->load->view("sales-create", $data, TRUE);
    $this->load->view('layout/master', $data);
}

public function delete($id) {
    $dt = $this->common_model->view_data("products", array("id" => $id), "id", "asc");

    if ($dt) {
        if (!empty($dt->picture) && file_exists("./public/images/products/" . $dt->picture)) {
            unlink("./public/images/products/" . $dt->picture); 
        }

        $this->common_model->delete_data("products", array("id" => $id));

        $this->session->set_flashdata('success', 'Record has been deleted.');
    } else {
        $this->session->set_flashdata('error', 'An error occurred. Please try again.');
    }

    redirect(base_url() . "products", "refresh");
}


public function update(){

  $id=$this->input->post("id");
  $selPdt=$this->common_model->view_data("products_groups",array("id"=>$id),"id","desc");
 
  $data = array(
    "name"                       => $this->common_model->xss_clean($this->input->post("ename")),   
    "is_active"                  => $this->common_model->xss_clean($this->input->post("is_active")),
                  
      );

      
      if ($this->common_model->update_data("products_groups", $data,array("id"=>$id),$id)) {
          $this->session->set_flashdata('success', 'Your changes have been successfully updated.');
      }
      else{
        $this->session->set_flashdata('error', 'An error occurred. Please try again.');
      }
      $this->session->set_userdata($sdata);
      redirect(base_url() . "products/groups", "refresh");
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

    // get serial type
    $product = $this->db->get_where('products', ['id' => $product_id])->row();

    if($product->serial_type == 'unique'){
        $serials = $this->db
            ->where('product_id', $product_id)
            ->where('is_available', 1)
            ->get('inv_stock_item_serial')
            ->result();

        echo '<option value="">Select</option>';
        foreach($serials as $s){
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

    if(!$product_id ){
        echo json_encode(['status' => 'error', 'msg' => 'Missing invoice or product']);
        return;
    }

    // Load product info
    $this->db->select('p.*, u.name as unit_name');
    $this->db->from('products p');
    $this->db->join('unit u', 'u.id = p.unit_id', 'left');
    $this->db->where('p.id', $product_id);
    $product = $this->db->get()->row();

    if(!$product){
        echo json_encode(['status' => 'error', 'msg' => 'Product not found']);
        return;
    }

    // SERIAL TYPE: unique / common
    $serial_type = $product->serial_type;

    // ================== GET SERIAL LIST IF UNIQUE ==================
    $serial_list = [];
    if($serial_type == 'unique'){
        $serial_list = $this->db
            ->where('product_id', $product_id)
            ->where('is_available', 1)
            ->where('serial_type', 'unique')
            ->get('inv_stock_item_serial')
            ->result();
    }

    // default qty & price
    $qty = 1;
    $price = $product->sales_price;
    $sub_total = $qty * $price;

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

            // NEW FIELD FOR UNIQUE SERIAL LIST
            'serial_list'   => $serial_list
        ]
    ]);
}



// Controller: Purchase.php
public function delete_item_ajax()
{
    $item_id = $this->input->post('item_id');

    if(!$item_id){
        echo json_encode(['status'=>'error','msg'=>'Missing item ID']);
        return;
    }

    $this->db->where('id', $item_id);
    $deleted = $this->db->delete('purchase_items');

    if($deleted){
        echo json_encode(['status'=>'success']);
    } else {
        echo json_encode(['status'=>'error','msg'=>'Failed to delete']);
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
    $serials = $this->db->select('id, serial_number')
                        ->where('item_id', $item_id)
                        ->get('purchase_item_serials')
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
    $data['active']       = "order";
    $data['title']        = "Order List"; 
    $data['allPdt']       = $this->purchase_model->getPurchaseList($id);
    $data['allDets']       = $this->purchase_model->PurchaseItemDetailsList($id);
    $this->load->view('invoice', $data);
 }

}
