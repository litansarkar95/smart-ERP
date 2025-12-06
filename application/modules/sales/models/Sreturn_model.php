<?php

class Sreturn_model extends CI_Model {

public function get_products_by_customer($customer_id) {
    $this->db->select('p.id, p.name, SUM(si.qty - si.returned_qty) as qty');
    $this->db->from('sales_items si');
    $this->db->join('sales s', 's.id = si.sales_id');
    $this->db->join('products p', 'p.id = si.product_id');
    $this->db->where('s.customer_id', $customer_id);
    $this->db->group_by('si.product_id');
    $query = $this->db->get();
    return $query->result();
}



    public function get_serial_numbers_by_product($product_id, $customer_id) {
    $this->db->select('sib.batch_number, sib.serial_type, SUM(si.qty - si.returned_qty)  as qty_sold');
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



    public function getSalesReturnList($id=NULL) {
         $loggedin_org_id = $this->session->userdata("loggedin_org_id");
        if($id){
            $this->db->where("sales_return.id",$id); 
        }
		$this->db->select("sales_return.*,  business_partner.name customer_name,  business_partner.contact_no mobile_no");
        $this->db->from("sales_return");
        $this->db->join('business_partner', "sales_return.customer_id = business_partner.id",'left');
        $this->db->where("sales_return.organization_id", $loggedin_org_id);
        $this->db->order_by("id", "DESC");
        return $this->db->get()->result();
    }
}
