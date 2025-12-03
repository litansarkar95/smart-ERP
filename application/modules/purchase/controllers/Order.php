<?php
class Order extends MX_Controller
{
  public function __construct() {
    parent::__construct();
       $this->load->model("purchase_model");
 
}
public function index()
{
 
    $data = array();
    $data['active']    = "order";
    $data['title'] = "Order List"; 
    $data['allPdt']       = $this->purchase_model->getOrderList();
    $data['content'] = $this->load->view("order-list", $data, TRUE);
    $this->load->view('layout/master', $data);
 }
 
 public function create($id=NULL)
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
    $data['allGroup']       = $this->main_model->getRecordsByOrg("partner_group");

    $data['invoice']       = $this->purchase_model->getInvoice($id);//echo "<pre>";print_r($data['invoice'] );exit();
    $data['allItem']       = $this->purchase_model->getOrderItemList($id);
    // inv 

    $data['content']        = $this->load->view("order-purchase-create", $data, TRUE);
    $this->load->view('layout/master', $data);
}
public function delete($id)
{
    $invoice = $this->common_model->view_data(
        "purchase_invoice",
        array("id" => $id),
        "id",
        "asc"
    );

    if (!$invoice) {
        $this->session->set_flashdata('error', 'Invoice not found.');
        redirect(base_url() . "purchase/order", "refresh");
        return;
    }

    $invoice_code = $invoice[0]->invoice_code;


    $items = $this->common_model->view_data(
        "purchase_order_items",
        array("invoice_id" => $invoice_code),
        "id",
        "asc"
    );

    if (!empty($items)) {
        foreach ($items as $item) {

            $this->common_model->delete_data(
                "purchase_order_item_serials",
                array("item_id" => $item->id)
            );
        }

      
        $this->common_model->delete_data(
            "purchase_order_items",
            array("invoice_id" => $invoice_code)
        );
    }

    $this->common_model->delete_data(
        "purchase_invoice",
        array("id" => $id)
    );

    $this->session->set_flashdata('success', 'Invoice and related items deleted successfully.');
    redirect(base_url() . "purchase/order", "refresh");
}




}
