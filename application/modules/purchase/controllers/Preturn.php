<?php
class Preturn extends MX_Controller
{
  public function __construct() {
    parent::__construct();
       $this->load->model("purchase_model");
       $this->load->model("preturn_model");
       $this->load->model("partner/partner_model");
 
}

 
 public function index()
{

    $data = array();
    $data['active']         = "purchase";
    $data['title']          = "Purchase Return"; 
    $data['allBrand']       = $this->main_model->getRecordsByOrg("brands");
    $data['allCat']         = $this->main_model->getRecordsByOrg("products_groups");
    $data['allInv']         = $this->main_model->getRecordsByOrg("warehouse");
    $data['allPro']         = $this->main_model->getRecordsByOrg("products");
    $data['allSuplier']     = $this->purchase_model->getSuplier();
    $data['allPayment']     = $this->main_model->getRecordsByOrg("payment_method");
    $data['allGroup']       = $this->main_model->getRecordsByOrg("partner_groups");
    // inv 

    $data['content']        = $this->load->view("purchase-return-create", $data, TRUE);
    $this->load->view('layout/master', $data);
}

public function list()
{
 
    $data                 = array();
    $data['active']       = "purchas_return";
    $data['title']        = "Purchas Return List"; 
    $data['allPdt']       = $this->preturn_model->getPurchaseReturnList();
    $data['content']      = $this->load->view("purchase-return-list", $data, TRUE);
    $this->load->view('layout/master', $data);
 }

public function invoice($id)
{
 
    $data = array();
    $data['active']       = "invoice";
    $data['title']        = "invoice"; 
    $data['allPdt']       = $this->preturn_model->getPurchaseReturnList($id);
    $data['allDets']       = $this->preturn_model->PurchasReturnItemDetailsList($id);
    $this->load->view('purchase-return-invoice', $data);
 }
 
public function add_item_from_serial_ajax() {

        $serial = $this->input->post('serial', true);
        $current_customer_id = $this->input->post('customer_id', true);

        if(empty($serial)) {
            echo json_encode([
                "status" => "error",
                "msg" => "Please enter or scan a serial!"
            ]);
            return;
        }

         
        $item = $this->preturn_model->get_item_by_serial($serial, $current_customer_id);

        if(!$item) {
            echo json_encode([
                "status" => "error",
                "msg" => "Serial not found!"
            ]);
            return;
        }
        // Common Type Check
        if($item->serial_type == 'common') {

            // যদি current customer ID set থাকে
            if($current_customer_id && $current_customer_id != $item->supplier_id) {
                echo json_encode([
                    "status" => "error",
                    "msg" => "Sorry! This product belongs to another customer."
                ]);
                return;
            }

            // যদি qty_returned বা is_returned থাকে, reduce available qty
            $available_qty = $item->quanity - $item->qty_returned;
            if($available_qty <= 0){
                echo json_encode([
                    "status" => "error",
                    "msg" => "Sorry! No stock available for this product."
                ]);
                return;
            }
            $item->available_qty = $available_qty;
        }


        // =======================
        // UNIQUE SERIAL
        // =======================
        if($item->serial_type == 'unique') {

            // Customer check
            if($current_customer_id && $current_customer_id != $item->supplier_id) {
                echo json_encode([
                    "status" => "error",
                    "msg" => "Sorry! This serial belongs to another customer."
                ]);
                return;
            }

            // Returned / used check
            if($item->is_returned || $item->qty_returned >= $item->quanity) {
                echo json_encode([
                    "status" => "error",
                    "msg" => "This serial is already returned or used!"
                ]);
                return;
            }

        } else { // =======================
                 // COMMON SERIAL
                 // =======================

            $available_qty = $item->quanity - $item->qty_returned;

            if($available_qty <= 0) {
                echo json_encode([
                    "status" => "error",
                    "msg" => "This product is not available or already returned!"
                ]);
                return;
            }
        }

        // =======================
        // Get customer info (first scan)
        // =======================
        $supplier = null;
        if(empty($current_customer_id)) {
            $supplier = $this->preturn_model->get_by_id($item->supplier_id);
        } else {
            $supplier = $this->preturn_model->get_by_id($current_customer_id);
        }

        // =======================
        // Return JSON
        // =======================
     echo json_encode([
     "status"   => "success",
     "item"     => $item,       // এখন item->product_name থাকবে
     "customer" => $supplier
]);

    }
public function save_sales_return()
{
    $loggedin_org_id = $this->session->userdata("loggedin_org_id");
    $branch_id       = $this->session->userdata("loggedin_branch_id");
    $user_id         = $this->session->userdata('loggedin_id');
    $supplier_id     = $this->input->post('customer_id');
   // $invoice_no = $this->input->post('invoice_no');
    $sales_date     = $this->input->post('sales_date');
    $totalOrder     = $this->input->post('totalOrder') ?: 0;
    $paidAmount     = $this->input->post('paidAmount') ?: 0;
    $adjustment     = $this->input->post('adjustment') ?: 0;
    $total_amount   = $this->input->post('totalAmount') ?: 0;
    $due_amount     = $this->input->post('dueAmount') ?: 0;
    $payableAmount  = $this->input->post('payableAmount') ?? 0;
    $paymentMethodId = $this->input->post('payment_method_id') ?? 0;
   
    $items = $this->input->post('items'); 

    $this->db->trans_start();

    // Step 1: Insert into sales_return
    $int_no = $this->preturn_model->number_generator();
    $invoice_no = 'PRTN-'.str_pad($int_no,4,"0",STR_PAD_LEFT);
    $date = date("Y-m-d H:i:s");

    $purchase_return_data = [
        'organization_id'        => $loggedin_org_id,
        'branch_id'              => $branch_id,
        'code_random'            => $int_no,
        'invoice_no'             => $invoice_no,
        'supplier_id'            => $supplier_id,
        'return_date'            => strtotime($sales_date),
        'total_order'            => $totalOrder,
        'paid_amount'            => $paidAmount,
        'adjustment'             => $adjustment,
        'total_amount'           => $total_amount,
        'due_amount'             => $due_amount,
        'create_user'            => $user_id,
        "create_date"            => strtotime($date),
    ];

    $this->db->insert('purchase_return',$purchase_return_data);
    $purchase_return_id = $this->db->insert_id();


    //===============================================================
        //===================== Accounts

       

     $converted_date = convert_date_ddmmyyyy_to_yyyymmdd($sales_date);

        $total_tr_data = array(   
        "organization_id"            => $this->session->userdata('loggedin_org_id'),
        "branch_id"                  => $this->session->userdata('loggedin_branch_id'), 
        "voucher_type"               => 'Purchase Return',  
        'invoice_no'             => $invoice_no,
        "purchase_return_id"         => $purchase_return_id,   
        "party_id"                   => $supplier_id,   
        "account_name"               => 'Supplier Purchase Return', 
        "particulars"                => 'Purchase Return for order',   
        "date"                       => $converted_date,   
        "debit"                      => $payableAmount,   
        "credit"                     => 0,   
        "gl_date"                    => strtotime($sales_date),
        "acc_coa_head_id"            => 0,   
        "payment_method"             => 0,    
        "remarks"                    => 'Purchase Return ',
        "is_active"                  => 1,
        "create_user"                => $this->session->userdata('loggedin_id'),
        "create_date"                => strtotime($date),
       
    );
    $this->common_model->save_data("acc_general_ledger", $total_tr_data);


      if($paidAmount > 0){
        $total_pay_data = array(   
        "organization_id"            => $this->session->userdata('loggedin_org_id'),
        "branch_id"                  => $this->session->userdata('loggedin_branch_id'), 
        "voucher_type"               => 'Purchase Return Payment',  
        'invoice_no'             => $invoice_no,
        "purchase_return_id"         => $purchase_return_id,   
        "party_id"                   => $supplier_id,   
        "account_name"               => 'Supplier Account', 
        "particulars"                => 'Payment for Purchase Return',   
        "date"                       => $converted_date,   
        "debit"                      => 0,   
        "credit"                     => $paidAmount,   
        "gl_date"                    => strtotime($sales_date),
        "acc_coa_head_id"            => 0,   
        "payment_method"             => $paymentMethodId,    
        "remarks"                    => 'Payment for Purchase Return ',
        "is_active"                  => 1,
        "create_user"                => $this->session->userdata('loggedin_id'),
        "create_date"                => strtotime($date),
       
    );
    $this->common_model->save_data("acc_general_ledger", $total_pay_data);

   }

    // Customer Payment Update

            if($due_amount  > 0){
                $current_bac= $this->partner_model->get_current_balance($supplier_id);
                $current_balance = $current_bac->current_balance;
                $new_balance = $current_balance + $due_amount;
                $this->partner_model->update_balance($supplier_id, $new_balance);
            }

            //end New Balance
        //===============================================================
        //===================== End Accounts

$items_json = $this->input->post('items'); 

// JSON decode
$items = json_decode($items_json, true); // true দিলে assoc array হবে

    if(!empty($items)) {
    foreach ($items as $item) {
            $product_id = $item['product_id'];
            $qty        = $item['qty'];
            $price      = $item['price'];
            $total      = $item['total'];

        $item_data = [
            'purchase_return_id' => $purchase_return_id,
            'serial_type' => $item['serial_type'],
            'product_id'  => $item['product_id'],
            'qty'         => $item['qty'],
            'price'       => $item['price'],
            'total'       => $item['total'],
            'serials'     => isset($item['serials']) ? $item['serials'] : null
        ];

        // Save in DB
        $this->db->insert('purchase_return_items', $item_data);

   
        $serials = array_map('trim', explode(',', $item['serials']));
       $serial_type  =  $item['serial_type'];

    //     ##################
    //     ###### Unique
    //     #################
           if ($serial_type == 'unique') {
            foreach ($serials as $ser) {

             $sales_serial = $this->db
             ->select('id')
            ->where('serial', $ser)
            ->where('is_returned', 0)
            ->get('inv_stock_item_serial')
            ->row();

              if ($sales_serial) {
                $salesid = $sales_serial->id;
               //  $sales_item_id = $sales_serial->sales_item_id;
  
                  $itemRow = $this->db->where('id', $salesid)->get('inv_stock_item_serial')->row();
  //print_r($itemRow);exit();
             if ($itemRow) {

                 $new_returned = $itemRow->qty_returned + 1;

                if ($new_returned > $itemRow->quanity) {
                    $new_returned = $itemRow->quanity;
                }

    //             // is_returned set করা
                 $is_returned = ($new_returned >= $itemRow->quanity) ? 1 : 0;

                $this->db->where('id', $salesid)
                    ->update('inv_stock_item_serial', [
                        'qty_returned' => $new_returned,
                        'is_available'  => 0,
                        'is_returned'  => $is_returned
                    ]);

                     $this->db->where('serial_number', $ser)
                    ->update('purchase_item_serials', [
                        'is_available' => 0,
                        'is_return'  => 1
                    ]);
            }

   

               }

             }

         


            }else {
          $remaining_qty = $qty;

    foreach($serials as $serial) {

         $salesItem = $this->db
            ->select('si.id, si.quanity, si.qty_returned')
            ->from('inv_stock_item_batch si')
            ->where('si.organization_id', $loggedin_org_id)
            ->where('si.product_id', $product_id)
            ->where('batch_number', $serial)
            ->order_by('si.id', 'ASC')
            ->get()->row();

        if ($salesItem) {

             $new_returned = $salesItem->qty_returned + $qty;
             $new_quanity = $salesItem->quanity - $qty;

            if ($new_returned > $salesItem->quanity) {
                $new_returned = $salesItem->quanity;
            }

            $is_returned = ($new_returned >= $salesItem->quanity) ? 1 : 0;

            $this->db->where('id', $salesItem->id)
                ->update('inv_stock_item_batch', [
                    'quanity' => $new_quanity,
                    'qty_returned' => $new_returned,
                    'is_returned'  => $is_returned
                ]);
         }
        }

    //      foreach($serials as $serial) {
        
    // $row = $this->db->where('organization_id', $loggedin_org_id)
    //                 ->where('branch_id', $branch_id)
    //                 ->where('product_id', $product_id)
    //                 ->where('batch_number', $serial)
    //                 //->where('quanity >', 0)
    //                 ->order_by('id', 'ASC')
    //                 ->limit(1)
    //                 ->get('inv_stock_item_batch')
    //                 ->row();
            

    //                     if(!$row) break;

    //                     $deduct = min($remaining_qty, $row->quanity);

    //                     $update_data = [
    //                         'quanity' => $row->quanity + $deduct,
    //                         'is_available' => 1,
    //                     ];

    //                     $this->db->where('id', $row->id)
    //                             ->update('inv_stock_item_batch', $update_data);

    //                     $remaining_qty -= $deduct;
    //                 }
               
        }

      }
 } 

      
  // ---------- Update Master Stock ----------

         // Product info
        $product_id = $item['product_id'];
        $qty = $item['qty']; // return quantity

        // Check if stock exists
        $stockMaster = $this->db->where('organization_id', $loggedin_org_id)
                                ->where('branch_id', $branch_id)
                                ->where('product_id', $product_id)
                                ->get('inv_stock_master')
                                ->row();

        if($stockMaster){
            // Update existing stock: add the returned qty
            $this->db->set('quanity', 'quanity - '.$qty, FALSE)
                    ->set('update_user', $user_id)
                    ->set('update_date', time())
                    ->where('id', $stockMaster->id)
                    ->update('inv_stock_master');
        }
           
       
     $this->db->trans_complete();

    if ($this->db->trans_status() === FALSE) {
     
        $this->session->set_flashdata('error', 'Return failed!');
    } else {
        $this->session->set_flashdata('success', 'Return saved successfully! ');

    }
    redirect(base_url() . "purchase/preturn", "refresh");
}

public function get_invoice_by_supplier()
{
    $supplier_id = $this->input->post('supplier_id');

    $result = $this->preturn_model->get_invoice_by_supplier($supplier_id);

    echo json_encode($result);
}
public function get_products_by_invoice()
{
    $invoice_id = $this->input->post('invoice_id');

    $products = $this->preturn_model->get_products_by_invoice($invoice_id);

    echo json_encode($products);
}
public function get_serial_by_product()
{
    $product_id = $this->input->post('product_id');
    $invoice_id = $this->input->post('invoice_id');

    $result = $this->preturn_model->get_serial_by_product($product_id, $invoice_id);

    echo json_encode($result);
}
public function get_serial_items_by_product()
{
    $product_id = $this->input->post('product_id', true);
    $invoice_id = $this->input->post('invoice_id', true);
    $batch_number = $this->input->post('batch_number', true);

    $items = $this->preturn_model->get_serial_items_by_product($product_id, $invoice_id,$batch_number);

    // Customer info: প্রথম item থেকে supplier_id ধরে
    $customer = null;
    if(!empty($items)) {
        $customer_id = $items[0]->supplier_id;
        $customer = $this->preturn_model->get_by_id($customer_id); // আপনার model function
    }

    echo json_encode([
        "status" => "success",
        "item" => $items,
        "customer" => $customer
    ]);
}



}
