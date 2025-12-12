<?php
class Sreturn extends MX_Controller{
  public function __construct() {
    parent::__construct();
       $this->load->model("sreturn_model");
    //  $this->load->model("partner/partner_model");
 
}

 
 public function index()
{

    $data = array();
    $data['active']         = "purchase";
    $data['title']          = "Purchase Return"; 
//     $data['allBrand']       = $this->main_model->getRecordsByOrg("brands");
//     $data['allCat']         = $this->main_model->getRecordsByOrg("products_groups");
//     $data['allInv']         = $this->main_model->getRecordsByOrg("warehouse");
//     $data['allPro']         = $this->main_model->getRecordsByOrg("products");
     
//     $data['allPayment']     = $this->main_model->getRecordsByOrg("payment_method");
//     $data['allGroup']       = $this->main_model->getRecordsByOrg("partner_group");
    // inv 

    $data['content']        = $this->load->view("return/sreturn-create", $data, TRUE);
    $this->load->view('layout/master', $data);
}
public function get_invoice_by_customer()
{
    $customer_id = $this->input->post('customer_id');

    $result = $this->sreturn_model->get_invoice_by_customer($customer_id);

    echo json_encode($result);
}

public function get_products_by_invoice()
{
    $invoice_id = $this->input->post('invoice_id');

    $products = $this->sreturn_model->get_products_by_invoice($invoice_id);

    echo json_encode($products);
}

public function get_serial_by_product()
{
    $product_id = $this->input->post('product_id');
    $invoice_id = $this->input->post('invoice_id');

    $result = $this->sreturn_model->get_serial_by_product($product_id, $invoice_id);

    echo json_encode($result);
}

public function get_serial_items_by_product()
{
    $product_id = $this->input->post('product_id', true);
    $invoice_id = $this->input->post('invoice_id', true);
    $batch_number = $this->input->post('batch_number', true);

    $items = $this->sreturn_model->get_serial_items_by_product($product_id, $invoice_id,$batch_number);

    // Customer info: প্রথম item থেকে supplier_id ধরে
    $customer = null;
    if(!empty($items)) {
        $customer_id = $items[0]->supplier_id;
        $customer = $this->sreturn_model->get_by_id($customer_id); // আপনার model function
    }

    echo json_encode([
        "status" => "success",
        "item" => $items,
        "customer" => $customer
    ]);
}


public function add_item_from_serial_ajax() {

        $serial = $this->input->post('serial', true);
       //$serial ="aa";
        $current_customer_id = $this->input->post('customer_id', true);

        if(empty($serial)) {
            echo json_encode([
                "status" => "error",
                "msg" => "Please enter or scan a serial!"
            ]);
            return;
        }

         
    

      
    $items = $this->sreturn_model->get_item_by_serial($serial, $current_customer_id);

    // Customer info: প্রথম item থেকে supplier_id ধরে
    $customer = null;
    if(!empty($items)) {
        $customer_id = $items[0]->customer_id;
        $customer = $this->sreturn_model->get_by_id($customer_id); // আপনার model function
    }

    echo json_encode([
        "status" => "success",
        "item" => $items,
        "customer" => $customer
    ]);

    }
}
