<?php 
// Total calculation
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

<style>
.total-box {
    margin-top: 20px;
    width: 300px;
    padding: 12px 15px;
    background: #f9fbff;
    border: 1px solid #dce4f5;
    border-radius: 6px;
    box-shadow: 0 1px 3px rgba(0,0,0,0.05);
    float: right;
}

.total-row {
    display: flex;
    justify-content: space-between;
    padding: 6px 0;
    font-size: 14px;
    border-bottom: 1px dashed #d4dcef;
}

.total-row:last-child {
    border-bottom: none;
}

.total-title {
    font-weight: 600;
}

.total-final {
    font-weight: 700;
    font-size: 15px;
}
</style>

<!-- EXISTING REPORT TABLE HERE -->

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

    <tbody>
        <?php foreach($productwise as $p): ?>
        <tr>
            <td><?= $p->product_id ?></td>
            <td><?= $p->total_qty ?></td>
            <td><?= number_format($p->total_sales,2) ?></td>
            <td><?= number_format($p->total_purchase,2) ?></td>

            <td>
                <?php $cls = ($p->total_profit >= 0) ? "profit" : "loss"; ?>
                <span class="<?= $cls ?>">
                    <?= number_format($p->total_profit,2) ?>
                </span>
            </td>
        </tr>
        <?php endforeach; ?>
    </tbody>
</table>

<!-- ⭐ TOTAL BOX BELOW -->
<div class="total-box">

    <div class="total-row">
        <span class="total-title">Total Qty:</span>
        <span><?= number_format($grand_qty) ?></span>
    </div>

    <div class="total-row">
        <span class="total-title">Total Sales:</span>
        <span><?= number_format($grand_sales,2) ?></span>
    </div>

    <div class="total-row">
        <span class="total-title">Total Purchase:</span>
        <span><?= number_format($grand_purchase,2) ?></span>
    </div>

    <div class="total-row total-final">
        <span>Total Profit/Loss:</span>
        <span 
            style="color:<?= ($grand_profit>=0) ? 'green' : 'red' ?>;">
            <?= number_format($grand_profit,2) ?>
        </span>
    </div>

</div>
