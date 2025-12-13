<?php
class Quotation extends MX_Controller
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


}


