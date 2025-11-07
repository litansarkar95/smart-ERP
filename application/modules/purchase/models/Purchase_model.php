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

       public function get_product_by_id($product_id) {
        $this->db->select('purchase_price, sales_price, serial_type');
        $this->db->from('products');
        $this->db->where('id', $product_id);
        $query = $this->db->get();

        return $query->row();  // Return the product as an object
    }
	
    public function getProductsList($id=NULL) {
         $loggedin_org_id = $this->session->userdata("loggedin_org_id");
        if($id){
            $this->db->where("products.id",$id); 
        }
		$this->db->select("products.*, products_groups.name groups , brands.name brands , unit.name unit");
        $this->db->from("products");
        $this->db->join('products_groups', "products.group_id = products_groups.id",'left');
        $this->db->join('brands', "products.brand_id = brands.id",'left');
        $this->db->join('unit',  "products.unit_id = unit.id",'left');
        $this->db->where("products.organization_id", $loggedin_org_id);
        $this->db->order_by("id", "DESC");
        return $this->db->get()->result();
    }
    
  
}