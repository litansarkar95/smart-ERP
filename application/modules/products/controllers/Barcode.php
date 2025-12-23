<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once APPPATH.'../vendor/autoload.php'; // Composer autoload

use Picqer\Barcode\BarcodeGeneratorPNG;
class Barcode extends MX_Controller
{

  public function __construct() {
    parent::__construct();
    $this->load->model("sales/sales_model");
      
 
}

  public function gen($code = '')
    {
        if (!$code) return;

        $generator = new BarcodeGeneratorPNG();

        header('Content-Type: image/png');
        echo $generator->getBarcode($code, $generator::TYPE_CODE_128);
    }
public function index()
{
 
    $data = array();
    $data['active'] = "products/brands";
    $data['title'] = "Products Barcode"; 
    $data['allPdt']       = $this->main_model->getRecordsByOrg("brands");
    $data['allPro']         = $this->sales_model->get_all_products_with_available_stock();
    $data['content'] = $this->load->view("barcode/barcode-create", $data, TRUE);
    $this->load->view('layout/master', $data);
 }

public function get_product_stock()
{
    $product_id = $this->input->post('product_id');
    $product = $this->db->get_where('products', ['id'=>$product_id])->row();

    if ($product->serial_type === 'unique') {
        $items = $this->db
            ->where('product_id', $product_id)
            ->where('is_available', 1)
            ->get('inv_stock_item_serial')
            ->result();
    } else {
        $items = $this->db
            ->where('product_id', $product_id)
            ->where('is_available', 1)
            ->get('inv_stock_item_batch')
            ->result();
    }

    echo json_encode(['items' => $items]);
}

public function print_barcode()
{
    $product_id  = $this->input->post('product_id');
    $print_qty   = (int)$this->input->post('print_qty');
    $show_price  = $this->input->post('show_price'); // checkbox
    $paper_size  = $this->input->post('paper_size');

    $product = $this->db->get_where('products',['id'=>$product_id])->row();

    if (!$product) {
        show_error("Product not found!");
        return;
    }

    $barcodes = [];

    if ($product->serial_type === 'unique') {
        // সব available serial load
        $codes = $this->db
            ->select('serial')
            ->from('inv_stock_item_serial')
            ->where('product_id', $product_id)
            ->where('is_available', 1)
            ->get()
            ->result_array();
        $codes = array_column($codes, 'serial');

        foreach($codes as $code) {
            $barcodes[] = [
                'code'  => $product->product_code . '-' . $code,
                'name'  => $product->name,
                'price' => $product->sales_price
            ];
        }

    } else {
        // Common = same barcode repeated print_qty times
        for ($i=0; $i<$print_qty; $i++) {
            $barcodes[] = [
                'code'  => $product->product_code,
                'name'  => $product->name,
                'price' => $product->sales_price
            ];
        }
    }

    $data['barcodes']    = $barcodes;
    $data['show_price']  = $show_price;
    $data['paper_size']  = $paper_size;

    $this->load->view('barcode/print', $data);
}




}