<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Auth
{

    public $CI;
    protected $errors;
    protected $messages;

    //this is the expiration for a non-remember session
    //var $session_expire    = 600;

    public function __construct()
    {
        $this->CI       = &get_instance();
        $this->messages = array();
        $this->errors   = array();

        $this->CI->load->database();
    }
    public function logged_in()
    {
  
        return (bool) $this->CI->session->userdata('id');
    }

    public function getStaffRole($id)
    {

        $active_status = $this->CI->db->select('*')->from('roles')->where('id', $id)->get()->row_array();
 

        if ($active_status) {
          
            return $active_status;
        }
    }



}