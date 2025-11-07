<?php
defined('BASEPATH') OR exit('No direct script access allowed');

$route['default_controller'] = 'dashboard/login';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;
$route["logout"] = "dashboard/authentication/logout"; 

//Dashboard
$route["login"] = "dashboard/login"; 
$route["logout"] = "dashboard/logout";




//Settings