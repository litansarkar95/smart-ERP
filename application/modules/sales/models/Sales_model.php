<?php

class Sales_model extends CI_Model {

      public function get_products_by_group($group_id) {
         $loggedin_org_id = $this->session->userdata("loggedin_org_id");
        // Query the database
        $this->db->select('*');
        $this->db->from('products');
        $this->db->where("products.organization_id", $loggedin_org_id);
        $this->db->where('group_id', $group_id);
        $this->db->where('is_inventory', 1);
        $query = $this->db->get();

        return $query->result(); 
    }



    public function get_all_products_with_available_stock()
    {
        $this->db->select("
            p.id,
            p.name AS product_name,
            g.name AS group_name,

            -- Total stock in
            IFNULL( (SELECT SUM(quanity) 
                     FROM inv_stock_master 
                     WHERE product_id = p.id AND is_active = 1), 0 ) AS stock_in,

            -- Pending Sales
            IFNULL( (SELECT SUM(qty) 
                     FROM sales_order_items 
                     WHERE product_id = p.id AND status = 'Pending'), 0 ) AS pending_sales,

            -- Sales Price (latest stock record)
            IFNULL( (SELECT sales_price 
                     FROM inv_stock_master 
                     WHERE product_id = p.id 
                     ORDER BY id DESC 
                     LIMIT 1), 0 ) AS sales_price,

            -- Final Available Stock
            (
                IFNULL( (SELECT SUM(quanity) 
                         FROM inv_stock_master 
                         WHERE product_id = p.id AND is_active = 1), 0 )
                -
                IFNULL( (SELECT SUM(qty) 
                         FROM sales_order_items 
                         WHERE product_id = p.id AND status = 'Pending'), 0 )
            ) AS available_stock
        ");

        $this->db->from('products p');
        $this->db->join('products_groups g', 'g.id = p.group_id', 'left');
        $this->db->order_by('p.name', 'ASC');

        return $this->db->get()->result();
    }


   

 public function getCustomer() {
    $loggedin_org_id = $this->session->userdata("loggedin_org_id");
    
    $this->db->select('*');
    $this->db->from('business_partner');
    $this->db->where("business_partner.organization_id", $loggedin_org_id);
    
    // Use grouping for OR condition
    $this->db->group_start()
             ->where('business_partner.partner_type', 'Customer')
             ->or_where('business_partner.partner_type', 'Both')
             ->group_end();
    
    $query = $this->db->get();
    return $query->result();
}
public function number_generator() {
        
  
		$this->db->select_max('code_random');      
		$this->db->from('sales');
		$query = $this->db->get();
		$result =  $query->result_array();
		$invoice_no = $result[0]['code_random'];
		if ($invoice_no != '') {
			$invoice_no = $invoice_no + 1;
		} else {
			$invoice_no = 1;
		}
		return $invoice_no;
		 }

       public function get_product_by_id($product_id) {
        $this->db->select('purchase_price, sales_price, serial_type, warrenty ,warrenty_days');
        $this->db->from('products');
        $this->db->where('id', $product_id);
        $query = $this->db->get();

        return $query->row();  // Return the product as an object
    }
    public function get_last_purchase_info($product_id)
{
    $this->db->select("price, barcode_serial");
    $this->db->from("purchase_items");
    $this->db->where("product_id", $product_id);
    $this->db->order_by("id", "DESC");  // Latest record
    $this->db->limit(1);

    $query = $this->db->get();

    return $query->row(); // return object or null
}

public function get_total_quantity($product_id, $invoice_code = null) 
{
    $organization_id = $this->session->userdata("loggedin_org_id");

   
    $this->db->select('SUM(quanity) AS stock_qty');
    $this->db->from('inv_stock_master');
    $this->db->where('organization_id', $organization_id);
    $this->db->where('product_id', $product_id);
    $stock = $this->db->get()->row()->stock_qty;

    $this->db->select('SUM(qty) AS sold_qty');
    $this->db->from('sales_order_items');
    $this->db->where('organization_id', $organization_id);
    $this->db->where('product_id', $product_id);
    $this->db->where('status', "Pending");
    if($invoice_code) {
        $this->db->where('invoice_id !=', $invoice_code); 
    }
    $sold = $this->db->get()->row()->sold_qty;


    $available = ($stock ? $stock : 0) - ($sold ? $sold : 0);

    return $available > 0 ? $available : 0;
}


    public function getSalesList($id=NULL) {
         $loggedin_org_id = $this->session->userdata("loggedin_org_id");
        if($id){
            $this->db->where("sales.id",$id); 
        }
		$this->db->select("sales.*, warehouse.name warehouse , business_partner.name partner");
        $this->db->from("sales");
        $this->db->join('business_partner', "sales.customer_id = business_partner.id",'left');
        $this->db->join('warehouse', "sales.store_id = warehouse.id",'left');
        $this->db->where("sales.organization_id", $loggedin_org_id);
        $this->db->order_by("id", "DESC");
        return $this->db->get()->result();
    }


    public function SalesItemDetailsList($id) {
        $loggedin_org_id = $this->session->userdata("loggedin_org_id");
       
		$this->db->select("sales_items.* , products.name title , unit.name unit");
        $this->db->from("sales_items");
        $this->db->join('products', "sales_items.product_id = products.id",'left');
        $this->db->join('unit', "products.unit_id = unit.id",'left');
        $this->db->where("sales_items.organization_id", $loggedin_org_id);
        $this->db->where("sales_items.sales_id",$id);
        $this->db->order_by("id", "DESC");
        return $this->db->get()->result();
    }

      public function SalesItemBatch($id) {
        $loggedin_org_id = $this->session->userdata("loggedin_org_id");
       
		$this->db->select("sales_item_batch_profit_loss.* ");
        $this->db->from("sales_item_batch_profit_loss");
        $this->db->where("sales_item_batch_profit_loss.organization_id", $loggedin_org_id);
        $this->db->where("sales_item_batch_profit_loss.sales_item_id",$id);
        $this->db->order_by("id", "DESC");
        return $this->db->get()->result();
    }

      public function getOrderList($id=NULL) {
         $loggedin_org_id = $this->session->userdata("loggedin_org_id");
        if($id){
            $this->db->where("sales_invoice.id",$id); 
        }
		$this->db->select("sales_invoice.*, staff.first_name ");
        $this->db->from("sales_invoice");
        $this->db->join('login_credential', "sales_invoice.create_user = login_credential.id",'left');
        $this->db->join('staff', "login_credential.user_id = staff.id",'left');
        $this->db->where("sales_invoice.organization_id", $loggedin_org_id);
        $this->db->where("sales_invoice.status", 'Pending');
        $this->db->order_by("id", "DESC");
        return $this->db->get()->result();
    }

       public function get_stock_products($store_id ,$product_id) {
         $loggedin_org_id     = $this->session->userdata("loggedin_org_id");
         $branch_id           = $this->session->userdata("loggedin_branch_id");
        
		$this->db->select("inv_stock_master.*");
        $this->db->from("inv_stock_master");
        $this->db->where("inv_stock_master.organization_id", $loggedin_org_id);
        $this->db->where("inv_stock_master.branch_id", $branch_id);
        $this->db->where("inv_stock_master.store_id", $store_id);
        $this->db->where("inv_stock_master.product_id", $product_id);
        $this->db->order_by("id", "DESC");
        return $this->db->get()->result();
    }
    
public function get_items_by_invoice($invoice_id)
{
  

    if ($invoice_id) {
        $this->db->select('sales_order_items.*');
        $this->db->from('sales_order_items');
         $this->db->where('sales_order_items.invoice_id', $invoice_id);

        $query = $this->db->get();
        return $query->result();
    } else {
        return NULL;
    }
}

public function get_items_by_stock($invoice_id)
{


    if ($invoice_id) {
        $this->db->select('purchase_items.*');
        $this->db->from('purchase_items');
        $this->db->where('purchase_items.invoice_id', $invoice_id);

        $query = $this->db->get();
        return $query->result();
    } else {
        return NULL;
    }
}


public function get_stock_previous_products($store_id, $product_id)
{
    $this->db->select('id, organization_id, branch_id, store_id, product_id, purchase_price, rebate, sales_price, quanity, is_active, create_user, create_date, update_user, update_date');
    $this->db->from('inv_stock_master');
    $this->db->where('store_id', $store_id);
    $this->db->where('product_id', $product_id);
    $this->db->order_by('create_date', 'DESC'); 
    $this->db->limit(1); 

    $query = $this->db->get();

    if ($query->num_rows() > 0) {
        return $query->row();  
    }

    return null;  
}


//update
 public function get_current_balance($supplier_id) {
        $this->db->select('current_balance');
        $this->db->where('id', $supplier_id);  
        $query = $this->db->get('business_partner'); 
        
        if ($query->num_rows() > 0) {
            return $query->row()->current_balance; 
        } else {
            return 0; 
        }
    }

    public function update_current_balance($supplier_id, $dueAmount) {
        $current_balance = $this->get_current_balance($supplier_id);
        $new_balance = $current_balance - $dueAmount;

        $this->db->where('id', $supplier_id); 
        $this->db->update('business_partner', ['current_balance' => $new_balance]); 
        return $this->db->affected_rows() > 0;
    }

public function find_product_by_serial($serial,$invoice_id)
{
    // SERIAL খুঁজে বের করা
    $this->db->select("
        inv_stock_item_serial.id as serial_id,
        inv_stock_item_serial.product_id,
        inv_stock_item_serial.serial,
        inv_stock_item_serial.serial_type,
        inv_stock_item_serial.purchase_price,
        inv_stock_item_serial.sales_price,
        inv_stock_item_serial.warrenty,
        inv_stock_item_serial.warrenty_days,
        products.name product_name
    ");

    $this->db->from("inv_stock_item_serial");
    $this->db->join("products", "products.id = inv_stock_item_serial.product_id", "left");

    $this->db->where("inv_stock_item_serial.serial", $serial);
    $this->db->where("inv_stock_item_serial.is_available", 1); // Only available serial

    $query = $this->db->get();
    $row = $query->row();

    // যদি serial না পাওয়া যায়
    if (!$row) {
        return false;
    }

    // এখন এই Product এর মোট স্টক বের করব
    $stock = $this->db
                 ->select("COUNT(id) AS total_stock")
                 ->from("inv_stock_item_serial")
                 ->where("product_id", $row->product_id)
                 ->where("is_available", 1)
                 ->get()
                 ->row()
                 ->total_stock;


                 //insert
        $this->db->insert('sales_order_items', [
            'organization_id' => $this->session->userdata('loggedin_org_id'),
            'invoice_id'      => $invoice_id,
            'product_id'      => $row->product_id,
            // 'serial_type'     => $serial_type,
            // 'purchase_price'  => $purchase_price,
            // 'price'           => $price,
            // 'qty'             => $qty,
            // 'sub_total'       => $price * $qty,
            // 'net_total'       => $price * $qty,
            // 'warrenty'        => $stock_master->warrenty,
            // 'warrenty_days'   => $stock_master->warrenty_days,
            "create_user"     => $this->session->userdata('loggedin_id'),
            "create_date"     => strtotime($date)
        ]);

        $item_id = $this->db->insert_id();

    // RESPONSE READY
    return [
        "item_id"       => $row->serial_id,
        "product_id"    => $row->product_id,
        "product_name"  => $row->product_name,
        "serial"        => $row->serial,
        "serial_type"   => $row->serial_type,   // unique / common
        "price"         => $row->sales_price,
        "purchase_price"=> $row->purchase_price,
        "warrenty"      => $row->warrenty,
        "warrenty_days" => $row->warrenty_days,
        "stockQty"      => $stock
    ];
}

public function get_last_5_orders($customer_id)
    {
        $this->db->select('id, invoice_no');
        $this->db->from('sales');
        $this->db->where('customer_id', $customer_id);
        $this->db->order_by('id', 'DESC');
        $this->db->limit(5);

        return $this->db->get()->result();
    }
   public function getSalesOrderList($id) {
         $loggedin_org_id = $this->session->userdata("loggedin_org_id");
        
		$this->db->select("sales_invoice.*,  business_partner.name partner , business_partner.contact_no mobile_no , business_partner.address address");
        $this->db->from("sales_invoice");
        $this->db->join('business_partner', "sales_invoice.customer_id = business_partner.id",'left');
        $this->db->where("sales_invoice.invoice_code",$id);
        $this->db->where("sales_invoice.organization_id", $loggedin_org_id);
        $this->db->order_by("id", "DESC");
        return $this->db->get()->result();
    }
     public function SalesOrderItemDetailsList($id) {
        $loggedin_org_id = $this->session->userdata("loggedin_org_id");
       
		$this->db->select("sales_order_items.* , products.name title ,products.serial_type , unit.name unit");
        $this->db->from("sales_order_items");
        $this->db->join('products', "sales_order_items.product_id = products.id",'left');
        $this->db->join('unit', "products.unit_id = unit.id",'left');
       // $this->db->where("purchase_order_items.organization_id", $loggedin_org_id);
        $this->db->where("sales_order_items.invoice_id",$id);
        $this->db->order_by("id", "DESC");
        return $this->db->get()->result();
    }

        public function SaleseOrderItemBatch($id) {
       
		$this->db->select("sales_order_item_serials.* ");
        $this->db->from("sales_order_item_serials");
        $this->db->where("sales_order_item_serials.item_id",$id);
        $this->db->order_by("id", "DESC");
        return $this->db->get()->result();
    }

    public function getInvoice($id)
{
    return $this->db
        ->select("
            pi.*, 
            s.name AS supplier_name,
            s.contact_no AS supplier_mobile,
            s.address AS supplier_address
        ")
        ->from("sales_invoice pi")
        ->join("business_partner s", "s.id = pi.customer_id", "left")
        ->where("pi.invoice_code", $id)
        ->get()
        ->row();
}
    public function getOrderItemList($invoice_id)
{
    return $this->db->select("pi.*, p.name product_name, u.name unit_name")
            ->from("sales_order_items pi")
            ->join("products p", "p.id = pi.product_id", "left")
            ->join("unit u", "u.id = p.unit_id", "left")
            ->where("pi.invoice_id", $invoice_id)
            ->order_by("pi.id", "ASC")
            ->get()
            ->result();
}
}