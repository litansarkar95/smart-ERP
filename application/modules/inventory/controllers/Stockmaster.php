<?php
class Stockmaster extends MX_Controller
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
    $data['active']       = "Stock Balance";
    $data['title']        = "Stock Balance"; 
 
      //start

      $org_id           = $this->input->get("org_id") ;
      $is_active        = $this->input->get("is_active") ;



        if( $org_id == NULL  ){ 
        $org_id        =  0;
        } 
        
      
      

      $data['org_id']             = $this->input->get("org_id") ;
      $data['depertment_id']      = $this->input->get("is_active") ;
  
  
    $data['allorg'] =  $this->common_model->view_data("organizations", array("is_active" => 1), "id", "DESC");
    $data['allPdt']       = $this->inventory_model->StockBalance();
    $data['content'] = $this->load->view("stock-master-list", $data, TRUE);
    $this->load->view('layout/master', $data);
}


}


