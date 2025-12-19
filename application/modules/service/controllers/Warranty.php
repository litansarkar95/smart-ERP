<?php
class Warranty extends MX_Controller
{
  public function __construct() {
        parent::__construct();
        $this->load->model("service_model");
    }
  
      

public function index()
{

 
  $data = array();
  $data['active'] = "warranty";
  $data['title'] = "warranty"; 
  $data['allPdt'] = $this->service_model->ServiceWarranty();
  
  $data['content'] = $this->load->view("warranty-list", $data, TRUE);
  $this->load->view('layout/master', $data);

}

public function create()
{

 
  $data = array();
  $data['active'] = "warranty";
  $data['title'] = "Warranty Create"; 

  
  $data['content'] = $this->load->view("warranty-create", $data, TRUE);
  $this->load->view('layout/master', $data);

}

public function search()
{

 
   $data = array();
   $data['active'] = "warranty";
   $data['title'] = "Warranty"; 
   $enter_serial  = trim($this->input->post('enter_serial'));
   $serial_list   = trim($this->input->post('serial_list'));

    if (empty($enter_serial) && empty($serial_list)) {
        $this->session->set_flashdata(
            'error',
            'Please enter serial OR select serial'
        );
        redirect('service/warranty/create');
    }

  $serial = !empty($enter_serial) ? $enter_serial : $serial_list;

$info = $this->service_model->get_warranty_info_by_serial($serial);
$insl = $this->service_model->get_warranty_sales_info_by_serial($serial);

if (!$info) {
    $this->session->set_flashdata('error', 'Serial not found');
    redirect('service/warranty/create');
}

$purchase_ts   = (int) $info->purchase_ts;
$warranty_val  = (int) $info->warrenty;
$unit          = strtolower($info->warrenty_days);

if ($unit === 'month' || $unit === 'months') {
    $expire_ts = strtotime("+{$warranty_val} months", $purchase_ts);
} else {
    $expire_ts = $purchase_ts + ($warranty_val * 86400);
}

$remaining_days = floor(($expire_ts - time()) / 86400);
$remaining_days = max(0, $remaining_days);

//###############################  sales

$sales_ts   = (int) $insl->sales_ts;
$warranty_val  = (int) $insl->warrenty;
$unit          = strtolower($insl->warrenty_days);

if ($unit === 'month' || $unit === 'months') {
    $expire_ts = strtotime("+{$warranty_val} months", $sales_ts);
} else {
    $expire_ts = $sales_ts + ($warranty_val * 86400);
}

$sales_remaining_days = floor(($expire_ts - time()) / 86400);
$sales_remaining_days = max(0, $sales_remaining_days);




    $data['info'] = [
        'serial'                     => $serial,
        'supplier_id'                => $info->supplier_id,
        'purchase_id'                => $info->purchase_id,
        'invoice_no'                 => $info->invoice_no,
        'purchase_date'              => date('d-m-Y', $info->purchase_ts),
        'supplier'                   => $info->supplier_name,
        'warranty_left'              => ($remaining_days > 0)
            ? $remaining_days . ' Days Remaining'
            : 'Warranty Expired',
          

    ];
       $data['sales_info'] = [
        
        'customer_id'                => $insl->customer_id,
        'sales_id'                   => $insl->sales_id,
        'sinvoice_no'                => $insl->invoice_no,
        'sales_date'                 => date('d-m-Y', $insl->sales_ts),
        'customer_name'              => $insl->customer_name,
        'sales_warranty_left'        => ($sales_remaining_days > 0)
            ? $sales_remaining_days . ' Days Remaining'
            : 'Warranty Expired',     

    ];
  $data['allCat']         = $this->main_model->getRecordsByOrg("service_categories");
  
  $data['content'] = $this->load->view("warranty-search", $data, TRUE);
  $this->load->view('layout/master', $data);

}
public function get_serial_by_product()
{
    $product_id = $this->input->post('product_id');
    $invoice_id = $this->input->post('invoice_id');

    $result = $this->service_model->get_serial_by_product($product_id, $invoice_id);

    echo json_encode($result);
}
public function save()
{

    $leads_create = date("Y-m-d");
    $date = date("Y-m-d H:i:s");
    $data = array(   
        "organization_id"            => $this->session->userdata('loggedin_org_id'),
        "branch_id"                  => $this->session->userdata('loggedin_branch_id'), 
        "invoice_no"                 => "SE-".rand(1000000,999999999),
        "purchase_id"                => $this->common_model->xss_clean($this->input->post("purchase_id")),   
        "supplier_id"                => $this->common_model->xss_clean($this->input->post("supplier_id")),   
        "sales_id"                   => $this->common_model->xss_clean($this->input->post("sales_id")),   
        "customer_id"                => $this->common_model->xss_clean($this->input->post("customer_id")),   
        "serial"                     => $this->common_model->xss_clean($this->input->post("serial")),   
        "delivery_date"              => strtotime($this->common_model->xss_clean($this->input->post("delivery_date"))),   
        "is_active"                  => 1,
        "create_user"                => $this->session->userdata('loggedin_id'),
        "create_date"                => strtotime($date),
       
    );

  
    if ($this->common_model->save_data("service_warranty", $data)) {
        $id = $this->common_model->Id;
        $problem_ids = $this->input->post('problem_id'); // array
        $rates       = $this->input->post('rate'); 
        if (!empty($problem_ids)) {
        foreach ($problem_ids as $cat_id => $value) {

        $pdata = array(   
        "organization_id"            => $this->session->userdata('loggedin_org_id'),
        "branch_id"                  => $this->session->userdata('loggedin_branch_id'), 
        "service_warranty_id"        => $id,   
        "service_categories_id"      => $cat_id,   
        "amount"                     => isset($rates[$cat_id]) ? $rates[$cat_id] : 0,     
        "is_active"                  => 1,
        "create_user"                => $this->session->userdata('loggedin_id'),
        "create_date"                => strtotime($date),
       
    );
     $this->common_model->save_data("service_warranty_order", $pdata);
      }
     

        }
        $this->session->set_flashdata('success', 'Record has been successfully saved.');
           redirect(base_url() . "service/warranty/invoice/$id");
      }else{
        
     $this->session->set_flashdata('error', 'An error occurred. Please try again.');
      }
    
   redirect(base_url() . "service/warranty/create");


}
public function invoice($invoice_id)
{

 
  $data = array();
  $data['active'] = "warranty";
  $data['title'] = "Warranty"; 

    $warranty = $this->service_model->get_service_warranty($invoice_id);
    $orders   = $this->service_model->get_service_warranty_order_with_product($invoice_id);

    $data = [
        'warranty' => $warranty,
        'orders'   => $orders
    ];
  //print_r($warranty);exit();
  
  $this->load->view('warranty-invoice', $data);

}


}


