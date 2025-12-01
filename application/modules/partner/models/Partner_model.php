<?php

class Partner_model extends CI_Model {
	
    public function get_current_balance($partner_id)
    {
        return $this->db
                    ->select('current_balance')
                    ->where('id', $partner_id)
                    ->get('business_partner')
                    ->row();
    }

    // Update balance (add new amount)
    public function update_balance($partner_id, $new_balance)
    {
        $this->db->where('id', $partner_id);
        return $this->db->update('business_partner', [
            'current_balance' => $new_balance
        ]);
    }
    
  
}