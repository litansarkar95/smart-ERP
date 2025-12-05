<?php

class Sreturn_model extends CI_Model {

 public function get_products_by_customer($customer_id) {
        $this->db->select('p.id, p.name, SUM(si.qty) as qty');
        $this->db->from('sales_items si');
        $this->db->join('sales s', 's.id = si.sales_id');
        $this->db->join('products p', 'p.id = si.product_id');
        $this->db->where('s.customer_id', $customer_id); // Only this customer
        $this->db->where('si.is_returned', 0); // Exclude returned items
        $this->db->group_by('si.product_id');
        $query = $this->db->get();
        return $query->result();
    }

    // Fetch serial numbers (barcodes) for a selected product bought by that customer
    // public function get_serial_numbers_by_product($product_id, $customer_id) {
    //     $this->db->select('sib.batch_number, sib.serial_type');
    //     $this->db->from('sales_item_batch_profit_loss sib');
    //     $this->db->join('sales_items si', 'si.id = sib.sales_item_id');
    //     $this->db->join('sales s', 's.id = si.sales_id');
    //     $this->db->where('si.product_id', $product_id);
    //     $this->db->where('s.customer_id', $customer_id); // Only this customer's purchase
    //     $this->db->where('si.is_returned', 0); // Exclude returned items
    //     $query = $this->db->get();
    //     return $query->result();
    // }

    public function get_serial_numbers_by_product($product_id, $customer_id) {
    $this->db->select('sib.batch_number, sib.serial_type, sib.qty_sold');
    $this->db->from('sales_item_batch_profit_loss sib');
    $this->db->join('sales_items si', 'si.id = sib.sales_item_id');
    $this->db->join('sales s', 's.id = si.sales_id');
    $this->db->where('si.product_id', $product_id);
    $this->db->where('s.customer_id', $customer_id);
    $this->db->where('si.is_returned', 0);
    $query = $this->db->get();
    return $query->result();
}
 public function insert_return($master, $items) {
        $this->db->trans_start();

        $this->db->insert('sales_return', $master);
        $return_id = $this->db->insert_id();

        foreach($items as $item) {
            $item['sales_return_id'] = $return_id;
            $this->db->insert('sales_return_items', $item);
        }

        $this->db->trans_complete();

        return $this->db->trans_status() ? $return_id : false;
    }
}
