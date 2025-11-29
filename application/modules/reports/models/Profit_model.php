<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Profit_model extends CI_Model {

 public function get_profit_by_date($start, $end)
{
    $this->db->select("SUM(profit_loss) AS total_profit");
    $this->db->from("sales_item_batch_profit_loss");
    $this->db->where("DATE(FROM_UNIXTIME(create_date)) >=", $start);
    $this->db->where("DATE(FROM_UNIXTIME(create_date)) <=", $end);
    return $this->db->get()->row()->total_profit ?? 0;
}

public function get_productwise_profit($start, $end)
{

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


// Query
$this->db->where('sales_item_batch_profit_loss.sales_date >=', $start_timestamp);
$this->db->where('sales_item_batch_profit_loss.sales_date <=', $end_timestamp);
$this->db->group_by("sales_item_batch_profit_loss.product_id");
$query = $this->db->get();
return $query->result();

}




    // ইনভয়েস অনুযায়ী profit/loss
    public function get_profit_by_invoice($sales_id) {
        $this->db->select('SUM(profit_loss) as total_profit');
        $this->db->where('sales_id', $sales_id);
        return $this->db->get('sales_item_batch_profit_loss')->row();
    }

  
}
