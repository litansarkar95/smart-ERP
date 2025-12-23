<?php
class Dashboard extends MY_Controller
{
  public function __construct() {
        parent::__construct();
        $this->load->model("dashboard_model");
    }
  
      

public function index()
{

 
  $data = array();
  $data['active'] = "dashboard";
  $data['title'] = "Dashboard"; 

    $org_id    = $this->session->userdata('loggedin_org_id');
    $branch_id = $this->session->userdata('loggedin_branch_id');



    $data['today_sales']     = $this->dashboard_model->today_sales_amount($org_id, $branch_id);
    $data['total_sales']     = $this->dashboard_model->total_sales_amount($org_id, $branch_id);
    $data['today_purchase']  = $this->dashboard_model->today_purchase_amount($org_id, $branch_id);
    $data['total_purchase']  = $this->dashboard_model->total_purchase_amount($org_id, $branch_id);
    $data['today_expense']   = $this->dashboard_model->today_expense($org_id, $branch_id);
    $data['today_profit']    = $this->dashboard_model->today_profit($org_id, $branch_id);
   // $data['monthly_profit']  = $this->dashboard_model->monthly_profit($org_id, $branch_id);
    $data['total_profit']    = $this->dashboard_model->total_profit($org_id, $branch_id);
    $data['latest_sales']    = $this->dashboard_model->latest_five_sales($org_id, $branch_id);

    $chartData = $this->dashboard_model->get_weekly_sales_purchases($org_id, $branch_id);
    $data = array_merge($data ?? [], $chartData);

     $top_products = $this->dashboard_model->get_top_products($org_id, $branch_id);

    $total_top_sales = array_sum(array_map(function($p){ return $p->total_sales; }, $top_products));
$colors = [
    '#FF6384', // গোলাপি
    '#36A2EB', // নীল
    '#FFCE56', // হলুদ
    '#4BC0C0', // সিয়ান
    '#9966FF', // বেগুনি
    '#FF9F40', // কমলা
    '#00A86B', // সবুজ
    '#FF6F61', // লাল-কমলা
];
        $donut_labels = [];
        $donut_data   = [];
        $donut_colors = [];

        
     foreach($top_products as $index => $p) {
            $donut_labels[] = $p->product_name;
            $donut_data[] = $p->total_sales;
            $donut_colors[] = $colors[$index % count($colors)];
        }

        $data['top_products'] = $top_products;
        $data['total_top_sales'] = $total_top_sales;
        $data['donut_labels'] = $donut_labels;
        $data['donut_data'] = $donut_data;
        $data['donut_colors'] = $donut_colors;

      

  
  $data['content'] = $this->load->view("dashboard", $data, TRUE);
  $this->load->view('layout/master', $data);

}

public function setlanguage() {
  $language=$this->input->post("lan");
  $this->session->set_userdata("site_lang",$language);
  $this->session->set_flashdata("success","Successful Language ".ucfirst($language));

}
public function logout() {
  $this->session->sess_destroy();
  redirect("");
}
}


