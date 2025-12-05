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

  $this->form_validation->set_rules("totalAmount", "Total Amount", "required");
  $this->form_validation->set_rules("purchase_date", "Purchase date", "required");
  $this->form_validation->set_rules("supplier_id", "Supplier", "required");

  if ($this->form_validation->run() == NULL) {
  
  } else {

  }
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
        $user_id         = $this->session->userdata('user_id');

        $customer_id      = $this->input->post('customer_id');
        $payment_method_id= $this->input->post('payment_method_id');
        $paid_amount      = $this->input->post('paidAmount');
        $adjustment       = $this->input->post('adjustment');
        $total_amount     = $this->input->post('totalAmount');
        $due_amount       = $this->input->post('dueAmount');

        $items_json = $this->input->post('items');
        $items = json_decode($items_json, true);

        if(empty($items)){
            $this->session->set_flashdata('error', 'No items found!');
            redirect('sales/sreturn');
        }

        $this->db->trans_start();

        // ---------- INSERT MASTER ----------
        $master_data = [
            'customer_id' => $customer_id,
            'payment_method_id' => $payment_method_id,
            'paid_amount' => $paid_amount,
            'adjustment' => $adjustment,
            'total_amount' => $total_amount,
            'due_amount' => $due_amount,
            'create_user' => $user_id,
            'create_date' => time()
        ];
        $this->db->insert('sales_return', $master_data);
        $return_id = $this->db->insert_id();

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

            // ---------- Update Stock ----------
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

} else {
                    // Common product
               $remaining_qty = $qty;

while($remaining_qty > 0) {
    $row = $this->db->where('organization_id', $loggedin_org_id)
                    ->where('branch_id', $branch_id)
                    ->where('product_id', $product_id)
                    //->where('quanity >', 0)
                    ->order_by('id', 'ASC')
                    ->limit(1)
                    ->get('inv_stock_item_batch')
                    ->row();
                 

    if(!$row) break;

    $deduct = min($remaining_qty, $row->quanity);

    $update_data = [
        'quanity' => $row->quanity - $deduct,
        'is_available' => 1,
    ];

    $this->db->where('id', $row->id)
             ->update('inv_stock_item_batch', $update_data);

    $remaining_qty -= $deduct;
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
