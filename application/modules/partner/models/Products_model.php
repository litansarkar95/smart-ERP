<?php

class Products_model extends CI_Model {
	
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