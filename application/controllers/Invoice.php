<?php
defined('BASEPATH') OR exit('No direct script access allowed');

// Full namespace সহ ব্যবহার করবো
class Invoice extends CI_Controller {

    public function view($invoice_id = 'INV-1001') {
        // Error debugging ON (development mode)
         error_reporting(E_ALL);
        ini_set('display_errors', 1);

        // Barcode লাইব্রেরি include করো
        require_once(APPPATH . 'third_party/barcode/src/BarcodeGenerator.php');
        require_once(APPPATH . 'third_party/barcode/src/BarcodeGeneratorPNG.php');

        // Barcode generator object তৈরি
        $generator = new \Picqer\Barcode\BarcodeGeneratorPNG();

        // Barcode তৈরি (TYPE_CODE_128 ব্যবহার করবো)
        $barcode = $generator->getBarcode($invoice_id, \Picqer\Barcode\BarcodeGenerator::TYPE_CODE_128);

        // Base64 encode করে view তে পাঠানো
        $data['barcode_image'] = 'data:image/png;base64,' . base64_encode($barcode);
        $data['invoice_id'] = $invoice_id;

        // View লোড করা
        $this->load->view('invoice_view', $data);
    }
}
