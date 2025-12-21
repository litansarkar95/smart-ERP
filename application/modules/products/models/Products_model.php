<?php

class Products_model extends CI_Model {
	
public function getProductsList($id = NULL)
{
    $loggedin_org_id = $this->session->userdata("loggedin_org_id");

    if ($id) {
        $this->db->where("products.id", $id);
    }

    $this->db->select("
        products.*,
        products_groups.name AS groups,
        brands.name AS brands,
        unit.name AS unit,
        IFNULL(SUM(inv_stock_master.quanity), 0) AS stock_qty
    ");

    $this->db->from("products");

    $this->db->join(
        "inv_stock_master",
        "inv_stock_master.product_id = products.id 
         AND inv_stock_master.organization_id = products.organization_id
         AND inv_stock_master.is_active = 1",
        "left"
    );

    $this->db->join('products_groups', "products.group_id = products_groups.id", 'left');
    $this->db->join('brands', "products.brand_id = brands.id", 'left');
    $this->db->join('unit', "products.unit_id = unit.id", 'left');

    $this->db->where("products.organization_id", $loggedin_org_id);

    $this->db->group_by("products.id"); // ⭐ খুব গুরুত্বপূর্ণ

    $this->db->order_by("products.id", "DESC");

    return $this->db->get()->result();
}

    
  
}