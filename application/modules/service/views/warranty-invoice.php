<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Service Bill – A4 Print</title>

<style>
/* =========================
   A4 PRINT-READY LAYOUT
   ========================= */

@page{
  size: A4;
  margin: 15mm 12mm;
}


*{
  box-sizing: border-box;
  -webkit-print-color-adjust: exact;
  print-color-adjust: exact;
}

body{
  font-family: Arial, Helvetica, sans-serif;
  font-size: 11.5px;
  color:#000;
  margin:0;
}

.wrapper{
  max-width: 190mm;   /* A4 safe width */
  margin: 0 auto;
}


/* -------- ACTION BUTTONS -------- */
.actions{
  margin:15px 0;
  text-align:center;
}

.actions a{
  display:inline-block;
  padding:10px 18px;
  margin:4px;
  color:#fff;
  text-decoration:none;
  font-weight:bold;
  border-radius:4px;
}

.print-btn{ background:#f59e0b; }
.back-btn{ background:#2563eb; }

@media print{
  .actions{ display:none; }
}

/* -------- HEADER -------- */
.header{
  border:1px solid #000;
  padding:6px;
}

.header-row{
  display:flex;
  align-items:center;
}

.logo{
  width:140px;
}

.logo img{
  width:100%;
}

.company{
  flex:1;
  padding-left:10px;
}

.company h1{
  margin:0;
  font-size:22px;
}

.company h2{
  margin:0;
  font-size:15px;
  font-weight:normal;
}

.company p{
  margin:2px 0;
  font-size:13px;
}

/* -------- TITLE -------- */
.title{
  text-align:center;
  font-size:20px;
  font-weight:bold;
  border:1px solid #000;
  margin:10px 0;
  padding:6px 0;
}

/* -------- INFO -------- */
.info{
  width:100%;
  margin-bottom:10px;
}

.info td{
  padding:2px 4px;
  vertical-align:top;
}

.info .left{ width:60%; }
.info .right{ width:40%; text-align:right; }

/* -------- TABLE -------- */
.table {
  width: 98%;
  table-layout: fixed; /* fixed makes column respect width */
  border-collapse: collapse;
}

.table th,
.table td{
  border:1px solid #000;
  padding:5px;
}

.table th{
  text-align:center;
}

.table tr{
  page-break-inside: avoid;
}
.table th:nth-child(4),
.table td:nth-child(4) {
  width: 15%; /* Service Charge column */
  text-align: right;
  word-wrap: break-word;
}

.text-center{ text-align:center; }
.text-right{ text-align:right; }

/* -------- FOOTER -------- */
.footer{
  margin-top:25mm;
  page-break-inside: avoid;
}

.signatures{
  width:100%;
  margin-bottom:10mm;
}

.signatures td{
  text-align:center;
  padding-top:30px;
}

.terms h4{
  margin:4px 0;
}

.terms ul{
  margin:4px 0 6px 18px;
}

.note{
  font-weight:bold;
}

.developed{
  text-align:center;
  font-size:11px;
  margin-top:6px;
}

</style>
</head>

<body>
<div class="wrapper">

<!-- ACTION BUTTONS -->
<div class="actions">
  <a href="#" onclick="window.print()" class="print-btn">Print</a>
  <a href="<?php echo base_url(); ?>service/warranty" class="back-btn">Back</a>
</div>

<!-- HEADER -->
<div class="header">
  <div class="header-row">
    <div class="logo">
      <!-- <img src="/libs/mis.jpg" alt="Logo"> -->
    </div>
    <div class="company">
      <h1>Master IT Solution</h1>
      <h2>মাস্টার আইটি সলিউশন</h2>
      <p>Shop No: 5071, Cumilla IT Park, New Market, Cumilla</p>
      <p><b>Mobile:</b> 01840-325244, 01707-325244</p>
      <p><b>Hotline:</b> 09639125244</p>
    </div>
  </div>
</div>

<!-- TITLE -->
<div class="title">Service Bill (Customer Copy)</div>

<!-- INFO -->
<table class="info">
<tr>
  <td class="left">
    <b>Invoice No:</b><?= $warranty->invoice_no; ?><br>
    <b>Customer Name:</b> <?= $warranty->customer_name; ?><br>
    <b>Address:</b> <?= $warranty->address; ?><br>
    <b>Mobile:</b> <?= $warranty->contact_no; ?>
  </td>
  <td class="right">
   <b>Date:</b> <?= date("d-m-Y", $warranty->create_date); ?><br>
    <b>Delivery Date:</b> <?= date("d-m-Y", $warranty->delivery_date) ?><br>
    <b>Print Time:</b> <?= date('d-M-Y h:i A'); ?>

  </td>
</tr>
</table>

<!-- ITEM TABLE -->
<table class="table">
<thead>
<tr>
  <th style="width:6%">SL</th>
  <th style="width:40%">Description</th>
  <th>Problem</th>
  <th style="width:15%">Service Charge</th>
</tr>
</thead>

<tbody>
<?php
$total = 0;
$rowspan = count($orders);
$sl = 1;

foreach ($orders as $key => $row):
    $total += $row->amount;
?>
<tr>
  <td class="text-center"><?= $sl++; ?></td>

  <?php if ($key == 0): ?>
  <td rowspan="<?= $rowspan; ?>">
    <b><?= $warranty->product_name; ?></b><br>
    Serial: <?= $warranty->serial; ?>
  </td>
  <?php endif; ?>

  <td><?= $row->problem_name; ?></td>
  <td class="text-right"><?= number_format($row->amount, 2); ?></td>
</tr>
<?php endforeach; ?>
</tbody>

<tfoot>
<tr>
  <th colspan="3" class="text-right">Total</th>
  <th class="text-right"><?= number_format($total, 2); ?></th>
</tr>
</tfoot>
</table>


<!-- FOOTER -->
<div class="footer">

<table class="signatures">
<tr>
  <td>_________________________<br>Customer Signature</td>
  <td></td>
  <td>_________________________<br>Authorized Signature</td>
</tr>
</table>

<div class="terms">
<h4>Terms & Conditions</h4>
<ul>
  <li>No cash refund</li>
  <li>Adapter & power supply no warranty</li>
  <li>Burn, physical damage, electrical short & water damage not covered</li>
</ul>
</div>

<div class="note">Note: Please report within 5 days of warranty.</div>
<div class="developed">Developed by: MasterTech.com.bd</div>

</div>

</div>
</body>
</html>
