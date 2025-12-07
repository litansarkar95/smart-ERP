
<?php
class Salesreturn extends MX_Controller
{
  public function __construct() {
    parent::__construct();
      $this->load->model("sales_model");
      $this->load->model("salesreturn_model");
 
}
public function index()
{

    $data = array();
    $data['active']         = "sales";
    $data['title']          = "Sales Return"; 

    // inv 
    $int_no = $this->sales_model->number_generator();
    $invoice_no = 'INV-'.str_pad($int_no,4,"0",STR_PAD_LEFT);
    $data['invoice_no'] = $invoice_no; 
    $data['allPayment']     = $this->main_model->getRecordsByOrg("payment_method");
    $data['allCustomer']    = $this->sales_model->getCustomer();
    $data['content']        = $this->load->view("return/sales-return-create", $data, TRUE);
    $this->load->view('layout/master', $data);
}
  public function get_all_ajax() {


        $customers = $this->salesreturn_model->get_all(); // সব customer fetch
        echo json_encode($customers);
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

        // Get item info from sales_item_batch_profit_loss
        $item = $this->salesreturn_model->get_item_by_serial($serial, $current_customer_id);

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
    if($current_customer_id && $current_customer_id != $item->customer_id) {
        echo json_encode([
            "status" => "error",
            "msg" => "Sorry! This product belongs to another customer."
        ]);
        return;
    }

    // যদি qty_returned বা is_returned থাকে, reduce available qty
    $available_qty = $item->qty_sold - $item->qty_returned;
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
            if($current_customer_id && $current_customer_id != $item->customer_id) {
                echo json_encode([
                    "status" => "error",
                    "msg" => "Sorry! This serial belongs to another customer."
                ]);
                return;
            }

            // Returned / used check
            if($item->is_returned || $item->qty_returned >= $item->qty_sold) {
                echo json_encode([
                    "status" => "error",
                    "msg" => "This serial is already returned or used!"
                ]);
                return;
            }

        } else { // =======================
                 // COMMON SERIAL
                 // =======================

            $available_qty = $item->qty_sold - $item->qty_returned;

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
        $customer = null;
        if(empty($current_customer_id)) {
            $customer = $this->salesreturn_model->get_by_id($item->customer_id);
        } else {
            $customer = $this->salesreturn_model->get_by_id($current_customer_id);
        }

        // =======================
        // Return JSON
        // =======================
       echo json_encode([
    "status"   => "success",
    "item"     => $item,       // এখন item->product_name থাকবে
    "customer" => $customer
]);

    }




    public function save_sales_return()
{
    $loggedin_org_id = $this->session->userdata("loggedin_org_id");
    $branch_id       = $this->session->userdata("loggedin_branch_id");
    $user_id         = $this->session->userdata('loggedin_id');
    $customer_id     = $this->input->post('customer_id');
   // $invoice_no = $this->input->post('invoice_no');
    $sales_date     = $this->input->post('sales_date');
    $paidAmount    = $this->input->post('paidAmount') ?: 0;
    $adjustment     = $this->input->post('adjustment') ?: 0;
    $total_amount   = $this->input->post('totalAmount') ?: 0;
    $due_amount     = $this->input->post('dueAmount') ?: 0;
    $payableAmount  = $this->input->post('payableAmount') ?? 0;
    $paymentMethodId = $this->input->post('payment_method_id') ?? 0;
   
    $items = $this->input->post('items'); 

    $this->db->trans_start();

    // Step 1: Insert into sales_return
    $int_no = $this->salesreturn_model->number_generator();
    $invoice_no = 'SRTN-'.str_pad($int_no,4,"0",STR_PAD_LEFT);
    $date = date("Y-m-d H:i:s");

    $sales_return_data = [
        'organization_id'        => $loggedin_org_id,
        'branch_id'              => $branch_id,
        'code_random'            => $int_no,
        'invoice_no'             => $invoice_no,
        'customer_id'            => $customer_id,
        'sales_date'             => strtotime($sales_date),
        'paid_amount'            => $paidAmount,
        'adjustment'             => $adjustment,
        'total_amount'           => $total_amount,
        'due_amount'             => $due_amount,
        'create_user'            => $user_id,
        "create_date"            => strtotime($date),
    ];

    $this->db->insert('sales_return', $sales_return_data);
    $sales_return_id = $this->db->insert_id();

    //===============================================================
        //===================== Accounts

       

     $converted_date = convert_date_ddmmyyyy_to_yyyymmdd($sales_date);

        $total_tr_data = array(   
        "organization_id"            => $this->session->userdata('loggedin_org_id'),
        "branch_id"                  => $this->session->userdata('loggedin_branch_id'), 
        "voucher_type"               => 'Sales Return',  
        "sales_return_id"            => $sales_return_id,   
        "party_id"                   => $customer_id,   
        "account_name"               => 'Customer Sales Return', 
        "particulars"                => 'Sales Return for order',   
        "date"                       => $converted_date,   
        "debit"                      => $payableAmount,   
        "credit"                     => 0,   
        "gl_date"                    => strtotime($sales_date),
        "acc_coa_head_id"            => 0,   
        "payment_method"             => 0,    
        "remarks"                    => 'Sales Return ',
        "is_active"                  => 1,
        "create_user"                => $this->session->userdata('loggedin_id'),
        "create_date"                => strtotime($date),
       
    );
    $this->common_model->save_data("acc_general_ledger", $total_tr_data);


      if($paidAmount > 0){
        $total_pay_data = array(   
        "organization_id"            => $this->session->userdata('loggedin_org_id'),
        "branch_id"                  => $this->session->userdata('loggedin_branch_id'), 
        "voucher_type"               => 'Sales Return Payment',  
        "sales_return_id"            => $sales_return_id,   
        "party_id"                   => $customer_id,   
        "account_name"               => 'Customer Account', 
        "particulars"                => 'Payment for Sales Return',   
        "date"                       => $converted_date,   
        "debit"                      => 0,   
        "credit"                     => $paidAmount,   
        "gl_date"                    => strtotime($sales_date),
        "acc_coa_head_id"            => 0,   
        "payment_method"             => $paymentMethodId,    
        "remarks"                    => 'Payment for Sales Return ',
        "is_active"                  => 1,
        "create_user"                => $this->session->userdata('loggedin_id'),
        "create_date"                => strtotime($date),
       
    );
    $this->common_model->save_data("acc_general_ledger", $total_pay_data);

    }
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
            'sales_return_id' => $sales_return_id,
            'serial_type' => $item['serial_type'],
            'product_id'  => $item['product_id'],
            'qty'         => $item['qty'],
            'price'       => $item['price'],
            'total'       => $item['total'],
            'serials'     => isset($item['serials']) ? $item['serials'] : null
        ];

        // Save in DB
        $this->db->insert('sales_return_items', $item_data);

        //
        $serials = array_map('trim', explode(',', $item['serials']));
       $serial_type  =  $item['serial_type'];

        ##################
        ###### Unique
        #################
           if ($serial_type == 'unique') {
            foreach ($serials as $ser) {
             $sales_serial = $this->db
             ->select('id,sales_item_id')
            ->where('batch_number', $ser)
            ->where('is_returned', 0)
            ->get('sales_item_batch_profit_loss')
            ->row();
              if ($sales_serial) {
                $salesid = $sales_serial->id;
                 $sales_item_id = $sales_serial->sales_item_id;

                  $itemRow = $this->db->where('id', $sales_item_id)->get('sales_items')->row();

            if ($itemRow) {

                $new_returned = $itemRow->returned_qty + 1;

                if ($new_returned > $itemRow->qty) {
                    $new_returned = $itemRow->qty;
                }

                // is_returned set করা
                $is_returned = ($new_returned >= $itemRow->qty) ? 1 : 0;

                $this->db->where('id', $sales_item_id)
                    ->update('sales_items', [
                        'returned_qty' => $new_returned,
                        'is_returned'  => $is_returned
                    ]);
            }

        $this->db->where('organization_id', $loggedin_org_id)
         ->where('branch_id', $branch_id)
         ->where('product_id', $product_id)
         ->where('serial', $ser)
         ->update('inv_stock_item_serial', [
             'quanity' => 1,
             'is_available' => 1
         ]);


          $this->db->where('serial_number', $ser)
         ->update('sales_order_item_serials', [
             'is_available' => 1
         ]);
                     $this->db->where('organization_id', $loggedin_org_id)
         ->where('branch_id', $branch_id)
         ->where('id', $salesid)
         ->where('batch_number', $ser)
         ->update('sales_item_batch_profit_loss', [
             'is_returned' => 1
         ]);
              }

            }

         


           }else {
         $remaining_qty = $qty;

    while($remaining_qty > 0) {

         $salesItem = $this->db
            ->select('si.id, si.qty, si.returned_qty')
            ->from('sales_items si')
            ->join('sales s', 's.id = si.sales_id')
            ->where('s.customer_id', $customer_id)
            ->where('si.product_id', $product_id)
            ->where('si.returned_qty < si.qty')
            ->order_by('si.id', 'ASC')
            ->get()->row();

        if ($salesItem) {

            $new_returned = $salesItem->returned_qty + $qty;

            if ($new_returned > $salesItem->qty) {
                $new_returned = $salesItem->qty;
            }

            $is_returned = ($new_returned >= $salesItem->qty) ? 1 : 0;

            $this->db->where('id', $salesItem->id)
                ->update('sales_items', [
                    'returned_qty' => $new_returned,
                    'is_returned'  => $is_returned
                ]);
        }

         foreach($serials as $serial) {
        
    $row = $this->db->where('organization_id', $loggedin_org_id)
                    ->where('branch_id', $branch_id)
                    ->where('product_id', $product_id)
                    ->where('batch_number', $serial)
                    //->where('quanity >', 0)
                    ->order_by('id', 'ASC')
                    ->limit(1)
                    ->get('inv_stock_item_batch')
                    ->row();
            

                        if(!$row) break;

                        $deduct = min($remaining_qty, $row->quanity);

                        $update_data = [
                            'quanity' => $row->quanity + $deduct,
                            'is_available' => 1,
                        ];

                        $this->db->where('id', $row->id)
                                ->update('inv_stock_item_batch', $update_data);

                        $remaining_qty -= $deduct;
                    }
                    }
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
            $this->db->set('quanity', 'quanity + '.$qty, FALSE)
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
    redirect(base_url() . "sales/salesreturn", "refresh");
}

}