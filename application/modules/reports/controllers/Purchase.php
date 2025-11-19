<?php
class Purchase extends MX_Controller
{
  public function __construct() {
    parent::__construct();
      $this->load->model("reports_model");
 
}
public function index()
{
 
    $data = array();
    $data['active']    = "products";
    $data['title'] = "Products List"; 
    $data['allCat']         = $this->main_model->getRecordsByOrg("products_groups");
    $data['content'] = $this->load->view("purchase/purchas-new", $data, TRUE);
    $this->load->view('layout/master', $data);
 }
 public function purchase_statement()
    {
        $from = $this->input->get('from');
        $to   = $this->input->get('to');
        $p_group = $this->input->get('group');



        $data['report'] = $this->reports_model->purchaseStatement($from, $to, $p_group);
        $data['from'] = $from;
        $data['to'] = $to;
       // echo "<pre>";print_r($data['report']);exit();

        $this->load->view("reports/purchase/purchase_statement", $data);
    }
    
}
