<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GRN Report</title>

<style>
    @page {
        size: A4;
        margin: 15mm;
    }

    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background: #f4f4f4;
    }

    .print-area {
        width: 210mm;
        min-height: 297mm;
        background: #fff;
        padding: 20px 25px;
        margin: auto;
        box-shadow: 0 0 8px rgba(0,0,0,0.4);
    }

    .header {
        text-align: center;
    }

    .header img {
        width: 120px;
        margin-bottom: 5px;
    }

    .title {
        font-size: 20px;
        font-weight: bold;
        margin-top: -10px;
    }

    .subtitle {
        font-size: 15px;
        margin-bottom: 10px;
    }

    .print-time {
        text-align: right;
        font-size: 12px;
        margin-bottom: 8px;
    }

    table.info {
        width: 100%;
        margin-bottom: 15px;
        font-size: 14px;
    }

    table.info td {
        padding: 3px 0;
    }

    table.data {
        width: 100%;
        border-collapse: collapse;
        font-size: 14px;
    }

    table.data th, table.data td {
        border: 1px solid #000;
        padding: 6px;
    }

    table.data th {
        text-align: center;
        background: #e8e8e8;
        font-weight: bold;
    }

    tfoot td {
        font-weight: bold;
        background: #f2f2f2;
    }

    .footer {
        margin-top: 30px;
        text-align: left;
        font-size: 12px;
    }

    .print-btn {
        padding: 10px 18px;
        background: #007bff;
        border: none;
        color: #fff;
        font-size: 15px;
        border-radius: 6px;
        cursor: pointer;
        margin: 15px auto;
        display: block;
        text-align: center;
    }

    .print-btn:hover {
        background: #0056b3;
    }

    /* Hide button on print */
    @media print {
        .print-btn {
          display: none;
        }
        body {
            background: #fff;
        }
        .print-area {
            box-shadow: none;
            margin: 0;
        }
    }
</style>
</head>

<body>

<button class="print-btn" onclick="window.print()">Print</button>
<?php
if(isset($allPdt)){
    foreach($allPdt as $pdt){

?>
<div class="print-area">
    <div class="print-time">Print Date : 22-11-2025 04:10:58 PM</div>

    <div class="header">
        <!-- <img src="https://waltonbd.com/image/catalog/logo.png"> -->
        <div class="title">Test Dealer (Demo)</div>
        <div class="subtitle">Bashundhara</div>
        <h3>Purchase Invoice</h3>
    </div>

    <table class="info">
        <tr>
            <td><strong>Invoice No:</strong> <?php echo $pdt->invoice_no; ?></td>
            <td><strong>Supplier:</strong> <?php echo $pdt->partner; ?></td>
        </tr>
        <tr>
            <td><strong>Invoice Date:</strong> <?php echo date("d-m-Y",$pdt->purchase_date); ?></td>
            <td><strong>Total Amount:</strong> <?php echo $pdt->totalAmount; ?></td>
        </tr>
    </table>

    <table class="data">
        <thead>
            <tr>
                <th>SL</th>
                <th>Item Name</th>
                <th>Unit Price</th>
                <th>Qty</th>
                <th>Rebate</th>
                <th>Unit</th>
                <th>Amount</th>
            </tr>
        </thead>

        <tbody>
            <?php
            $i = 1;
            if(isset($allDets)){
                foreach($allDets as $detail){
               
            ?>
            <tr>
                <td><?= $i++ ?></td>
                <td><?php echo $detail->title; ?></td>
                <td><?php echo $detail->purchase_price; ?></td>
                <td><?php echo $detail->quanity; ?></td>
                <td><?php echo $detail->rebate; ?></td>
                <td><?php echo $detail->unit; ?></td>
                <td><?php echo $detail->quanity * $detail->purchase_price; ?></td>
            </tr>
            <?php
                }
            }
            ?>

          
        </tbody>

        <tfoot>
            <tr>
                <td colspan="6" style="text-align:right;">Total :</td>
                <td><?php echo $pdt->allTotal; ?></td>
            </tr>
            <tr>
                <td colspan="6" style="text-align:right;">total Discount :</td>
                 <td><?php echo $pdt->totalDiscount; ?></td>
            </tr>
            <tr>
                <td colspan="6" style="text-align:right;">Total Rebate:</td>
                <td><?php echo $pdt->totalRebate; ?></td>
            </tr>
            <tr>
                <td colspan="6" style="text-align:right;">Total :</td>
                   <td><?php echo $pdt->totalAmount; ?></td>
            </tr>
             <tr>
                <td colspan="6" style="text-align:right;">Paid :</td>
                   <td><?php echo $pdt->paidAmount; ?></td>
            </tr>

             <tr>
                <td colspan="6" style="text-align:right;">due :</td>
                 <td><?php echo $pdt->dueAmount; ?></td>
            </tr>
        </tfoot>
    </table>

    <!-- <div class="footer">
        Design and developed by: Master IT
    </div> -->
</div>
<?php
    }
}
?>
</body>
</html>
