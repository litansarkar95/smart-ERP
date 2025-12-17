<?php
class Warranty extends MX_Controller
{
  public function __construct() {
        parent::__construct();
        $this->load->model("quotation_model");
    }
  
      

public function index()
{

 
  $data = array();
  $data['active'] = "Quotation";
  $data['title'] = "Quotation"; 

  
  $data['content'] = $this->load->view("quotation-create", $data, TRUE);
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
  $data['allCat']         = $this->main_model->getRecordsByOrg("service_categories");
  
  $data['content'] = $this->load->view("warranty-search", $data, TRUE);
  $this->load->view('layout/master', $data);

}

public function invoice()
{

 
  $data = array();
  $data['active'] = "warranty";
  $data['title'] = "Warranty"; 
  $data['allCat']         = $this->main_model->getRecordsByOrg("service_categories");
  
  $this->load->view('warranty-invoice', $data);

}
}


