<?php
class Purchasebatch extends MX_Controller
{
  public function __construct() {
    parent::__construct();
       $this->load->model("purchase_model");
       $this->load->model("purchasebatch_model");
 
}
public function index()
{
 
    $data = array();
    $data['active']       = "purchase";
    $data['title']         = "Purchase List"; 
    $data['allPdt']       = $this->purchase_model->getPurchaseList();
    $data['content'] = $this->load->view("purchase-list", $data, TRUE);
    $this->load->view('layout/master', $data);
 }
 public function create()
{

  $this->form_validation->set_rules("totalAmount", "Total Amount", "required");
  $this->form_validation->set_rules("purchase_date", "Purchase date", "required");
  $this->form_validation->set_rules("supplier_id", "Supplier", "required");

  if ($this->form_validation->run() == NULL) {
  
  } else {

  }

    $data = array();
    $data['active']         = "purchase";
    $data['title']          = "Create Purchase "; 
    $data['allUnit']        = $this->common_model->view_data("unit", array("is_active" => 1), "name", "ASC");;
    $data['allBrand']       = $this->main_model->getRecordsByOrg("brands");
    $data['allCat']         = $this->main_model->getRecordsByOrg("products_groups");
    $data['allInv']         = $this->main_model->getRecordsByOrg("warehouse");
    $data['allPro']         = $this->main_model->getRecordsByOrg("products");
    $data['allSuplier']     = $this->purchase_model->getSuplier();
    $data['allPayment']     = $this->main_model->getRecordsByOrg("payment_method");
    $data['allGroup']       = $this->main_model->getRecordsByOrg("partner_groups");
    // inv 
    $int_no = $this->purchase_model->number_generator();
    $invoice_no = 'GRN-'.str_pad($int_no,4,"0",STR_PAD_LEFT);
    $data['invoice_no'] = $invoice_no; 
    $data['content']        = $this->load->view("batch/purchase-create", $data, TRUE);
    $this->load->view('layout/master', $data);

}


public function insert()
{

  $this->form_validation->set_rules("totalAmount", "Total Amount", "required");
  $this->form_validation->set_rules("purchase_date", "Purchase date", "required");
  $this->form_validation->set_rules("supplier_id", "Supplier", "required");

  if ($this->form_validation->run() == NULL) {
  
  } else {

    //table list
    #####
    #purchase , purchase_invoice, purchase_order_items,purchase_order_item_serials
    #inv_stock_master ,inv_stock_item_serial, inv_stock_history,
    #acc_general_ledger,business_partner
    #

   $invoice_code   = $this->common_model->xss_clean($this->input->post("invoice_code"));
   $store_id        = $this->common_model->xss_clean($this->input->post("store_id"));
   $supplier_id     = $this->common_model->xss_clean($this->input->post("supplier_id"));
   $branch_id       = $this->session->userdata("loggedin_branch_id");
   

    $int_no = $this->purchase_model->number_generator();
  	$invoice_no = 'GRN-'.str_pad($int_no,4,"0",STR_PAD_LEFT);

       $save_customer = $this->common_model->xss_clean($this->input->post("save_customer"));
        if($save_customer == 1){
            $date = date("Y-m-d H:i:s");
            $data_custome = array(
                "organization_id"   => $this->session->userdata('loggedin_org_id'),
                "name"              => $this->common_model->xss_clean($this->input->post("customer_name")),
                "partner_type"      => "Both",
                "contact_no"        => $this->common_model->xss_clean($this->input->post("mobile_no")),
                "address"           => $this->common_model->xss_clean($this->input->post("address")),
                "customer_group_id" => $this->common_model->xss_clean($this->input->post("customer_group_id")),
                "is_active"         => 1,
                "create_user"       => $this->session->userdata('loggedin_id'),
                "create_date"       => strtotime($date),
            );
            if($this->common_model->save_data("business_partner", $data_custome)){
                $customer_id = $this->common_model->Id;
            }
        } else {
            $customer_id = $this->common_model->xss_clean($this->input->post("supplier_id"));
        }
    
    $date = date("Y-m-d H:i:s");
    $data = array(   
        "organization_id"            => $this->session->userdata('loggedin_org_id'),
        "branch_id"                  => $this->session->userdata('loggedin_branch_id'), 
        "invoice_code"               => $this->common_model->xss_clean($this->input->post("invoice_id")),  
        "code_random"                => $int_no,   
        "invoice_no"                 => $invoice_no,   
        "purchase_date"              => strtotime($this->common_model->xss_clean($this->input->post("purchase_date"))),   
        "supplier_id"                => $customer_id,   
        "store_id"                   => $this->common_model->xss_clean($this->input->post("store_id")),   
        "totalQty"                   => $this->common_model->xss_clean($this->input->post("totalOrderAmount")),   
        "allTotal"                   => $this->common_model->xss_clean($this->input->post("subtotalAmount")),   
        "totalDiscount"              => $this->common_model->xss_clean($this->input->post("totaldiscount")),   
        "totalRebate"                => $this->common_model->xss_clean($this->input->post("totalRebate")),   
        "totalAmount"                => $this->common_model->xss_clean($this->input->post("totalAmount")),   
        "paidAmount"                 => $this->common_model->xss_clean($this->input->post("paidAmount")),   
        "dueAmount"                  => $this->common_model->xss_clean($this->input->post("dueAmount")),  
        "is_active"                  => 1,
        "create_user"                => $this->session->userdata('loggedin_id'),
        "create_date"                => strtotime($date),
       
    );

     

   
    if ($this->common_model->save_data("purchase", $data)) {
      $purchase_id = $this->common_model->Id;
    $this->db->where('invoice_code', $invoice_code)->update('purchase_invoice', ['status' => 'Approved']);
         #######################################################################
    ####################### Start Accounts Ledger  #########################
    #####################################################################

        $totalOrderAmount = $this->input->post('totalOrderAmount') ?? 0;
        $subtotalAmount = $this->input->post('subtotalAmount') ?? 0;
        $totalRebate = $this->input->post('totalRebate') ?? 0;
        $totalDiscount = $this->input->post('totaldiscount') ?? 0;
        $dueAmount = $this->input->post('dueAmount') ?? 0;
        $paymentMethodId = $this->input->post('payment_method_id');
        $paidAmount = $this->input->post('paidAmount');
   

        // Calculate net amount after rebate and discount
        $netAmount = $subtotalAmount  - $totalDiscount;

  
      //update suplier payment
      $this->purchase_model->update_current_balance($customer_id, $dueAmount);
        $total_tr_data = array(   
        "organization_id"            => $this->session->userdata('loggedin_org_id'),
        "branch_id"                  => $this->session->userdata('loggedin_branch_id'), 
        "voucher_type"               => 'Purchase',  
        "invoice_no"                 => $invoice_no, 
        "purchase_invoice_id"        => $purchase_id,   
        "party_id"                   => $customer_id,   
        "account_name"               => 'Supplier Purchase', 
        "particulars"                =>'Purchase for order',   
        "date"                       => $date,   
        "debit"                      => 0,   
        "credit"                     => $netAmount,   
        "gl_date"                    => strtotime($date),
        "acc_coa_head_id"            => 0,   
        "payment_method"             => 0,    
        "remarks"                    => 'Purchase order ',
        "is_active"                  => 1,
        "create_user"                => $this->session->userdata('loggedin_id'),
        "create_date"                => strtotime($date),
       
    );
    $this->common_model->save_data("acc_general_ledger", $total_tr_data);

    if($paidAmount > 0){
        $total_pay_data = array(   
        "organization_id"            => $this->session->userdata('loggedin_org_id'),
        "branch_id"                  => $this->session->userdata('loggedin_branch_id'), 
        "voucher_type"               => 'Supplier Payment',  
        "invoice_no"                 => $invoice_no, 
        "purchase_invoice_id"        => $purchase_id,   
        "party_id"                   => $customer_id,   
        "account_name"               => 'Supplier Account', 
        "particulars"                => 'Payment for order',   
        "date"                       => $date,   
        "debit"                      => $paidAmount,   
        "credit"                     => 0,   
        "gl_date"                    => strtotime($date),
        "acc_coa_head_id"            => 0,   
        "payment_method"             => $paymentMethodId,    
        "remarks"                    => 'Payment for order ',
        "is_active"                  => 1,
        "create_user"                => $this->session->userdata('loggedin_id'),
        "create_date"                => strtotime($date),
       
    );
    $this->common_model->save_data("acc_general_ledger", $total_pay_data);

    }

     if($totalRebate > 0){
        $total_pay_data = array(   
        "organization_id"            => $this->session->userdata('loggedin_org_id'),
        "branch_id"                  => $this->session->userdata('loggedin_branch_id'), 
        "voucher_type"               => 'Supplier Rebate',  
        "invoice_no"                 => $invoice_no, 
        "purchase_invoice_id"        => $purchase_id,   
        "party_id"                   => $customer_id,   
        "account_name"               => 'Rebate', 
        "particulars"                => 'Rebate for order',   
        "date"                       => $date,   
        "debit"                      => $totalRebate,   
        "credit"                     => 0,   
        "gl_date"                    => strtotime($date),
        "acc_coa_head_id"            => 0,   
        "payment_method"             => 0,    
        "remarks"                    => 'Payment for order with rebate and discount ',
        "is_active"                  => 1,
        "create_user"                => $this->session->userdata('loggedin_id'),
        "create_date"                => strtotime($date),
       
    );
    $this->common_model->save_data("acc_general_ledger", $total_pay_data);
    }

   #######################################################################
   ####################### End Accounts Ledger #########################
   #####################################################################


       // Get items from sales order
        $items = $this->purchase_model->get_items_by_invoice($invoice_code);

        foreach($items as $item){
                // Save each sales_item
                $pdata = array(
                    "organization_id"    => $this->session->userdata('loggedin_org_id'),
                    "branch_id"          => $branch_id,
                    "invoice_code"       => $this->common_model->xss_clean($this->input->post("invoice_code")),  
                    "purchase_id"        => $purchase_id,
                    "store_id"           => $store_id,
                    "product_id"         => $item->product_id,
                    "serial_type"        => $item->serial_type,
                    "purchase_price"     => $item->price,
                    "sales_price"        => $item->price - $item->rebate,
                    "qty"                => $item->qty,
                    "sub_total"          => $item->price * $item->qty,
                    "rebate"             => $item->rebate,
                    "total_rebate"       => $item->total_rebate,
                    "net_total"          => $item->sub_total,
                    "warrenty"           => $item->warrenty,
                    "warrenty_days"      => $item->warrenty_days,
                    "status"             => 'Approved',
                    "create_user"        => $this->session->userdata('loggedin_id'),
                    "create_date"       => strtotime($date),
                );
                $this->common_model->save_data("purchase_items", $pdata);
                $purchase_item_id = $this->common_model->Id;

                // item serial
                if ($item->serial_type == 'unique') {

                    $items_serials = $this->purchase_model->get_order_item_serials($item->id);
                    foreach($items_serials as $items_serial){
                  // Save each sales_item
                    $items_ser = array(
                    "item_id"            => $purchase_item_id,
                    "serial_type"        => $item->serial_type,
                    "is_available"       => 1,
                    "serial_number"      => $items_serial->serial_number,
                        );
                        $this->common_model->save_data("purchase_item_serials", $items_ser);
                    }

                   
                }

            }


                
   #######################################################################
   ####################### Start inv_stock_item_serial #########################
   #####################################################################
    // Start inv_stock_item_serial
    $items  = $this->purchase_model->get_items_order_by_invoice($invoice_code);


 
    foreach($items  as $item){
        if ($item->serial_type == 'common') {
            // যদি barcode_serial থাকে
            if (!empty($item->barcode_serial)) {
              //  for ($i = 1; $i <= $item->qty; $i++) {
                     $pdata = array(   
                    "organization_id"            => $this->session->userdata('loggedin_org_id'),
                    "branch_id"                  => $this->session->userdata('loggedin_branch_id'), 
                    "purchase_id"                => $purchase_id,  
                    "supplier_id"                => $customer_id,  
                    "store_id"                   => $this->common_model->xss_clean($this->input->post("store_id")),   
                    "product_id"                 => $item->product_id,   
                    "purchase_price"             => $item->price - $item->rebate,   
                    "rebate"                     => $item->rebate,    
                    "sales_price"                => $item->sales_price,        
                    "quanity"                    => $item->qty,   
                    "is_available"               => 1,   
                    "serial_type"                => $item->serial_type,   
                    "batch_number"               => $item->barcode_serial,
                    "create_user"                => $this->session->userdata('loggedin_id'),
                    "create_date"                => strtotime($date),
                
                );
            $this->common_model->save_data("inv_stock_item_batch", $pdata);
                //}
            } else {
                // barcode_serial ফাঁকা => unique code generate করো
              //  for ($i = 1; $i <= $item->qty; $i++) {
                    $unique_code = strtoupper(uniqid('SN'));
                     $pdata = array(   
                    "organization_id"            => $this->session->userdata('loggedin_org_id'),
                    "branch_id"                  => $this->session->userdata('loggedin_branch_id'), 
                    "purchase_id"                => $purchase_id,  
                    "supplier_id"                => $customer_id,   
                    "store_id"                   => $this->common_model->xss_clean($this->input->post("store_id")),   
                    "product_id"                 => $item->product_id,   
                    "purchase_price"             => $item->price - $item->rebate,     
                    "rebate"                     =>  $item->rebate,  
                    "sales_price"                => $item->sales_price,        
                    "quanity"                    => $item->qty,    
                    "is_available"               => 1,   
                    "serial_type"                => $item->serial_type,   
                    "batch_number"               => $unique_code,
                    "create_user"                => $this->session->userdata('loggedin_id'),
                    "create_date"                => strtotime($date),
                
                );
                    $this->common_model->save_data("inv_stock_item_batch", $pdata);
                 //   echo "Invoice: {$item->invoice_id} | Product: {$item->product_id} | Unique Code: {$unique_code} <br>";
               // }
            }
        }elseif ($item->serial_type == 'unique') {
         if (!empty($item->serial_number)) {
                // serial_number ফিল্ডে মান থাকলে কমা দিয়ে split করো
                $serials = explode(',', $item->serial_number);
                foreach ($serials as $serial) {
                    $serial = trim($serial);
                    $pdata = array(   
                    "organization_id"            => $this->session->userdata('loggedin_org_id'),
                    "branch_id"                  => $this->session->userdata('loggedin_branch_id'), 
                    "purchase_id"                => $purchase_id,   
                    "supplier_id"                => $customer_id,  
                    "store_id"                   => $this->common_model->xss_clean($this->input->post("store_id")),   
                    "product_id"                 => $item->product_id,   
                    "purchase_date"              => strtotime($this->common_model->xss_clean($this->input->post("purchase_date"))),
                    "purchase_price"             => $item->price - $item->rebate,    
                    "rebate"                     => $item->rebate,    
                    "sales_price"                => $item->sales_price,        
                    "quanity"                    => 1,   
                    "is_available"               => 1,   
                    "serial_type"                => $item->serial_type,   
                    "serial"                     => $serial,
                    "warrenty"                   => $item->warrenty, 
                    "warrenty_days"              => $item->warrenty_days, 
                    "create_user"                => $this->session->userdata('loggedin_id'),
                    "create_date"                => strtotime($date),
                
                );
                    $this->common_model->save_data("inv_stock_item_serial", $pdata);
                  //  echo "Invoice: {$item->invoice_id} | Product: {$item->product_id} | Serial: {$serial} <br>";
                }
            } else {
                // serial_number ফাঁকা ⇒ qty সংখ্যক unique code বানাও
                for ($i = 1; $i <= $item->qty; $i++) {
                    $unique_serial = strtoupper(uniqid('UNQ'));
                     $pdata = array(   
                    "organization_id"            => $this->session->userdata('loggedin_org_id'),
                    "branch_id"                  => $this->session->userdata('loggedin_branch_id'), 
                    "purchase_id"                => $purchase_id,  
                    "supplier_id"                => $customer_id,  
                    "store_id"                   => $this->common_model->xss_clean($this->input->post("store_id")),   
                    "product_id"                 => $item->product_id,  
                    "purchase_date"              => strtotime($this->common_model->xss_clean($this->input->post("purchase_date"))), 
                    "purchase_price"             => $item->price - $item->rebate,    
                    "rebate"                     => $item->rebate,  
                    "sales_price"                => $item->sales_price,        
                    "quanity"                    => 1,   
                    "is_available"               => 1,   
                    "serial_type"                => $item->serial_type,   
                    "serial"                     => $unique_serial,
                    "warrenty"                   => $item->warrenty, 
                    "warrenty_days"              => $item->warrenty_days,
                    "create_user"                => $this->session->userdata('loggedin_id'),
                    "create_date"                => strtotime($date),
                
                );
                    $this->common_model->save_data("inv_stock_item_serial", $pdata);
                    //echo "Invoice: {$item->invoice_id} | Product: {$item->product_id} | Generated Serial: {$unique_serial} <br>";
                }
            }
        }
         
   
    }
 // inv_stock_item_serial 
   #######################################################################
   ####################### End inv_stock_item_serial #########################
   #####################################################################
       // Start Stock
    $existing = $this->purchase_model->get_items_by_stock($invoice_code);
    
    foreach($existing as $products){
        $product_id     = $products->product_id;
        $price          = $products->price;
        $rebate         = $products->rebate;
        $quanity        = $products->qty;
        $sales_price    = $products->sales_price;
        $warrenty       = $products->warrenty;
        $warrenty_days  = $products->warrenty_days;

        $date = date("Y-m-d H:i:s");


 ###################################################################
        ############# Previus Stock History 
        #############################################################################

         $is_previous_stock = $this->purchase_model->get_stock_previous_products($store_id ,$product_id );
         if($is_previous_stock){

            $previous_purchase_price = $is_previous_stock->purchase_price;
            $previous_rebate         = $is_previous_stock->rebate;
            $previous_sales_price    = $is_previous_stock->sales_price;
            $previous_quanity        = $is_previous_stock->quanity;

            $this->db->insert('inv_stock_history', [
                'organization_id'                     => $this->session->userdata("loggedin_org_id"),
                'branch_id'                           => $this->session->userdata("loggedin_branch_id"),
                "purchase_id"                         => $purchase_id,  
                'store_id'                            => $store_id,
                'product_id'                          => $product_id,
                'previous_purchase_price'             => $previous_purchase_price,
                'previous_rebate'                     => $previous_rebate,
                'previous_sales_price'                => $previous_sales_price,
                'previous_quanity'                    => $previous_quanity,
                'purchase_price'                      => $price - $rebate,
                'rebate'                              => $rebate,
                'sales_price'                         => $sales_price,
                'quanity'                             => $quanity,
                'is_active'                           => 1,
                'create_user'                         => $this->session->userdata('loggedin_id'),
                'create_date'                         => strtotime($date),
            ]);
            $history_id = $this->db->insert_id();

         }else{
            $this->db->insert('inv_stock_history', [
                'organization_id'                     => $this->session->userdata("loggedin_org_id"),
                'branch_id'                           => $this->session->userdata("loggedin_branch_id"),
                "purchase_id"                         => $purchase_id,  
                'store_id'                            => $store_id,
                'product_id'                          => $product_id,
                'previous_purchase_price'             => 0,
                'previous_rebate'                     => 0,
                'previous_sales_price'                => 0,
                'previous_quanity'                    => 0,
                'purchase_price'                      => $price - $rebate,
                'rebate'                              => $rebate,
                'sales_price'                         => $sales_price,
                'quanity'                             => $quanity,
                'is_active'                           => 1,
                'create_user'                         => $this->session->userdata('loggedin_id'),
                'create_date'                         => strtotime($date),
            ]);
            $history_id = $this->db->insert_id();

         }

          

        ###################################################################
        ############# End Previus Stock History 
        #############################################################################
        
          


        $is_product = $this->purchase_model->get_stock_products($store_id ,$product_id );

         
            if($is_product){
                foreach($is_product as $mdata){
                    $new_qty =  $mdata->quanity;
            
        

            $this->db->where('branch_id', $branch_id);
            $this->db->where('store_id', $store_id);
            $this->db->where('product_id', $product_id);
            $this->db->update('inv_stock_master', [
                'purchase_price'     => $price - $rebate,
                'rebate'             => $rebate,
                'sales_price'        => $sales_price,
                'quanity'            => $new_qty + $quanity,
                'warrenty'           => $warrenty,
                'warrenty_days'      => $warrenty_days,
                'update_user'        => $this->session->userdata('loggedin_id'),
                'update_date'        => strtotime($date),
            ]);


            }
        } else {
            $this->db->insert('inv_stock_master', [
                'organization_id'    => $this->session->userdata("loggedin_org_id"),
                'branch_id'          => $this->session->userdata("loggedin_branch_id"),
                'store_id'           => $store_id,
                'product_id'         => $product_id,
                'purchase_price'     => $price - $rebate,
                'rebate'             => $rebate,
                'sales_price'        => $sales_price,
                'quanity'            => $quanity,
                'warrenty'           => $warrenty,
                'warrenty_days'      => $warrenty_days,
                'is_active'          => 1,
                'create_user'        => $this->session->userdata('loggedin_id'),
                'create_date'        => strtotime($date),
            ]);
            $item_id = $this->db->insert_id();
        }


    }


      


        $this->session->set_flashdata('success', 'Record has been successfully saved.');
      }else{
        
   $this->session->set_flashdata('error', 'An error occurred. Please try again.');
      }
    
   redirect(base_url() . "purchase/create");
  }

    $data = array();
    $data['active']         = "purchase";
    $data['title']          = "Create Purchase "; 
    $data['allUnit']        = $this->common_model->view_data("unit", array("is_active" => 1), "name", "ASC");;
    $data['allBrand']       = $this->main_model->getRecordsByOrg("brands");
    $data['allCat']         = $this->main_model->getRecordsByOrg("products_groups");
    $data['allInv']         = $this->main_model->getRecordsByOrg("warehouse");
    $data['allPro']         = $this->main_model->getRecordsByOrg("products");
    $data['allSuplier']     = $this->purchase_model->getSuplier();
    $data['allPayment']         = $this->main_model->getRecordsByOrg("payment_method");
    $data['allGroup']       = $this->main_model->getRecordsByOrg("partner_groups");
    // inv 
    $int_no = $this->purchase_model->number_generator();
  	$invoice_no = 'GRN-'.str_pad($int_no,4,"0",STR_PAD_LEFT);
    $data['invoice_no'] = $invoice_no; 
    $data['content']        = $this->load->view("purchase-create", $data, TRUE);
    $this->load->view('layout/master', $data);
}
public function add_item_ajax(){
    $invoice_code = $this->input->post('invoice_code');
    $existing = $this->db->get_where('purchase_invoice', ['invoice_code' => $invoice_code])->row();

    if($existing){
        $invoice_id = $existing->id;
    } else {
        $invoice_data = [
            'organization_id' => $this->session->userdata('loggedin_org_id'),
            'branch_id'       => $this->session->userdata('loggedin_branch_id'), 
            'invoice_code'    => $invoice_code,
            'supplier_id'     => $this->input->post('supplier_id'),
            'remarks'         => '',
            'status'          => 'Pending',
            'create_user'     => $this->session->userdata('loggedin_id'),
            'create_date'     => time()
        ];
        $invoice_id = $this->purchasebatch_model->insert_invoice($invoice_data);
    }

    $data = [
        'invoice_id'    => $invoice_code,
        'serial_type'   => $this->input->post('serial_type'),
        'product_id'    => $this->input->post('product_id'),
        'purchase_date' => time(),
        'price'         => $this->input->post('price'),
        'qty'           => $this->input->post('qty'),
        'rebate'        => $this->input->post('rebate'),
        'total_rebate'  => $this->input->post('total_rebate'),
        'sub_total'     => $this->input->post('sub_total'),
        'sales_price'   => $this->input->post('sales_price'),
        'warrenty'      => $this->input->post('warrenty'),
        'warrenty_days' => $this->input->post('warrenty_days'),
        'barcode_serial'=> $this->input->post('barcode_serial'),
        'create_date'   => time()
    ];

    $serials = $this->input->post('serials');

    $item_id = $this->purchasebatch_model->add_or_update_item($data, $serials);

    echo json_encode([
        'status' => 'success',
        'item_id'=> $item_id,
        'invoice_id' => $invoice_id
    ]);
}


  // DELETE SINGLE SERIAL
public function delete_item_serial(){
    $serial_id = $this->input->post('serial_id');

    if($serial_id){
        $this->purchasebatch_model->delete_serial($serial_id);
    } else {
        // Optionally handle deleting by serial_number + item_id if ID not provided
        $serial_number = $this->input->post('serial_number');
        $item_id = $this->input->post('item_id');
        if($serial_number && $item_id){
            $this->db->where('item_id', $item_id)
                     ->where('serial_number', $serial_number)
                     ->delete('purchase_order_item_serials');
        }
    }

    echo json_encode(['status'=>'success']);
}

// DELETE FULL ITEM
public function delete_item(){
    $item_id = $this->input->post('item_id');
    if(!$item_id){
        echo json_encode(['status'=>'error','message'=>'Item ID missing']);
        return;
    }

    $this->load->model('Purchasebatch_model');
    $this->Purchasebatch_model->delete_item($item_id);

    echo json_encode(['status'=>'success']);
}

   public function update_item()
    {
        if (!$this->input->is_ajax_request()) {
            show_error('No direct script access allowed');
        }

        $item_id      = $this->input->post('item_id');
        $price        = $this->input->post('price');
        $qty          = $this->input->post('qty');
        $total_rebate = $this->input->post('total_rebate');
        $sub_total    = $this->input->post('sub_total');

        if (!$item_id) {
            echo json_encode([
                'status' => 'error',
                'message' => 'Item ID missing'
            ]);
            return;
        }

        $data = [
            'price'        => $price,
            'qty'          => $qty,
            'rebate'       => ($total_rebate > 0 && $qty > 0) 
                                ? round($total_rebate / $qty, 2) 
                                : 0.00,
            'total_rebate' => $total_rebate,
            'sub_total'    => $sub_total,
        ];

        $update = $this->purchasebatch_model->update_item($item_id, $data);

        if ($update) {
            echo json_encode([
                'status' => 'success',
                'message' => 'Item updated successfully'
            ]);
        } else {
            echo json_encode([
                'status' => 'error',
                'message' => 'Update failed'
            ]);
        }
    }
}
