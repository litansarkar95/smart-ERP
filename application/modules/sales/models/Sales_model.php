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

    // 1️⃣ total stock
    $this->db->select('SUM(quanity) AS stock_qty');
    $this->db->from('inv_stock_master');
    $this->db->where('organization_id', $organization_id);
    $this->db->where('product_id', $product_id);
    $stock = $this->db->get()->row()->stock_qty;

    // 2️⃣ total sold (exclude current invoice if provided)
    $this->db->select('SUM(qty) AS sold_qty');
    $this->db->from('sales_order_items');
    $this->db->where('organization_id', $organization_id);
    $this->db->where('product_id', $product_id);
    $this->db->where('status', "Pending");
    if($invoice_code) {
        $this->db->where('invoice_id !=', $invoice_code); 
    }
    $sold = $this->db->get()->row()->sold_qty;

    // 3️⃣ available = stock - sold
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
            $this->db->where("purchase_invoice.id",$id); 
        }
		$this->db->select("purchase_invoice.*, staff.first_name ");
        $this->db->from("purchase_invoice");
        $this->db->join('login_credential', "purchase_invoice.create_user = login_credential.id",'left');
        $this->db->join('staff', "login_credential.user_id = staff.id",'left');
        $this->db->where("purchase_invoice.organization_id", $loggedin_org_id);
        $this->db->where("purchase_invoice.status", 'Pending');
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




}