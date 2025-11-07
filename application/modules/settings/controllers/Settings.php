<?php
class Settings extends MX_Controller
{
  public function __construct() {
    parent::__construct();
    $this->load->helper('url');
    $this->load->helper('file');
    $this->load->helper('download');
    $this->load->library('zip');
    $this->load->model("settings_model");
}
public function database_backup(){
    $this->load->dbutil();
    $db_format=array('format'=>'zip','filename'=>'tours_backup.sql');
    $backup=& $this->dbutil->backup($db_format);
    $dbname='backup-on-'.date("Y-m-d").'.zip';
    $save='./public/db_backup/'.$dbname;
    write_file($save,$backup);
    force_download($dbname,$backup);
}

public function general_settings(){
    $data = array();
    $data['active'] = "general_settings";
    $data['title'] = display('general_settings'); 
    $data['allPdt'] = $this->settings_model->Settings();
    $data['content'] = $this->load->view("settings/general_settings", $data, TRUE);
   $this->load->view('layout/master', $data);
}

public function general_update(){

    $id = 1;
    $selPdt=$this->common_model->view_data("setting",array("id"=>$id),"id","desc");
    
    $data = array(
        "title"                      => $this->common_model->xss_clean($this->input->post("title")),   
        "name"                       => $this->common_model->xss_clean($this->input->post("name")),
        "short_description"          => $this->common_model->xss_clean($this->input->post("short_description")),
        "address"                    => $this->common_model->xss_clean($this->input->post("address")),
        "email"                      => $this->common_model->xss_clean($this->input->post("email")),
        "phone"                      => $this->common_model->xss_clean($this->input->post("phone")),
        "facebook"                   => $this->common_model->xss_clean($this->input->post("facebook")),
        "twitter"                    => $this->common_model->xss_clean($this->input->post("twitter")),
        "linkedin"                   => $this->common_model->xss_clean($this->input->post("linkedin")),
        "instagram"                  => $this->common_model->xss_clean($this->input->post("instagram")),
        "youtube"                    => $this->common_model->xss_clean($this->input->post("youtube")),
        "language"                   => $this->common_model->xss_clean($this->input->post("language")),
                    
        );

       
        $language = $this->common_model->xss_clean($this->input->post("language"));
        $this->session->set_userdata("site_lang",$language);

        if ($_FILES['favicon']['name'] != "") {
            $config['allowed_types'] = '*';  //supported image
            $config['upload_path'] = "./assets/images/";
            $config['encrypt_name'] = TRUE;
            $this->load->library('upload', $config);
            if ($this->upload->do_upload("favicon")) {
                $data['favicon'] = $this->upload->data('file_name');
                //$arrayMsg['enc_name'] = "1";
            }
        }
        if ($_FILES['pic']['name'] != "") {
            $config['allowed_types'] = 'gif|jpg|jpeg|png';  //supported image
            $config['upload_path'] = "./assets/images/";
            $config['encrypt_name'] = TRUE;
            $this->load->library('upload', $config);
            if ($this->upload->do_upload("pic")) {
                $data['logo'] = $this->upload->data('file_name');
                //$arrayMsg['enc_name'] = "1";
            }
        } 
    
  
        if ($this->common_model->update_data("setting", $data,array("id"=>$id))) {
            $this->session->set_flashdata('success', 'Update Successfully');
 
        }
        else{
            $this->session->set_flashdata('error', 'Server error.');
         
        }
        $this->session->set_userdata($sdata);
       redirect(base_url() . "settings/general_settings", "refresh");
}

}


