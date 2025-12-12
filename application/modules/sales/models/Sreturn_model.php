<?php

class Sreturn_model extends CI_Model {

   public function get_invoice_by_customer($customer_id)
{
    return $this->db
        ->select('id, invoice_no')
        ->from('sales')
        ->where('customer_id', $customer_id)
        ->order_by('id', 'DESC')
        ->get()
        ->result();
}

public function get_products_by_invoice($invoice_id)
{
    return $this->db
        ->select('products.id, products.name')
        ->from('sales_items')
        ->join('products', 'products.id = sales_items.product_id')
        ->where('sales_items.sales_id', $invoice_id)
        ->order_by('products.name', 'ASC')
        ->get()
        ->result();
}

public function get_serial_by_product($product_id, $invoice_id)
{
    $data = [];

    // ========== 1) COMMON SERIAL (BATCH) ==========
    $batch = $this->db
        ->select("id, batch_number, qty_sold, qty_returned")
        ->from("sales_item_batch_profit_loss")
        ->where("product_id", $product_id)
        ->where("sales_id", $invoice_id)
        ->where("is_returned", 0)
        ->get()
        ->result();

    foreach ($batch as $b) {

        $remaining = $b->qty_sold - $b->qty_returned;

        if ($remaining > 0) {
            $data[] = [
                "value" =>  $b->batch_number,
                "label" => "Batch: " . $b->batch_number . " (Qty: $remaining)"
            ];
        }
    }
     return $data;



   
}

public function get_serial_items_by_product($product_id, $invoice_id, $batch_number)
{
    $data = [];

    // =========================
    // Get all items for this batch
    // =========================
    $batch_items = $this->db
        ->select("sa.id, sa.batch_number, sa.qty_sold, sa.qty_returned, sa.sales_price, sa.serial_type, sa.customer_id, products.name as product_name")
        ->from("sales_item_batch_profit_loss sa")
        ->join("products", "products.id = sa.product_id", "left")
        ->where("sa.batch_number", $batch_number)
        ->where("sa.sales_id", $invoice_id)
        ->where("sa.is_returned", 0)
        ->get()
        ->result();

    // =========================
    // Group by unique vs common
    // =========================
    $grouped = [];

    foreach ($batch_items as $b) {
        $key = $b->serial_type === 'unique' ? $b->product_id . '-' . $b->batch_number : $b->id;

        if (!isset($grouped[$key])) {
            $grouped[$key] = [
                "id" => $b->id,
                "product_id" => $product_id,
                "product_name" => $b->product_name,
                "serial_type" => $b->serial_type,
                "serial" => ($b->serial_type === 'unique') ? $b->batch_number : "",
                "batch_number" => $b->batch_number,
                "sales_price" => $b->sales_price,
                "supplier_id" => $b->customer_id,
                "available_qty" => 0
            ];
        }

        // =========================
        // Add remaining quantity
        // =========================
        $remaining = $b->qty_sold - $b->qty_returned;
        $grouped[$key]['available_qty'] += $remaining;
    }

    // =========================
    // Convert to array of objects
    // =========================
    foreach ($grouped as $item) {
        $data[] = (object)$item;
    }

    return $data;
}


public function get_item_by_serial($serial, $customer_id = null) {
   
    $this->db->select('si.*, p.name as product_name')
             ->from('sales_item_batch_profit_loss si')
             ->join('products p', 'p.id = si.product_id', 'left')  
             ->where('si.batch_number', $serial)  
             ->where('si.is_returned', 0);  

    if ($customer_id) {
        $this->db->where('si.customer_id', $customer_id);  
    }

    $query = $this->db->get();

    if ($query->num_rows() > 0) {
       
        return $query->row();
    } else {
        
            return null;
        }
}

public function get_by_id($id) {
    return $this->db->select('*')
                    ->from('business_partner')
                    ->where('id', $id)
                    ->get()
                    ->row();
}
}