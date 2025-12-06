<?php
class Sreturn extends MX_Controller
{
  public function __construct() {
    parent::__construct();
       $this->load->model("sales_model");
       $this->load->model("sreturn_model");
 
}

 
 public function index()
{

    $data = array();
    $data['active']         = "purchase";
    $data['title']          = "Create Purchase "; 
    $data['allUnit']        = $this->common_model->view_data("unit", array("is_active" => 1), "name", "ASC");;
    $data['allBrand']       = $this->main_model->getRecordsByOrg("brands");
    $data['allCat']         = $this->main_model->getRecordsByOrg("products_groups");
    $data['allInv']         = $this->main_model->getRecordsByOrg("warehouse");
    $data['allPro']         = $this->sales_model->get_all_products_with_available_stock();
    $data['allGroup']       = $this->main_model->getRecordsByOrg("partner_group");
    $data['allCustomer']    = $this->sales_model->getCustomer();
    $data['allPayment']     = $this->main_model->getRecordsByOrg("payment_method");

    $data['content']        = $this->load->view("sales-return-create", $data, TRUE);
    $this->load->view('layout/master', $data);
}
public function list()
{
 
    $data                 = array();
    $data['active']       = "sales_return";
    $data['title']        = "Sales Return List"; 
    $data['allPdt']       = $this->sreturn_model->getSalesReturnList();
    $data['content']      = $this->load->view("sales-return-list", $data, TRUE);
    $this->load->view('layout/master', $data);
 }

public function invoice($id)
{
 
    $data = array();
    $data['active']       = "invoice";
    $data['title']        = "invoice"; 
    $data['allPdt']       = $this->sales_model->getSalesList($id);
    $data['allDets']       = $this->sales_model->SalesItemDetailsList($id);
    $this->load->view('sales-return-invoice', $data);
 }
 
    public function get_products_by_customer($customer_id) {
        $data = $this->sreturn_model->get_products_by_customer($customer_id);
        echo json_encode($data);
    }

    // Get serial numbers for selected product by that customer
    public function get_serial_numbers_by_product($product_id, $customer_id) {
        $data = $this->sreturn_model->get_serial_numbers_by_product($product_id, $customer_id);
       $result = [];

foreach ($data as $row) {
    for ($i = 0; $i < $row->qty_sold; $i++) {
        $result[] = [
            'batch_number' => $row->batch_number,
            'serial_type'  => $row->serial_type
        ];
    }
}

echo json_encode($result);
    }
public function get_product_price($product_id, $customer_id)
{
    $this->db->select('sales_price');
    $this->db->from('sales_item_batch_profit_loss sib');
    $this->db->join('sales s', 's.id = sib.sales_id');
    $this->db->where('sib.product_id', $product_id);
    $this->db->where('s.customer_id', $customer_id);

    $row = $this->db->get()->row();

    echo json_encode([
        'price' => $row ? $row->sales_price : 0
    ]);
}

public function create() {
    if($this->input->post()) {

        $loggedin_org_id = $this->session->userdata("loggedin_org_id");
        $branch_id       = $this->session->userdata("loggedin_branch_id");
        $user_id         = $this->session->userdata('loggedin_id');

        $customer_id       = $this->input->post('customer_id');
        $payment_method_id = $this->input->post('payment_method_id');
        $paid_amount       = $this->input->post('paidAmount');
        $adjustment        = $this->input->post('adjustment');
        $total_amount      = $this->input->post('totalAmount');
        $due_amount        = $this->input->post('dueAmount');
        $sales_date        = $this->input->post('sales_date');
        $paymentMethodId        = $this->input->post('payment_method_id');

        $items_json = $this->input->post('items');
        $items = json_decode($items_json, true);

        if(empty($items)){
            $this->session->set_flashdata('error', 'No items found!');
            redirect('sales/sreturn');
        }

        $this->db->trans_start();

        // ---------- INSERT MASTER ----------
        $int_no = $this->sreturn_model->number_generator();
        $invoice_no = 'SRTN-'.str_pad($int_no,4,"0",STR_PAD_LEFT);

        $master_data = [
            'organization_id'        => $loggedin_org_id,
            'branch_id'              => $branch_id,
            'customer_id'            => $customer_id,
            "code_random"            => $int_no,
            'invoice_no'             => $invoice_no,
            'sales_date'             => strtotime($this->common_model->xss_clean($this->input->post("sales_date"))),
            'paid_amount'         => $paid_amount,
            'adjustment' => $adjustment,
            'total_amount' => $total_amount,
            'due_amount' => $due_amount,
            'create_user' => $user_id,
            'create_date' => time()
        ];
        $this->db->insert('sales_return', $master_data);
        $return_id = $this->db->insert_id();

        //===============================================================
        //===================== Accounts

        $payableAmount = $this->input->post('payableAmount') ?? 0;
        $paidAmount = $this->input->post('paidAmount') ?? 0;
   

     $converted_date = convert_date_ddmmyyyy_to_yyyymmdd($sales_date);

        $total_tr_data = array(   
        "organization_id"            => $this->session->userdata('loggedin_org_id'),
        "branch_id"                  => $this->session->userdata('loggedin_branch_id'), 
        "voucher_type"               => 'Sales Return',  
        "sales_return_id"            => $return_id,   
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
        "sales_return_id"            => $return_id,   
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

        foreach($items as $item) {

            $product_id = $item['product_id'];
            $qty        = $item['qty'];
            $price      = $item['price'];
            $total      = $item['total'];
            $serials    = explode(',', $item['serials']);
            $serial_type = $item['serial_type'];
            // ---------- Insert into sales_return_items ----------

            $item_data = [
                'sales_return_id' => $return_id,
                'product_id'      => $product_id,
                'qty'             => $qty,
                'price'           => $price,
                'total'           => $total,
                'serials'         => implode(',', $serials)
            ];
            $this->db->insert('sales_return_items', $item_data);


// UNIQUE ============================


///////////////////////
// UPDATE returned_qty + is_returned
///////////////////////

foreach ($serials as $ser) {
    $ser = trim($ser);

    // ========================
    // UNIQUE PRODUCT RETURN
    // ========================
    if ($serial_type == 'unique') {

        $sales_serial = $this->db
             ->select('sales_item_id')
            ->where('batch_number', $ser)
            ->where('is_returned', 0)
            ->get('sales_item_batch_profit_loss')
            ->row();

        if ($sales_serial) {

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
        }
    }

    // ========================
    // COMMON PRODUCT RETURN
    // ========================
    else {

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
    }
}




            #########################
            ##### End UPdate
            #####################

            foreach($serials as $serial) {
             
                $serial = trim($serial);

              if($serial_type == 'unique') {
          $this->db->where('organization_id', $loggedin_org_id)
         ->where('branch_id', $branch_id)
         ->where('product_id', $product_id)
         ->where('serial', $serial)
         ->update('inv_stock_item_serial', [
             'quanity' => 1,
             'is_available' => 1
         ]);


          $this->db->where('serial_number', $serial)
         ->update('sales_order_item_serials', [
             'is_available' => 1
         ]);

         //update
          $this->db->where('organization_id', $loggedin_org_id)
         ->where('branch_id', $branch_id)
         ->where('product_id', $product_id)
         ->where('batch_number', $serial)
         ->update('sales_item_batch_profit_loss', [
             'is_returned' => 1
         ]);

        } else {
                    // Common product
               $remaining_qty = $qty;

while($remaining_qty > 0) {

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
            }
        }

        $this->db->trans_complete();

        if($this->db->trans_status() === FALSE) {
            $this->session->set_flashdata('error', 'Return failed!');
        } else {
            $this->session->set_flashdata('success', 'Return saved successfully!');
        }

        redirect('sales/sreturn');
    }

   
}

}
