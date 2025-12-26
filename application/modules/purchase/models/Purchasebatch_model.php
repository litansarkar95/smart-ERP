<?php


class Purchasebatch_model extends CI_Model {

     public function insert_invoice($data){
        $this->db->insert('purchase_invoice', $data);
        return $this->db->insert_id();
    }

    public function insert_item($data, $serials = []){
        $this->db->insert('purchase_order_items', $data);
        $item_id = $this->db->insert_id();

        if(!empty($serials)){
            foreach($serials as $s){
                $this->db->insert('purchase_order_item_serials', [
                    'item_id'       => $item_id,
                    'serial_number' => $s
                ]);
            }
        }

        return $item_id;
    }
public function add_or_update_item($data, $serials = []) {
    // ================================
    // Check existing item
    // ================================
    $this->db->where('invoice_id', $data['invoice_id']);
    $this->db->where('product_id', $data['product_id']);
    $this->db->where('serial_type', $data['serial_type']);
    $this->db->where('price', $data['price']); // একই পণ্যের different price আলাদা row
    if($data['serial_type'] == 'common') {
        $this->db->where('barcode_serial', $data['barcode_serial']);
    }

    $existing = $this->db->get('purchase_order_items')->row();

    if($existing){
        // Update existing item
        $updateData = [
            'qty' => $data['qty'],
            'total_rebate' => $this->input->post('totalRebate'),
            'sub_total' => $data['sub_total'],
            'sales_price' => $data['sales_price'],
            'warrenty' => $data['warrenty'],
            'warrenty_days' => $data['warrenty_days'],
        ];
        $this->db->where('id', $existing->id)->update('purchase_order_items', $updateData);

        $item_id = $existing->id;

        // For unique serial, append serials
        if(!empty($serials) && $data['serial_type'] == 'unique'){
            foreach($serials as $s){
                $this->db->insert('purchase_order_item_serials', [
                    'item_id' => $item_id,
                    'serial_number' => $s
                ]);
            }
        }

        return $item_id;

    } else {
        // Insert new item
        $this->db->insert('purchase_order_items', $data);
        $item_id = $this->db->insert_id();

        if(!empty($serials)){
            foreach($serials as $s){
                $this->db->insert('purchase_order_item_serials', [
                    'item_id' => $item_id,
                    'serial_number' => $s
                ]);
            }
        }

        return $item_id;
    }
}


    public function delete_serial($serial_id){
        $this->db->where('id',$serial_id)
                 ->delete('purchase_order_item_serials');
    }

public function delete_item($item_id){
    // Delete serials first
    $this->db->where('item_id', $item_id)
             ->delete('purchase_order_item_serials');

    // Delete item
    $this->db->where('id', $item_id)
             ->delete('purchase_order_items');
}

    public function update_item($item_id, $data)
    {
        $this->db->where('id', $item_id);
        return $this->db->update('purchase_order_items', $data);
    }
}
