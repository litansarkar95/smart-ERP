<?php

class Dashboard_model extends CI_Model {

    public function get_total_purchase_today() {
        $start_of_day = strtotime('today midnight');
        $end_of_day = strtotime('tomorrow midnight') - 1; 
    
       // $start_of_day = date('Y-m-d H:i:s', $start_of_day);
       // $end_of_day = date('Y-m-d H:i:s', $end_of_day);
    
        // Select the sum of total_amount for today's sales
        $this->db->select_sum('grand_total');
        $this->db->where('purchase_date >=', $start_of_day);
        $this->db->where('purchase_date <=', $end_of_day);
    
        $query = $this->db->get('purchase');
        
        if ($query->num_rows() > 0) {
            return $query->row()->grand_total;
        } else {
            return 0;
        }
    }
    public function get_total_sales_today() {
        $start_of_day = strtotime('today midnight');
        $end_of_day = strtotime('tomorrow midnight') - 1; 
        $this->db->select_sum('grand_total');
        $this->db->where('purchase_date >=', $start_of_day);
        $this->db->where('purchase_date <=', $end_of_day);
    
        $query = $this->db->get('sales');
        
        if ($query->num_rows() > 0) {
            return $query->row()->grand_total;
        } else {
            return 0;
        }
    }
    public function get_total_expense_today() {
        $start_of_day = strtotime('today midnight');
        $end_of_day = strtotime('tomorrow midnight') - 1; 
        $this->db->join('acc_chart_of_accounts', "acc_general_ledger.acc_coa_head_id = acc_chart_of_accounts.id", 'left');
        $this->db->where('acc_chart_of_accounts.root_account_type', "EXPENSE");
        $this->db->select_sum('debit_amount');
        $this->db->where('gl_date >=', $start_of_day);
        $this->db->where('gl_date <=', $end_of_day);
        // Perform the query
        $query = $this->db->get('acc_general_ledger');
        // Check if there are any rows and return the total, or 0 if no results
        if ($query->num_rows() > 0) {
            return $query->row()->debit_amount;
        } else {
            return 0;
        }
    }

    public function get_total_purchase() {
        $this->db->select_sum('grand_total');
        $query = $this->db->get('purchase');
        
        if ($query->num_rows() > 0) {
            return $query->row()->grand_total;
        } else {
            return 0;
        }
    }

    public function get_total_sales() {
        $this->db->select_sum('grand_total');
        $query = $this->db->get('sales');
        
        if ($query->num_rows() > 0) {
            return $query->row()->grand_total;
        } else {
            return 0;
        }
    }
    public function get_total_customer() {
        $this->db->select('COUNT(id) AS total_customers');
        $this->db->where('is_customer', 1);
        $query = $this->db->get('tbl_customers');
        
        if ($query->num_rows() > 0) {
            return $query->row()->total_customers;
        } else {
            return 0;
        }
    }

    public function get_total_expense() {
        $this->db->join('acc_chart_of_accounts', "acc_general_ledger.acc_coa_head_id = acc_chart_of_accounts.id", 'left');
        $this->db->where('acc_chart_of_accounts.root_account_type', "EXPENSE");
        $this->db->select_sum('debit_amount');
        // Perform the query
        $query = $this->db->get('acc_general_ledger');
        // Check if there are any rows and return the total, or 0 if no results
        if ($query->num_rows() > 0) {
            return $query->row()->debit_amount;
        } else {
            return 0;
        }
    }
    
    public function get_total_suppliers() {
        $this->db->select('COUNT(id) AS total_customers');
        $this->db->where('is_supplier', 1);
        $query = $this->db->get('tbl_customers');
        
        if ($query->num_rows() > 0) {
            return $query->row()->total_customers;
        } else {
            return 0;
        }
    }

    public function get_total_staff() {
        $this->db->select('COUNT(id) AS total_customers');
        $query = $this->db->get('staff');
        
        if ($query->num_rows() > 0) {
            return $query->row()->total_customers;
        } else {
            return 0;
        }
    }


    public function get_last_10_purchases() {
        $this->db->select('purchase.*');
        $this->db->from('purchase');
        $this->db->order_by('purchase.id', 'DESC');  
        $this->db->limit(10);  

        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            return $query->result();  
        } else {
            return [];  
        }
    }

    public function get_productwise_profit($start_date, $end_date)
{
    // Start এবং End কে timestamp এ convert করা
    $start_timestamp = strtotime($start_date . " 00:00:00");
    $end_timestamp   = strtotime($end_date . " 23:59:59");

    $this->db->select("
        sales_item_batch_profit_loss.product_id,
        products.name AS product_name,
        SUM(sales_item_batch_profit_loss.qty_sold) AS total_qty,
        SUM(sales_item_batch_profit_loss.qty_sold * sales_item_batch_profit_loss.sales_price) AS total_sales,
        SUM(sales_item_batch_profit_loss.qty_sold * sales_item_batch_profit_loss.purchase_price) AS total_purchase,
        SUM(sales_item_batch_profit_loss.profit_loss) AS total_profit
    ");
    $this->db->from("sales_item_batch_profit_loss");
    $this->db->join("products", "products.id = sales_item_batch_profit_loss.product_id", "left");

    // Filter by sales date
    $this->db->where('sales_item_batch_profit_loss.sales_date >=', $start_timestamp);
    $this->db->where('sales_item_batch_profit_loss.sales_date <=', $end_timestamp);

    // Group by product
    $this->db->group_by("sales_item_batch_profit_loss.product_id");

    $query = $this->db->get();
    return $query->result();
}

}