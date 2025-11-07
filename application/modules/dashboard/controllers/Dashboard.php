<?php
class Dashboard extends MX_Controller
{
  public function __construct() {
        parent::__construct();
        
    }
  
      

public function index()
{

 
  $data = array();
  $data['active'] = "dashboard";
  $data['title'] = "Dashboard"; 

//  $total = $this->session->userdata($sessionData);
//   print_r( $total);exit();
  $data['content'] = $this->load->view("dashboard", $data, TRUE);
  $this->load->view('layout/master', $data);

}

public function setlanguage() {
  $language=$this->input->post("lan");
  $this->session->set_userdata("site_lang",$language);
  $this->session->set_flashdata("success","Successful Language ".ucfirst($language));

}
public function logout() {
  $this->session->sess_destroy();
  redirect("");
}
}


