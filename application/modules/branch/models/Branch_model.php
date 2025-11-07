<?php

class Branch_model extends CI_Model {
	
   


    public function OrganizationList($id=NULL) {
          if($id){
            $this->db->where("organizations.id",$id); 
        }
		    $this->db->select("organizations.* ");
        $this->db->from("organizations");
        $this->db->order_by("organizations.id", "DESC");
        return $this->db->get()->result();
    } 
    
       public function BranchList($org_id) {
        if ($org_id != 0) {
          $this->db->where("branch.organization_id", $org_id); 
         }

      
		    $this->db->select("branch.* ,organizations.name org_name");
        $this->db->from("branch");
        $this->db->join('organizations', "branch.organization_id = organizations.id",'left');
        $this->db->order_by("branch.id", "DESC");
        return $this->db->get()->result();
    } 


        public function BranchWhereList($id=NULL) {
            if($id){
            $this->db->where("branch.id",$id); 
        }

      
		    $this->db->select("branch.* ,organizations.name org_name");
        $this->db->from("branch");
        $this->db->join('organizations', "branch.organization_id = organizations.id",'left');
        $this->db->order_by("branch.id", "DESC");
        return $this->db->get()->result();
    } 


    public function BranchStaffList($org_id, $branch_id, $employee_id, $roles_id) 
{
   
    if (empty($org_id) && empty($branch_id) && empty($employee_id) && empty($roles_id)) {
        return []; 
    }

    if ($org_id != 0) {
        $this->db->where("staff.organization_id", $org_id); 
    }

    if ($branch_id != 0) {
        $this->db->where("staff.branch_id", $branch_id); 
    }

    if ($employee_id != 0) {
        $this->db->where("staff.id", $employee_id); 
    }

    if ($roles_id != 0) {
        $this->db->where("staff.roles_id", $roles_id); 
    }

    $this->db->select("staff.*, roles.name AS role, organizations.name AS org_name, branch.name AS branch_name");
    $this->db->from("staff");
    $this->db->join("roles", "staff.roles_id = roles.id", "left");
    $this->db->join("organizations", "staff.organization_id = organizations.id", "left");
    $this->db->join("branch", "staff.branch_id = branch.id", "left");
    $this->db->order_by("staff.id", "DESC");

    return $this->db->get()->result();
}


}