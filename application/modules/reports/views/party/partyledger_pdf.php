<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Party Ledger - Print</title>

    <style>
        @media print {
            #printBtn { display: none; }
            body {
                margin: 0;
                padding: 0;
            }
        }

        body {
            font-family: Arial, sans-serif;
            background: #f7f7f7;
        }

        .print-area {
            width: 210mm;
            min-height: 297mm;
            padding: 15mm;
            margin: auto;
            background: #fff;
            box-shadow: 0 0 10px #aaa;
        }

        h2, h4 {
            margin: 0;
            text-align: center;
        }

        .header {
            border-bottom:2px solid #000;
            padding-bottom: 8px;
            margin-bottom: 10px;
        }

        .info-table {
            width: 100%;
            margin-bottom: 12px;
            font-size: 14px;
        }
        .info-table td {
            padding: 4px;
        }

        .ledger-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 13px;
        }

        .ledger-table th, .ledger-table td {
            border: 1px solid #555;
            padding: 6px;
        }

        .ledger-table th {
            background: #e0e0e0;
        }

        .footer-total {
            margin-top: 12px;
            font-size: 14px;
        }
    </style>
</head>

<body>

<button id="printBtn" onclick="window.print()" 
style="padding:10px 20px; background:#007bff; color:#fff; border:none; 
border-radius:5px; margin:15px; cursor:pointer;">
    🖨 Print A4
</button>

<div class="print-area">

    <div class="header">
        <h2>Master IT</h2>
        <h4>Party Ledger Report</h4>
    
    </div>

    <table class="info-table">
        <tr>
            <td><strong>Party:</strong> <?= $party->name ?></td>
            <td><strong>Contact:</strong> <?= $party->contact_no ?></td>
        </tr>
        <tr>
            <td><strong>Date Range:</strong> <?= $from_date ?> to <?= $to_date ?></td>
            <td><strong>Opening Balance:</strong> 
                <?= number_format($opening_balance,2) ?> (<?= $opening_type ?>)
            </td>
        </tr>
    </table>

    <table class="ledger-table">
        <thead>
            <tr>
                <th>Date</th>
                <th>Voucher Type</th>
                <th>Particulars</th>
                <th style="width: 80px;">Debit</th>
                <th style="width: 80px;">Credit</th>
                <th style="width: 100px;">Balance</th>
            </tr>
        </thead>

        <tbody>
            <?php 
                $running = $opening_balance; 
                foreach ($ledger as $row):  
                    $running += ($row->debit - $row->credit);
            ?>
            <tr>
                <td><?= $row->date ?></td>
                <td><?= $row->voucher_type ?></td>
                <td><?= $row->particulars ?></td>
                <td style="text-align:right;"><?= number_format($row->debit,2) ?></td>
                <td style="text-align:right;"><?= number_format($row->credit,2) ?></td>
                <td style="text-align:right;"><?= number_format($running,2) ?></td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <div class="footer-total">
        <strong>Total Debit:</strong> <?= number_format($total_debit,2) ?> &nbsp;&nbsp;
        <strong>Total Credit:</strong> <?= number_format($total_credit,2) ?> &nbsp;&nbsp;
        <strong>Closing Balance:</strong> <?= number_format($running,2) ?>
    </div>

</div>

</body>
</html>
