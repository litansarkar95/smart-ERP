<?php
class Products extends MX_Controller
{
  public function __construct() {
    parent::__construct();
       $this->load->model("products_model");
 
}
public function index()
{
 
    $data = array();
    $data['active']    = "products";
    $data['title'] = "Products List"; 
    $data['allPdt']       = $this->products_model->getProductsList();
    $data['content'] = $this->load->view("products-list", $data, TRUE);
    $this->load->view('layout/master', $data);
 }
 
 public function create()
{

  $this->form_validation->set_rules("group_id", "Products Group", "required");
  $this->form_validation->set_rules("brand_id", "Brand Name", "required");
  $this->form_validation->set_rules("name", "Product Name", "required");
  $this->form_validation->set_rules("unit_id", "Unit", "required");
  $this->form_validation->set_rules("serial_type", "Serial Type", "required");

  if ($this->form_validation->run() == NULL) {
  
  } else {

    $date = date("Y-m-d H:i:s");
    $data = array(   
        "organization_id"            => $this->session->userdata('loggedin_org_id'),
        "name"                       => $this->common_model->xss_clean($this->input->post("name")),   
        "group_id"                   => $this->common_model->xss_clean($this->input->post("group_id")),   
        "brand_id"                   => $this->common_model->xss_clean($this->input->post("brand_id")),   
        "unit_id"                    => $this->common_model->xss_clean($this->input->post("unit_id")),   
        "serial_type"                => $this->common_model->xss_clean($this->input->post("serial_type")),   
        "purchase_price"             => $this->common_model->xss_clean($this->input->post("purchase_price")),   
        "tax_method"                 => $this->common_model->xss_clean($this->input->post("tax_method")),   
        "product_tax"                => $this->common_model->xss_clean($this->input->post("product_tax")),   
        "product_tax_amount"         => $this->common_model->xss_clean($this->input->post("product_tax_amount")),   
        "total_amount"               => $this->common_model->xss_clean($this->input->post("total_amount")),   
        "sales_price"                => $this->common_model->xss_clean($this->input->post("sales_price")),   
        "warrenty"                   => $this->common_model->xss_clean($this->input->post("warrenty")),   
        "warrenty_days"              => $this->common_model->xss_clean($this->input->post("warrenty_days")),   
        "re_order_level"             => $this->common_model->xss_clean($this->input->post("re_order_level")),   
        "is_inventory"               => $this->common_model->xss_clean($this->input->post('is_inventory') ? 1 : 0),   
        "is_short_bill"              => $this->common_model->xss_clean($this->input->post('is_short_bill') ? 1 : 0),   
        "is_quotation"               => $this->common_model->xss_clean($this->input->post('is_quotation') ? 1 : 0),   
        "note"                       => $this->common_model->xss_clean($this->input->post("note")),   
        "is_active"                  => 1,
        "create_user"                => $this->session->userdata('loggedin_id'),
        "create_date"                => strtotime($date),
       
    );

       if ($_FILES['pic']['name'] != "") {
        $config['allowed_types'] = 'gif|jpg|jpeg|png';  //supported image
        $config['upload_path'] = "./public/images/products/";
        $config['encrypt_name'] = FALSE;
        $this->load->library('upload', $config);
        if ($this->upload->do_upload("pic")) {
            $data['picture'] = $this->upload->data('file_name');
            //$arrayMsg['enc_name'] = "1";
        }
    }else{
        $data['picture'] = "0.png";
    }

   
    if ($this->common_model->save_data("products", $data)) {
      $id = $this->common_model->Id;

        $this->session->set_flashdata('success', 'Record has been successfully saved.');
      }else{
        
   $this->session->set_flashdata('error', 'An error occurred. Please try again.');
      }
    
   redirect(base_url() . "products");
  }

    $data = array();
    $data['active'] = "products";
    $data['title'] = "Products List"; 
    $data['allUnit']       = $this->common_model->view_data("unit", array("is_active" => 1), "name", "ASC");;
    $data['allBrand']       = $this->main_model->getRecordsByOrg("brands");
    $data['allCat']       = $this->main_model->getRecordsByOrg("products_groups");
    $data['content'] = $this->load->view("products-create", $data, TRUE);
    $this->load->view('layout/master', $data);
}

public function delete($id) {
    $dt = $this->common_model->view_data("products", array("id" => $id), "id", "asc");

    if ($dt) {
        if (!empty($dt->picture) && file_exists("./public/images/products/" . $dt->picture)) {
            unlink("./public/images/products/" . $dt->picture); 
        }

        $this->common_model->delete_data("products", array("id" => $id));

        $this->session->set_flashdata('success', 'Record has been deleted.');
    } else {
        $this->session->set_flashdata('error', 'An error occurred. Please try again.');
    }

    redirect(base_url() . "products", "refresh");
}


public function update(){

  $id=$this->input->post("id");
  $selPdt=$this->common_model->view_data("products_groups",array("id"=>$id),"id","desc");
 
  $data = array(
    "name"                       => $this->common_model->xss_clean($this->input->post("ename")),   
    "is_active"                  => $this->common_model->xss_clean($this->input->post("is_active")),
                  
      );

      
      if ($this->common_model->update_data("products_groups", $data,array("id"=>$id),$id)) {
          $this->session->set_flashdata('success', 'Your changes have been successfully updated.');
      }
      else{
        $this->session->set_flashdata('error', 'An error occurred. Please try again.');
      }
      $this->session->set_userdata($sdata);
      redirect(base_url() . "products/groups", "refresh");
}


}
