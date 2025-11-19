<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Reports_model extends CI_Model {

    public function purchaseStatement($from_date, $to_date, $p_group = null)
    {
        $from = strtotime($from_date . " 00:00:00");
        $to   = strtotime($to_date . " 23:59:59");

        $this->db->select("
            p.id,
            p.invoice_no,
            p.purchase_date,
            pd.product_id,
            pd.quanity,
            pd.purchase_price,
            pr.name as product_name,
            pr.unit_id,
            pr.group_id
        ");
        $this->db->from("purchase p");
        $this->db->join("inv_stock_history pd", "pd.purchase_id = p.id", "left");
        $this->db->join("products pr", "pr.id = pd.product_id", "left");

        $this->db->where("p.purchase_date >=", $from);
        $this->db->where("p.purchase_date <=", $to);

        if ($p_group != null && $p_group != 0) {
            $this->db->where("pr.group_id", $p_group);
        }

        $this->db->order_by("p.id", "ASC");

        $result = $this->db->get()->result();

        // ---- Group by GRN / Purchase ID ----
        $data = [];
        foreach ($result as $row) {
            $data[$row->id]['grn_no'] = $row->invoice_no;
            $data[$row->id]['purchase_date'] = $row->purchase_date;

            $data[$row->id]['items'][] = [
                'product_name'  => $row->product_name,
                'qty'           => $row->quanity,
                'price'         => $row->purchase_price,
                'total'         => ($row->purchase_price * $row->quanity)
            ];
        }

        return $data;
    }
}
