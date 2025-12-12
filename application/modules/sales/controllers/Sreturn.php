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
        $current_customer_id = $this->input->post('customer_id', true);

        if(empty($serial)) {
            echo json_encode([
                "status" => "error",
                "msg" => "Please enter or scan a serial!"
            ]);
            return;
        }

         
        $item = $this->sreturn_model->get_item_by_serial($serial, $current_customer_id);

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
                    "msg" => "This serial is  already returned or used!"
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
        $supplier = null;
        if(empty($current_customer_id)) {
            $supplier = $this->sreturn_model->get_by_id($item->customer_id);
        } else {
            $supplier = $this->sreturn_model->get_by_id($current_customer_id);
        }

        // =======================
        // Return JSON
        // =======================
     echo json_encode([
     "status"   => "success",
     "item"     => $item,       // এখন item->product_name থাকবে
     "customer" => $supplier
]);

    }
}
