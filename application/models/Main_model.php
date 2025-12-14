<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Main_model extends CI_Model {


   public function getRecordsByOrg($table, $id = NULL)
{
    $loggedin_org_id = $this->session->userdata("loggedin_org_id");

    if (!$loggedin_org_id) {
        return []; 
    }

    $this->db->select("$table.*");
    $this->db->from($table);
    $this->db->where("$table.organization_id", $loggedin_org_id);
    if (!empty($id)) {
        $this->db->where("$table.id", $id);
    }

    $this->db->order_by("$table.id", "DESC");
    $query = $this->db->get();
    return ($id) ? $query->row() : $query->result();
} 


public function get_branch_by_id($branch_id)
    {
        return $this->db
            ->where('id', $branch_id)
            ->where('is_active', 1)
            ->get('branch')
            ->row();
    }
}
