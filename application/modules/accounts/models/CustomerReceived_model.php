<?php

class CustomerReceived_model extends CI_Model {

    public function number_generator($table) {
        
  
		$this->db->select_max('code_random');      
		$this->db->from($table);
		$query = $this->db->get();
		$result =  $query->result_array();
		$invoice_no = $result[0]['code_random'];
		if ($invoice_no != '') {
			$invoice_no = $invoice_no + 1;
		} else {
			$invoice_no = 1;
		}
		return $invoice_no;
		 }

    public function getReceivedList($id=NULL) {
         $loggedin_org_id = $this->session->userdata("loggedin_org_id");
        if($id){
            $this->db->where("acc_customer_received.id",$id); 
        }
       $this->db->select("acc_customer_received.*,  business_partner.name customer_name ,  business_partner.contact_no mobile_no , payment_method.name payment_method");
        $this->db->from("acc_customer_received");
        $this->db->join('sales', "acc_customer_received.sales_id = sales.id",'left');
        $this->db->join('business_partner', "sales.customer_id = business_partner.id",'left');
        $this->db->join('payment_method', "acc_customer_received.payment_method_id = payment_method.id",'left');
        $this->db->where("acc_customer_received.organization_id", $loggedin_org_id);
        $this->db->order_by("id", "DESC");
        return $this->db->get()->result();
    }
	
    
    public function getSupplierList($id=NULL) {
         $loggedin_org_id = $this->session->userdata("loggedin_org_id");
        if($id){
            $this->db->where("acc_supplier_received.id",$id); 
        }
       $this->db->select("acc_supplier_received.*,  business_partner.name customer_name ,  business_partner.contact_no mobile_no , payment_method.name payment_method");
        $this->db->from("acc_supplier_received");
        $this->db->join('purchase', "acc_supplier_received.purchase_id = purchase.id",'left');
        $this->db->join('business_partner', "purchase.supplier_id = business_partner.id",'left');
        $this->db->join('payment_method', "acc_supplier_received.payment_method_id = payment_method.id",'left');
        $this->db->where("acc_supplier_received.organization_id", $loggedin_org_id);
        $this->db->order_by("id", "DESC");
        return $this->db->get()->result();
    }

}