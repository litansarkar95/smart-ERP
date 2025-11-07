<?php

class Roles_model extends CI_Model {
	
    public function RolesList() {
        $loggedin_org_id = $this->session->userdata("loggedin_org_id");

		$this->db->select("roles.*");
        $this->db->from("roles");
        $this->db->where("roles.organization_id", $loggedin_org_id);
        $this->db->order_by("id", "DESC");
        return $this->db->get()->result();
    }
    
	 
}