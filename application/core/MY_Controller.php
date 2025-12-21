<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MY_Controller extends MX_Controller
{
    public function __construct()
    {
        parent::__construct();

        $loggedin = $this->session->userdata('loggedin');
        if (!$loggedin) {
            redirect(base_url());
        }
    }
}
