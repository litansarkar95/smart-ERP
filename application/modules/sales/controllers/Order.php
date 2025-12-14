<?php
class Order extends MX_Controller
{
  public function __construct() {
    parent::__construct();
       $this->load->model("sales_model");
 
}
public function index()
{
 
    $data = array();
    $data['active']    = "order";
    $data['title'] = "Order List"; 
    $data['allPdt']       = $this->sales_model->getOrderList();
    $data['content'] = $this->load->view("order-list", $data, TRUE);
    $this->load->view('layout/master', $data);
 }
 public function invoice($id)
{
 
    $data = array();
    $data['active']       = "order";
    $data['title']        = "Order List"; 
    $data['allPdt']       = $this->sales_model->getSalesOrderList($id);
    $data['allDets']       = $this->sales_model->SalesOrderItemDetailsList($id);
  // echo "<pre>"; print_r($data['allPdt']);exit();
    $this->load->view('sales-order-invoice', $data);
 }
 

 public function create($id=NULL)
{


    $data = array();
    $data['active']         = "sales";
    $data['title']          = "Create Sales "; 
    $data['allUnit']        = $this->common_model->view_data("unit", array("is_active" => 1), "name", "ASC");;
    $data['allBrand']       = $this->main_model->getRecordsByOrg("brands");
    $data['allCat']         = $this->main_model->getRecordsByOrg("products_groups");
    $data['allInv']         = $this->main_model->getRecordsByOrg("warehouse");
    $data['allPro']         = $this->sales_model->get_all_products_with_available_stock();
    $data['allGroup']       = $this->main_model->getRecordsByOrg("partner_group");
    $data['allCustomer']    = $this->sales_model->getCustomer();
    $data['allPayment']     = $this->main_model->getRecordsByOrg("payment_method");
    // inv 
    $data['invoice']        = $this->sales_model->getInvoice($id);//echo "<pre>";print_r($data['invoice'] );exit();
  //  $data['allPdt']        = $this->purchase_model->PurchaseOrderCon($id);//echo "<pre>";print_r($data['invoice'] );exit();
    $data['allItem']       = $this->sales_model->getOrderItemList($id);
    //echo "<pre>";print_r($data['allItem'] );exit();
    $data['content']        = $this->load->view("order-sales-create", $data, TRUE);
    $this->load->view('layout/master', $data);
}

public function delete($id)
{
    $invoice = $this->common_model->view_data(
        "sales_invoice",
        array("invoice_code" => $id),
        "id",
        "asc"
    );

    if (!$invoice) {
        $this->session->set_flashdata('error', 'Invoice not found.');
        redirect(base_url() . "sales/order", "refresh");
        return;
    }

    $invoice_code = $invoice[0]->invoice_code;


    $items = $this->common_model->view_data(
        "sales_order_items",
        array("invoice_id" => $invoice_code),
        "id",
        "asc"
    );

    if (!empty($items)) {
        foreach ($items as $item) {

            $this->common_model->delete_data(
                "sales_order_item_serials",
                array("item_id" => $item->id)
            );
        }

      
        $this->common_model->delete_data(
            "sales_order_items",
            array("invoice_id" => $invoice_code)
        );
    }

    $this->common_model->delete_data(
        "sales_invoice",
        array("invoice_code" => $id)
    );

    $this->session->set_flashdata('success', 'Invoice and related items deleted successfully.');
    redirect(base_url() . "sales/order", "refresh");
}



}
