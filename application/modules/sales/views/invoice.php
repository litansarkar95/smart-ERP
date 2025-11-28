<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Premium Invoice - A4</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>
    @page { size: A4; margin: 12mm; }

    body {
        font-family: 'Inter', sans-serif;
        margin: 0;
        padding: 0;
        background: #f2f4f7;
    }

    .invoice-page {
        background: #fff;
        margin: 0 auto;
        padding: 20mm;
        width: 210mm;
        min-height: 297mm;
        box-shadow: 0 0 10px rgba(0,0,0,0.15);
        position: relative;
        box-sizing: border-box;
        border-radius: 4px;
    }

    /* Header */
    .header-title {
        font-size: 30px;
        font-weight: 700;
        text-align: center;
        margin-bottom: 5px;
        letter-spacing: 1px;
    }

    .sub-header {
        text-align: center;
        font-size: 14px;
        color: #444;
        margin-bottom: 25px;
        line-height: 20px;
    }

    .info-row {
        display: flex;
        justify-content: space-between;
        font-size: 14px;
        margin-bottom: 6px;
    }

    /* Table */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 12px;
        font-size: 14px;
    }

    th {
        background: #e9eef5;
        font-weight: 600;
        text-align: center;
        border: 1px solid #bfc9d6;
        padding: 8px;
    }

    td {
        border: 1px solid #c9d3df;
        padding: 8px;
        vertical-align: top;
    }

    .due-title {
        margin-top: 20px;
        text-align: center;
        font-size: 22px;
        font-weight: 700;
        color: #333;
    }

    .totals-row {
        text-align: right;
        font-size: 14px;
        margin-top: 5px;
    }

    .narration {
        font-size: 14px;
        margin-top: 15px;
        border-top: 1px dashed #aaa;
        padding-top: 10px;
    }

    /* Footer fixed area */
    .footer-area {
        position: absolute;
        bottom: 20mm;
        left: 20mm;
        right: 20mm;
    }

    .signatures {
        display: flex;
        justify-content: space-between;
        margin-top: 25px;
        text-align: center;
        font-size: 14px;
    }

    .sign-box {
        width: 45%;
    }

    .sign-box hr {
        border: none;
        border-top: 1px solid #444;
        margin-bottom: 5px;
    }

    .footer-note {
        text-align: center;
        font-size: 12px;
        margin-top: 10px;
        color: #444;
        line-height: 18px;
    }

    .contact-info {
        text-align: center;
        font-size: 12.5px;
        font-weight: 600;
        margin-top: 6px;
        line-height: 18px;
    }

    .print-btn {
        padding: 10px 25px;
        background: #000;
        color: #fff;
        border: none;
        cursor: pointer;
        margin: 20px auto;
        display: block;
        border-radius: 6px;
        font-size: 16px;
    }

    @media print {
        body { background: none; }
        .print-btn { display: none; }
        .invoice-page {
            margin: 0;
            box-shadow: none;
            border-radius: 0;
        }
    }
</style>

</head>
<body>

<button class="print-btn" onclick="window.print()">🖨 Print</button>

<div class="invoice-page">

    <div class="header-title">LOGIC GO</div>
    <div class="sub-header">
        Office: Samir Tower, House-308, 5th Floor, Elephant Road, Dhaka-1205<br>
        Contact: +8801894821851
    </div>

    <!-- Invoice Info -->
    <div class="info-row"><strong>Customer:</strong> MASTER IT SOLUTION <span><strong>Invoice No:</strong> LCM/INV/2025005287</span></div>
    <div class="info-row"><strong>Address:</strong> COMILLA <span><strong>Ref No:</strong> —</span></div>
    <div class="info-row"><strong>Mobile:</strong> 01840325244 <span><strong>Sold By:</strong> Leton</span></div>
    <div class="info-row"><strong>Date & Time:</strong> 12/11/2025 — 7:45 PM</div>

    <!-- Table -->
    <table>
        <tr>
            <th>SL</th>
            <th>Product Description</th>
            <th>Warranty</th>
            <th>Qty</th>
            <th>Unit Price</th>
            <th>Amount</th>
        </tr>

        <tr>
            <td style="text-align:center;">1</td>
            <td>
                EV-IPC-DL12B/4MM/3MP/DUAL LIGHT BULLET/IP CAMERA POE<br>
                <strong>SN:</strong> 25070130064, 25070130082, 25070130080, 25070130052, 
                25070130088, 25070130074, 25070130084, 25070130073, 25070130051,
                25070130050, 25070130048, 25070130054, 25070130058
            </td>
            <td style="text-align:center;">1 YEAR</td>
            <td style="text-align:center;">13</td>
            <td style="text-align:right;">1,750.00</td>
            <td style="text-align:right;">22,750.00</td>
        </tr>
    </table>

    <div class="totals-row"><b>Total Amount:</b> 22,750.00</div>
    <div class="totals-row"><b>Less Discount:</b> 0.00</div>
    <div class="totals-row"><b>Add VAT:</b> 0.00</div>
    <div class="totals-row"><b>Net Payable:</b> 22,750.00</div>
    <div class="totals-row"><b>Previous Due:</b> 315,450.00</div>
    <div class="totals-row"><b>Received Amount:</b> 40,000.00</div>
    <div class="totals-row"><b>Current Due:</b> 298,200.00</div>

    <div class="narration">
        <strong>Narration:</strong> WARRANTY SWITCH = 1 PCS  
        <br><strong>Total Qty:</strong> 13  
        <br><strong>In Words:</strong> Twenty-Two Thousand Seven Hundred Fifty Only
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

</div>

</body>
</html>
