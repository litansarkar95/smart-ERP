<?php
class Sidebarpermissions extends MX_Controller
{
  public function __construct() {
    parent::__construct();
     if (!$this->session->userdata('loggedin_id')) {
        redirect('login');
        exit;
    }
}

 public function index()
    {

    $data = array();
    $data['active'] = "sidebarpermissions";
    $data['title'] = "Menu Permissions"; 

    $data['allRoles'] = $this->menu_model->Roles();
    $data['allStaff'] = $this->common_model->view_data("staff", array("is_active" => 1), "id", "DESC");

    $data['allPdt'] = $this->menu_model->get_main_menus();

    //
    $role_id = 1;

   $menus = $this->db->order_by('position', 'ASC')->get('menus')->result_array();

    // Get current permissions for this role
    $permissions = $this->db->get_where('role_menu', ['role_id' => $role_id])->result_array();
    $perm_menu_ids = array_column($permissions, 'menu_id');
      // print_r($permissions);exit();

        // Merge all data into one $data array
        $data = array_merge($data, [
            'menus' => $menus,
        'perm_menu_ids' => $perm_menu_ids,
        'role_id' => $role_id
        ]);



    $data['content'] = $this->load->view("permissions/sidemenu-permissions", $data, TRUE);
    $this->load->view('layout/master', $data);
    }


   public function view($role_id) {
   
    $data = array();
    $data['active'] = "sidebarpermissions";
    $data['title'] = "Roles permissions"; 

    $data['allRoles'] = $this->menu_model->Roles();
    $data['allStaff'] = $this->common_model->view_data("staff", array("is_active" => 1), "id", "DESC");
    $data['allPdt'] = $this->menu_model->get_main_menus();

    //
  $data['id'] = $role_id;

        $menus = $this->db->order_by('position', 'ASC')->get('menus')->result_array();

    // Get current permissions for this role
    $permissions = $this->db->get_where('role_menu', ['role_id' => $role_id])->result_array();
    $perm_menu_ids = array_column($permissions, 'menu_id');
       

        // Merge all data into one $data array
        $data = array_merge($data, [
        'menus' => $menus,
        'perm_menu_ids' => $perm_menu_ids,
        'role_id' => $role_id
        ]);



    $data['content'] = $this->load->view("permissions/sidemenu-permissions", $data, TRUE);
    $this->load->view('layout/master', $data);
}

public function update()
{
    $role_id = $this->input->post('role_id');
    $menu_id = $this->input->post('menu_id');
    $status = $this->input->post('status'); // 1 = grant, 0 = revoke

    if ($status == 1) {
        // Grant permission if not exists
        $exists = $this->db->get_where('role_menu', [
            'role_id' => $role_id,
            'menu_id' => $menu_id
        ])->row();

        if (!$exists) {
            $this->db->insert('role_menu', [
                'role_id' => $role_id,
                'menu_id' => $menu_id
            ]);
        }
    } else {
        // Revoke permission
        $this->db->delete('role_menu', [
            'role_id' => $role_id,
            'menu_id' => $menu_id
        ]);
    }

    echo json_encode(['success' => true]);
}


 public function users()
    {

    $data = array();
    $data['active'] = "sidebarpermissions";
    $data['title'] = "Users Permissions"; 

    $user_id = $this->common_model->xss_clean($this->input->post("employee_id"));
   
    $roles = $this->db->get_where('staff', ['id' => $user_id])->row('roles_id');
    // staff Table name 
     $staff = $this->db->get_where('staff', ['id' => $user_id])->row();
     $data['employee_name'] = $staff->first_name." ".$staff->last_name;

    $id = $this->db->get_where('login_credential', ['user_id' => $user_id, 'role' => $roles])->row();
    $login_id = $id->id  ;

        $menus = $this->db->order_by('position', 'ASC')->get('menus')->result_array();

    // Get current permissions for this role
    $permissions = $this->db->get_where('user_menu', ['user_id' => $login_id])->result_array();
    $perm_menu_ids = array_column($permissions, 'menu_id');
   

        // Merge all data into one $data array
        $data = array_merge($data, [
        'menus' => $menus,
        'perm_menu_ids' => $perm_menu_ids,
        'role_id' => $login_id
        ]);




    $data['content'] = $this->load->view("permissions/sidebar-users-permissions", $data, TRUE);
    $this->load->view('layout/master', $data);
    }

public function usersupdate() {
    $role_id = $this->input->post('role_id');
    $menu_id = $this->input->post('menu_id');
    $status = $this->input->post('status'); // 1 = grant, 0 = revoke
   
    if ($status == 1) {
        // Grant permission if not exists
        $exists = $this->db->get_where('user_menu', [
            'user_id' => $role_id,
            'menu_id' => $menu_id
        ])->row();

        if (!$exists) {
            $this->db->insert('user_menu', [
                 'user_id' => $role_id,
            'menu_id' => $menu_id
            ]);
        }
    } else {
        // Revoke permission
        $this->db->delete('user_menu', [
            'user_id' => $role_id,
            'menu_id' => $menu_id
        ]);
    }

    echo json_encode(['success' => true]);
}
}