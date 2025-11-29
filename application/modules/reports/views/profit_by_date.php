<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Product Report</title>

<style>
body {
    font-family: 'Inter', sans-serif;
    background: #eef1f5;
    margin: 0;
    padding: 0;
}

/* Print Button */
.print-btn {
    padding: 10px 22px;
    background: #111;
    color: #fff;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    margin: 20px auto;
    display: block;
    font-size: 15px;
}

/* Main Report Box */
.report-container {
    width: 950px;
    background: #fff;
    margin: 0 auto;
    padding: 25px 35px;
    box-shadow: 0 6px 15px rgba(0,0,0,0.12);
    border-radius: 10px;
}

/* Company Header */
.company-header {
    text-align: center;
    margin-bottom: 10px;
}

.company-header h2 {
    margin: 0;
    font-size: 30px;
    font-weight: 700;
}

.company-header p {
    margin: 3px 0;
    font-size: 14px;
    color: #555;
}

.report-title {
    text-align: center;
    font-size: 18px;
    font-weight: 600;
    margin-top: 5px;
    margin-bottom: 20px;
}

/* Table Styles */
.report-table {
    width: 100%;
    border-collapse: collapse;
    font-size: 14px;
}

.report-table th {
    background: #eaf0ff;
    padding: 10px;
    border: 1px solid #d0d7e6;
    font-weight: 600;
    text-align: center;
}

.report-table td {
    padding: 9px;
    border: 1px solid #e2e6ef;
    text-align: center;
}

.report-table tr:hover {
    background: #f5f9ff;
}

/* Profit Colors */
.profit { color: green; font-weight: 600; }
.loss   { color: red; font-weight: 600; }

/* Footer + Totals */
.footer-container {
    margin-top: 30px;
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
}

/* Signature box */
.signature-box {
    width: 30%;
    text-align: center;
    font-size: 14px;
}
.signature-box hr {
    border: none;
    border-top: 1px solid #333;
    margin-bottom: 6px;
}

/* Total Summary Box */
.footer-summary {
    width: 320px;
    background: #f9fbff;
    border: 1px solid #dce4f5;
    border-radius: 8px;
    padding: 14px 18px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
    font-size: 14px;
}

.footer-summary .row {
    display: flex;
    justify-content: space-between;
    padding: 7px 0;
    border-bottom: 1px dashed #d4dcef;
}

.footer-summary .row:last-child {
    border-bottom: none;
}

.footer-summary .final {
    font-weight: 700;
    font-size: 15px;
}

/* Print Mode */
@media print {
    body { background: white; }
    .print-btn { display: none; }

    .report-container {
        box-shadow: none;
        width: 100%;
        margin: 0;
        padding: 0 10px;
    }
}

.signature-wrapper-right {
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: flex-end; /* right side */
 
}
</style>
</head>
<body>

<button class="print-btn" onclick="window.print()">🖨 Print Report</button>

<div class="report-container">

    <!-- Company Info -->
    <div class="company-header">
        <h2>LOGIC GO</h2>
        <p>Samir Tower, Elephant Road, Dhaka – 1205</p>
        <p>Contact: +8801894821851</p>
    </div>

    <!-- Report Title -->
    <div class="report-title">
        Product-wise Sales & Profit Report  
        <br>
        <small>Date: <?= date("d M, Y") ?></small>
    </div>

    <!-- Table -->
    <table class="report-table">
        <thead>
            <tr>
                <th>Product ID</th>
                <th>Total Qty</th>
                <th>Total Sales (Tk)</th>
                <th>Total Purchase (Tk)</th>
                <th>Profit / Loss (Tk)</th>
            </tr>
        </thead>

        <?php 
        $grand_qty = 0;
        $grand_sales = 0;
        $grand_purchase = 0;
        $grand_profit = 0;

        foreach($productwise as $p){
            $grand_qty += $p->total_qty;
            $grand_sales += $p->total_sales;
            $grand_purchase += $p->total_purchase;
            $grand_profit += $p->total_profit;
        }
        ?>

        <tbody>
            <?php foreach($productwise as $p): ?>
            <tr>
                <td><?= $p->product_name ?></td>
                <td><?= $p->total_qty ?></td>
                <td><?= number_format($p->total_sales,2) ?></td>
                <td><?= number_format($p->total_purchase,2) ?></td>
                <td>
                    <?php $cls = ($p->total_profit >= 0) ? "profit" : "loss"; ?>
                    <span class="<?= $cls ?>"><?= number_format($p->total_profit,2) ?></span>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <!-- Footer (Signature + Totals) -->
    <div class="footer-container signature-wrapper-right">


        <div class="footer-summary">
            <div class="row">
                <span>Total Qty</span>
                <span><?= number_format($grand_qty) ?></span>
            </div>

            <div class="row">
                <span>Total Sales</span>
                <span><?= number_format($grand_sales,2) ?></span>
            </div>

            <div class="row">
                <span>Total Purchase</span>
                <span><?= number_format($grand_purchase,2) ?></span>
            </div>

            <div class="row final">
                <span>Total Profit / Loss</span>
                <span style="color:<?= ($grand_profit>=0 ? 'green' : 'red') ?>;">
                    <?= number_format($grand_profit,2) ?>
                </span>
            </div>
        </div>

    </div>

</div>

</body>
</html>
