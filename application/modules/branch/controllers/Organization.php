<?php
class Organization extends MX_Controller
{
  public function __construct() {
    parent::__construct();
    $this->load->model("branch_model");
 
}

 public function index()
{

  $data = array();
  $data['active']       = "organization";
  $data['title']        = "Organization List"; 
  $data['allPdt']       = $this->branch_model->OrganizationList();
  $data['content'] = $this->load->view("organization-list", $data, TRUE);
  $this->load->view('layout/master', $data);
}
public function create()
{

  
  $this->form_validation->set_rules("name", " Name", "required");
  $this->form_validation->set_rules("mobile_no",  "Mobile No", "required");
  $this->form_validation->set_rules("address",  "Address", "required");

  if ($this->form_validation->run() == NULL) {
  
  } else {
    $date = date("Y-m-d H:i:s");
    $data = array(   
        "name"                       => $this->common_model->xss_clean($this->input->post("name")),    
        "mobile_no"                  => $this->common_model->xss_clean($this->input->post("mobile_no")),      
        "email"                      => $this->common_model->xss_clean($this->input->post("email")),   
        "address"                    => $this->common_model->xss_clean($this->input->post("address")),  
        "is_active"                  => 1,
        "create_date"                => strtotime($date),
       
    );
    if ($_FILES['pic']['name'] != "") {
        $config['allowed_types'] = 'gif|jpg|jpeg|png';  //supported image
        $config['upload_path'] = "./public/images/organization/";
        $config['encrypt_name'] = TRUE;
        $this->load->library('upload', $config);
        if ($this->upload->do_upload("pic")) {
            $data['picture'] = $this->upload->data('file_name');
            //$arrayMsg['enc_name'] = "1";
        }
    }else{
        $data['picture'] = "0.png";
    }
    if ($this->common_model->save_data("organizations", $data)) {
      $id = $this->common_model->Id;

      

      $this->session->set_flashdata('success', "Record has been successfully saved.");
      }else{
      
          $this->session->set_flashdata('error', 'An error occurred. Please try again.');
      }
    
   redirect(base_url() . "branch/organization/create", "refresh");
  }


  $data = array();
  $data['active'] = "organization";
  $data['title'] = "Organization Create"; 
  $data['content'] = $this->load->view("organization-create", $data, TRUE);
  $this->load->view('layout/master', $data);
}

  public function delete($id) {
       
        $dt = $this->common_model->view_data("organizations", array("id" => $id), "id", "asc");
       
        if ($dt) {
                      
                        foreach ($dt as $imag) {
                            $file_path = './public/images/organization/' . $imag->picture;

                            if (file_exists($file_path)) {
                                unlink($file_path);
                            }
                        }
                        
            $this->common_model->delete_data("organizations", array("id" => $id));
            $this->session->set_flashdata('success', "Record has been deleted.");
          
        } else {
            $this->session->set_flashdata('error', 'Failed to delete the record. Please try again');
        }
      
        redirect(base_url() . "branch/organization", "refresh");
      
      }
 public function edit($id)
{

  $data = array();
  $data['active'] = "organization";
  $data['title'] = "Edit Organization "; 
  $data['allPdt'] = $this->branch_model->organizationList($id);
  $data['allorg'] =  $this->common_model->view_data("organizations", array("is_active" => 1), "id", "DESC");
  $data['content'] = $this->load->view("organization-edit", $data, TRUE);
  $this->load->view('layout/master', $data);
}
   public function update(){
    
        $id=$this->input->post("id");
        $selPdt=$this->common_model->view_data("organizations",array("id"=>$id),"id","desc");
       
        $data = array(
        "name"                       => $this->common_model->xss_clean($this->input->post("name")),    
        "mobile_no"                  => $this->common_model->xss_clean($this->input->post("mobile_no")),      
        "email"                      => $this->common_model->xss_clean($this->input->post("email")),   
        "address"                    => $this->common_model->xss_clean($this->input->post("address")),  
        "is_active"                  => $this->common_model->xss_clean($this->input->post("is_active")),
                        
            );

               if (!empty($_FILES['pic']['name'])) {
            
                $this->db->where('id', $id);
                $old_image = $this->db->get('organizations')->row();
            
                if ($old_image && !empty($old_image->picture)) {
                    $old_file_path = "./public/images/organization/" . $old_image->picture;
                    
                    if (file_exists($old_file_path)) {
                        unlink($old_file_path);
                    }
                }
            
       
                $config['allowed_types'] = 'gif|jpg|jpeg|png|webp';  
                $config['upload_path'] = "./public/images/organization/";
                $config['encrypt_name'] = TRUE; 
            
                $this->load->library('upload', $config);
                
                if ($this->upload->do_upload("pic")) {
                    $upload_data = $this->upload->data();
                    $new_file_name = $upload_data['file_name'];  
            
                    $update_data = array('picture' => $new_file_name);
                    $this->db->where('id', $id);
                    $this->db->update('organizations', $update_data);
            
                } 
            }
            if ($this->common_model->update_data("organizations", $data,array("id"=>$id))) {
                $this->session->set_flashdata('success', 'Your changes have been successfully updated.');
            }
            else{
                $this->session->set_flashdata('error', 'Unable to complete the operation. Please try again later.');
            }
            $this->session->set_userdata($sdata);
            redirect(base_url() . "branch/organization", "refresh");
    }
 

}


