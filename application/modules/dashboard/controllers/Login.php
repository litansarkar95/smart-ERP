<?php
class Login extends MX_Controller
{
  public function __construct() {
    parent::__construct();
  //  $this->load->model("authentication_model");
 
}
public function index()
{

 $loggedin = $this->session->userdata('loggedin');
    if($loggedin){
        redirect(base_url() . "dashboard", "refresh");
    }

      $this->form_validation->set_rules('username', 'Username',  "required");
      $this->form_validation->set_rules("password", "Password", "required");
  
  if ($this->form_validation->run() == NULL) {

  }else{
    //$this->session->unset_userdata('captcha');
    $username       = $this->security->xss_clean($this->input->post("username"));
    $password       = $this->security->xss_clean($this->input->post("password"));
    

    $login_credential = $this->common_model->admin_login($username, $password);

 
    if ($login_credential) {
        if ($login_credential->active) {
            if ($login_credential->role == 1) {
                $userType = 'superadmin';
            } elseif($login_credential->role == 2) {
                $userType = 'admin';
            } elseif($login_credential->role == 3) {
                $userType = 'staff';
            } elseif($login_credential->role == 4) {
                $userType = 'client';
            }  elseif($login_credential->role == 5) {
                $userType = 'manager';
            } elseif($login_credential->role == 6) {
                $userType = 'accounts';
            }else {
                $userType = 'user';
            }
            $getUser = $this->common_model->getUserNameByRoleID($login_credential->role, $login_credential->user_id);
           // print_r($getUser);exit();       // get logger name
                   $sessionData = array(
                    'name' => $getUser['name'],
                    'logger_photo' => $getUser['picture'],
                    'logger_contact' => $getUser['contact_no'],
                    'loggedin_org_id' => $login_credential->organization_id,
                    'loggedin_branch_id' => $login_credential->branch_id,
                    'loggedin_id' => $login_credential->id,
                    'loggedin_userid' => $login_credential->user_id,
                    'loggedin_role_id' => $login_credential->role,
                    'loggedin_type' => $userType,
                    'loggedin' => true,
                );
       
                $this->session->set_userdata($sessionData);
                $this->db->update('login_credential', array('last_login' => date('Y-m-d H:i:s')), array('id' => $login_credential->id));
                // is logged in
                if ($this->session->has_userdata('redirect_url')) {
                    redirect($this->session->userdata('redirect_url'));
                } else {
                    $this->session->set_flashdata('success',"Welcome Back ". $getUser['name'] );
                    redirect(base_url('dashboard'));
                }
        }else {
            $this->session->set_flashdata('error',"Inactive Account");
           
            redirect(base_url('login'));
        }

    }else {
        $this->session->set_flashdata('error', "Username & Password Incorrect");
   
        redirect(base_url('login'));
    }

    
  }



    $data = array();
    $data['active'] = "login";
    $data['title'] = "Login || Labiba IT"; 
   $this->load->view('login', $data);
}
 
public function logout() {
  $this->session->sess_destroy();
  redirect("");
}

}


