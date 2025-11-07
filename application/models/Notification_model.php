<?php
// application/models/Notification_model.php
class Notification_model extends CI_Model {

    public function get_latest() {
        $this->db->select('customer_order.*, customers.name as customer_name, customers.contact_no as customer_phone');
        $this->db->from('customer_order');
        $this->db->join('customers', 'customers.id = customer_order.customer_id', 'left');
        $this->db->order_by('customer_order.create_date', 'DESC');
        $this->db->limit(10);
        $this->db->where('is_read', 0);
        $query = $this->db->get();
        $results = $query->result();
    
        // add dynamic URL for each order
        foreach ($results as &$row) {
            $row->url = base_url('notification/mark_as_read/' . $row->id);
        }
    
        return $results;
    }
    
    
    
    public function get_unread_count() {
        $this->db->where('is_read', 0);
        return $this->db->count_all_results('customer_order');
    }
    public function mark_as_read($id) {
        $this->db->where('id', $id);
        $this->db->update('customer_order', ['is_read' => 1]);
    }
    
}
