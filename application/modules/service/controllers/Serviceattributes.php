<?php
class Serviceattributes extends MX_Controller
{
  public function __construct() {
    parent::__construct();
      $this->load->model("service_model");
 
}
public function index()
{
 
    $data = array();
    $data['active'] = "Serviceattributes";
    $data['title'] = "Service Attributes"; 
    $data['allCat']       = $this->main_model->getRecordsByOrg("service_name");
    $data['allPdt']       = $this->service_model->serviceAttributes();
    $data['content'] = $this->load->view("service-attributes-list", $data, TRUE);
    $this->load->view('layout/master', $data);
 }
 
 public function create()
{

  $this->form_validation->set_rules("service_id","Service", "required");
  $this->form_validation->set_rules("attributesName","Attributes Name", "required");

  if ($this->form_validation->run() == NULL) {
  
  } else {

    $leads_create = date("Y-m-d");
    $date = date("Y-m-d H:i:s");
    $data = array(   
        "organization_id"            => $this->session->userdata('loggedin_org_id'),
        'branch_id'                  => $this->session->userdata("loggedin_branch_id"),
        "service_name_id"            => $this->common_model->xss_clean($this->input->post("service_id")),   
        "name"                       => $this->common_model->xss_clean($this->input->post("attributesName")),   
        "is_checkbox"                => $this->common_model->xss_clean($this->input->post("is_checkbox")),   
        "is_input_entry"             => $this->common_model->xss_clean($this->input->post("is_input")),   
        "is_active"                  => 1,
        "create_user"                => $this->session->userdata('loggedin_id'),
        "create_date"                => strtotime($date),
       
    );

   
    if ($this->common_model->save_data("service_attributes", $data)) {
      $id = $this->common_model->Id;

        $this->session->set_flashdata('success', 'Record has been successfully saved.');
      }else{
        
   $this->session->set_flashdata('error', 'An error occurred. Please try again.');
      }
    
   redirect(base_url() . "service/serviceattributes");
  }

    $data = array();
    $data['active'] = "Serviceattributes";
    $data['title'] = "Service Attributes"; 
    $data['allCat']       = $this->main_model->getRecordsByOrg("service_name");
    $data['allPdt']       = $this->main_model->getRecordsByOrg("service_attributes");
    $data['content'] = $this->load->view("service-attributes-list", $data, TRUE);
    $this->load->view('layout/master', $data);
}

public function delete($id) {

  $dt = $this->common_model->view_data("service_attributes", array("id" => $id), "id", "asc");
 
 
  if ($dt) {
 
      $this->common_model->delete_data("service_attributes", array("id" => $id),$id);
      $this->session->set_flashdata('success', 'Record has been deleted.');
    
  } else {
     $this->session->set_flashdata('error', 'An error occurred. Please try again.');
  }

      redirect(base_url() . "service/serviceattributes", "refresh");

}

public function update(){

  $id=$this->input->post("id");
  $selPdt=$this->common_model->view_data("service_attributes",array("id"=>$id),"id","desc");
 
  $data = array(
    "name"                       => $this->common_model->xss_clean($this->input->post("ename")),   
    "is_active"                  => $this->common_model->xss_clean($this->input->post("is_active")),
                  
      );

      
      if ($this->common_model->update_data("service_attributes", $data,array("id"=>$id),$id)) {
          $this->session->set_flashdata('success', 'Your changes have been successfully updated.');
      }
      else{
        $this->session->set_flashdata('error', 'An error occurred. Please try again.');
      }
      $this->session->set_userdata($sdata);
      redirect(base_url() . "service/serviceattributes", "refresh");
}


}
