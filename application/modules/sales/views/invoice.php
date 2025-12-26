<!DOCTYPE html>
<html lang="bn">
<head>
<meta charset="UTF-8">
<title>Master IT Solution</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<style>
    @page { size: A4; margin: 12mm; }

    body{
        font-family: 'Inter', sans-serif;
        margin:0;
        padding:0;
        background:#f2f4f7;
        color:#222;
    }

    .invoice-page{
        background:#fff;
        width:210mm;
        min-height:297mm;
        margin:0 auto;
        padding:18mm 18mm 48mm 18mm; /* extra bottom for footer */
        box-sizing:border-box;
        position:relative;
        border-radius:4px;
        box-shadow:0 0 10px rgba(0,0,0,0.12);
    }

    .print-btn{
        display:block;
        margin:18px auto;
        padding:10px 24px;
        background:#111;
        color:#fff;
        border:none;
        border-radius:6px;
        cursor:pointer;
        font-size:15px;
    }

    .header-title{
        text-align:center;
        font-size:32px;
        font-weight:700;
        margin-bottom:4px;
        letter-spacing:1px;
    }

    .sub-header{
        text-align:center;
        color:#444;
        font-size:13.5px;
        line-height:1.3;
        margin-bottom:18px;
    }

    /* info rows */
    .info-row{
        display:flex;
        justify-content:space-between;
        gap:12px;
        margin-bottom:6px;
        font-size:13.5px;
    }
    .info-left, .info-right{ display:flex; gap:8px; align-items:center; }
    .label { font-weight:600; min-width:86px; display:inline-block; }

    /* table */
    table{
        width:100%;
        border-collapse:collapse;
        margin-top:12px;
        font-size:13.5px;
    }
    th{
        background:#e9eef5;
        border:1px solid #bfc9d6;
        padding:9px 8px;
        text-align:center;
        font-weight:600;
    }
    td{
        border:1px solid #c9d3df;
        padding:8px;
        vertical-align:top;
        font-size:13.5px;
    }

    /* after table: layout with narration left + summary right */
    .after-table{
        display:flex;
        justify-content:space-between;
        gap:18px;
        margin-top:12px;
        align-items:flex-start;
    }

    .narration{
        flex:1;
        border-top:1px dashed #ccc;
        padding-top:10px;
        font-size:13.5px;
        line-height:1.6;
    }

    .summary-box{
        width:320px;
        background:#f9fbff;
        border:1px solid #e1e8f2;
        padding:12px;
        border-radius:6px;
        box-shadow:0 1px 0 rgba(0,0,0,0.02);
        font-size:13.5px;
    }

    .summary-row{
        display:flex;
        justify-content:space-between;
        padding:6px 0;
        border-bottom:1px dashed #e6ecf6;
        align-items:center;
    }

    .summary-row:last-child{ border-bottom:none; }

    .summary-row .label { font-weight:600; color:#333; min-width:120px; }
    .summary-row .value { font-weight:600; min-width:80px; text-align:right; }

    .summary-row.small .label, .summary-row.small .value { font-weight:500; font-size:13px; color:#444; }
    .summary-row.total .label, .summary-row.total .value { font-size:15px; font-weight:700; color:#111; }

    .summary-row.current-due {
        background: linear-gradient(90deg, rgba(255,250,230,0.8), rgba(255,255,255,0));
        border-radius:4px;
        padding:8px;
        margin-top:6px;
    }

    /* footer area */
    .footer-area{
        position:absolute;
        left:18mm;
        right:18mm;
        bottom:15mm;
    }
    .signatures{
        display:flex;
        justify-content:space-between;
        margin-top:12px;
        font-size:13px;
    }
    .sign-box{ width:45%; text-align:center; }
    .sign-box hr{ border:none; border-top:1px solid #444; margin-bottom:6px; }

    .footer-note{ text-align:center; font-size:12px; color:#444; margin-top:10px; line-height:1.4; }
    .contact-info{ text-align:center; font-size:12.5px; font-weight:600; margin-top:8px; }

    @media print{
        body{ background:none; }
        .print-btn{ display:none; }
        .invoice-page{ box-shadow:none; border-radius:0; margin:0; padding-bottom:50mm; }
    }
    .nav-btn{
    display:inline-flex;
    align-items:center;
    gap:6px;
    margin:14px auto 6px;
    padding:9px 20px;
    background:linear-gradient(135deg,#1f2937,#111827);
    color:#fff;
    text-decoration:none;
    border-radius:6px;
    font-size:14px;
    font-weight:500;
    transition:all .2s ease;
    box-shadow:0 3px 6px rgba(0,0,0,0.18);
    width:fit-content;
}

.nav-btn:hover{
    background:linear-gradient(135deg,#111827,#000);
    transform:translateY(-1px);
}

@media print{
    .nav-btn{ display:none; }
}

.action-bar{
    display:flex;
    justify-content:center;
    align-items:center;
    gap:12px;
    margin:18px auto 10px;
    flex-wrap:wrap;
}

.print-btn{
    padding:9px 20px;
    background:#111;
    color:#fff;
    border:none;
    border-radius:6px;
    cursor:pointer;
    font-size:14px;
    font-weight:500;
}

.print-btn:hover{
    background:#000;
}

@media print{
    .action-bar{ display:none; }
}

</style>
</head>
<body>

<div class="action-bar">
    <a href="<?= base_url('sales/create') ?>" class="nav-btn back-purchase">
        ← Back to Sales
    </a>

    <button class="print-btn" onclick="window.print()">
        🖨 Print
    </button>

    <a href="<?= base_url('dashboard') ?>" class="nav-btn back-dashboard">
        ⌂ Dashboard
    </a>
</div>

<div class="invoice-page">
<?php
if(isset($allPdt)){
    foreach($allPdt as $pdt){
        $branch_id =  $pdt->branch_id;
        $branch = $this->main_model->get_branch_by_id($branch_id);

?>
    <div class="header-title"> <?= !empty($branch->name) ? $branch->name : '' ?></div>
    <div class="sub-header">
         <?php if(!empty($branch->address)): ?>
        <?= $branch->address ?>
    <?php endif; ?><br>
        Contact: <?= !empty($branch->mobile_no) ? $branch->mobile_no : '' ?><br>
        E-mail: <?= !empty($branch->email) ? $branch->email : '' ?>
    </div>

    <!-- Info -->
    <div class="info-row">
        <div class="info-left">
            <span class="label">Customer:</span>
            <span><?php echo $pdt->customer_name; ?></span>
        </div>
        <div class="info-right">
            <span class="label">Invoice No:</span>
            <span><?php echo $pdt->invoice_no; ?></span>
        </div>
    </div>

    <div class="info-row">
        <div class="info-left">
            <span class="label">Address:</span>
            <span><?php echo $pdt->address; ?></span>
        </div>
        <div class="info-right">
            <span class="label">Ref No:</span>
            <span>—</span>
        </div>
    </div>

    <div class="info-row">
        <div class="info-left">
            <span class="label">Mobile:</span>
            <span><?php echo $pdt->mobile_no; ?></span>
        </div>
        <div class="info-right">
            <span class="label">Sold By:</span>
            <span>Leton</span>
        </div>
    </div>

    <div class="info-row">
        <div class="info-left">
            <span class="label">Date & Time:</span>
            <span><?php    echo $formatted_date = date("d/m/Y — g:i A");     ?>
        </span>
        </div>
        <div></div>
    </div>

    <!-- Table -->
    <table>
        <thead>
            <tr>
                <th style="width:5%;">SL</th>
                <th style="width:53%;">Product Description</th>
                <th style="width:12%;">Warranty</th>
                <th style="width:6%;">Qty</th>
                <th style="width:12%;">Unit Price</th>
                <th style="width:12%;">Amount</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $i = 1;
            if(isset($allDets)){
                foreach($allDets as $details){

            ?>
            <tr>
                <td style="text-align:center;"><?= $i++ ?></td>
                <td>
                    <?php echo $details->title; ?><br>
                         <?php
                 if($details->serial_type == 'unique'){
                    ?>
                    <strong>S/N:</strong>

                 <?php
               
                $allbatch = $this->sales_model->SalesItemBatch($details->id);

                $batch_numbers = [];

                if (!empty($allbatch)) {
                    foreach ($allbatch as $batch) {
                        $batch_numbers[] = $batch->batch_number;
                    }

                    echo implode(", ", $batch_numbers);  // Output: 25070130064, 25070130082, ...
                }
            }else{

            }
                ?>

                </td>
                <td style="text-align:center;"><?php if($details->warrenty > 0 ){ echo $details->warrenty." ".$details->warrenty_days; }?></td>
                <td style="text-align:center;"><?php echo $details->qty; ?></td>
                <td style="text-align:right;"><?php echo $details->price; ?></td>
                <td style="text-align:right;"><?php echo $details->sub_total; ?></td>
            </tr>
            <?php
    }
}
            ?>
        </tbody>
    </table>

    <!-- Narration + Summary -->
    <div class="after-table">

        <div class="narration">
            <strong>Narration:</strong> WARRANTY SWITCH = 1 PCS<br>
            <strong>In Words:</strong> <br>
            <br>
            <strong>Note:</strong> পণ্যের স্থিতি ও ওয়ারেন্টি শর্ত কোম্পানির নিয়ম অনুযায়ী কার্যকর হবে।
        </div>

        <div class="summary-box" aria-hidden="false">
            <div class="summary-row small">
                <div class="label">Total Qty</div>
                <div class="value"><?php echo $pdt->totalQty; ?></div>
            </div>

            <div class="summary-row small">
                <div class="label">Total Amount</div>
                <div class="value"><?php echo $pdt->subTotal; ?></div>
            </div>

            <div class="summary-row small">
                <div class="label">Less Discount</div>
                <div class="value"><?php echo $pdt->total_discount; ?></div>
            </div>

            <!-- <div class="summary-row small">
                <div class="label">Add VAT</div>
                <div class="value">0.00</div>
            </div> -->

            <div class="summary-row total">
                <div class="label">Net Payable</div>
                <div class="value"><?php echo $pdt->payableAmount; ?></div>
            </div>

            <div class="summary-row small">
                <div class="label">Previous Due</div>
                <div class="value">0</div>
            </div>

            <div class="summary-row small">
                <div class="label">Received Amount</div>
                <div class="value"><?php echo $pdt->paidAmount; ?></div>
            </div>

            <div class="summary-row current-due total">
                <div class="label">Current Due</div>
                <div class="value">0</div>
            </div>
        </div>

    </div>

    <!-- Footer Area -->
    <div class="footer-area">
        <div class="signatures">
            <div class="sign-box">
                <hr>
                Customer Signature
            </div>
            <div class="sign-box">
                <hr>
                Authorised Signature
            </div>
        </div>

        <div class="footer-note">
            টাকা ইস্যু, মন অর্ডারফর্ম গ্রাহকের ও ওয়্যারান্টি সংক্রান্ত কোন প্রকার ক্লেইম গ্রহণযোগ্য হবে না।
        </div>

        <div class="contact-info">
            Warranty & Support: 01706995884 |
            Sales: 01896199042, 01706995886, 01706995883 |
            Complain: 01894821850
        </div>
    </div>
<?php
}
}
?>
</div>
</body>
</html>
