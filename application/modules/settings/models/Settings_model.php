<?php

class Settings_model extends CI_Model {
	
    public function Settings() {
       
		$this->db->select("setting.*");
        $this->db->from("setting");
        $this->db->where("setting.id",1);
        $this->db->order_by("id", "DESC");
        return $this->db->get()->result();
    }
    
	 
}