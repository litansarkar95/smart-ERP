<?php

class Inventory_model extends CI_Model {
	
    public function StockItemSerial() 
{
   
    // if (empty($org_id) && empty($branch_id) && empty($employee_id) && empty($roles_id)) {
    //     return []; 
    // }

 

    $this->db->select("inv_stock_item_serial.*, products.name AS product, organizations.name AS org_name, branch.name AS branch_name");
    $this->db->from("inv_stock_item_serial");
    $this->db->join("products", "inv_stock_item_serial.product_id = products.id", "left");
    $this->db->join("organizations", "inv_stock_item_serial.organization_id = organizations.id", "left");
    $this->db->join("branch", "inv_stock_item_serial.branch_id = branch.id", "left");
    $this->db->order_by("inv_stock_item_serial.id", "DESC");

    return $this->db->get()->result();
}
    public function StockBalance() 
{
   

    $this->db->select("inv_stock_master.*, products.name AS product,products.re_order_level AS re_order_level,unit.name unit, products_groups.name groups , organizations.name AS org_name, branch.name AS branch_name");
    $this->db->from("inv_stock_master");
    $this->db->join("products", "inv_stock_master.product_id = products.id", "left");
    $this->db->join("products_groups", "products.group_id = products_groups.id", "left");
    $this->db->join("unit", "products.unit_id = unit.id", "left");
    $this->db->join("organizations", "inv_stock_master.organization_id = organizations.id", "left");
    $this->db->join("branch", "inv_stock_master.branch_id = branch.id", "left");
    $this->db->order_by("inv_stock_master.id", "DESC");

    return $this->db->get()->result();
}

}