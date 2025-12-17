<?php

class Service_model extends CI_Model {

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
        ->where("serial_type", "unique")
        ->get()
        ->result();

    foreach ($batch as $b) {

        $remaining = $b->qty_sold - $b->qty_returned;

        if ($remaining > 0) {
            $data[] = [
                "value" =>  $b->batch_number,
                "label" => $b->batch_number 
            ];
        }
    }
     return $data;



   
}

}