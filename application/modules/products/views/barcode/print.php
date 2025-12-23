<!DOCTYPE html>
<html>
<head>
    <title>Print Barcodes</title>
    <style>
        body { font-family: Arial; }
        .barcode-box { display: inline-block; width: <?= $paper_size=='A4' ? '200px' : '120px' ?>; text-align: center; margin:5px; border:1px solid #ddd; padding:10px; }
        .barcode-name { font-weight:bold; margin-bottom:5px; }
        .barcode-price { margin-top:5px; font-size:14px; }
    </style>
</head>
<body>
<?php
$width = $paper_size == 'A4' ? '200px' : '120px';   // Example: A4 বা ছোট paper
$height = $paper_size == 'A4' ? '60px' : '40px';
?>

<?php
include_once APPPATH.'third_party/barcode/src/BarcodeGenerator.php';
include_once APPPATH.'third_party/barcode/src/BarcodeGeneratorPNG.php';

use Picqer\Barcode\BarcodeGeneratorPNG;

$generator = new BarcodeGeneratorPNG();

foreach($barcodes as $b):
?>
  <div class="barcode-box">
    <div class="barcode-name"><?= $b['name'] ?></div>
    <img src="data:image/png;base64,<?= base64_encode($generator->getBarcode($b['code'], $generator::TYPE_CODE_128)) ?>" 
         alt="barcode"
         style="width: <?= $width ?>; height: <?= $height ?>; object-fit: contain;">
    <?php if(!empty($show_price)): ?>
        <div class="barcode-price">৳ <?= number_format($b['price'],2) ?></div>
    <?php endif; ?>
</div>

<?php endforeach; ?>

</body>
</html>
