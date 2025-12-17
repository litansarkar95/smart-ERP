<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Service Bill – A4 Print</title>

<style>
/* =========================
   A4 PRINT-READY LAYOUT
   Clean • Accurate • Stable
   ========================= */

@page {
  size: A4;
  margin: 12mm 10mm;
}

*{
  box-sizing: border-box;
}

body{
  font-family: Arial, Helvetica, sans-serif;
  font-size: 12px;
  color:#000;
  margin:0;
}

.wrapper{
  width: 100%;
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
  height:auto;
}

.company{
  flex:1;
  padding-left:10px;
}

.company h1{
  margin:0;
  font-size:24px;
}

.company h2{
  margin:0;
  font-size:16px;
  font-weight:normal;
}

.company p{
  margin:2px 0;
  font-size:14px;
}

/* -------- TITLE -------- */
.title{
  text-align:center;
  font-size:22px;
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
  vertical-align:top;
  padding:2px 4px;
}

.info .left{ width:60%; }
.info .right{ width:40%; text-align:right; }

/* -------- TABLE -------- */
.table{
  width:100%;
  border-collapse:collapse;
}

.table th,
.table td{
  border:1px solid #000;
  padding:6px;
}

.table th{
  text-align:center;
}

.table td{
  vertical-align:top;
}

.text-right{ text-align:right; }
.text-center{ text-align:center; }

/* -------- TOTAL -------- */
.total-row th{
  font-size:14px;
}

/* -------- FOOTER -------- */
.footer{
  margin-top:25mm;
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

/* -------- BUTTONS (HIDE ON PRINT) -------- */
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
}

.print-btn{ background:#f59e0b; }
.back-btn{ background:#2563eb; }

@media print{
  .actions{ display:none; }
}
</style>
</head>

<body>
<div class="wrapper">
  <!-- ACTION BUTTONS -->
  <div class="actions">
    <a href="#" onclick="window.print()" class="print-btn">Print</a>
    <a href="#" class="back-btn">Back</a>
  </div>
  <!-- HEADER -->
  <div class="header">
    <div class="header-row">
      <div class="logo">
        <img src="/libs/mis.jpg" alt="Logo">
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
        <b>Invoice No:</b> SE1765954691<br>
        <b>Customer Name:</b><br>
        <b>Address:</b><br>
        <b>Mobile:</b>
      </td>
      <td class="right">
        <b>Date:</b> 17-Dec-2025<br>
        <b>Delivery Date:</b> 01-Jan-2026<br>
        <b>Print Time:</b> 17-Dec-2025 12:58 PM
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
    <!-- First problem row -->
    <tr>
      <td class="text-center">1</td>

      <!-- Description ONLY ONCE with rowspan -->
      <td rowspan="3">
        <b>UNIVEW 2MP CAMERA IPC2122LB-SF40-A</b><br>
        Serial: 210235ue3r3247000332
      </td>

      <td>LAPTOP PLUGGED IN NOT CHARGING</td>
      <td class="text-right">0.00</td>
    </tr>

    <!-- Second problem -->
    <tr>
      <td class="text-center">2</td>
      <td>PAPER NOT RECEIVING</td>
      <td class="text-right">0.00</td>
    </tr>

    <!-- Third problem -->
    <tr>
      <td class="text-center">3</td>
      <td>NO POWER</td>
      <td class="text-right">0.00</td>
    </tr>
  </tbody>

  <!-- TOTAL ALWAYS ONE -->
  <tfoot>
    <tr>
      <th colspan="3" class="text-right">Total</th>
      <th class="text-right">0.00</th>
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
