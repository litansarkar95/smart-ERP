<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Authentication_model extends CI_Model
{
   
    
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
    // checking login credential
    public function login_credential($username, $password)
    {
        $this->db->select('*');
        $this->db->from('login_credential');
        $this->db->where('username', $username);
        $this->db->where("password", $this->Encryptor('encrypt', $password));
        $this->db->limit(1);
        $query = $this->db->get();
      
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
        // } elseif ($roleID == 7) {
        //     $sql = "SELECT student.id, CONCAT(student.first_name,' ',student.last_name) as name, student.email, student.photo FROM student INNER JOIN enroll ON enroll.student_id = student.id WHERE student.id = " . $this->db->escape($userID);
        //     return $this->db->query($sql)->row_array();
        // } else {
            $sql = "SELECT CONCAT(staff.first_name,' ',staff.last_name) as name,email,picture FROM staff WHERE id = " . $this->db->escape($userID);
            return $this->db->query($sql)->row_array();
       // }
    }


}