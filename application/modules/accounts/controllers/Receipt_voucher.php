<?php
class Receipt_voucher extends MX_Controller
{
  public function __construct() {
        parent::__construct();
       // $this->load->model("voucher_model");
    }
  
      

public function index()
{

 
  $data = array();
  $data['active'] = "Receipt";
  $data['title'] = "Receipt"; 

  
  $data['content'] = $this->load->view("receipt-create", $data, TRUE);
  $this->load->view('layout/master', $data);

}


}


