<?php
defined('BASEPATH') OR exit('No direct script access allowed');

// যদি তুমি HMVC ব্যবহার করো
class Admin_Controller extends MX_Controller
// যদি শুধু MVC, তাহলে উপরেরটা বদলে এটা:
// class Admin_Controller extends CI_Controller
{
    public function __construct() {
        parent::__construct();

        // Load necessary libraries & helpers
        $this->load->library('session');
        $this->load->helper('url');
        $this->load->database();

        // Check permission
        $this->check_permission();
    }

protected function check_permission() {
    $CI =& get_instance();

    $CI->load->library('session');
    $CI->load->helper('url');
    $CI->load->database();


    $segments = $CI->uri->segment_array();

$controller = '';
$url = 'index';

// HMVC structure detect করার জন্য
if (isset($segments[1]) && isset($segments[2])) {

        $module = strtolower($segments[1]);    // modules folder lowercase
        $controller = ucfirst($segments[2]);   // controller file ucfirst

        $modulePath = APPPATH . 'modules/' . $module . '/controllers/' . $controller . '.php';

        if (file_exists($modulePath)) {
            $controller = strtolower($segments[1] . '/' . $segments[2]);
            $url = isset($segments[3]) && !is_numeric($segments[3]) ? strtolower($segments[3]) : 'index';
        } else {
            $controller = strtolower($segments[1]);
            $url = !empty($segments[2]) && !is_numeric($segments[2]) ? strtolower($segments[2]) : 'index';
        }

    } elseif (isset($segments[1])) {
        $controller = strtolower($segments[1]);
        $url = !empty($segments[2]) && !is_numeric($segments[2]) ? strtolower($segments[2]) : 'index';
    } else {
        $controller = 'dashboard';
        $url = 'index';
    }





    // Method map
    $method_map = [
        'index' => 'read', 'view' => 'view', 'details' => 'view', 'list' => 'view',
        'add' => 'create', 'insert' => 'create', 'create' => 'create',
        'edit' => 'edit', 'update' => 'update',
        'delete' => 'delete', 'remove' => 'delete', 'import' => 'import',
        'report' => 'export', 'download' => 'export', 'print' => 'export','export' => 'export',
        'approve' => 'approve', 'reject' => 'approve', 'verify' => 'approve',
        'settings' => 'manage', 'config' => 'manage',
    ];

    $method = isset($method_map[$url]) ? $method_map[$url] : 'read';
  
    // Public routes (skip)
    $public_routes = [
        ['controller' => 'login', 'url' => 'index'],
        ['controller' => 'login', 'url' => 'logout'],
    ];

    foreach ($public_routes as $route) {
        if ($route['controller'] === $controller && $route['url'] === $url) {
            return;
        }
    }

    // Login check
    if (!$CI->session->userdata('loggedin_id')) {
        redirect('login');
        exit;
    }

    $user_id = $CI->session->userdata('loggedin_id');
    $role_id = $CI->session->userdata('loggedin_role_id');

    // === User Permission Check ===
    $CI->db->select('permissions.id');
    $CI->db->from('permissions');
    $CI->db->join('user_permissions', 'permissions.id = user_permissions.permission_id');
    $CI->db->where([
        'user_permissions.user_id'  => $user_id,
        'permissions.controller'   => $controller,
        'permissions.method'       => $method,
        'permissions.url'          => $url,
    ]);
    if ($CI->db->get()->num_rows() > 0) return;

    // === Role Permission Check ===
    $CI->db->select('permissions.id');
    $CI->db->from('permissions');
    $CI->db->join('role_permissions', 'permissions.id = role_permissions.permission_id');
    $CI->db->where([
        'role_permissions.role_id' => $role_id,
        'permissions.controller'   => $controller,
        'permissions.method'       => $method,
        'permissions.url'          => $url,
    ]);
   if ($CI->db->get()->num_rows() > 0) return;

    // ❌ Access Denied
    $data = [
        'controller' => $controller,
        'url'        => $url,
        'method'     => $method,
    ];

    if (ob_get_length()) ob_end_clean();

    echo $CI->load->view('errors/custom_access_denied', $data, TRUE);
    exit;
}


}
