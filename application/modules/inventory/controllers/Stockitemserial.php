<?php
class Stockitemserial extends MX_Controller
{
  public function __construct() {
    parent::__construct();
      if (!$this->session->userdata('loggedin')){
            redirect(base_url() , "refresh");
          }
    $this->load->model("inventory_model");
 
}

 public function index()
{

    $data = array();
    $data['active']       = "Stock Item Serial";
    $data['title']        = "Stock Item Serial"; 
    $data['allStaff']     =  $this->common_model->view_data("staff", "", "id", "DESC");
 
      //start

      $org_id           = $this->input->get("org_id") ;
      $is_active        = $this->input->get("is_active") ;



        if( $org_id == NULL  ){ 
        $org_id        =  0;
        } 
        
      
      

      $data['org_id']             = $this->input->get("org_id") ;
      $data['depertment_id']      = $this->input->get("is_active") ;
  
  
    $data['allorg'] =  $this->common_model->view_data("organizations", array("is_active" => 1), "id", "DESC");
    $data['allPdt']       = $this->inventory_model->StockItemSerial();
    $data['content'] = $this->load->view("stockitemserial-list", $data, TRUE);
    $this->load->view('layout/master', $data);
}


}


