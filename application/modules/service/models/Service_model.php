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
public function get_warranty_info_by_serial($serial)
{
    return $this->db
        ->select('
            pis.serial_number,
            p.id   AS purchase_id,
            p.supplier_id   AS supplier_id,
            pi.invoice_code,
            p.purchase_date   AS purchase_ts,
            pi.warrenty,
            pi.warrenty_days,
            pi.purchase_price,
            p.invoice_no,
            bp.name          AS supplier_name
        ')
        ->from('purchase_item_serials pis')
        ->join('purchase_items pi', 'pi.id = pis.item_id')
        ->join('purchase p', 'p.id = pi.purchase_id')
        ->join('business_partner bp', 'bp.id = p.supplier_id')
        ->where('pis.serial_number', $serial)
        ->limit(1)
        ->get()
        ->row();
}


public function get_warranty_sales_info_by_serial($serial)
{
    $query = $this->db
        ->select('
            sis.batch_number,
            sis.sales_price,
            s.id              AS sales_id,
            s.customer_id     AS customer_id,
            s.sales_date      AS sales_ts,
            si.warrenty,
            si.warrenty_days,
            s.invoice_no,
            bp.name           AS customer_name
        ')
        ->from('sales_item_batch_profit_loss sis')
        ->join('sales_items si', 'si.id = sis.sales_item_id')
        ->join('sales s', 's.id = si.sales_id')
        ->join('business_partner bp', 'bp.id = sis.customer_id')
        ->where('sis.batch_number', $serial)
        ->where('sis.is_returned', 0)
        ->limit(1)
        ->get();

    return ($query->num_rows() > 0) ? $query->row() : false;
}

public function get_warranty_product_info_by_serial($serial)
{
    $query = $this->db
        ->select('sis.product_id,
            sis.serial,
            p.name      
        ')
        ->from('inv_stock_item_serial sis')
        ->join('products p', 'p.id = sis.product_id')
        ->where('sis.serial', $serial)
        ->limit(1)
        ->get();

    return ($query->num_rows() > 0) ? $query->row() : false;
}

public function get_service_warranty($invoice_id)
{
    $branch_id = $this->session->userdata("loggedin_branch_id");

    return $this->db
        ->select('
            sw.*,
            p.name as product_name,
            p.product_code,
            bp.name as customer_name,
            bp.contact_no,
            bp.address
        ')
        ->from('service_warranty sw')
        ->join('inv_stock_item_serial iss', 'sw.serial = iss.serial', 'left')
        ->join('products p', 'p.id = iss.product_id', 'left')
        ->join('business_partner bp', 'bp.id = sw.customer_id', 'left')
        ->where('sw.id', $invoice_id)
        ->where('sw.branch_id', $branch_id)
        ->get()
        ->row(); // single row
}


public function get_service_warranty_order_with_product($invoice_id)
{
    $branch_id = $this->session->userdata("loggedin_branch_id");

    return $this->db
        ->select('
            so.*,
            sc.name as problem_name
        ')
        ->from('service_warranty_order so')
        ->join('service_categories sc', 'so.service_categories_id = sc.id', 'left')
        ->where('so.service_warranty_id', $invoice_id)
        ->where('so.branch_id', $branch_id)
        ->get()
        ->result();
}


  public function ServiceWarranty($id = NULL)
{
    $loggedin_org_id = $this->session->userdata("loggedin_org_id");

    if ($id) {
        $this->db->where("sw.id", $id);
    }

    $this->db->select("
        sw.*,
        customer.name AS customer,
        supplier.name AS supplier,
        products.name AS product_name
    ");

    $this->db->from("service_warranty sw");

    // Customer join
    $this->db->join(
        "business_partner customer",
        "sw.customer_id = customer.id",
        "left"
    );

    // Supplier join
    $this->db->join(
        "business_partner supplier",
        "sw.supplier_id = supplier.id",
        "left"
    );
     $this->db->join(
        "products",
        "sw.product_id = products.id",
        "left"
    );

    

    $this->db->where("sw.organization_id", $loggedin_org_id);
    $this->db->order_by("sw.id", "DESC");

    return $this->db->get()->result();
}
public function updateServiceStatus($id, $data)
{
    $this->db->where('id', $id);
    return $this->db->update('service_warranty', $data);
}


 
       public function serviceAttributes($id=NULL) {
         $loggedin_org_id     = $this->session->userdata("loggedin_org_id");
         $branch_id           = $this->session->userdata("loggedin_branch_id");
         if($id){
             $this->db->where("service_attributes.id", $id);
         }
        
		$this->db->select("service_attributes.* ,service_name.name service_name");
        $this->db->from("service_attributes");
        $this->db->where("service_attributes.organization_id", $loggedin_org_id);
        $this->db->where("service_attributes.branch_id", $branch_id);
        $this->db->join("service_name", "service_name.id = service_attributes.service_name_id", "left");
        $this->db->order_by("id", "DESC");
        return $this->db->get()->result();
    }

}