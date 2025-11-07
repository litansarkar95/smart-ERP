<?php
defined('BASEPATH') OR exit('No direct script access allowed');

if (!function_exists('has_permission')) {
    function has_permission($controller, $url)
{
    $CI =& get_instance();
    $CI->load->library('session');
    $CI->load->database();

    $user_id = $CI->session->userdata('loggedin_id');
    $role_id = $CI->session->userdata('loggedin_role_id');

    // URL থেকে method map
    $method_map = [
      'index' => 'read', 'view' => 'view', 'details' => 'view', 'list' => 'view',
        'add' => 'create', 'insert' => 'create', 'create' => 'create',
        'edit' => 'edit', 'update' => 'update',
        'delete' => 'delete', 'remove' => 'delete',
        'report' => 'export', 'download' => 'export', 'print' => 'export',
        'approve' => 'approve', 'reject' => 'approve', 'verify' => 'approve',
        'settings' => 'manage', 'config' => 'manage',
    ];

    $method = isset($method_map[$url]) ? $method_map[$url] : 'read';

    // User permission check
    $CI->db->from('permissions');
    $CI->db->join('user_permissions', 'permissions.id = user_permissions.permission_id');
    $CI->db->where([
        'user_permissions.user_id' => $user_id,
        'permissions.controller'   => strtolower($controller),
        'permissions.method'       => $method,
        'permissions.url'          => strtolower($url)
    ]);
    if ($CI->db->get()->num_rows() > 0) return true;

    // Role permission check
    $CI->db->from('permissions');
    $CI->db->join('role_permissions', 'permissions.id = role_permissions.permission_id');
    $CI->db->where([
        'role_permissions.role_id' => $role_id,
        'permissions.controller'   => strtolower($controller),
        'permissions.method'       => $method,
        'permissions.url'          => strtolower($url)
    ]);
    if ($CI->db->get()->num_rows() > 0) return true;

    return false;
}

}
