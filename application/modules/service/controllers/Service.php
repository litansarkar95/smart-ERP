<?php
class Service extends MX_Controller
{
  public function __construct() {
    parent::__construct();
      
 
}
public function index()
{
 
    $data = array();
    $data['active'] = "Categories";
    $data['title'] = "Categories"; 
    $data['allPdt']       = $this->main_model->getRecordsByOrg("service_categories");
    $data['content'] = $this->load->view("categories", $data, TRUE);
    $this->load->view('layout/master', $data);
 }
 
 public function create()
{

  $this->form_validation->set_rules("name", display('name'), "required");

  if ($this->form_validation->run() == NULL) {
  
  } else {

    $leads_create = date("Y-m-d");
    $date = date("Y-m-d H:i:s");
    $data = array(   
        "organization_id"            => $this->session->userdata('loggedin_org_id'),
        "name"                       => $this->common_model->xss_clean($this->input->post("name")),   
        "amount"                     => $this->common_model->xss_clean($this->input->post("amount")),
        "is_active"                  => 1,
        "create_user"                => $this->session->userdata('loggedin_id'),
        "create_date"                => strtotime($date),
       
    );

   
    if ($this->common_model->save_data("service_categories", $data)) {
      $id = $this->common_model->Id;

        $this->session->set_flashdata('success', 'Record has been successfully saved.');
      }else{
        
   $this->session->set_flashdata('error', 'An error occurred. Please try again.');
      }
    
   redirect(base_url() . "service/categories");
  }

    $data = array();
    $data['active'] = "Categories";
    $data['title'] = "Categories"; 
    $data['allPdt']       = $this->main_model->getRecordsByOrg("service_categories");
    $data['content'] = $this->load->view("service-create", $data, TRUE);
    $this->load->view('layout/master', $data);
}




}