<?php
class Permissions extends MX_Controller
{
  public function __construct() {
    parent::__construct();

}


public function index()
{

  
  $this->form_validation->set_rules("name", "Name", "required");
  $this->form_validation->set_rules("controller", "Controller", "required");
  $this->form_validation->set_rules("method", "Method", "required");

  if ($this->form_validation->run() == NULL) {
  
  } else {
  

    $name       = $this->common_model->xss_clean($this->input->post("name"));
    $controller = $this->common_model->xss_clean($this->input->post("controller"));
    $method     = $this->common_model->xss_clean($this->input->post("method"));
    $url        = $this->common_model->xss_clean($this->input->post("url"));

    $date = date("Y-m-d H:i:s");

    $data = array(   
        "name"                             => $name,   
        "controller"                       => $controller,   
        "method"                           => $method,  
        "url"                              => $url,
        "is_active"                        => 1, 
        "create_date"                      => strtotime($date),
    );

    $this->db->where('name', $name);
    $this->db->where('controller', $controller);
    $this->db->where('method', $method);
    $this->db->where('url', $url);

    $exists = $this->db->get('permissions')->row();

    if ($exists) {
        $this->session->set_flashdata('error', 'Permission already exists.');
    } else {
        if ($this->common_model->save_data("permissions", $data)) {
            $id = $this->common_model->Id;
           $this->session->set_flashdata('success', 'Your data has been saved successfully.');
        } else {
         $this->session->set_flashdata('error', 'Oops! Something went wrong. Please try again later.');
        }
    }

    redirect(base_url() . "settings/permissions", "refresh");

  }


    $data = array();
    $data['active'] = "menu_permissions";
    $data['title'] = "Roles permissions"; 
    $data['allRoles'] = $this->menu_model->Roles();
    $data['allPdt'] = $this->common_model->view_data("permissions", "", "id", "DESC");
    $data['content'] = $this->load->view("permissions/permissions-list", $data, TRUE);
    $this->load->view('layout/master', $data);
}

public function delete($id) {
  
  $dt = $this->common_model->view_data("permissions", array("id" => $id), "id", "asc");

     
    if ($dt) {

        $this->common_model->delete_data("permissions", array("id" => $id));
        $this->common_model->delete_data("user_permissions", array("permission_id" => $id));
        $this->common_model->delete_data("role_permissions", array("permission_id" => $id));
     
      $this->session->set_flashdata('success', 'Record has been deleted.');
      
    } else {
    $this->session->set_flashdata('error', 'Oops! Something went wrong. Please try again later.');
    }
  
    redirect(base_url() . "settings/permissions", "refresh");
  
  }
public function update(){
    
        $id=$this->input->post("id");
        $selPdt=$this->common_model->view_data("permissions",array("id"=>$id),"id","desc");
       
        $data = array(
                  "name"           => $this->common_model->xss_clean($this->input->post("ename")),   
                  "controller"     => $this->common_model->xss_clean($this->input->post("econtroller")),   
                  "method"         => $this->common_model->xss_clean($this->input->post("emethod")),  
                  "url"            => $this->common_model->xss_clean($this->input->post("eurl")),
                  "is_active"            => $this->common_model->xss_clean($this->input->post("is_active"))
                        
            );
            if ($this->common_model->update_data("permissions", $data,array("id"=>$id))) {
             $this->session->set_flashdata('success', 'Record has been updated.');
            }
            else{
               $this->session->set_flashdata('error', 'Oops! Something went wrong. Please try again later.');
            }
            $this->session->set_userdata($sdata);
            redirect(base_url() . "settings/permissions", "refresh");
    }
}