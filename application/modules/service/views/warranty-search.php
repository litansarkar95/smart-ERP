<style>
.print-btn{
 
  
    padding:10px !important;
}
.serial-item {
    background-color: #f9f9f9;
    padding: 5px 10px;
    margin-bottom: 5px;
    border-radius: 5px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.serial-item h4 {
    margin: 0;
    font-size: 14px;
}
.form-check-input {
    width: 18px;
    height: 18px;
    cursor: pointer;
    border: 2px solid #0d6efd;
}

.form-check-input:checked {
    background-color: #0d6efd;
    border-color: #0d6efd;
}

.form-check-label {
    font-weight: 500;
    margin-left: 4px;
    cursor: pointer;
}

  </style>
  	  <link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
<div class="">





  <div class="" style="margin-top:15px">
    <div class="col-12 mb-3">
      <div class="">
        <div class="row">
          <div class="col-auto">
            <h3>Warranty Product</h3>
          </div>
          <div class="col-auto ms-auto">
            <!-- Button trigger modal -->
               <div class="right">
                
            </div>

          </div>
        </div>
     <div class="row">
  <div class="col-12">
        <form action="<?php echo base_url(); ?>service/warranty/save"
              method="post"
              enctype="multipart/form-data">

              <?php if (!empty($product)) : ?>
                 <div class="card ">

      <!-- Card Header -->
      <div class="card-header">
        <h4 class="mb-0">Product Information</h4>
      </div>
      <div class="card-body">
<div class="row mb-3">

  <div class="col-md-3 mb-3">
    <label>Product Name</label>
    <p><?= $product['name']; ?></p>
  </div>

  <div class="col-md-3 mb-3">
    <label>Purchase Price</label>
    <p><?= number_format($info['purchase_price'], 2); ?></p>
  </div>

  <div class="col-md-3 mb-3">
    <label>Sales Price</label>
    <p><?= number_format($sales_info['sales_price'], 2); ?></p>
  </div>

  <div class="col-md-3 mb-3">
    <label>Barcode</label>
    <p><?= $product['barcode']; ?></p>
  </div>
 </div>

          </div>
</div><br>
<?php endif; ?>

<?php if (!empty($info)) : ?>
    <div class="card ">

      <!-- Card Header -->
      <div class="card-header">
        <h4 class="mb-0">Purchase Information</h4>
      </div>
  <input type="hidden" name="serial" class="form-control form-control-sm" value="<?= $info['serial']; ?>" >
  <input type="hidden" name="supplier_id" class="form-control form-control-sm" value="<?= $info['supplier_id']; ?>" >
  <input type="hidden" name="purchase_id" class="form-control form-control-sm" value="<?= $info['purchase_id']; ?>" >
  <input type="hidden" name="product_id" class="form-control form-control-sm" value="<?= $product['product_id']; ?>" >
  <input type="hidden" name="purchase_price" class="form-control form-control-sm" value="<?= $info['purchase_price']; ?>" >
  <input type="hidden" name="sales_price" class="form-control form-control-sm" value="<?= $sales_info['sales_price']; ?>" >
  <input type="hidden" name="sales_date" class="form-control form-control-sm" value="<?= $sales_info['sales_date']; ?>" >
  <input type="hidden" name="warrenty" class="form-control form-control-sm" value="<?= $sales_info['warrenty']; ?>" >
  <input type="hidden" name="warrenty_days" class="form-control form-control-sm" value="<?= $sales_info['warrenty_days']; ?>" >
      <!-- Card Body -->
      <div class="card-body">

    

          <div class="row mb-3">

            <!-- Product Group -->
            <div class="col-md-2 mb-3">
              <div class="form-group">
                <label>Invoice No</label>
              <p> <?= $info['invoice_no']; ?></p>
              </div>
            </div>

            <!-- Product Name -->
            <div class="col-md-2 mb-3">
              <div class="form-group">
                <label>Purchase Date</label>
                   <p> <?= $info['purchase_date']; ?></p>
              </div>
            </div>

            <!-- Supplier -->
            <div class="col-md-2 mb-3">
              <div class="form-group">
                <label>	Supplier</label>
                   <p> <?= $info['supplier']; ?></p>
              </div>
            </div>

            <!-- IMEI -->
            <div class="col-md-3 mb-3">
              <div class="form-group">
                <label>	Supplier Warranty</label>
                   <p>  <span class="<?= strpos($info['warranty_left'], 'Expired') !== false ? 'text-danger' : 'text-success'; ?>">
                <?= $info['warranty_left']; ?>
            </span></p>
              </div>
            </div>

          </div>


     

      </div>
    </div>
<?php endif; ?>
<?php if (!empty($sales_info)) : ?>
<div class="card mt-3">
  <input type="hidden" name="customer_id" class="form-control form-control-sm" value="<?= $sales_info['customer_id']; ?>" >
  <input type="hidden" name="sales_id" class="form-control form-control-sm" value="<?= $sales_info['sales_id']; ?>" >
      <!-- Card Header -->
      <div class="card-header">
        <h4 class="mb-0">Sales Information</h4>
      </div>

      <!-- Card Body -->
      <div class="card-body">



          <div class="row mb-3">

          
            <!-- Product Group -->
            <div class="col-md-2 mb-3">
              <div class="form-group">
                <label>Invoice No</label>
              <p> <?= $sales_info['sinvoice_no']; ?></p>
              </div>
            </div>

            <!-- Product Name -->
            <div class="col-md-2 mb-3">
              <div class="form-group">
                <label>Sales Date</label>
                   <p> <?= $sales_info['sales_date']; ?></p>
              </div>
            </div>

            <!-- Customer -->
            <div class="col-md-2 mb-3">
              <div class="form-group">
                <label>	Customer</label>
                   <p> <?= $sales_info['customer_name']; ?></p>
              </div>
            </div>

            <!-- IMEI -->
            <div class="col-md-3 mb-3">
              <div class="form-group">
                <label>	Customer Warranty</label>
                   <p>  <span class="<?= strpos($sales_info['sales_warranty_left'], 'Expired') !== false ? 'text-danger' : 'text-success'; ?>">
                <?= $sales_info['sales_warranty_left']; ?>
            </span></p>
              </div>
            </div>

          </div>

    

      </div>
    </div>
<?php endif; ?>

<div class="card mt-3">

      <!-- Card Header -->
      <div class="card-header">
        <h4 class="mb-0">Sales Information</h4>
      </div>

      <!-- Card Body -->
      <div class="card-body">



          <div class="row mb-3">

<?php if (isset($allCat)) {
    foreach ($allCat as $cat) { ?>
        
<div class="col-md-3 col-sm-4 col-6 mb-3">
  <div class="d-flex align-items-center">
    <div class="form-check me-2">
   <input class="form-check-input"
       type="checkbox"
       name="problem_id[<?= $cat->id; ?>]"
       value="<?= $cat->id; ?>"
       id="problem_id<?= $cat->id; ?>">

  <label class="form-check-label" for="problem_id<?= $cat->id; ?>">
      <?= $cat->name; ?>
  </label>

      </div>

    <input type="number"
           name="rate[<?php echo $cat->id; ?>]"
           class="form-control form-control-sm"
           value="<?php echo $cat->amount; ?>"
           min="0"
           style="width:70px;">
  </div>
</div>

<?php }
} ?>



            <!-- IMEI -->
         
 <div class="col-md-2 ">
																<div class="form-group">
																<label for="delivery_date">Delivery Date<span class="text-error"> *</span></label>
									      						<input type="text"  name="delivery_date" id="delivery_date" value=""   class="form-control" >
																<span class="text-error small"><?php echo form_error('delivery_date'); ?></span>
																</div>
									      					</div>     

          </div>

          <!-- Button -->
          <div class="row">
            <div class="col-12 text-end">
              <button type="submit" class="btn btn_bg px-5">
                Save
              </button>
            </div>
          </div>

        </form>

      </div>
    </div>


  </div>
</div>



<script>
$(document).ready(function () {

    $("#delivery_date, #due_paid_date").datepicker({
        dateFormat: "dd-mm-yy",
        changeMonth: true,
        changeYear: true,
        yearRange: "1900:2100"
    });

    // Today + 15 days
    var futureDate = new Date();
    futureDate.setDate(futureDate.getDate() + 15);

    var formattedDate = $.datepicker.formatDate("dd-mm-yy", futureDate);

    $("#delivery_date, .to_date").val(formattedDate);

});
</script>
