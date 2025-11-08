<?php
class Purchase extends MX_Controller
{
  public function __construct() {
    parent::__construct();
       $this->load->model("purchase_model");
 
}
public function index()
{
 
    $data = array();
    $data['active']    = "purchase";
    $data['title'] = "Purchase List"; 
    $data['allPdt']       = $this->purchase_model->getPurchaseList();
    $data['content'] = $this->load->view("purchase-list", $data, TRUE);
    $this->load->view('layout/master', $data);
 }
 
 public function create()
{

  $this->form_validation->set_rules("totalAmount", "Total Amount", "required");
  $this->form_validation->set_rules("purchase_date", "Purchase date", "required");
  $this->form_validation->set_rules("supplier_id", "Supplier", "required");

  if ($this->form_validation->run() == NULL) {
  
  } else {

    echo $totalAmount = $this->common_model->xss_clean($this->input->post("totalAmount"));

    $int_no = $this->purchase_model->number_generator();
  	$invoice_no = 'GRN-'.str_pad($int_no,4,"0",STR_PAD_LEFT);
    
    $date = date("Y-m-d H:i:s");
    $data = array(   
        "organization_id"            => $this->session->userdata('loggedin_org_id'),
        "branch_id"                  => $this->session->userdata('loggedin_branch_id'), 
        "invoice_code"               => $this->common_model->xss_clean($this->input->post("invoice_id")),  
        "code_random"                => $int_no,   
        "invoice_no"                 => $invoice_no,   
        "purchase_date"              => strtotime($this->common_model->xss_clean($this->input->post("purchase_date"))),   
        "supplier_id"                => $this->common_model->xss_clean($this->input->post("supplier_id")),   
        "store_id"                   => $this->common_model->xss_clean($this->input->post("store_id")),   
        "totalQty"                   => $this->common_model->xss_clean($this->input->post("totalOrderAmount")),   
        "totalAmount"                => $this->common_model->xss_clean($this->input->post("totalAmount")),   
        "paidAmount"                 => $this->common_model->xss_clean($this->input->post("paidAmount")),   
        "dueAmount"                  => $this->common_model->xss_clean($this->input->post("dueAmount")),  
        "is_active"                  => 1,
        "create_user"                => $this->session->userdata('loggedin_id'),
        "create_date"                => strtotime($date),
       
    );

     

   
    if ($this->common_model->save_data("purchase", $data)) {
      $id = $this->common_model->Id;

        $this->session->set_flashdata('success', 'Record has been successfully saved.');
      }else{
        
   $this->session->set_flashdata('error', 'An error occurred. Please try again.');
      }
    
   redirect(base_url() . "purchase/create");
  }

    $data = array();
    $data['active']         = "purchase";
    $data['title']          = "Create Purchase "; 
    $data['allUnit']        = $this->common_model->view_data("unit", array("is_active" => 1), "name", "ASC");;
    $data['allBrand']       = $this->main_model->getRecordsByOrg("brands");
    $data['allCat']         = $this->main_model->getRecordsByOrg("products_groups");
    $data['allInv']         = $this->main_model->getRecordsByOrg("warehouse");
    $data['allPro']         = $this->main_model->getRecordsByOrg("products");
    $data['allSuplier']     = $this->purchase_model->getSuplier();
    // inv 
    $int_no = $this->purchase_model->number_generator();
  	$invoice_no = 'GRN-'.str_pad($int_no,4,"0",STR_PAD_LEFT);
    $data['invoice_no'] = $invoice_no; 
    $data['content']        = $this->load->view("purchase-create", $data, TRUE);
    $this->load->view('layout/master', $data);
}

public function delete($id) {
    $dt = $this->common_model->view_data("products", array("id" => $id), "id", "asc");

    if ($dt) {
        if (!empty($dt->picture) && file_exists("./public/images/products/" . $dt->picture)) {
            unlink("./public/images/products/" . $dt->picture); 
        }

        $this->common_model->delete_data("products", array("id" => $id));

        $this->session->set_flashdata('success', 'Record has been deleted.');
    } else {
        $this->session->set_flashdata('error', 'An error occurred. Please try again.');
    }

    redirect(base_url() . "products", "refresh");
}


public function update(){

  $id=$this->input->post("id");
  $selPdt=$this->common_model->view_data("products_groups",array("id"=>$id),"id","desc");
 
  $data = array(
    "name"                       => $this->common_model->xss_clean($this->input->post("ename")),   
    "is_active"                  => $this->common_model->xss_clean($this->input->post("is_active")),
                  
      );

      
      if ($this->common_model->update_data("products_groups", $data,array("id"=>$id),$id)) {
          $this->session->set_flashdata('success', 'Your changes have been successfully updated.');
      }
      else{
        $this->session->set_flashdata('error', 'An error occurred. Please try again.');
      }
      $this->session->set_userdata($sdata);
      redirect(base_url() . "products/groups", "refresh");
}

 public function get_products_by_group() {
        $group_id = $this->input->post('group_id');
        
        if ($group_id) {
            // Fetch products by group_id
            $products = $this->purchase_model->get_products_by_group($group_id);

            // Prepare options for product select
            $options = '<option value="">Select</option>';
            foreach ($products as $product) {
                $options .= "<option value='{$product->id}'>{$product->name}</option>";
            }

            echo $options;
        }
    }


    public function get_product_details() {
        $product_id = $this->input->post('product_id');
        
        if ($product_id) {
            // Fetch product details from database
            $product = $this->purchase_model->get_product_by_id($product_id);
            
            if ($product) {
                // Return product details as JSON
                echo json_encode([
                    'price' => $product->purchase_price,  // Example: Purchase Price
                    'sales_price' => $product->sales_price,
                    'serial_type' => $product->serial_type,
                    'warrenty' => $product->warrenty
                ]);
            } else {
                echo json_encode([]);
            }
        }
    }


// Controller: Purchase.php
public function add_item_ajax()
{
    $product_id = $this->input->post('product_id');
    $invoice_id = $this->input->post('invoice_id');
    $price      = $this->input->post('price');
    $qty        = $this->input->post('qty');
    $sub_total  = $this->input->post('sub_total');
    $warrenty  = $this->input->post('warrenty');
    $serial_number = $this->input->post('serial_number');

    if(!$product_id || !$invoice_id){
        echo json_encode(['status' => 'error', 'msg' => 'Missing invoice or product']);
        return;
    }

    // start invoice

      $is_invoice = $this->db->get_where('purchase_invoice', [
        'invoice_code' => $invoice_id,
    ])->row();

    if(!$is_invoice){
         $this->db->insert('purchase_invoice', [
            'organization_id' =>$this->session->userdata('loggedin_org_id'),
            'invoice_code' => $invoice_id,
        ]);
        $item_id = $this->db->insert_id();

    }

    // end invoice 

    // check if product already exists for this invoice
    $existing = $this->db->get_where('purchase_items', [
        'invoice_id' => $invoice_id,
        'product_id' => $product_id
    ])->row();

    // get product name and unit name
    $this->db->select('p.name as product_name, u.name as unit_name , p.serial_type');
    $this->db->from('products p');
    $this->db->join('unit u', 'u.id = p.unit_id', 'left');
    $this->db->where('p.id', $product_id);
    $product = $this->db->get()->row();

    $unit_name = $product->unit_name ?? '';
    $serial_type = $product->serial_type ?? '';

    if($existing){
        $new_qty = $existing->qty + $qty;
        $new_subtotal = $existing->sub_total + $sub_total;

        $new_serials = trim($existing->serial_number);
        if($new_serials != '' && $serial_number != ''){
            $new_serials .= ',' . $serial_number;
        } else if($serial_number != ''){
            $new_serials = $serial_number;
        }

        $this->db->where('id', $existing->id);
        $this->db->update('purchase_items', [
            'qty' => $new_qty,
            'sub_total' => $new_subtotal,
            'serial_number' => $new_serials
        ]);

        $item_id = $existing->id;
    } else {
        $this->db->insert('purchase_items', [
            'invoice_id' => $invoice_id,
            'serial_type' => $serial_type,
            'product_id' => $product_id,
            'price' => $price,
            'qty' => $qty,
            'sub_total' => $sub_total,
            'warrenty' => $warrenty,
            'serial_number' => $serial_number
        ]);
        $item_id = $this->db->insert_id();
    }

    echo json_encode([
        'status' => 'success',
        'item' => [
            'id' => $item_id,
            'product_name' => $product->product_name,
            'qty' => $existing ? $new_qty : $qty,
            'price' => $price,
            'sub_total' => $existing ? $new_subtotal : $sub_total,
            'warrenty' => $warrenty,
            'serial_number' => $existing ? $new_serials : $serial_number,
            'unit_name' => $unit_name
        ]
    ]);
}


// Controller: Purchase.php
public function delete_item_ajax()
{
    $item_id = $this->input->post('item_id');

    if(!$item_id){
        echo json_encode(['status'=>'error','msg'=>'Missing item ID']);
        return;
    }

    $this->db->where('id', $item_id);
    $deleted = $this->db->delete('purchase_items');

    if($deleted){
        echo json_encode(['status'=>'success']);
    } else {
        echo json_encode(['status'=>'error','msg'=>'Failed to delete']);
    }
}


}
