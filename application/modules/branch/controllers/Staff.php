<?php
class Staff extends MX_Controller
{
  public function __construct() {
    parent::__construct();
    $this->load->model("branch_model");
 
}

 public function index()
{

  $data = array();
  $data['active']       = "branch_staff";
  $data['title']        = "Branch Staff"; 
  //$data['allStaff']     =  $this->common_model->view_data("staff", "", "id", "DESC");
  $data['allorg']       =  $this->common_model->view_data("organizations","", "id", "DESC");
  $data['allBranch']    =  $this->common_model->view_data("branch", "", "id", "DESC");

  $data['allRoles']     =  $this->common_model->view_data("roles",  array("is_admin_system" => 1), "id", "DESC");
  //
      //start

      $org_id               = $this->input->get("org_id") ;
      $branch_id            = $this->input->get("branch_id") ;
      $employee_id          = $this->input->get("employee_id") ;
      $roles_id             = $this->input->get("roles_id") ;


      if( $org_id == NULL  ){    
        $org_id        =  0;
        }

        if( $branch_id == NULL  ){ 
        $branch_id        =  0;
        }
        if( $employee_id == NULL  ){ 
        $employee_id        =  0;
        } 
        
      
        if( $roles_id == NULL  ){ 
        $roles_id        =  0;
        } 

      $data['org_id']             = $this->input->get("org_id") ;
      $data['branch_id']          = $this->input->get("branch_id") ;
      $data['employee_id']        = $this->input->get("employee_id") ;
      $data['roles_id']           = $this->input->get("roles_id") ;
        //end 
  
  
  $data['allPdt']       = $this->branch_model->BranchStaffList($org_id,$branch_id,$employee_id, $roles_id);
  $data['content'] = $this->load->view("staff-list", $data, TRUE);
  $this->load->view('layout/master', $data);
}
public function create()
{

  
  $this->form_validation->set_rules("name", "First Name", "required");
  $this->form_validation->set_rules(
    'mobile_no',
    'Mobile No',
    'required|is_unique[login_credential.username]',
    array(
        'is_unique' => 'This mobile number already exists in staff records.'
    )
);

  $this->form_validation->set_rules("roles_id",  "Role", "required");
  $this->form_validation->set_rules("org_id",  "Organization", "required");
  $this->form_validation->set_rules("password", "Password", "required");

  if ($this->form_validation->run() == NULL) {
  
  } else { 
    $date = date("Y-m-d H:i:s");
    $data = array(   
        "organization_id"            => $this->common_model->xss_clean($this->input->post("org_id")),     
        "branch_id"                  => $this->common_model->xss_clean($this->input->post("branch_id")),    
        "first_name"                 => $this->common_model->xss_clean($this->input->post("name")),    
        "email"                      => $this->common_model->xss_clean($this->input->post("email")),   
        "roles_id"                   => $this->common_model->xss_clean($this->input->post("roles_id")),   
        "contact_no"                 => $this->common_model->xss_clean($this->input->post("mobile_no")),      
        "date_of_joining"            => strtotime($date), 
        "is_active"                  => 1,
        "create_date"                => strtotime($date),
       
    );
    if ($_FILES['pic']['name'] != "") {
        $config['allowed_types'] = 'gif|jpg|jpeg|png';  //supported image
        $config['upload_path'] = "./public/images/staff/";
        $config['encrypt_name'] = TRUE;
        $this->load->library('upload', $config);
        if ($this->upload->do_upload("pic")) {
            $data['picture'] = $this->upload->data('file_name');
            //$arrayMsg['enc_name'] = "1";
        }
    }else{
        $data['picture'] = "0.png";
    }
    if ($this->common_model->save_data("staff", $data)) {
      $id = $this->common_model->Id;

            // login auth
      $login = array(  
        "organization_id"            => $this->common_model->xss_clean($this->input->post("org_id")),     
        "branch_id"                  => $this->common_model->xss_clean($this->input->post("branch_id")),  
        "user_id"                    => $id,
        "username"                   => $this->common_model->xss_clean($this->input->post("mobile_no")),
        "password"                   => $this->common_model->Encryptor('encrypt', $this->input->post('password')),
        "role"                       => $this->common_model->xss_clean($this->input->post("roles_id")),
    );        

    $this->common_model->save_data("login_credential", $login);

       $this->session->set_flashdata('success', "Record has been successfully saved.");
      }else{
      
       $this->session->set_flashdata('error', 'An error occurred. Please try again.');
      }
    
   redirect(base_url() . "branch/staff/create", "refresh");
  }


  $data = array();
  $data['active'] = "branch_staff";
  $data['title'] = "Branch Staff"; 
  $data['allorg'] =  $this->common_model->view_data("organizations", array("is_active" => 1), "id", "DESC");
  $data['allBranch'] =  $this->common_model->view_data("branch", array("is_active" => 1), "id", "DESC");
  $data['allRoles'] =  $this->common_model->view_data("roles", array("is_admin_system" => 1), "name", "ASC");

  $data['content'] = $this->load->view("staff-create", $data, TRUE);
 $this->load->view('layout/master', $data);
}

public function delete() {
   $id = $this->input->post('id');
    $dt = $this->common_model->view_data("staff", array("id" => $id), "id", "asc");
   
   
    if ($dt) {
   
        $this->common_model->delete_data("staff", array("id" => $id));
        $this->session->set_flashdata('success', 'Delete Successfully');
      
    } else {
        $this->session->set_flashdata('error', 'An error occurred. Please try again.');
    }
  
    redirect(base_url() . "employees", "refresh");
  
  }
 public function details($id)
{

  $data = array();
  $data['active'] = "employees";
  $data['title'] = "Employees Details"; 
  $data['staff'] = $this->employees_model->employeesList($id)[0];


  $data['allShift'] =  $this->common_model->view_data("shifts", array("is_active"=>1), "id", "DESC");
  $data['content'] = $this->load->view("employees/employees-details", $data, TRUE);
 $this->load->view('layout/master', $data);
}
 public function edit($id)
{

  $data = array();
  $data['active'] = "employees";
  $data['title'] = "Edit Employees "; 
  $data['allPdt'] = $this->employees_model->employeesList($id);
  $data['allShift'] =  $this->common_model->view_data("shifts", array("is_active" => 1), "id", "DESC");
  $data['allRoles'] =  $this->common_model->view_data("roles", array("is_active" => 1), "id", "DESC");
  $data['content'] = $this->load->view("employees/employees-edit", $data, TRUE);
 $this->load->view('layout/master', $data);
}
   public function update(){
    
        $id=$this->input->post("id");
        $selPdt=$this->common_model->view_data("staff",array("id"=>$id),"id","desc");
       
        $data = array(
        "employee_id"                => $this->common_model->xss_clean($this->input->post("username")),   
        "department_id"              => $this->common_model->xss_clean($this->input->post("departments")),   
        "designation_id"             => $this->common_model->xss_clean($this->input->post("designation")),   
        "first_name"                 => $this->common_model->xss_clean($this->input->post("first_name")),   
        "last_name"                  => $this->common_model->xss_clean($this->input->post("last_name")),   
        "email"                      => $this->common_model->xss_clean($this->input->post("email")),   
        "roles_id"                   => $this->common_model->xss_clean($this->input->post("roles_id")),   
        "contact_no"                 => $this->common_model->xss_clean($this->input->post("mobile_no")),   
        "emergency_contact_no"       => $this->common_model->xss_clean($this->input->post("emergency_contact_no")),   
        "dob"                        => strtotime($this->common_model->xss_clean($this->input->post("dob"))),   
        "date_of_joining"            => strtotime($this->common_model->xss_clean($this->input->post("joining_date"))),   
        "permanent_address"          => $this->common_model->xss_clean($this->input->post("address")),   
        "gender"                     => $this->common_model->xss_clean($this->input->post("gender")),   
        "blood_group"                => $this->common_model->xss_clean($this->input->post("blood_group")), 
        "basic_salary"               => $this->common_model->xss_clean($this->input->post("basic_salary")),   
        "hourly_rate"                => $this->common_model->xss_clean($this->input->post("hourly_rate")),   
        "shift_id"                   => $this->common_model->xss_clean($this->input->post("shift_id")),  
        "is_active"                  => $this->common_model->xss_clean($this->input->post("is_active")),
                        
            );
            if ($this->common_model->update_data("staff", $data,array("id"=>$id))) {
                $this->session->set_flashdata('success', 'Your changes have been successfully updated.');
            }
            else{
               $this->session->set_flashdata('error', 'An error occurred. Please try again.');
            }
            $this->session->set_userdata($sdata);
            redirect(base_url() . "employees", "refresh");
    }
 public function getBranchByOrg()
{
    $org_id = $this->input->post('org_id');
    
    $branches = [];
    if ($org_id) {
        $branches = $this->db
            ->where('organization_id', $org_id)
            ->get('branch')
            ->result();
    }

    echo json_encode($branches);
}



}


