<?php

class Preturn_model extends CI_Model {
  

public function get_item_by_serial3($serial, $customer_id = null) {

    $this->db->select('si.*, p.name as product_name')
             ->from('inv_stock_item_serial si')
             ->join('products p', 'p.id = si.product_id', 'left')
             ->where('si.serial', $serial)
             ->where('si.is_available', 1); 

//     if ($customer_id) {
//        // $this->db->where('si.customer_id', $customer_id);
//     }

    $this->db->order_by('si.id', 'ASC');

    return $this->db->get()->row(); 
}


public function get_item_by_serial($serial, $supplier_id = null) {
   
    $this->db->select('si.*, p.name as product_name, si.serial, si.warrenty, si.warrenty_days')
             ->from('inv_stock_item_serial si')
             ->join('products p', 'p.id = si.product_id', 'left')  
             ->where('si.serial', $serial)  
             ->where('si.is_available', 1);  

    if ($supplier_id) {
        $this->db->where('si.supplier_id', $supplier_id);  
    }

    $query = $this->db->get();

    if ($query->num_rows() > 0) {
       
        return $query->row();
    } else {
        $this->db->select('sb.*, p.name as product_name, sb.batch_number, sb.purchase_price, sb.sales_price')
                 ->from('inv_stock_item_batch sb')
                 ->join('products p', 'p.id = sb.product_id', 'left')  // batch_number এর জন্য product এর নাম
                 ->where('sb.batch_number', $serial);  // batch_number দিয়ে ফিল্টার করা
                 
        if ($supplier_id) {
           // $this->db->where('sb.supplier_id', $supplier_id);  // যদি customer_id থাকে
        }

        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            return $query->row();
        } else {
        
            return null;
        }
    }
}


public function get_by_id($id) {
    return $this->db->select('*')
                    ->from('business_partner')
                    ->where('id', $id)
                    ->get()
                    ->row();
}

 public function number_generator() {
        
  
		$this->db->select_max('code_random');      
		$this->db->from('purchase_return');
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




  public function getPurchaseReturnList($id=NULL) {
         $loggedin_org_id = $this->session->userdata("loggedin_org_id");
        if($id){
            $this->db->where("purchase_return.id",$id); 
        }
		$this->db->select("purchase_return.*,  business_partner.name customer_name,  business_partner.contact_no mobile_no");
        $this->db->from("purchase_return");
        $this->db->join('business_partner', "purchase_return.supplier_id = business_partner.id",'left');
        $this->db->where("purchase_return.organization_id", $loggedin_org_id);
        $this->db->order_by("id", "DESC");
        return $this->db->get()->result();
    }

 public function PurchasReturnItemDetailsList($id) {
        $loggedin_org_id = $this->session->userdata("loggedin_org_id");
       
        $this->db->select("purchase_return_items.* , products.name title , unit.name unit");
        $this->db->from("purchase_return_items");
        $this->db->join('products', "purchase_return_items.product_id = products.id",'left');
        $this->db->join('unit', "products.unit_id = unit.id",'left');
      //  $this->db->where("purchase_return_items.organization_id", $loggedin_org_id);
        $this->db->where("purchase_return_items.purchase_return_id",$id);
        $this->db->order_by("id", "DESC");
        return $this->db->get()->result();
    }


}