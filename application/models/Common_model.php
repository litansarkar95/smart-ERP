<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Common_model extends CI_Model {

    public $Id;

    public function save_data($table, $data) {
        if ($this->db->insert($table, $data)) {
            
            $this->Id = $this->db->insert_id();
            //LOGS
            $user_id = $this->session->userdata('loggedin_id');
            logs("New Record inserted On $table id $this->Id", $this->Id, $user_id,"Insert");
            return TRUE;
        } else {
            return FALSE;
        }
    }

    public function update_data($table, $data, $where,$id=NULL) {



        if ($where) {
            $this->db->where($where);
        }
        if ($this->db->update($table, $data)) {
                //LOGS
                $user_id = $this->session->userdata('loggedin_id');
                logs("Record deleted On $table id $id", $id, $user_id,"Update");
            return TRUE;
        } else {
            return FALSE;
        }
    }

    public function view_data($table, $where, $order1, $order2) {
        if ($where) {
            $this->db->where($where);
        }
        $this->db->select("*");
        $this->db->from($table);
        $this->db->order_by($order1, $order2);
        return $this->db->get()->result();
    }

    public function delete_data($table, $data,$id=NULL) {
       
        if ($this->db->delete($table, $data)) {
      
        //LOGS
        $user_id = $this->session->userdata('loggedin_id');
        logs("Record deleted On $table id $id", $id, $user_id,"Delete");
            return TRUE;
        } else {
            return FALSE;
        }
    }
#####################################
############### SEND SMS
##########################

public function sms_save_data($sender_id, $message,$date=null,$sms_type=null,$response_code=null,$success_message=null,$message_id=null) {
    $data = array(
        "sender_id" =>  $sender_id,
        "message" => $message,
        "send_time" => $date,
        "sms_type" => $sms_type,
        "response_code" => $response_code,
        "message_id" => $message_id,
        "message_status" => $success_message
    
    );
    if ($this->db->insert("sms_log", $data)) {
        $this->Id = $this->db->insert_id();

        return TRUE;
    } else {
        return FALSE;
    }
}

    public function Encryptor($action, $string) {
        $output = false;

        $encrypt_method = "AES-256-CBC";
        //pls set your unique hashing key
        $secret_key = 'hitenVkuld%:bTXz,3r>6|FW#!7eSs>vM~n+48~{Mh$#A4p).)#wV3^_y-B.6WCar=b4.';
        $secret_iv = '3w8XD|r@n:nxp|oml]nw$-KEc|rT$H).(~ &`gnV!vD0vs|?r]#Zdr-qRlOV@&#6';

        // hash
        $key = hash('sha256', $secret_key);

        // iv - encrypt method AES-256-CBC expects 16 bytes - else you will get a warning
        $iv = substr(hash('sha256', $secret_iv), 0, 16);

        //do the encyption given text/string/number
        if ($action == 'encrypt') {
            $output = openssl_encrypt($string, $encrypt_method, $key, 0, $iv);
            $output = base64_encode($output);
        } else if ($action == 'decrypt') {
            //decrypt the given text/string/number
            $output = openssl_decrypt(base64_decode($string), $encrypt_method, $key, 0, $iv);
        }

        return $output;
    }

    public function xss_clean($data) {
        return $this->security->xss_clean($data);
    }

    public function admin_login($username, $password) {
        $this->db->where("username", $username);
        $this->db->where("password", $this->Encryptor('encrypt', $password));
        $this->db->where("active", 1);
        $query = $this->db->get('login_credential');
        if ($query->num_rows() == 1) {
            return $query->row();
        }
        return FALSE;
    }

    
    public function getUserNameByRoleID($roleID, $userID = '')
    {
   
        // if ($roleID == 6) {
        //     $sql = "SELECT name,email,picture FROM parent WHERE id = " . $this->db->escape($userID);
        //     return $this->db->query($sql)->row_array();
        // } else
        if ($roleID == 7) {
            //$sql = "SELECT customers.id, customers.name as name, customers.email, customers.contact_no, customers.picture FROM customers INNER JOIN enroll ON enroll.student_id = student.id WHERE customers.id = " . $this->db->escape($userID);
             $sql = "SELECT CONCAT(staff.first_name,' ',staff.last_name) as name,email,contact_no,picture FROM staff WHERE id = " . $this->db->escape($userID);
            return $this->db->query($sql)->row_array();
        } else {
           
            $sql = "SELECT CONCAT(staff.first_name,' ',staff.last_name) as name,email,contact_no,picture FROM staff WHERE id = " . $this->db->escape($userID);
            return $this->db->query($sql)->row_array();
       }
    }

    public function CategoriesList() {
        
        $query = $this->db->query("SELECT  a.id, a.name,a.icons, a.parent_id,a.is_active,a.create_date,(select b.name from categories b where b.id=a.parent_id) AS parent_name
        FROM   categories a" );
        return $query->result();
    }



    public function Role($id=NULL) {
        if($id){
            $this->db->where("roles.id",$id); 
        }
		$this->db->select("roles.*");
        $this->db->from("roles");
        $this->db->where("roles.is_active",1); 
        $this->db->where("roles.is_superadmin",0); 
        $this->db->order_by("id", "DESC");
        return $this->db->get()->result();
    }

}