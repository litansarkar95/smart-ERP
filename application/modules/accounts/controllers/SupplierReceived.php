<?php
class SupplierReceived extends MX_Controller
{
  public function __construct() {
        parent::__construct();
        $this->load->model("partner/partner_model");
        $this->load->model("customerReceived_model");
    }
  
      

public function index()
{

 
  $data = array();
  $data['active'] = "SupplierReceived";
  $data['title'] = "Supplier Received"; 
  $data['allCustomer']         = $this->main_model->getRecordsByOrg("business_partner");
  $data['allPayment']         = $this->main_model->getRecordsByOrg("payment_method");
  $data['content'] = $this->load->view("supplier-received-create", $data, TRUE);
  $this->load->view('layout/master', $data);

}

public function get_customer_balance()
{
    $customer_id = $this->input->post('customer_id');

    if (!$customer_id) {
        echo json_encode([
            'status' => 'error'
        ]);
        return;
    }

    $customer = $this->db
        ->select('current_balance')
        ->from('business_partner')
        ->where('id', $customer_id)
        ->where_in('partner_type', ['Customer', 'Both'])
        ->get()
        ->row();

    if ($customer) {
        echo json_encode([
            'status' => 'success',
            'current_balance' => $customer->current_balance
        ]);
    } else {
        echo json_encode([
            'status' => 'error'
        ]);
    }
}
public function get_supplie_due_invoices()
{
    $customer_id = $this->input->post('customer_id');

    $invoices = $this->db
        ->select('invoice_no, totalAmount, dueAmount ,supplier_id')
        ->from('purchase')
        ->where('supplier_id', $customer_id)
        ->where('dueAmount >', 0)
        ->where('is_active', 1)
        ->order_by('purchase_date', 'ASC')
        ->get()
        ->result();

    if ($invoices) {
        echo json_encode([
            'status' => 'success',
            'data' => $invoices
        ]);
    } else {
        echo json_encode([
            'status' => 'empty'
        ]);
    }
}
public function save_due_collection()
{
    $invoice_no = $this->input->post('invoice_no');
    $customer_id = $this->input->post('customer_id');
    $due_amount = $this->input->post('due_amount');
    $discount_amount = $this->input->post('discount_amount');
    $payable_amount = $this->input->post('payable_amount');
    $paid_amount = $this->input->post('paid_amount');
    $received_date = $this->input->post('received_date');
    $payment_method_id = $this->input->post('bank_id');

    $this->db->trans_start();

foreach($invoice_no as $i => $inv){
    if(floatval($paid_amount[$i]) > 0){
        
        // Get sales_id and existing paidAmount
        $sale = $this->db->select('id, paidAmount')
                         ->where('invoice_no', $inv)
                         ->get('purchase')
                         ->row();

        if($sale){
            $sales_id = $sale->id;
             $int_no = $this->customerReceived_model->number_generator("acc_supplier_received");
        $invoice_n = 'SPGRN-'.str_pad($int_no,4,"0",STR_PAD_LEFT);
        $data = [
            "organization_id"            => $this->session->userdata('loggedin_org_id'),
            "branch_id"                  => $this->session->userdata('loggedin_branch_id'),
            "code_random"                => $int_no,
            "invoice_no"                 => $invoice_n,
            'purchase_id'                => $sales_id,
            'paid_amount'                => $paid_amount[$i],
            'discount_amount'            => $discount_amount[$i],
            'received_date'              => strtotime($received_date), 
            'payment_method_id'          => $payment_method_id, 
            'note'                       => $this->input->post('note'), 
            'create_user'                => $this->session->userdata('loggedin_id'),
            'create_date'                => strtotime($date)
        ];
        $this->db->insert('acc_supplier_received', $data);

        $insert_id = $this->db->insert_id();
        $converted_date = convert_date_ddmmyyyy_to_yyyymmdd($received_date);

        // account leger
        $total_tr_data = array(   
        "organization_id"            => $this->session->userdata('loggedin_org_id'),
        "branch_id"                  => $this->session->userdata('loggedin_branch_id'), 
        "voucher_type"               => 'Supplier Payment',  
        "invoice_no"                 => $invoice_n, 
        "supplier_received_id"       => $insert_id,   
        "party_id"                   => $customer_id,   
        "account_name"               => 'Supplier Payment Sales', 
        "particulars"                => 'Supplier Payment',   
        "date"                       => $converted_date,    
        "debit"                      => $paid_amount[$i],   
        "credit"                     => 0,
        "gl_date"                    => strtotime($received_date),
        "acc_coa_head_id"            => 0,   
        "payment_method"             => $payment_method_id,    
        "remarks"                    => 'Supplier Payment',
        "is_active"                  => 1,
        "create_user"                => $this->session->userdata('loggedin_id'),
        "create_date"                => strtotime($date),
       
    );
    


   $this->common_model->save_data("acc_general_ledger", $total_tr_data);

   if($discount_amount[$i] > 0){
     $total_tr_data = array(   
        "organization_id"            => $this->session->userdata('loggedin_org_id'),
        "branch_id"                  => $this->session->userdata('loggedin_branch_id'), 
        "voucher_type"               => 'Supplier Payment',  
        "invoice_no"                 => $invoice_n, 
        "supplier_received_id"       => $insert_id,   
        "party_id"                   => $customer_id,   
        "account_name"               => 'Supplier Payment Discount', 
        "particulars"                => 'Supplier Payment',   
        "date"                       => $converted_date,    
        "debit"                      => $discount_amount[$i],  
        "credit"                     => 0, 
        "gl_date"                    => strtotime($received_date),
        "acc_coa_head_id"            => 0,   
        "payment_method"             => $payment_method_id,    
        "remarks"                    => 'Supplier Received',
        "is_active"                  => 1,
        "create_user"                => $this->session->userdata('loggedin_id'),
        "create_date"                => strtotime($date),
       
    );
    


   $this->common_model->save_data("acc_general_ledger", $total_tr_data);
   }



              $current_bac= $this->partner_model->get_current_balance($customer_id);
                $current_balance = $current_bac->current_balance;
                $new_balance = $current_balance + ($paid_amount[$i]+$discount_amount[$i]);
                $this->partner_model->update_balance($customer_id, $new_balance);


            // $data = [
            //     "organization_id"            => $this->session->userdata('loggedin_org_id'),
            //     "branch_id"                  => $this->session->userdata('loggedin_branch_id'),
            //     'sales_id' => $sales_id,
            //     'paid_amount' => $paid_amount[$i],
            //     'discount_amount' => $discount_amount[$i],
            //     'bank_id' => $bank_id,
            //     'created_at' => date('Y-m-d H:i:s'),
            //     'created_by' => 2
            // ];

            // $this->db->insert('acc_customer_received', $data);

            // Update sales table
            $this->db->set('dueAmount', 'dueAmount - ' . floatval($paid_amount[$i]), FALSE)
                     ->set('paidAmount', 'paidAmount + ' . floatval($paid_amount[$i]), FALSE)
                     ->where('id', $sales_id)
                     ->update('purchase');
        }
    }
}



    $this->db->trans_complete();

    if ($this->db->trans_status() === FALSE) {
        $this->session->set_flashdata('error', 'Payment could not be saved!');
    } else {
        $this->session->set_flashdata('success', 'Payment saved successfully!');
    }

    redirect($_SERVER['HTTP_REFERER']);
}



public function save_auto_paid()
{
    $customer_id = $this->input->post('customer_id');
    $received_date = $this->input->post('received_date');
    $total_paid = floatval($this->input->post('total_paid'));
    $payment_method_id = $this->input->post('payment_method_id');
 
    $this->db->where('supplier_id', $customer_id);
    $this->db->where('dueAmount >', 0);
    $this->db->order_by('purchase_date', 'ASC'); 
    $invoices = $this->db->get('purchase')->result();
    $date = date("Y-m-d H:i:s");

    foreach ($invoices as $invoice) {
        if ($total_paid <= 0) break; 

        $due = $invoice->dueAmount;
        $paid_now = min($total_paid, $due);

      
        $this->db->where('id', $invoice->id);
        $this->db->update('purchase', [
            'paidAmount' => $invoice->paidAmount + $paid_now,
            'dueAmount' => $invoice->dueAmount - $paid_now
        ]);

        $int_no = $this->customerReceived_model->number_generator("acc_supplier_received");
        $invoice_no = 'SPGRN-'.str_pad($int_no,4,"0",STR_PAD_LEFT);

  
        $this->db->insert('acc_supplier_received', [
            "organization_id"            => $this->session->userdata('loggedin_org_id'),
            "branch_id"                  => $this->session->userdata('loggedin_branch_id'),
            "code_random"                => $int_no,
            "invoice_no"                 => $invoice_no,
            'purchase_id'                => $invoice->id,
            'paid_amount'                => $paid_now,
            'received_date'              => strtotime($received_date), 
            'payment_method_id'          => $payment_method_id, // Example, you can get from form
            'note'                       => $this->input->post('note'), // Example, you can get from form
            'create_user'                => $this->session->userdata('loggedin_id'),
            'create_date'                => strtotime($date)
        ]);
        $insert_id = $this->db->insert_id();

         $converted_date = convert_date_ddmmyyyy_to_yyyymmdd($received_date);

        // account leger
        $total_tr_data = array(   
        "organization_id"            => $this->session->userdata('loggedin_org_id'),
        "branch_id"                  => $this->session->userdata('loggedin_branch_id'), 
        "voucher_type"               => 'Supplier Payment',  
        "invoice_no"                 => $invoice_no, 
        "supplier_received_id"       => $insert_id,   
        "party_id"                   => $customer_id,   
        "account_name"               => 'Supplier Payment', 
        "particulars"                => 'Supplier Payment',   
        "date"                       => $converted_date,    
        "debit"                      => $paid_now,   
        "credit"                     => 0,   
        "gl_date"                    => strtotime($received_date),
        "acc_coa_head_id"            => 0,   
        "payment_method"             => $payment_method_id,    
        "remarks"                    => 'Supplier Payment',
        "is_active"                  => 1,
        "create_user"                => $this->session->userdata('loggedin_id'),
        "create_date"                => strtotime($date),
       
    );
    //


    $this->common_model->save_data("acc_general_ledger", $total_tr_data);

    // amounts
  
                $current_bac= $this->partner_model->get_current_balance($customer_id);
                $current_balance = $current_bac->current_balance;
                $new_balance = $current_balance + $paid_now;
                $this->partner_model->update_balance($customer_id, $new_balance);
            

        $total_paid -= $paid_now;
    }

    // Redirect or load view with success message
    $this->session->set_flashdata('success', 'Paid amount distributed successfully.');
    redirect($_SERVER['HTTP_REFERER']);
}


public function list()
{
 
    $data                 = array();
    $data['active']       = "supplierReceived";
    $data['title']        = "Supplier Received List"; 
    $data['allPdt']       = $this->customerReceived_model->getSupplierList();
    $data['content']      = $this->load->view("supplier-received-list", $data, TRUE);
    $this->load->view('layout/master', $data);
 }

public function invoice($id)
{
    $data['receipt'] = $this->customerReceived_model->getSupplierList($id);

    if (empty($data['receipt'])) {
        show_404();
    }

    $this->load->view('received_invoice', $data);
}

}


