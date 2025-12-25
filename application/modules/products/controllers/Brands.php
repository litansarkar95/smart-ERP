<?php
class Brands extends MX_Controller
{
  public function __construct() {
    parent::__construct();
      
 
}
public function index()
{
 
    $data = array();
    $data['active'] = "products/brands";
    $data['title'] = "Products Brand"; 
    $data['allPdt']       = $this->main_model->getRecordsByOrg("brands");
    $data['content'] = $this->load->view("brand/brand-list", $data, TRUE);
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

   if ($_FILES['pic']['name'] != "") {
        $config['allowed_types'] = 'gif|jpg|jpeg|png';  //supported image
        $config['upload_path'] = "./public/images/brands/";
        $config['encrypt_name'] = FALSE;
        $this->load->library('upload', $config);
        if ($this->upload->do_upload("pic")) {
            $data['picture'] = $this->upload->data('file_name');
            //$arrayMsg['enc_name'] = "1";
        }
    }else{
        $data['picture'] = "0.png";
    }
    if ($this->common_model->save_data("brands", $data)) {
      $id = $this->common_model->Id;

        $this->session->set_flashdata('success', 'Record has been successfully saved.');
      }else{
        
   $this->session->set_flashdata('error', 'An error occurred. Please try again.');
      }
    
   redirect(base_url() . "products/brands");
  }

  $data = array();
  $data['active']      = "products/brands";
  $data['title']       = "Products Brand"; 
  $data['allPdt']      = $this->main_model->getRecordsByOrg("brands");
  $data['content']     = $this->load->view("brand/brand-list", $data, TRUE);
  $this->load->view('layout/master', $data);
}
 public function store()
    {
        $data = [
            'organization_id' => $this->session->userdata('loggedin_org_id'),
            'name'            => $this->input->post('name'),
            'is_active'       => 1,
            'create_user'     => $this->session->userdata('loggedin_id'),
            'create_date'     => time()
        ];

        $this->db->insert('brands', $data);
        $id = $this->db->insert_id();

        echo json_encode([
            'status' => true,
            'id'     => $id,
            'name'   => $data['name']
        ]);
    }
public function delete($id) {

  $dt = $this->common_model->view_data("brands", array("id" => $id), "id", "asc");
 
 
  if ($dt) {
 
      $this->common_model->delete_data("brands", array("id" => $id),$id);
    $this->session->set_flashdata('success', 'Record has been deleted.');
    
  } else {
        $this->session->set_flashdata('error', 'An error occurred. Please try again.');
  }

     redirect(base_url() . "products/brands", "refresh");

}

public function update(){

  $id=$this->input->post("id");
  $selPdt=$this->common_model->view_data("brands",array("id"=>$id),"id","desc");
 
  $data = array(
    "name"                       => $this->common_model->xss_clean($this->input->post("ename")),   
    "is_active"                  => $this->common_model->xss_clean($this->input->post("is_active")),
                  
      );

       if (!empty($_FILES['epic']['name'])) {
            
                $this->db->where('id', $id);
                $old_image = $this->db->get('brands')->row();
            
                if ($old_image && !empty($old_image->picture)) {
                    $old_file_path = "./public/images/brands/" . $old_image->picture;
                    
                    if (file_exists($old_file_path)) {
                        unlink($old_file_path);
                    }
                }
            
       
                $config['allowed_types'] = 'gif|jpg|jpeg|png|webp';  
                $config['upload_path'] = "./public/images/brands/";
                $config['encrypt_name'] = FALSE; 
            
                $this->load->library('upload', $config);
                
                if ($this->upload->do_upload("epic")) {
                    $upload_data = $this->upload->data();
                    $new_file_name = $upload_data['file_name'];  
            
                    $update_data = array('picture' => $new_file_name);
                    $this->db->where('id', $id);
                    $this->db->update('brands', $update_data);
            
                } 
            }
      if ($this->common_model->update_data("brands", $data,array("id"=>$id),$id)) {
             $this->session->set_flashdata('success', 'Your changes have been successfully updated.');
      }
      else{
             $this->session->set_flashdata('error', 'An error occurred. Please try again.');
      }
      $this->session->set_userdata($sdata);
      redirect(base_url() . "products/brands", "refresh");
}


}
