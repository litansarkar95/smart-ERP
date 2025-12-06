
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
    $this->load->database();
    $this->load->library('session');

    $customer_id = $this->input->post('customer_id');
    $invoice_no = $this->input->post('invoice_no');
    $sales_date = strtotime($this->input->post('sales_date'));
    $paid_amount = $this->input->post('paidAmount') ?: 0;
    $adjustment = $this->input->post('adjustment') ?: 0;
    $total_amount = $this->input->post('totalAmount') ?: 0;
    $due_amount = $this->input->post('dueAmount') ?: 0;

    $items = $this->input->post('items'); // JSON বা array থেকে আসা উচিত [{product_id, qty, price, total, serials, serial_type}, ...]

    $this->db->trans_start();

    // Step 1: Insert into sales_return
    $sales_return_data = [
        'organization_id' => 1, // আপনার org_id
        'branch_id' => 1,       // branch_id
        'code_random' => rand(1000,9999),
        'invoice_no' => $invoice_no,
        'customer_id' => $customer_id,
        'sales_date' => $sales_date,
        'paid_amount' => $paid_amount,
        'adjustment' => $adjustment,
        'total_amount' => $total_amount,
        'due_amount' => $due_amount,
        'create_user' => $this->session->userdata('user_id'),
        'create_date' => time()
    ];

    $this->db->insert('sales_return', $sales_return_data);
    $sales_return_id = $this->db->insert_id();
// Form থেকে আসা items
$items_json = $this->input->post('items'); 

// JSON decode
$items = json_decode($items_json, true); // true দিলে assoc array হবে

if(!empty($items)) {
    foreach ($items as $item) {
        $item_data = [
            'sales_return_id' => $sales_return_id,
            'serial_type' => $item['serial_type'],
            'product_id'  => $item['product_id'],
            'qty'         => $item['qty'],
            'price'       => $item['price'],
            'total'       => $item['total'],
            'serials'     => isset($item['serials']) ? $item['serials'] : null
        ];

       // print_r($item_data); // Debug: দেখতে কী আসছে

        // Save in DB
        $this->db->insert('sales_return_items', $item_data);
    }
} else {
    echo "No items found!";
}

      

    $this->db->trans_complete();

    if ($this->db->trans_status() === FALSE) {
        // কোনো সমস্যা হলে
        echo json_encode(['status' => 'error', 'msg' => 'Failed to save sales return.']);
    } else {
        echo json_encode(['status' => 'success', 'msg' => 'Sales return saved successfully.', 'sales_return_id' => $sales_return_id]);
    }
}

}