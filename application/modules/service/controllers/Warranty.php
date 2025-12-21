<?php
class Warranty extends MY_Controller
{
  public function __construct() {
        parent::__construct();
        $this->load->model("sales/sales_model");
        $this->load->model("service_model");
        
    }
  
      

public function index()
{

 
  $data = array();
  $data['active'] = "warranty";
  $data['title'] = "warranty"; 
  $data['allPdt'] = $this->service_model->ServiceWarranty();
  //echo "<pre>";print_r($data['allPdt']);exit();
  $data['content'] = $this->load->view("warranty-list", $data, TRUE);
  $this->load->view('layout/master', $data);

}

public function create()
{

 
  $data = array();
  $data['active'] = "warranty";
  $data['title'] = "Warranty Create"; 

  
  $data['content'] = $this->load->view("warranty-create", $data, TRUE);
  $this->load->view('layout/master', $data);

}

public function search()
{

 
   $data = array();
   $data['active'] = "warranty";
   $data['title'] = "Warranty"; 
   $enter_serial  = trim($this->input->post('enter_serial'));
   $serial_list   = trim($this->input->post('serial_list'));

    if (empty($enter_serial) && empty($serial_list)) {
        $this->session->set_flashdata(
            'error',
            'Please enter serial OR select serial'
        );
        redirect('service/warranty/create');
    }

  $serial = !empty($enter_serial) ? $enter_serial : $serial_list;

$info = $this->service_model->get_warranty_info_by_serial($serial);
$insl = $this->service_model->get_warranty_sales_info_by_serial($serial);

if (!$info) {
    $this->session->set_flashdata('error', 'Serial not found');
    redirect('service/warranty/create');
}

$purchase_ts   = (int) $info->purchase_ts;
$warranty_val  = (int) $info->warrenty;
$unit          = strtolower($info->warrenty_days);

if ($unit === 'month' || $unit === 'months') {
    $expire_ts = strtotime("+{$warranty_val} months", $purchase_ts);
} else {
    $expire_ts = $purchase_ts + ($warranty_val * 86400);
}

$remaining_days = floor(($expire_ts - time()) / 86400);
$remaining_days = max(0, $remaining_days);

//###############################  sales

$data['sales_info'] = null;   // default

if ($insl !== false) {

    $sales_ts = !empty($insl->sales_ts) ? (int)$insl->sales_ts : 0;

    $warranty_sval = (int) $insl->warrenty;
    $unit = strtolower($insl->warrenty_days);

    if ($sales_ts > 0) {
        if ($unit === 'month' || $unit === 'months') {
            $expire_sts = strtotime("+{$warranty_sval} months", $sales_ts);
        } else {
            $expire_sts = $sales_ts + ($warranty_sval * 86400);
        }

        $sales_remaining_days = max(
            0,
            floor(($expire_sts - time()) / 86400)
        );
    } else {
        $sales_remaining_days = 0;
    }

    $data['sales_info'] = [
        'customer_id'   => $insl->customer_id,
        'sales_id'      => $insl->sales_id,
        'sinvoice_no'   => $insl->invoice_no,
        'sales_price'   =>  $insl->sales_price,
        'sales_date'    => $sales_ts ? date('d-m-Y', $sales_ts) : '',
        'customer_name' => $insl->customer_name,
        'sales_date'    => $insl->sales_ts,
        'warrenty'      => $insl->warrenty,
        'warrenty_days' => $insl->warrenty_days,
        'sales_warranty_left' =>
            ($sales_remaining_days > 0)
            ? $sales_remaining_days . ' Days Remaining'
            : 'Warranty Expired',
    ];
}


$pinfo = $this->service_model->get_warranty_product_info_by_serial($serial);
$data['product'] = [
    'name'          => $pinfo->name,
    //'purchase_price'=> 12000,
    'product_id'   => $pinfo->product_id,
    'barcode'       => $serial,
];


    $data['info'] = [
        'serial'                     => $serial,
        'supplier_id'                => $info->supplier_id,
        'purchase_id'                => $info->purchase_id,
        'invoice_no'                 => $info->invoice_no,
        'purchase_price'             => $info->purchase_price,
        'purchase_date'              => date('d-m-Y', $info->purchase_ts),
        'supplier'                   => $info->supplier_name,
        'warranty_left'              => ($remaining_days > 0)
            ? $remaining_days . ' Days Remaining'
            : 'Warranty Expired',
          

    ];
   
   // print_r($data['sales_info']);exit();
  $data['allCat']         = $this->main_model->getRecordsByOrg("service_categories");
  
  $data['content'] = $this->load->view("warranty-search", $data, TRUE);
  $this->load->view('layout/master', $data);

}
public function get_serial_by_product()
{
    $product_id = $this->input->post('product_id');
    $invoice_id = $this->input->post('invoice_id');

    $result = $this->service_model->get_serial_by_product($product_id, $invoice_id);

    echo json_encode($result);
}
public function save()
{

    $leads_create = date("Y-m-d");
    $date = date("Y-m-d H:i:s");
    $data = array(   
        "organization_id"            => $this->session->userdata('loggedin_org_id'),
        "branch_id"                  => $this->session->userdata('loggedin_branch_id'), 
        "invoice_no"                 => "SE-".rand(1000000,999999999),
        "purchase_id"                => $this->common_model->xss_clean($this->input->post("purchase_id")),   
        "product_id"                 => $this->common_model->xss_clean($this->input->post("product_id")),   
        "supplier_id"                => $this->common_model->xss_clean($this->input->post("supplier_id")),   
        "sales_id"                   => $this->common_model->xss_clean($this->input->post("sales_id")),   
        "customer_id"                => $this->common_model->xss_clean($this->input->post("customer_id")),   
        "serial"                     => $this->common_model->xss_clean($this->input->post("serial")),   
        "delivery_date"              => strtotime($this->common_model->xss_clean($this->input->post("delivery_date"))),
        "purchase_price"             => $this->common_model->xss_clean($this->input->post("purchase_price")),  
        "sales_price"                => $this->common_model->xss_clean($this->input->post("sales_price")),    
        "sales_date"                 => $this->common_model->xss_clean($this->input->post("sales_date")),    
        "warrenty"                   => $this->common_model->xss_clean($this->input->post("warrenty")),    
        "warrenty_days"              => $this->common_model->xss_clean($this->input->post("warrenty_days")),    
        "is_active"                  => 1,
        "create_user"                => $this->session->userdata('loggedin_id'),
        "create_date"                => strtotime($date),
       
    );

  
    if ($this->common_model->save_data("service_warranty", $data)) {
        $id = $this->common_model->Id;
        $problem_ids = $this->input->post('problem_id'); // array
        $rates       = $this->input->post('rate'); 
        $total_amount = 0; 

        if (!empty($problem_ids)) {
        foreach ($problem_ids as $cat_id => $value) {

            $amount = isset($rates[$cat_id]) ? $rates[$cat_id] : 0;
            $total_amount += $amount; 

        $pdata = array(   
        "organization_id"            => $this->session->userdata('loggedin_org_id'),
        "branch_id"                  => $this->session->userdata('loggedin_branch_id'), 
        "service_warranty_id"        => $id,   
        "service_categories_id"      => $cat_id,   
        "amount"                     => isset($rates[$cat_id]) ? $rates[$cat_id] : 0,     
        "is_active"                  => 1,
        "create_user"                => $this->session->userdata('loggedin_id'),
        "create_date"                => strtotime($date),
       
    );
     $this->common_model->save_data("service_warranty_order", $pdata);
      }
            $update_data = array(
            'total' => $total_amount
        );

        $this->common_model->update_data(
            'service_warranty',
            $update_data,
            array('id' => $id)
        );


        }
        $this->session->set_flashdata('success', 'Record has been successfully saved.');
           redirect(base_url() . "service/warranty/invoice/$id");
      }else{
        
     $this->session->set_flashdata('error', 'An error occurred. Please try again.');
      }
    
   redirect(base_url() . "service/warranty/create");


}
public function invoice($invoice_id)
{

 
  $data = array();
  $data['active'] = "warranty";
  $data['title'] = "Warranty"; 

    $warranty = $this->service_model->get_service_warranty($invoice_id);
    $orders   = $this->service_model->get_service_warranty_order_with_product($invoice_id);

    $data = [
        'warranty' => $warranty,
        'orders'   => $orders
    ];
  //print_r($warranty);exit();
  
  $this->load->view('warranty-invoice', $data);

}

public function change_status($id)
{
    $data = [
        'status' => $this->input->post('status'),
        'replace_given' => $this->input->post('replace_given') ? 1 : 0,
        'delivered_from_stock' => $this->input->post('delivered_from_stock') ? 1 : 0,
        'delivered_from_supplier' => $this->input->post('delivered_from_supplier') ? 1 : 0,
        'replace_serial' => $this->input->post('replace_serial'),
        'handover_to' => $this->input->post('handover_to'),
    ];

    $supdate = $this->service_model->updateServiceStatus($id, $data);
    if($supdate){
        $delivered_from_stock = $this->input->post('delivered_from_stock');
        if($delivered_from_stock == 1){
            $this->sales_save($id);
    
             
        }
          $this->session->set_flashdata('success', 'Status updated successfully!');
    }else{
            $this->session->set_flashdata('error', 'An error occurred. Please try again.');
    }
    
    redirect('service/warranty');
}

public function sales_save($id){  
    $date            = date("Y-m-d H:i:s");
    $branch_id       = $this->session->userdata("loggedin_branch_id");
    $store_id        = 1; 
    $product_id      =  $this->common_model->xss_clean($this->input->post("product_id"));
    $sales_date      =  $this->common_model->xss_clean($this->input->post("sales_date"));
    $purchase_price  =  $this->common_model->xss_clean($this->input->post("purchase_price"));
    $warrenty        =  $this->common_model->xss_clean($this->input->post("warrenty"));
    $warrenty_days   =  $this->common_model->xss_clean($this->input->post("warrenty_days"));
    $serial          =  $this->common_model->xss_clean($this->input->post("replace_serial"));


    $int_no = $this->sales_model->number_generator();
    $invoice_no = 'INV-'.str_pad($int_no,4,"0",STR_PAD_LEFT);

    // ধরছি $id আগেই পাওয়া আছে
    $warranty = $this->db
        ->select('customer_id')
        ->from('service_warranty')
        ->where('id', $id)
        ->get()
        ->row();

    

    $customer_id = $warranty->customer_id;
  
    $customer = $this->db
        ->select('name, contact_no, address')
        ->from('business_partner')
        ->where('id', $customer_id)
        ->where('is_active', 1)
        ->get()
        ->row();

    if(!$customer){
        return false;
    }

    $data = array(
        "organization_id" => $this->session->userdata('loggedin_org_id'),
        "branch_id"       => $branch_id,
        "invoice_code"    => 0,
        "code_random"     => $int_no,
        "invoice_no"      => $invoice_no,
        "sales_date"      => $sales_date,
        "customer_id"     => $customer_id,
        "store_id"        => 1,
        "totalQty"        => 1,
        "customer_name"   => $customer->name,
        "mobile_no"       => $customer->contact_no,
        "address"         => $customer->address,
        "is_active"       => 1,
        "create_user"     => $this->session->userdata('loggedin_id'),
        "create_date"     => strtotime($date),
    );
  
    if($this->common_model->save_data("sales", $data)){
        $sales_id =  $this->common_model->Id;


        
     $converted_date = convert_date_ddmmyyyy_to_yyyymmdd($sales_date);

        $total_tr_data = array(   
        "organization_id"            => $this->session->userdata('loggedin_org_id'),
        "branch_id"                  => $this->session->userdata('loggedin_branch_id'), 
        "voucher_type"               => 'Sales',  
        "invoice_no"                 => $invoice_no,
        "sales_invoice_id"           => $sales_id,   
        "party_id"                   => $customer_id,   
        "account_name"               => 'Customer Sales', 
        "particulars"                => 'Sales Replace',   
        "date"                       => date("Y-m-d"),   
        "debit"                      => 0,   
        "credit"                     => 0,   
        "gl_date"                    => strtotime($date),
        "acc_coa_head_id"            => 0,   
        "payment_method"             => 0,    
        "remarks"                    => "Sales Replace Barcode:  $serial",
        "is_active"                  => 1,
        "create_user"                => $this->session->userdata('loggedin_id'),
        "create_date"                => strtotime($date),
       
    );
    $this->common_model->save_data("acc_general_ledger", $total_tr_data);
        $pdata = array(
                    "organization_id" => $this->session->userdata('loggedin_org_id'),
                    "branch_id"       => $branch_id,
                    "sales_id"        => $sales_id,
                    "store_id"        => $store_id,
                    "serial_type"     => "unique",
                    "product_id"      => $product_id,
                    "purchase_price"  => $purchase_price,
                    "price"           => 0,
                    "qty"             => 1,
                    "warrenty"        => $warrenty,
                    "warrenty_days"   => $warrenty_days,
                    "status"          => 'Approved',
                    "create_user"     => $this->session->userdata('loggedin_id'),
                    "create_date"     => strtotime($date),
                );
                $this->common_model->save_data("sales_items", $pdata);
                $sales_item_id = $this->common_model->Id;

            // Save profit/loss
               $stock_serial = $this->db->get_where('inv_stock_item_serial', ['serial'=>$serial, 'is_available'=>1])->row();
              
                $total_profit = (0- $purchase_price);
                        $profit_data = array(
                            "organization_id" => $this->session->userdata('loggedin_org_id'),
                            "branch_id"       => $branch_id,
                            "sales_id"        => $sales_id,
                            "sales_item_id"   => $sales_item_id,
                            "customer_id"     => $customer_id,
                            "product_id"      => $product_id,
                            "batch_id"        => $stock_serial->id,
                            "batch_number"    => $stock_serial->serial,
                            "qty_sold"        => 1,
                            "purchase_price"  => $purchase_price,
                            "sales_price"     => 0,
                            "profit_loss"     => $total_profit,
                            "serial_type"     => 'unique',
                            "sales_date"      => $sales_date,
                            "create_user"     => $this->session->userdata('loggedin_id'),
                            "create_date"     => time()
                        );
                        $this->common_model->save_data("sales_item_batch_profit_loss", $profit_data);

                        // Mark inv_stock_item_serial as sold
                            $this->db->where('id', $stock_serial->id);
                            $this->db->update('inv_stock_item_serial', ['is_available'=>0]);
                 // =======================
                // Update inv_stock_master
                // =======================
                $this->db->where('store_id', $store_id);
                $this->db->where('product_id', $product_id);
                $master_stock = $this->db->get('inv_stock_master')->row();
                if($master_stock){
                    $new_qty = $master_stock->quanity - 1;
                    $this->db->where('id', $master_stock->id);
                    $this->db->update('inv_stock_master', [
                        "quanity"     => $new_qty,
                        "update_user" => $this->session->userdata('loggedin_id'),
                        "update_date" => time()
                    ]);
                }

    }

    return false;
}


}


