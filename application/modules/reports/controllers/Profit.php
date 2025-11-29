<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Profit extends MX_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Profit_model');
    }

    public function index()
{
 
    $data = array();
    $data['active']    = "products";
    $data['title'] = "Products List"; 
  //  $data['allCat']         = $this->main_model->getRecordsByOrg("products_groups");
    $data['content'] = $this->load->view("profit-new", $data, TRUE);
    $this->load->view('layout/master', $data);
 }

   public function by_date()
{
    $p_from = $this->input->post("p_from");
    $p_to   = $this->input->post("p_to");

    // Convert dd-mm-yy → yyyy-mm-dd
    $start_date = date("Y-m-d", strtotime($p_from));
    $end_date   = date("Y-m-d", strtotime($p_to));

    $data["start_date"] = $p_from;
    $data["end_date"]   = $p_to;

    // TOTAL PROFIT
    $data["total_profit"] = $this->Profit_model->get_profit_by_date($start_date, $end_date);

    // PRODUCT WISE
    $data["productwise"] = $this->Profit_model->get_productwise_profit($start_date, $end_date);

    $this->load->view("reports/profit_by_date", $data);
}

    // ইনভয়েস অনুযায়ী
    public function by_invoice($invoice_id) {
        $data['total_profit'] = $this->Profit_model->get_profit_by_invoice($invoice_id)->total_profit;
        $data['invoice_id']   = $invoice_id;
        $this->load->view('profit_by_invoice', $data);
    }
}
