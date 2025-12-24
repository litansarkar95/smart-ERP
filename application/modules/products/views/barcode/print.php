<!DOCTYPE html>
<html>
<head>
    <title>Print Barcodes</title>
    <style>
        body { font-family: Arial; }
        .barcode-box { display: inline-block; width: <?= $paper_size=='A4' ? '200px' : '120px' ?>; text-align: center; margin:5px; border:1px solid #ddd; padding:10px; }
        .barcode-name { font-weight:bold; margin-bottom:5px; }
        .barcode-price { margin-top:5px; font-size:14px; }
        @media (max-width: 600px) {
    .barcode-box {
        margin: 2px;
        padding: 5px;
        width: 90%; /* মোবাইলের জন্য ফিট করার জন্য */
    }
}
.barcode-code{
    font-size:11px;
    margin-top:2px;
    font-weight:bold;
}
.barcode-box{
    width: 200px;       /* default */
    padding: 6px;
    margin: 4px;
    border: 1px solid #ddd;
    text-align: center;
}

.barcode-box img{
    max-width: 100%;
    height: 50px;       /* 🔥 barcode height fixed */
    object-fit: contain;
}

.barcode-name{
    font-size: 12px;
    font-weight: bold;
    margin-bottom: 2px;
}

.barcode-code{
    font-size: 11px;
    margin-top: 2px;
    font-weight: 600;
}

.barcode-price{
    font-size: 11px;
    margin-top: 2px;
}
.print-btn{
    background: linear-gradient(135deg, #4e73df, #224abe);
    color: #fff;
    padding: 10px 28px;
    border: none;
    border-radius: 30px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 6px 15px rgba(0,0,0,0.2);
}

.print-btn i{
    margin-right: 6px;
}

.print-btn:hover{
    transform: translateY(-2px);
    box-shadow: 0 10px 20px rgba(0,0,0,0.25);
    background: linear-gradient(135deg, #224abe, #4e73df);
}
@media print{
    .print-btn{
        display: none;
    }
}

    </style>
</head>
<body>
<?php


switch($paper_size){
    case 'a4_40':
        $width = '190px';
        $height = '45px';
        break;

    case 'a4_24':
        $width = '260px';
        $height = '60px';
        break;

    case 'a4_21':
        $width = '270px';
        $height = '70px';
        break;

    case 'single':
    default:
        $width = '300px';
        $height = '80px';
}

?>
<div class="print-area">
    <button onclick="window.print()" class="print-btn">
        🖨 Print
    </button>
</div>
<?php
include_once APPPATH.'third_party/barcode/src/BarcodeGenerator.php';
include_once APPPATH.'third_party/barcode/src/BarcodeGeneratorPNG.php';

use Picqer\Barcode\BarcodeGeneratorPNG;

$generator = new BarcodeGeneratorPNG();

foreach($barcodes as $b):
?>
<div class="barcode-box">
    <div class="barcode-name"><?= $b['name'] ?></div>
   <img src="data:image/png;base64,<?= base64_encode(
    $generator->getBarcode($b['batch'], $generator::TYPE_CODE_128)
) ?>"
style="width:<?= $width ?>;height:<?= $height ?>;">
<div class="barcode-code">
    <?= $b['batch'] ?> <!-- ✅ Batch / Serial -->
</div>
    
    <?php if (!empty($show_price)): ?>
        <div class="barcode-price">৳ <?= number_format($b['price'], 2) ?></div>
    <?php endif; ?>
</div>



<?php endforeach; ?>
<script>
    window.onload = function () {
        window.print();
    }
</script>

</body>
</html>
