<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Ledger_model extends CI_Model {
   public function get_general_ledger($conditions)
    {
        $this->db->select('*');
        $this->db->from('acc_general_ledger');
        $this->db->where($conditions);
        $this->db->order_by('date', 'ASC'); // important for running balance
        return $this->db->get()->result();
    }

    // Sum total debit
    public function sum_debit($conditions)
    {
        $this->db->select_sum('debit');
        $this->db->from('acc_general_ledger');
        $this->db->where($conditions);
        $row = $this->db->get()->row();

        return $row->debit ?? 0;
    }

    // Sum total credit
    public function sum_credit($conditions)
    {
        $this->db->select_sum('credit');
        $this->db->from('acc_general_ledger');
        $this->db->where($conditions);
        $row = $this->db->get()->row();

        return $row->credit ?? 0;
    }

  public function get_partner($partner_id)
    {
        return $this->db
            ->where('id', $partner_id)
            ->get('business_partner')
            ->row();
    }

    // Get all active partners (for dropdown)
    public function get_all_active_partners()
    {
        return $this->db
            ->where('is_active', 1)
            ->order_by('name', 'ASC')
            ->get('business_partner')
            ->result();
    }
}