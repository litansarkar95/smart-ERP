<?php
class Menupathpermissions extends MX_Controller
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
    $data['active'] = "roles_permissions";
    $data['title'] = "Roles permissions"; 

    $data['allRoles'] = $this->menu_model->Roles();
    $data['allStaff'] = $this->common_model->view_data("staff", array("is_active" => 1), "id", "DESC");

    $data['allPdt'] = $this->menu_model->get_main_menus();

    //
    $role_id = 1;

$permissions = $this->db->get('permissions')->result();

// Group by controller/module
$groupedPermissions = [];
foreach ($permissions as $perm) {
    $groupedPermissions[$perm->name][$perm->method] = $perm->id;
}

// Assigned permissions for the role
$rolePerms = $this->db
    ->where('role_id', $role_id)
    ->get('role_permissions')
    ->result();

        $assigned = [];
        foreach ($rolePerms as $rp) {
            $assigned[$rp->permission_id] = true;
        }

        // Merge all data into one $data array
        $data = array_merge($data, [
            'role_id' => $role_id,
            'permissions' => $groupedPermissions,
            'assigned' => $assigned
        ]);



    $data['content'] = $this->load->view("permissions/role-permissions-list", $data, TRUE);
    $this->load->view('layout/master', $data);
    }


   public function view($role_id) {
   
    $data = array();
    $data['active'] = "roles_permissions_choose";
    $data['title'] = "Roles permissions"; 

    $data['allRoles'] = $this->menu_model->Roles();
    $data['allStaff'] = $this->common_model->view_data("staff", array("is_active" => 1), "id", "DESC");
    $data['allPdt'] = $this->menu_model->get_main_menus();

    //
  $data['id'] = $role_id;

$permissions = $this->db->get('permissions')->result();

// Group by controller/module
$groupedPermissions = [];
foreach ($permissions as $perm) {
    $groupedPermissions[$perm->name][$perm->method] = $perm->id;
}

// Assigned permissions for the role
$rolePerms = $this->db
    ->where('role_id', $role_id)
    ->get('role_permissions')
    ->result();

$assigned = [];
foreach ($rolePerms as $rp) {
    $assigned[$rp->permission_id] = true;
}

// Merge all data into one $data array
$data = array_merge($data, [
    'role_id' => $role_id,
    'permissions' => $groupedPermissions,
    'assigned' => $assigned
]);



   $data['content'] = $this->load->view("permissions/role-permissions-list", $data, TRUE);
    $this->load->view('layout/master', $data);
}

public function update() {
    $role_id = $this->input->post('role_id');
    $permission_id = $this->input->post('permission_id');
    $status = $this->input->post('status');

    if ($status == 1) {
        // Insert if not already exists
        $exists = $this->db->get_where('role_permissions', [
            'role_id' => $role_id,
            'permission_id' => $permission_id
        ])->row();

        if (!$exists) {
            $this->db->insert('role_permissions', [
                'role_id' => $role_id,
                'permission_id' => $permission_id
            ]);
        }
    } else {
        // Delete the permission
        $this->db->where('role_id', $role_id);
        $this->db->where('permission_id', $permission_id);
        $this->db->delete('role_permissions');
    }

    echo json_encode(['status' => 'success']);
}

 public function users()
    {

    $data = array();
    $data['active'] = "roles_permissions";
    $data['title'] = "Users Permissions"; 

    $user_id = $this->common_model->xss_clean($this->input->post("employee_id"));
   
    $roles = $this->db->get_where('staff', ['id' => $user_id])->row('roles_id');

    $id = $this->db->get_where('login_credential', ['user_id' => $user_id, 'role' => $roles])->row();
    $login_id = $id->id  ;

        $permissions = $this->db->get('permissions')->result();
        // Group by controller/module
        $groupedPermissions = [];
        foreach ($permissions as $perm) {
            $groupedPermissions[$perm->controller][$perm->method] = $perm->id;
        }

        // Assigned permissions for the role
        $rolePerms = $this->db
            ->where('user_id', $login_id)
            ->get('user_permissions')
            ->result();

        $assigned = [];
        foreach ($rolePerms as $rp) {
            $assigned[$rp->permission_id] = true;
        }

        // Merge all data into one $data array
        $data = array_merge($data, [
            'user_id' => $login_id,
            'permissions' => $groupedPermissions,
            'assigned' => $assigned
        ]);



    $data['content'] = $this->load->view("permissions/users-permissions", $data, TRUE);
    $this->load->view('layout/master', $data);
    }

public function usersupdate() {
    $user_id = $this->input->post('role_id');
    $permission_id = $this->input->post('permission_id');
    $status = $this->input->post('status');

    if ($status == 1) {
        // Insert if not already exists
        $exists = $this->db->get_where('user_permissions', [
            'user_id' => $user_id,
            'permission_id' => $permission_id
        ])->row();

        if (!$exists) {
            $this->db->insert('user_permissions', [
                'user_id' => $user_id,
                'permission_id' => $permission_id
            ]);
        }
    } else {
        // Delete the permission
        $this->db->where('user_id', $user_id);
        $this->db->where('permission_id', $permission_id);
        $this->db->delete('user_permissions');
    }

    echo json_encode(['status' => 'success']);
}
}