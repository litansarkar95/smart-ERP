<?php
class Partner extends MX_Controller
{
  public function __construct() {
    parent::__construct();
       $this->load->model("products_model");
 
}
public function index()
{
 
    $data = array();
    $data['active']    = "partner";
    $data['title'] = "Partner List"; 
    $data['allPdt']       = $this->main_model->getRecordsByOrg("business_partner");
    $data['content'] = $this->load->view("partner-list", $data, TRUE);
    $this->load->view('layout/master', $data);
 }
 
 public function create()
{

  $this->form_validation->set_rules("type_id", "Type", "required");
  $this->form_validation->set_rules("name", " Name", "required");

  if ($this->form_validation->run() == NULL) {
  
  } else {


    
    $date = date("Y-m-d H:i:s");
    $data = array(   
        "organization_id"            => $this->session->userdata('loggedin_org_id'),
        "name"                       => $this->common_model->xss_clean($this->input->post("name")),   
        "partner_type"               => $this->common_model->xss_clean($this->input->post("type_id")),   
        "contact_no"                 => $this->common_model->xss_clean($this->input->post("mobile_no")),   
        "email"                      => $this->common_model->xss_clean($this->input->post("email")), 
        "address"                    => $this->common_model->xss_clean($this->input->post("address")),      
        "customer_group_id"          => $this->common_model->xss_clean($this->input->post("cgroup_id")),    
        "reference_id"               => $this->common_model->xss_clean($this->input->post("reference_id")),    
        "opening_balance_type"       => $this->common_model->xss_clean($this->input->post("balance_type")), 
        
        "notes"                      => $this->common_model->xss_clean($this->input->post("note")),   
        "is_active"                  => 1,
        "create_user"                => $this->session->userdata('loggedin_id'),
        "create_date"                => strtotime($date),
       
    );

   $balance_type =  $this->common_model->xss_clean($this->input->post("balance_type")) ;

      if($balance_type  == 'Customer'){
              $data['opening_balance'] = $this->common_model->xss_clean($this->input->post("customer_balance"));
              $data['current_balance'] = $this->common_model->xss_clean($this->input->post("customer_balance"));
      }else  if($balance_type  == 'Supplier'){
              $data['opening_balance'] = $this->common_model->xss_clean($this->input->post("supplier_balance"));
              $data['current_balance'] = - $this->common_model->xss_clean($this->input->post("supplier_balance"));
      }
     

   
    if ($this->common_model->save_data("business_partner", $data)) {
      $id = $this->common_model->Id;

        if($balance_type  == 'Customer'){
      // Accounts
       $cdata = array(   
        "organization_id"            => $this->session->userdata('loggedin_org_id'),
        "branch_id"                  => $this->session->userdata('loggedin_branch_id'),
        "voucher_type"               => 'Accounts Receivable',   
        "party_id"                   => $id,   
        "account_name"               => 'Opening Balance',   
        "particulars"                => 'Opening Balance',    
        "date"                       => date("Y-m-d"),    
        "debit"                      => $this->common_model->xss_clean($this->input->post("customer_balance")),    
        "credit"                     => 0,    
        "gl_date"                    => strtotime(date("Y-m-d")), 
        "remarks"                    => 'Opening balance entry',   
        "is_active"                  => 1,
        "create_user"                => $this->session->userdata('loggedin_id'),
        "create_date"                => strtotime($date),
       
    );

    $this->common_model->save_data("acc_general_ledger", $cdata);
  }

   if($balance_type  == 'Supplier'){
      // Accounts
       $sdata = array(   
        "organization_id"            => $this->session->userdata('loggedin_org_id'),
        "branch_id"                  => $this->session->userdata('loggedin_branch_id'),
        "voucher_type"               => 'Accounts Payable',   
        "party_id"                   => $id,   
        "account_name"               => 'Opening Balance',   
        "particulars"                => 'Opening Balance',    
        "date"                       => date("Y-m-d"),    
        "debit"                      => 0,    
        "credit"                     => $this->common_model->xss_clean($this->input->post("supplier_balance")),    
        "gl_date"                    => strtotime(date("Y-m-d")), 
        "remarks"                    => 'Opening balance entry',   
        "is_active"                  => 1,
        "create_user"                => $this->session->userdata('loggedin_id'),
        "create_date"                => strtotime($date),
       
    );

    $this->common_model->save_data("acc_general_ledger", $sdata);
  }

        $this->session->set_flashdata('success', 'Record has been successfully saved.');
      }else{
        
   $this->session->set_flashdata('error', 'An error occurred. Please try again.');
      }
    
   redirect(base_url() . "partner/create");
  }

    $data = array();
    $data['active'] = "partner";
    $data['title'] = "Create Partner"; 
    $data['allCgroup']       = $this->main_model->getRecordsByOrg("partner_group");
    $data['allRef']          = $this->main_model->getRecordsByOrg("staff");
    $data['content'] = $this->load->view("partner-create", $data, TRUE);
    $this->load->view('layout/master', $data);
}

public function delete($id) {
    $dt = $this->common_model->view_data("business_partner", array("id" => $id), "id", "asc");

    if ($dt) {
      

        $this->common_model->delete_data("business_partner", array("id" => $id));

        $this->session->set_flashdata('success', 'Record has been deleted.');
    } else {
        $this->session->set_flashdata('error', 'An error occurred. Please try again.');
    }

    redirect(base_url() . "partner", "refresh");
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
