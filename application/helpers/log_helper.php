<?php
defined('BASEPATH') OR exit('No direct script access allowed');

function logs($message, $record_id = null, $user_id = null,$action = null) {
    $CI =& get_instance();
    $CI->load->model('log_model');
    $CI->load->library('user_agent');
    $data = [
        'message' => $message,
        'record_id' => $record_id,
        'user_id' => $user_id,
        'action' => $action,
        'ip_address' => $CI->input->ip_address(),
        'platform' => $CI->agent->platform(),
        'agent' => $CI->agent->agent_string(),
        'created_at' => date('Y-m-d')
    ];
    
    $CI->log_model->insert_log($data);
}


