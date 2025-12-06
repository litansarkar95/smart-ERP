<?php

class Salesreturn_model extends CI_Model {

public function get_item_by_serial($serial, $customer_id = null) {
    $this->db->select('s.*, p.name as product_name')
             ->from('sales_item_batch_profit_loss s')
             ->join('products p', 'p.id = s.product_id', 'left')
             ->where('s.batch_number', $serial)
             ->where('s.is_returned', 0); // already returned items skip

    if ($customer_id) {
        $this->db->where('s.customer_id', $customer_id);
    }

    // order by id ASC, যাতে প্রথম available item আসে
    $this->db->order_by('s.id', 'ASC');

    return $this->db->get()->row(); // শুধুমাত্র একটিমাত্র row
}



public function get_by_id($id) {
    return $this->db->select('*')
                    ->from('business_partner')
                    ->where('id', $id)
                    ->get()
                    ->row();
}


    public function get_all() {
        return $this->db->select('id, name, contact_no')
                        ->from('business_partner')
                        ->where('is_active', 1)
                        ->get()
                        ->result(); // সব customer return
    }


}
