<?php
class Dashboard extends MX_Controller
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

//  $total = $this->session->userdata($sessionData);
//   print_r( $total);exit();



    $start = date('Y-m-01'); // এই মাসের প্রথম দিন
    $end   = date('Y-m-t');  // এই মাসের শেষ দিন

    $data['profits'] = $this->dashboard_model->get_productwise_profit($start, $end);

    // Monthly totals
    $total_sales = 0;
    $total_purchase = 0;
    $total_profit = 0;

    foreach($data['profits'] as $p) {
        $total_sales    += $p->total_sales;
        $total_purchase += $p->total_purchase;
        $total_profit   += $p->total_profit;
    }

    $data['totals'] = [
        'sales'    => $total_sales,
        'purchase' => $total_purchase,
        'profit'   => $total_profit
    ];

  
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


