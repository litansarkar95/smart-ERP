<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Menu_model extends CI_Model {

   public function get_user_menu($user_id, $role_id) {
        $this->db->distinct();
        $this->db->select('menus.*');
        $this->db->from('menus');
        $this->db->join('role_menu', 'role_menu.menu_id = menus.id', 'left');
        $this->db->join('user_menu', 'user_menu.menu_id = menus.id', 'left');
        $this->db->where('role_menu.role_id', $role_id);
        $this->db->or_where('user_menu.user_id', $user_id);
        $this->db->order_by('menus.position', 'ASC');

        $query = $this->db->get();
        $menus = $query->result_array();

        return $this->build_tree($menus);
    }

    private function build_tree($elements, $parentId = 0) {
        $branch = [];

        foreach ($elements as $element) {
            if ($element['parent_id'] == $parentId) {
                $children = $this->build_tree($elements, $element['id']);
                if ($children) {
                    $element['children'] = $children;
                }
                $branch[] = $element;
            }
        }

        return $branch;
    }



public function get_menu_list_with_parent() {
    $this->db->select('m1.*, m2.name AS parent_name');
    $this->db->from('menus m1');
    $this->db->join('menus m2', 'm1.parent_id = m2.id', 'left');
    $this->db->order_by('m1.position', 'ASC');

    return $this->db->get()->result();
}
public function get_main_menus() {
    $this->db->select('*');
    $this->db->from('menus');
    $this->db->where('parent_id', 0); 
    $this->db->order_by('position', 'ASC');

    return $this->db->get()->result();
}
public function get_child_menus($id) {
    $this->db->select('m1.*, m2.name AS parent_name');
    $this->db->from('menus m1');
    $this->db->join('menus m2', 'm1.parent_id = m2.id', 'left');
    $this->db->where('m1.parent_id', $id);  // শুধু এই parent_id-র child গুলো
    $this->db->order_by('m1.position', 'ASC');

    return $this->db->get()->result();
}

public function roleMenuList($id) {
    $this->db->select('role_menu.* , roles.name');
    $this->db->from('role_menu');
    $this->db->join('roles', 'role_menu.role_id  = roles.id', 'left');
    $this->db->where('role_menu.menu_id', $id);  // শুধু এই parent_id-র child গুলো
    $this->db->order_by('role_menu.id', 'ASC');

    return $this->db->get()->result();
}

public function UserMenuList($id) {
    $this->db->select('user_menu.* , login_credential.id credential_id , staff.employee_id , staff.first_name ,  staff.last_name');
    $this->db->from('user_menu');
    $this->db->join('login_credential', 'user_menu.user_id  = login_credential.id', 'left');
    $this->db->join('staff', 'staff.id  = login_credential.user_id', 'left');
    $this->db->where('user_menu.menu_id', $id);  // শুধু এই parent_id-র child গুলো
    $this->db->order_by('user_menu.id', 'ASC');

    return $this->db->get()->result();
}
       public function Roles()
    {
    
        $this->db->select("roles.*");           
        $this->db->from("roles");
        $this->db->where("roles.is_admin_system", 1);
        $this->db->order_by("roles.name", "ASC");
        return $this->db->get()->result(); 
    }


}
