<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

/*
*
* ---------------how to use-----------------
* ------------------------------------------
* Developed by <sourav.diubd@gmail.com>
*
* $autoload['helper'] =  array('lang');

* display a language
* echo display('helloworld'); 

* display language list
* $lang = languageList(); 
* ------------------------------------------
*
*/


if (!function_exists('display')) {

    function display($text = null)
    {
        $ci =& get_instance();
        $ci->load->database();
        $table = 'language';
        $phrase = 'phrase';
        $setting_table = 'setting';
        $default_lang = 'english';
    
        // Load language setting from the session or database
        if ($ci->session->userdata('site_lang')) {
            $language = $ci->session->userdata('site_lang');
        } else {
            // Check database for language setting
            $data = $ci->db->get($setting_table)->row();
            $language = !empty($data->language) ? $data->language : $default_lang;
            $ci->session->set_userdata('site_lang', $language); // Set session if not set
        }
    
        // Return translation if text is provided
        if (!empty($text)) {
            if ($ci->db->table_exists($table)) {
                if ($ci->db->field_exists($phrase, $table)) {
                    if ($ci->db->field_exists($language, $table)) {
                        $row = $ci->db->select($language)
                                      ->from($table)
                                      ->where($phrase, $text)
                                      ->get()
                                      ->row();
    
                        if (!empty($row->$language)) {
                            return html_escape($row->$language);
                        } else {
                            return false; // Translation not found
                        }
                    } else {
                        return false; // Language field does not exist
                    }
                } else {
                    return false; // Phrase field does not exist
                }
            } else {
                return false; // Table does not exist
            }
        } else {
            return false; // No text provided
        }
    }
    
 
}

