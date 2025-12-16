<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Money Receipt</title>

<style>
@page { size:A4; margin:12mm; }

body{
    font-family:Arial, sans-serif;
    color:#222;
}

/* Print Button */
.print-btn{
    text-align:center;
    margin:10px 0;
}
.print-btn button{
    padding:8px 20px;
    font-size:14px;
    cursor:pointer;
}

/* Hide button when printing */
@media print{
    .print-btn{
        display:none;
    }
}

.wrapper{
    width:210mm;
    margin:auto;
}

/* Company Header */
.company-header{
    text-align:center;
    border-bottom:2px solid #000;
    padding-bottom:8px;
    margin-bottom:10px;
}
.company-header h1{
    margin:0;
    font-size:22px;
}
.company-header p{
    margin:2px 0;
    font-size:14px;
}

.header{
    text-align:center;
}
.header h2{
    margin:5px 0 0 0;
}

.info-table, .pay-table{
    width:100%;
    border-collapse:collapse;
    margin-top:12px;
}

.info-table td{
    padding:6px;
    font-size:14px;
}

.pay-table th, .pay-table td{
    border:1px solid #444;
    padding:8px;
    font-size:14px;
}

.pay-table th{
    background:#f1f1f1;
}

.summary{
    width:40%;
    float:right;
    margin-top:12px;
}

.summary td{
    padding:6px;
    font-size:14px;
}

.footer{
    margin-top:80px;
    display:flex;
    justify-content:space-between;
}

.sign{
    width:40%;
    text-align:center;
}

.sign hr{
    border-top:1px solid #000;
}
</style>
</head>

<body>

<!-- Print Button -->
<div class="print-btn">
    <button onclick="window.print()">🖨 Print Receipt</button>
</div>

<?php foreach($receipt as $row): 
    
    $branch_id =  $row->branch_id;
    $branch = $this->main_model->get_branch_by_id($branch_id);
    ?>

<div class="wrapper">

<!-- Company Header -->
<div class="company-header">
    <h1><?= !empty($branch->name) ? $branch->name : '' ?></h1>
    <p>  <?php if(!empty($branch->address)): ?>
        <?= $branch->address ?>
     <?php endif; ?>
    </p>
    <p>Phone: <?= !empty($branch->mobile_no) ? $branch->mobile_no : '' ?></p>
</div>

<!-- Receipt Title -->
<div class="header">
    <h2>Money Receipt</h2>
    <p><?= date('d-m-Y', $row->received_date) ?></p>
</div>

<table class="info-table">
<tr>
    <td><strong>Receipt No:</strong> <?= $row->invoice_no ?></td>
    <td><strong>Sales Invoice:</strong> <?= $row->sales_id ?></td>
</tr>
<tr>
    <td><strong>Customer:</strong> <?= $row->customer_name ?></td>
    <td><strong>Mobile:</strong> <?= $row->mobile_no ?></td>
</tr>
<tr>
    <td><strong>Payment Method:</strong> <?= $row->payment_method ?></td>
    <td></td>
</tr>
</table>

<table class="pay-table">
<thead>
<tr>
    <th>Description</th>
    <th style="text-align:right">Amount</th>
</tr>
</thead>
<tbody>
<tr>
    <td>Received Amount</td>
    <td style="text-align:right"><?= number_format($row->paid_amount,2) ?></td>
</tr>
<tr>
    <td>Discount</td>
    <td style="text-align:right"><?= number_format($row->discount_amount,2) ?></td>
</tr>
</tbody>
</table>

<table class="summary">
<tr>
    <td><strong>Total Received</strong></td>
    <td style="text-align:right">
        <?= number_format($row->paid_amount + $row->discount_amount,2) ?>
    </td>
</tr>
</table>

<div style="clear:both"></div>

<div class="footer">
    <div class="sign">
        <hr>
        Customer Signature
    </div>
    <div class="sign">
        <hr>
        Authorized Signature
    </div>
</div>

</div>

<?php endforeach; ?>

</body>
</html>
