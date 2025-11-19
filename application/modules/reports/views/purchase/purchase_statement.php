<!DOCTYPE html>
<html>
<head>
    <title>Purchase Statement</title>

    <style>
        body {
            font-family: Arial;
            font-size: 14px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 25px;
        }

        th, td {
            border: 1px solid #333;
            padding: 6px;
        }

        th {
            background: #eee;
        }

        .sub-total-area td {
            font-weight: bold;
            background: #f9f9f9;
        }

        .grand-total {
            font-size: 18px;
            font-weight: bold;
            text-align: right;
        }

        /* ========== Print Button Style ========== */
        .print-btn {
            padding: 8px 18px;
            background: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            margin-bottom: 15px;
        }

        /* ========== Do NOT show button in Print ========== */
        @media print {
            .print-btn {
                display: none !important;
            }

            body {
                margin: 5mm 10mm;
            }
        }
    </style>
</head>
<body>

<!-- Print Button -->
<button class="print-btn" onclick="window.print()">Print</button>

<h2 style="text-align:center;">Purchase Statement (All Purchase)</h2>
<p style="text-align:center;">
    From <?= $from ?> To <?= $to ?>
</p>

<?php
$grand_qty = 0;
$grand_total = 0;

foreach ($report as $grn_id => $grn): ?>

    <h3>GRN No: <?= $grn['grn_no']; ?></h3>
    <p>GRN Date: <?= date("d-M-Y", $grn['purchase_date']); ?></p>

    <table>
        <tr>
            <th>SL</th>
            <th>Item Name</th>
            <th>Qty</th>
            <th>Rate</th>
            <th>Total Amount</th>
        </tr>

        <?php
        $sl = 1;
        $sub_qty = 0;
        $sub_total = 0;

        foreach ($grn['items'] as $item):
            $sub_qty += $item['qty'];
            $sub_total += $item['total'];
        ?>
        <tr>
            <td><?= $sl++; ?></td>
            <td><?= $item['product_name']; ?></td>
            <td><?= number_format($item['qty'], 2); ?></td>
            <td><?= number_format($item['price'], 2); ?></td>
            <td><?= number_format($item['total'], 2); ?></td>
        </tr>
        <?php endforeach; ?>

        <tr class="sub-total-area">
            <td colspan="2">Sub Total by GRN</td>
            <td><?= number_format($sub_qty, 2); ?></td>
            <td></td>
            <td><?= number_format($sub_total, 2); ?></td>
        </tr>

    </table>

<?php
$grand_qty += $sub_qty;
$grand_total += $sub_total;
endforeach;
?>

<h2 class="grand-total">
    Total: Qty = <?= number_format($grand_qty, 2); ?> |
    Amount = <?= number_format($grand_total, 2); ?>
</h2>

</body>
</html>
