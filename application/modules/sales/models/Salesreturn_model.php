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

 public function number_generator() {
        
  
		$this->db->select_max('code_random');      
		$this->db->from('sales_return');
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
