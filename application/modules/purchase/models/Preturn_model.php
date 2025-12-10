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

public function get_invoice_by_supplier($supplier_id)
{
    return $this->db
        ->select('id, invoice_no')
        ->from('purchase')
        ->where('supplier_id', $supplier_id)
        ->order_by('id', 'DESC')
        ->get()
        ->result();
}
public function get_products_by_invoice($invoice_id)
{
    return $this->db
        ->select('products.id, products.name')
        ->from('purchase_items')
        ->join('products', 'products.id = purchase_items.product_id')
        ->where('purchase_items.purchase_id', $invoice_id)
        ->order_by('products.name', 'ASC')
        ->get()
        ->result();
}
public function get_serial_by_product($product_id, $invoice_id)
{
    $data = [];

    // ========== 1) COMMON SERIAL (BATCH) ==========
    $batch = $this->db
        ->select("id, batch_number, quanity, qty_returned")
        ->from("inv_stock_item_batch")
        ->where("product_id", $product_id)
        ->where("purchase_id", $invoice_id)
        ->where("is_returned", 0)
        ->get()
        ->result();

    foreach ($batch as $b) {

        $remaining = $b->quanity - $b->qty_returned;

        if ($remaining > 0) {
            $data[] = [
                "value" =>  $b->batch_number,
                "label" => "Batch: " . $b->batch_number . " (Qty: $remaining)"
            ];
        }
    }

    // ========== 2) UNIQUE SERIAL ==========
    $unique = $this->db
        ->select("id, serial, quanity, qty_returned")
        ->from("inv_stock_item_serial")
        ->where("product_id", $product_id)
        ->where("purchase_id", $invoice_id)
        ->where("is_returned", 0)
        ->get()
        ->result();

    foreach ($unique as $u) {

        $remaining = $u->quanity - $u->qty_returned;

        if ($remaining > 0) {
            $data[] = [
                "value" =>  $u->serial,
                "label" => "Serial: " . $u->serial
            ];
        }
    }

    return $data;
}
public function get_serial_items_by_product($product_id, $invoice_id,$batch_number)
{
    $data = [];

    // ========== COMMON TYPE (BATCH) ==========
    $batch = $this->db
        ->select("inv_stock_item_batch.id, inv_stock_item_batch.batch_number, quanity, qty_returned, inv_stock_item_batch.purchase_price, supplier_id , products.name as product_name")
        ->from("inv_stock_item_batch")
        ->join('products', 'products.id = inv_stock_item_batch.product_id', 'left')
        ->where("batch_number", $batch_number)
        ->where("purchase_id", $invoice_id)
        ->where("is_returned", 0) 
        ->get()->result();

    foreach ($batch as $b) {
        $remaining = $b->quanity - $b->qty_returned;
        if ($remaining > 0) {
            $data[] = (object)[
                "id" => $b->id,
                "product_id" => $product_id,
                "product_name" =>$b->product_name,
                "serial_type" => "common",
                "serial" => "",
                "batch_number" => $b->batch_number,
                "purchase_price" => $b->purchase_price,
                "supplier_id" => $b->supplier_id,
                "available_qty" => $remaining
            ];
          
        }
    }

    // ========== UNIQUE TYPE ==========
   $unique = $this->db
    ->select("inv_stock_item_serial.id, inv_stock_item_serial.serial, inv_stock_item_serial.quanity, qty_returned, inv_stock_item_serial.purchase_price, supplier_id , products.name as product_name")
    ->from("inv_stock_item_serial")
    ->join('products', 'products.id = inv_stock_item_serial.product_id', 'left')
    ->where("serial", $batch_number)
    ->where("purchase_id", $invoice_id)
    ->where("is_returned", 0) 
    ->get()
    ->result();


    foreach ($unique as $u) {
        $remaining = $u->quanity - $u->qty_returned;
        if ($remaining > 0) {
            $data[] = (object)[
                "id" => $u->id,
                "product_id" => $product_id,
                "product_name" => $u->product_name,
                "serial_type" => "unique",
                "serial" => $u->serial,
                "batch_number" => "",
                "purchase_price" => $u->purchase_price,
                "supplier_id" => $u->supplier_id,
                "available_qty" => $remaining
            ];
        }
    }

    return $data;
}


}