<?php
class Quotation extends MX_Controller
{
  public function __construct() {
    parent::__construct();
       $this->load->model("partner/partner_model");
       $this->load->model("sales_model");
       $this->load->model('quotation_model');
 
}
public function index()
{
 
    $data                 = array();
    $data['active']       = "quotation";
    $data['title']        = "Create Quotation"; 
    $data['allPdt']       = $this->sales_model->getSalesList();
    $data['content']      = $this->load->view("quotation-create", $data, TRUE);
    $this->load->view('layout/master', $data);
 }

public function search_products() {
    $term = $this->input->get('term');
    
    log_message('debug', 'Search term: ' . $term);
    
    if (empty($term)) {
        echo json_encode([]); 
        return;
    }

    $this->db->like('name', $term);
    $this->db->where('is_active', 1);
    $query = $this->db->get('products');
    
    log_message('debug', 'Search query: ' . $this->db->last_query());

  
    $products = $query->result();
    
    $response = [];
    foreach ($products as $product) {
        $response[] = [
            'id' => $product->id,
            'name' => $product->name,           
            'brand_id' => $product->brand_id,   
            'warranty' => $product->warrenty,   
            'sales_price' => $product->sales_price 
        ];
    }

  
    echo json_encode($response);
}



  
}