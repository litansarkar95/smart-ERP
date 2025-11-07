<?php
class Sidebarmenu extends MX_Controller
{
  public function __construct() {
    parent::__construct();
     if (!$this->session->userdata('loggedin')){
            redirect(base_url() , "refresh");
          }

}

 public function index()
    {

    $data = array();
    $data['active'] = "sidebar_menu_definition";
    $data['title'] = "Sidebar Menu Definition"; 
    $data['allPdt'] = $this->menu_model->get_main_menus();
    $data['content'] = $this->load->view("sidebar-menu", $data, TRUE);
    $this->load->view('layout/master', $data);
    }
    
    public function childmenu($id)
    {

    $data = array();
    $data['active'] = "child_menu";
    $data['title'] = "Child Menu "; 



    $data['allPdt'] = $this->menu_model->get_child_menus($id);
    $data['menu_name'] = $this->db->get_where('menus', ['id' => $id])->row('name');
    $data['allMenu'] = $this->menu_model->get_main_menus();

    $data['content'] = $this->load->view("child-menu-list", $data, TRUE);
    $this->load->view('layout/master', $data);
    }


public function insert()
{

  $this->form_validation->set_rules("name", "Name", "required");
  $this->form_validation->set_rules('url', 'URL', 'required');


  if ($this->form_validation->run() == NULL) {
  
  } else {

    
    $date = date("Y-m-d H:i:s");
    $data = array(   
        "name"                             => $this->common_model->xss_clean($this->input->post("name")),   
        "url"                              => $this->common_model->xss_clean($this->input->post("url")),   
        "parent_id"                        => $this->common_model->xss_clean($this->input->post("parent_id")),   
        "position"                         => $this->common_model->xss_clean($this->input->post("position")),   
        "icon"                             => $this->common_model->xss_clean($this->input->post("icon")),  
        "is_active"                        => 1, 
        "create_date"                      => strtotime($date),
       
    );

    if ($this->common_model->save_data("menus", $data)) {
      $id=$this->common_model->Id;
   

      $this->session->set_flashdata('success', 'Record has been successfully saved.');
      }else{
       
             $this->session->set_flashdata('error', 'An error occurred. Please try again.');
      }
    
   redirect(base_url() . "settings/sidebarmenu", "refresh");
  }

      $data = array();
    $data['active'] = "sidebar_menu_definition";
    $data['title'] = "Sidebar Menu Definition"; 
    $data['allPdt'] = $this->menu_model->get_main_menus();
    $data['content'] = $this->load->view("sidebar-menu", $data, TRUE);
    $this->load->view('layout/master', $data);
}




public function delete($id) {
   
  $dt = $this->common_model->view_data("menus", array("id" => $id), "id", "asc");

     
    if ($dt) {

        $this->common_model->delete_data("menus", array("id" => $id));
     
     $this->session->set_flashdata('success', 'Record has been deleted.');
      
    } else {
         $this->session->set_flashdata('error', 'Oops! Something went wrong. Please try again later.');
    }
  
    redirect(base_url() . "settings/sidebarmenu", "refresh");
  
  }

 
  public function update(){

    $id=$this->input->post("id");
    $selPdt=$this->common_model->view_data("menus",array("id"=>$id),"id","desc");
  
    $data = array(
       "name"                              => $this->common_model->xss_clean($this->input->post("ename")),   
        "url"                              => $this->common_model->xss_clean($this->input->post("eurl")),   
        "parent_id"                        => $this->common_model->xss_clean($this->input->post("eparent_id")),   
        "position"                         => $this->common_model->xss_clean($this->input->post("eposition")),   
        "icon"                             => $this->common_model->xss_clean($this->input->post("eicon")),      
                   
        );

  
        if ($this->common_model->update_data("menus", $data,array("id"=>$id))) {
        
         $this->session->set_flashdata('success', 'Delete Successfully');
        }
        else{
            $this->session->set_flashdata('error', 'Something error.');
        }
        $this->session->set_userdata($sdata);
     redirect(base_url() . "menu", "refresh");
}

 public function childmenuupdate(){

    $id=$this->input->post("id");
    $parent_id = $this->common_model->xss_clean($this->input->post("eparent_id")) ;
    $selPdt=$this->common_model->view_data("menus",array("id"=>$id),"id","desc");
  
    $data = array(
       "name"                              => $this->common_model->xss_clean($this->input->post("ename")),   
        "url"                              => $this->common_model->xss_clean($this->input->post("eurl")),   
        "parent_id"                        => $this->common_model->xss_clean($this->input->post("eparent_id")),   
        "position"                         => $this->common_model->xss_clean($this->input->post("eposition")),   
        "icon"                             => $this->common_model->xss_clean($this->input->post("eicon")),      
                   
        );

  
        if ($this->common_model->update_data("menus", $data,array("id"=>$id))) {
        
         $this->session->set_flashdata('success', 'Delete Successfully');
        }
        else{
            $this->session->set_flashdata('error', 'Something error.');
        }
        $this->session->set_userdata($sdata);
     redirect(base_url() . "menu/childmenu/$parent_id", "refresh");
}
}


