<?php

class Purchase_model extends CI_Model {

      public function get_products_by_group($group_id) {
         $loggedin_org_id = $this->session->userdata("loggedin_org_id");
        // Query the database
        $this->db->select('*');
        $this->db->from('products');
        $this->db->where("products.organization_id", $loggedin_org_id);
        $this->db->where('group_id', $group_id);
        $this->db->where('is_inventory', 1);
        $query = $this->db->get();

        return $query->result(); // Return the result as an array of objects
    }

 public function getSuplier() {
    $loggedin_org_id = $this->session->userdata("loggedin_org_id");
    
    $this->db->select('*');
    $this->db->from('business_partner');
    $this->db->where("business_partner.organization_id", $loggedin_org_id);
    
    // Use grouping for OR condition
    $this->db->group_start()
             ->where('business_partner.partner_type', 'Supplier')
             ->or_where('business_partner.partner_type', 'Both')
             ->group_end();
    
    $query = $this->db->get();
    return $query->result();
}
public function number_generator() {
        
  
		$this->db->select_max('code_random');      
		$this->db->from('purchase');
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

       public function get_product_by_id($product_id) {
        $this->db->select('purchase_price, sales_price, serial_type, warrenty ,warrenty_days');
        $this->db->from('products');
        $this->db->where('id', $product_id);
        $query = $this->db->get();

        return $query->row();  // Return the product as an object
    }
	
    public function getPurchaseList($id=NULL) {
         $loggedin_org_id = $this->session->userdata("loggedin_org_id");
        if($id){
            $this->db->where("purchase.id",$id); 
        }
		$this->db->select("purchase.*, warehouse.name warehouse , business_partner.name partner");
        $this->db->from("purchase");
        $this->db->join('business_partner', "purchase.supplier_id = business_partner.id",'left');
        $this->db->join('warehouse', "purchase.store_id = warehouse.id",'left');
        $this->db->where("purchase.organization_id", $loggedin_org_id);
        $this->db->order_by("id", "DESC");
        return $this->db->get()->result();
    }

       public function get_stock_products($store_id ,$product_id) {
         $loggedin_org_id     = $this->session->userdata("loggedin_org_id");
         $branch_id           = $this->session->userdata("loggedin_branch_id");
        
		$this->db->select("inv_stock_master.*");
        $this->db->from("inv_stock_master");
        $this->db->where("inv_stock_master.organization_id", $loggedin_org_id);
        $this->db->where("inv_stock_master.branch_id", $branch_id);
        $this->db->where("inv_stock_master.store_id", $store_id);
        $this->db->where("inv_stock_master.product_id", $product_id);
        $this->db->order_by("id", "DESC");
        return $this->db->get()->result();
    }
    
  public function get_items_by_invoice()
{
    $invoice_id = $this->input->post('invoice_id'); // বা GET থেকে নিতে পারো
    
    if ($invoice_id) {
        $this->db->where('invoice_id', $invoice_id);
        $query = $this->db->get('purchase_items');
       return $result = $query->result();
        
      
    } else {
        return NULL;
    }
}

}