<?php
class Purchase extends MX_Controller
{
  public function __construct() {
    parent::__construct();
       $this->load->model("purchase_model");
 
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

    //table list
    #####
    #purchase , purchase_invoice, purchase_order_items,purchase_order_item_serials
    #inv_stock_master ,inv_stock_item_serial, inv_stock_history,
    #acc_general_ledger,business_partner
    #

   $invoice_code   = $this->common_model->xss_clean($this->input->post("invoice_id"));
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
                    "invoice_code"       => $this->common_model->xss_clean($this->input->post("invoice_id")),  
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

public function delete($id) {
    $dt = $this->common_model->view_data("products", array("id" => $id), "id", "asc");

    if ($dt) {
        if (!empty($dt->picture) && file_exists("./public/images/products/" . $dt->picture)) {
            unlink("./public/images/products/" . $dt->picture); 
        }

        $this->common_model->delete_data("products", array("id" => $id));

        $this->session->set_flashdata('success', 'Record has been deleted.');
    } else {
        $this->session->set_flashdata('error', 'An error occurred. Please try again.');
    }

    redirect(base_url() . "products", "refresh");
}


public function update(){

  $id=$this->input->post("id");
  $selPdt=$this->common_model->view_data("products_groups",array("id"=>$id),"id","desc");
 
  $data = array(
    "name"                       => $this->common_model->xss_clean($this->input->post("ename")),   
    "is_active"                  => $this->common_model->xss_clean($this->input->post("is_active")),
                  
      );

      
      if ($this->common_model->update_data("products_groups", $data,array("id"=>$id),$id)) {
          $this->session->set_flashdata('success', 'Your changes have been successfully updated.');
      }
      else{
        $this->session->set_flashdata('error', 'An error occurred. Please try again.');
      }
      $this->session->set_userdata($sdata);
      redirect(base_url() . "products/groups", "refresh");
}

 public function get_products_by_group() {
        $group_id = $this->input->post('group_id');
        
        if ($group_id) {
            // Fetch products by group_id
            $products = $this->purchase_model->get_products_by_group($group_id);

            // Prepare options for product select
            $options = '<option value="">Select</option>';
            foreach ($products as $product) {
                $options .= "<option value='{$product->id}'>{$product->name}</option>";
            }

            echo $options;
        }
    }


    public function get_product_details() {
        $product_id = $this->input->post('product_id');
        
        if ($product_id) {
            // Fetch product details from database
            $product = $this->purchase_model->get_product_by_id($product_id);


             // Latest purchase info
            $last_purchase = $this->purchase_model->get_last_purchase_info($product_id);
            
            if ($product) {
                // Return product details as JSON
                echo json_encode([
                    'price' => $product->purchase_price,  // Example: Purchase Price
                    'sales_price'   => $product->sales_price,
                    'serial_type'   => $product->serial_type,
                    'warrenty'      => $product->warrenty,
                    'warrenty_days' => $product->warrenty_days,

                    // Extra fields for common type
                    'last_price'     => $last_purchase->price ?? 0,
                    'barcode_serial' => $last_purchase->barcode_serial ?? '',
                ]);
            } else {
                echo json_encode([]);
            }
        }
    }
public function add_item_ajax()
{
    $product_id      = $this->input->post('product_id');
    $invoice_id      = $this->input->post('invoice_id');
    $supplier_id     = $this->input->post('supplier_id');
    $qty             = $this->input->post('qty') ?: 0;
    $price           = $this->input->post('price') ?: 0;
    $rebate          = $this->input->post('rebate') ?: 0;
    $serial_numbers  = $this->input->post('serial_number') ?: '';
    $barcode_serial  = $this->input->post('barcode_serial') ?: '';
    $sales_price     = $this->input->post('sales_price') ?: 0;
    $warrenty        = $this->input->post('warrenty') ?: 0;
    $warrenty_days   = $this->input->post('warrenty_days') ?: '';

    if(!$product_id || !$invoice_id){
        echo json_encode(['status' => 'error', 'msg' => 'Missing invoice or product']);
        return;
    }

    // Load product info
    $this->db->select('p.name as product_name, u.name as unit_name, p.serial_type');
    $this->db->from('products p');
    $this->db->join('unit u', 'u.id = p.unit_id', 'left');
    $this->db->where('p.id', $product_id);
    $product = $this->db->get()->row();

    $serial_type = $product->serial_type ?? 'common';
    $unit_name = $product->unit_name ?? '';

    // ======================
    // 1. SERIAL DUPLICATE CHECK (BEFORE ITEM UPDATE)
    // ======================

    if($serial_type == 'unique' && !empty($serial_numbers)){

        $serial_array = explode(',', $serial_numbers);

        foreach($serial_array as $s){
            $s = trim($s);
            if($s == '') continue;

            $exists = $this->db->get_where('purchase_order_item_serials', [
                'serial_number' => $s
            ])->row();

            if($exists){
                echo json_encode([
                    'status' => 'error',
                    'msg' => "Duplicate Serial Found: $s"
                ]);
                return; // 🚫 Stop everything (NO item update)
            }
        }
    }

    // start invoice

    $is_invoice = $this->db->get_where('purchase_invoice', [
        'invoice_code' => $invoice_id,
    ])->row();
  
    if(!$is_invoice){
          $date = date("Y-m-d H:i:s");
         $this->db->insert('purchase_invoice', [
            'organization_id'            =>$this->session->userdata('loggedin_org_id'),
            "branch_id"                  => $this->session->userdata('loggedin_branch_id'),
            'invoice_code'               => $invoice_id,
            'supplier_id'                => $supplier_id,
            'create_user'                => $this->session->userdata('loggedin_id'),
            'create_date'                => strtotime($date)]);
            $item_id = $this->db->insert_id();

    }

    // ======================
    // 2. ITEM INSERT / UPDATE
    // ======================

    $existing_item = $this->db->get_where('purchase_order_items', [
        'invoice_id' => $invoice_id,
        'product_id' => $product_id
    ])->row();

    $date = date("Y-m-d H:i:s");

    if($existing_item){

        $new_qty = $existing_item->qty + $qty;

        $total_rebate = $existing_item->rebate * $new_qty;
        $sub_total = ($price * $new_qty) - $total_rebate;

        $this->db->where('id', $existing_item->id)->update('purchase_order_items', [
            'price' => $price,
            'qty' => $new_qty,
            'total_rebate' => $total_rebate,
            'sub_total' => $sub_total,
            'sales_price' => $sales_price,
            'warrenty' => $warrenty,
            'warrenty_days' => $warrenty_days,
            'barcode_serial' => $barcode_serial
        ]);

        $item_id = $existing_item->id;

    } else {

        $total_rebate = $rebate * $qty;
        $sub_total = ($price * $qty) - $total_rebate;

        $this->db->insert('purchase_order_items', [
            'invoice_id'    => $invoice_id,
            'product_id'    => $product_id,
            'serial_type'   => $serial_type,
            'price'         => $price,
            'qty'           => $qty,
            'rebate'        => $rebate,
            'total_rebate'  => $total_rebate,
            'sub_total'     => $sub_total,
            'sales_price'   => $sales_price,
            'warrenty'      => $warrenty,
            'warrenty_days' => $warrenty_days,
            'barcode_serial'=> $barcode_serial,
            'create_date'   => strtotime($date)
        ]);

        $item_id = $this->db->insert_id();
    }

    // ======================
    // 3. SERIAL INSERT (SAFE NOW)
    // ======================

    if($serial_type == 'unique' && !empty($serial_numbers)){

        $serial_array = explode(',', $serial_numbers);

        foreach($serial_array as $serial){
            $serial = trim($serial);
            if($serial == '') continue;

            $this->db->insert('purchase_order_item_serials', [
                'item_id' => $item_id,
                'serial_number' => $serial
            ]);
        }

        // Update qty from serial count
        $new_qty = $this->db->where('item_id', $item_id)->count_all_results('purchase_order_item_serials');
        $this->db->where('id', $item_id)->update('purchase_order_items', ['qty' => $new_qty]);
    }

    // ======================
    // 4. FINAL OUTPUT
    // ======================

    $item = $this->db->get_where('purchase_order_items', ['id' => $item_id])->row();

    if($serial_type == 'unique'){
        $serial_list = $this->db->select('serial_number')->where('item_id', $item_id)->get('purchase_order_item_serials')->result_array();
        $serial_str = implode(',', array_column($serial_list, 'serial_number'));
    } else {
        $serial_str = $barcode_serial;
    }

    echo json_encode([
        'status' => 'success',
        'item' => [
            'id' => $item->id,
            'serial_type' => $item->serial_type,
            'product_name' => $product->product_name,
            'qty' => $item->qty,
            'price' => $item->price,
            'sub_total' => $item->sub_total,
            'total_rebate' => $item->total_rebate ,
            'warrenty' => $item->warrenty,
            'warrenty_days' => $item->warrenty_days,
            'serial_number' => $serial_str,
            'unit_name' => $unit_name
        ]
    ]);
}


// Controller: Purchase.php
public function delete_item_ajax()
{
    $item_id = $this->input->post('item_id');

    if(!$item_id){
        echo json_encode(['status'=>'error','msg'=>'Missing item ID']);
        return;
    }

    $this->db->where('id', $item_id);
    $deleted = $this->db->delete('purchase_order_items');

    if($deleted){
        echo json_encode(['status'=>'success']);
    } else {
        echo json_encode(['status'=>'error','msg'=>'Failed to delete']);
    }
}

public function get_supplier_balance()
{
    $supplier_id = $this->input->post('supplier_id');
    $balance = 0;

    if ($supplier_id) {
        $supplier = $this->db->get_where('business_partner', ['id' => $supplier_id])->row();
        if ($supplier) {
            $balance = $supplier->current_balance;
        }
    }

    echo json_encode(['balance' => $balance]);
}


// Fetch serials for an item
public function get_item_serials() {
    $item_id = $this->input->get('item_id');
    $serials = $this->db->select('id, serial_number')
                        ->where('item_id', $item_id)
                        ->get('purchase_order_item_serials')
                        ->result_array();
    echo json_encode(['status'=>'success','serials'=>$serials]);
}

// Delete a serial
public function delete_item_serial() {
    $serial_id = $this->input->post('serial_id');
    $item_id = $this->input->post('item_id');

    // delete serial
    $this->db->where('id', $serial_id)->delete('purchase_order_item_serials');

    // recalc qty
    $new_qty = $this->db->where('item_id', $item_id)
                        ->from('purchase_order_item_serials')
                        ->count_all_results();

    // update purchase_order_items table
    $item = $this->db->get_where('purchase_order_items', ['id'=>$item_id])->row();
    $price = $item->price;
    $total_rebate = $item->total_rebate;

    $new_total_rebate = $item->rebate * $new_qty;
    $new_sub_total = max(0, ($price * $new_qty) - $item->rebate);

    $this->db->where('id', $item_id)->update('purchase_order_items', [
        'qty' => $new_qty,
        'sub_total' => $new_sub_total
    ]);

    // 🔥 NEW: get updated serial list
    $serial_list = $this->db->select('serial_number')
                            ->where('item_id', $item_id)
                            ->get('purchase_order_item_serials')
                            ->result_array();

    $serial_string = implode(',', array_column($serial_list, 'serial_number'));

    // return full updated info
     echo json_encode([
    'status' => 'success',
    'item' => [
        'id' => $item_id,
        'qty' => $new_qty,
        'sub_total' => $new_sub_total,
        'total_rebate' => $new_total_rebate,   
        'serial_number' => $serial_string       
    ]
]);


}


public function get_serials()
{
    $item_id = $this->input->post('item_id');

    echo json_encode([
        'success' => true
    ]);
}

public function update_item()
{
    $item_id = $this->input->post('item_id');
    $qty = $this->input->post('qty');
    $price = $this->input->post('price');
    $rebate = $this->input->post('rebate');
    $serial_number = $this->input->post('batch');



    $data = [
        'qty' => $qty,
        'price' => $price,
        'total_rebate' => $rebate,
        'barcode_serial' => $serial_number,
    ];

    $this->db->where('id', $item_id);
    $this->db->update('purchase_order_items', $data);

    echo json_encode(['success' => true]);
}


public function invoice($id)
{
 
    $data = array();
    $data['active']       = "order";
    $data['title']        = "Order List"; 
    $data['allPdt']       = $this->purchase_model->getPurchaseList($id);
    $data['allDets']      = $this->purchase_model->PurchaseItemDetailsList($id);
  // echo "<pre>"; print_r($data['allPdt']);exit();
    $this->load->view('invoice', $data);
 }
public function get_customer_info()
{
    $id = $this->input->post('id');
    $customer = $this->db->where('id', $id)->get('business_partner')->row();

    echo json_encode($customer);
}
}
