<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Partyledger extends MX_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Profit_model');
    }

    public function index()
{
 
    $data = array();
    $data['active']    = "Partyledger";
    $data['title'] = "Party Ledger"; 
    $data['allPro']         = $this->main_model->getRecordsByOrg("business_partner");
    $data['content'] = $this->load->view("party/party-ledger-new", $data, TRUE);
    $this->load->view('layout/master', $data);
 }
public function view()
{
    // Form validation
    $this->form_validation->set_rules('p_from', 'From Date', 'required');
    $this->form_validation->set_rules('p_to', 'To Date', 'required');
    $this->form_validation->set_rules('party_id', 'Party Name', 'required');

    if ($this->form_validation->run() == FALSE) {
        // Validation failed, reload form
        $this->load->view('partyledger_form');
    } else {
        // Validation passed
        $p_from = $this->input->post('p_from');
        $p_to = $this->input->post('p_to');
        $party_id = $this->input->post('party_id');
        $report_type = $this->input->post('report_type');
            // Convert to MySQL DATE format
            $from_date = date('Y-m-d', strtotime(str_replace('/', '-', $p_from)));
            $to_date   = date('Y-m-d', strtotime(str_replace('/', '-', $p_to)));
            // Prepare the query
        $this->load->model('Ledger_model');
   $party = $this->Ledger_model->get_partner($party_id);

$conditions = [
    'party_id' => $party_id,
    'date >=' => $from_date,
    'date <=' => $to_date
];

$data['party'] = $party;
$data['ledger'] = $this->Ledger_model->get_general_ledger($conditions);
$data['total_debit'] = $this->Ledger_model->sum_debit($conditions);
$data['total_credit'] = $this->Ledger_model->sum_credit($conditions);
$data['opening_balance'] = $party->opening_balance;
$data['opening_type'] = $party->opening_balance_type;
$data['from_date'] = $p_from;
$data['to_date'] = $p_to;

//print_r($data);exit();
        // Generate report based on the report_type
        if ($report_type == 'pdf') {
            // Load PDF library and generate the PDF
           // $this->load->library('pdf');
           // $pdf_content = $this->load->view('party/partyledger_pdf', ['data' => $data], TRUE);
            //$this->pdf->generate($pdf_content);
           // $data['party'] = $this->Ledger_model->get_partner($party_id);


$html = $this->load->view('party/partyledger_pdf', $data);
//$this->pdf->create($html);

           //  $this->load->view('party/partyledger_pdf', ['data' => $data]);
        } elseif ($report_type == 'excel') {
            // Load Excel library and generate the Excel
            $this->load->library('excel');
            $this->excel->generate_excel($data);
        }
    }
}


}