<?php
class Purchasebatch extends MX_Controller
{
  public function __construct() {
    parent::__construct();
       $this->load->model("purchase_model");
       $this->load->model("purchasebatch_model");
 
}
public function index()
{
 
    $data = array();
    $data['active']       = "purchase";
    $data['title']         = "Purchase List"; 
    $data['allPdt']       = $this->purchase_model->getPurchaseList();
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

  }

    $data = array();
    $data['active']         = "purchase";
    $data['title']          = "Create Purchase "; 
    $data['allUnit']        = $this->common_model->view_data("unit", array("is_active" => 1), "name", "ASC");;
    $data['allBrand']       = $this->main_model->getRecordsByOrg("brands");
    $data['allCat']         = $this->main_model->getRecordsByOrg("products_groups");
    $data['allInv']         = $this->main_model->getRecordsByOrg("warehouse");
    $data['allPro']         = $this->main_model->getRecordsByOrg("products");
    $data['allSuplier']     = $this->purchase_model->getSuplier();
    $data['allPayment']     = $this->main_model->getRecordsByOrg("payment_method");
    $data['allGroup']       = $this->main_model->getRecordsByOrg("partner_groups");
    // inv 
    $int_no = $this->purchase_model->number_generator();
    $invoice_no = 'GRN-'.str_pad($int_no,4,"0",STR_PAD_LEFT);
    $data['invoice_no'] = $invoice_no; 
    $data['content']        = $this->load->view("batch/purchase-create", $data, TRUE);
    $this->load->view('layout/master', $data);

}
public function add_item_ajax(){
    $invoice_code = $this->input->post('invoice_code');
    $existing = $this->db->get_where('purchase_invoice', ['invoice_code' => $invoice_code])->row();

    if($existing){
        $invoice_id = $existing->id;
    } else {
        $invoice_data = [
            'organization_id' => $this->session->userdata('loggedin_org_id'),
            'branch_id'       => $this->session->userdata('loggedin_branch_id'), 
            'invoice_code'    => $invoice_code,
            'supplier_id'     => $this->input->post('supplier_id'),
            'remarks'         => '',
            'status'          => 'Pending',
            'create_user'     => $this->session->userdata('loggedin_id'),
            'create_date'     => time()
        ];
        $invoice_id = $this->purchasebatch_model->insert_invoice($invoice_data);
    }

    $data = [
        'invoice_id'    => $invoice_id,
        'serial_type'   => $this->input->post('serial_type'),
        'product_id'    => $this->input->post('product_id'),
        'purchase_date' => time(),
        'price'         => $this->input->post('price'),
        'qty'           => $this->input->post('qty'),
        'rebate'        => $this->input->post('rebate'),
        'total_rebate'  => $this->input->post('total_rebate'),
        'sub_total'     => $this->input->post('sub_total'),
        'sales_price'   => $this->input->post('sales_price'),
        'warrenty'      => $this->input->post('warrenty'),
        'warrenty_days' => $this->input->post('warrenty_days'),
        'barcode_serial'=> $this->input->post('barcode_serial'),
        'create_date'   => time()
    ];

    $serials = $this->input->post('serials');

    $item_id = $this->purchasebatch_model->add_or_update_item($data, $serials);

    echo json_encode([
        'status' => 'success',
        'item_id'=> $item_id,
        'invoice_id' => $invoice_id
    ]);
}


  // DELETE SINGLE SERIAL
public function delete_item_serial(){
    $serial_id = $this->input->post('serial_id');

    if($serial_id){
        $this->purchasebatch_model->delete_serial($serial_id);
    } else {
        // Optionally handle deleting by serial_number + item_id if ID not provided
        $serial_number = $this->input->post('serial_number');
        $item_id = $this->input->post('item_id');
        if($serial_number && $item_id){
            $this->db->where('item_id', $item_id)
                     ->where('serial_number', $serial_number)
                     ->delete('purchase_order_item_serials');
        }
    }

    echo json_encode(['status'=>'success']);
}

// DELETE FULL ITEM
public function delete_item(){
    $item_id = $this->input->post('item_id');
    if(!$item_id){
        echo json_encode(['status'=>'error','message'=>'Item ID missing']);
        return;
    }

    $this->load->model('Purchasebatch_model');
    $this->Purchasebatch_model->delete_item($item_id);

    echo json_encode(['status'=>'success']);
}


}
