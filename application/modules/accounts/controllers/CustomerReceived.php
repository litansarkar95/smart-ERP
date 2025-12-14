<?php
class CustomerReceived extends MX_Controller
{
  public function __construct() {
        parent::__construct();
       // $this->load->model("voucher_model");
    }
  
      

public function index()
{

 
  $data = array();
  $data['active'] = "CustomerReceived";
  $data['title'] = "Customer Received"; 
  $data['allCustomer']         = $this->main_model->getRecordsByOrg("business_partner");
  $data['allPayment']         = $this->main_model->getRecordsByOrg("payment_method");
  $data['content'] = $this->load->view("customer-received-create", $data, TRUE);
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
public function get_customer_due_invoices()
{
    $customer_id = $this->input->post('customer_id');

    $invoices = $this->db
        ->select('invoice_no, payableAmount, dueAmount')
        ->from('sales')
        ->where('customer_id', $customer_id)
        ->where('dueAmount >', 0)
        ->where('is_active', 1)
        ->order_by('sales_date', 'ASC')
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
    $due_amount = $this->input->post('due_amount');
    $discount_amount = $this->input->post('discount_amount');
    $payable_amount = $this->input->post('payable_amount');
    $paid_amount = $this->input->post('paid_amount');
    $bank_id = $this->input->post('bank_id');

    $this->db->trans_start();

foreach($invoice_no as $i => $inv){
    if(floatval($paid_amount[$i]) > 0){
        
        // Get sales_id and existing paidAmount
        $sale = $this->db->select('id, paidAmount')
                         ->where('invoice_no', $inv)
                         ->get('sales')
                         ->row();

        if($sale){
            $sales_id = $sale->id;

            $data = [
                'organization_id' => 1,
                'branch_id' => 1,
                'sales_id' => $sales_id,
                'paid_amount' => $paid_amount[$i],
                'discount_amount' => $discount_amount[$i],
                'bank_id' => $bank_id,
                'created_at' => date('Y-m-d H:i:s'),
                'created_by' => 2
            ];

            $this->db->insert('sales_payment', $data);

            // Update sales table
            $this->db->set('dueAmount', 'dueAmount - ' . floatval($paid_amount[$i]), FALSE)
                     ->set('paidAmount', 'paidAmount + ' . floatval($paid_amount[$i]), FALSE)
                     ->where('id', $sales_id)
                     ->update('sales');
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
    $total_paid = floatval($this->input->post('total_paid'));

    // Step 1: Get all due invoices for this customer (due > 0)
    $this->db->where('customer_id', $customer_id);
    $this->db->where('dueAmount >', 0);
    $this->db->order_by('sales_date', 'ASC'); // Oldest first
    $invoices = $this->db->get('sales')->result();

    foreach ($invoices as $invoice) {
        if ($total_paid <= 0) break; // No money left to pay

        $due = $invoice->dueAmount;
        $paid_now = min($total_paid, $due);

        // Update sales table
        $this->db->where('id', $invoice->id);
        $this->db->update('sales', [
            'paidAmount' => $invoice->paidAmount + $paid_now,
            'dueAmount' => $invoice->dueAmount - $paid_now
        ]);

        // Optional: Insert into sales_payment table
        $this->db->insert('sales_payment', [
            'sales_id' => $invoice->id,
            'paid_amount' => $paid_now,
            'payment_date' => time(),
            'payment_method_id' => 1, // Example, you can get from form
            'create_user' => $this->session->userdata('user_id'),
            'create_date' => time()
        ]);

        $total_paid -= $paid_now;
    }

    // Redirect or load view with success message
    $this->session->set_flashdata('success', 'Paid amount distributed successfully.');
    redirect($_SERVER['HTTP_REFERER']);
}

}


