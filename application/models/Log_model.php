<?php
class Log_model extends CI_Model {
    public function __construct() {
        parent::__construct();
    }

    public function insert_log($data) {

       
        return $this->db->insert('logs', $data);
    }

    public function get_logs($limit = 100) {
        return $this->db->order_by('time', 'DESC')->limit($limit)->get('logs')->result();
    }
}
