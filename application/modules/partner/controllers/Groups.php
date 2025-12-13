<?php
class Groups extends MX_Controller
{
  public function __construct() {
    parent::__construct();
      
 
}
public function index()
{
 
    $data = array();
    $data['active'] = "partner/groups";
    $data['title'] = "Partner Groups"; 
    $data['allPdt']       = $this->main_model->getRecordsByOrg("partner_groups");
    $data['content'] = $this->load->view("groups-list", $data, TRUE);
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
        "is_active"                  => 1,
        "create_user"                => $this->session->userdata('loggedin_id'),
        "create_date"                => strtotime($date),
       
    );

   
    if ($this->common_model->save_data("partner_groups", $data)) {
      $id = $this->common_model->Id;

        $this->session->set_flashdata('success', 'Record has been successfully saved.');
      }else{
        
   $this->session->set_flashdata('error', 'An error occurred. Please try again.');
      }
    
   redirect(base_url() . "partner/groups");
  }

    $data = array();
    $data['active'] = "partner/groups";
    $data['title'] = "partner Groups"; 
    $data['allPdt']       = $this->main_model->getRecordsByOrg("partner_groups");
    $data['content'] = $this->load->view("groups-list", $data, TRUE);
    $this->load->view('layout/master', $data);
}

public function delete($id) {

  $dt = $this->common_model->view_data("partner_groups", array("id" => $id), "id", "asc");
 
 
  if ($dt) {
 
      $this->common_model->delete_data("partner_groups", array("id" => $id),$id);
      $this->session->set_flashdata('success', 'Record has been deleted.');
    
  } else {
     $this->session->set_flashdata('error', 'An error occurred. Please try again.');
  }

      redirect(base_url() . "partner/groups", "refresh");

}

public function update(){

  $id=$this->input->post("id");
  $selPdt=$this->common_model->view_data("partner_groups",array("id"=>$id),"id","desc");
 
  $data = array(
    "name"                       => $this->common_model->xss_clean($this->input->post("ename")),   
    "is_active"                  => $this->common_model->xss_clean($this->input->post("is_active")),
                  
      );

      
      if ($this->common_model->update_data("partner_groups", $data,array("id"=>$id),$id)) {
          $this->session->set_flashdata('success', 'Your changes have been successfully updated.');
      }
      else{
        $this->session->set_flashdata('error', 'An error occurred. Please try again.');
      }
      $this->session->set_userdata($sdata);
      redirect(base_url() . "partner/groups", "refresh");
}


}
