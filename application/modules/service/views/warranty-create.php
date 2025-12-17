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

  </style>
  	  <link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
<div class="container-fluid">





  <div class="row px-3">
    <div class="col-12">
      <div class="content">
        <div class="row">
          <div class="col-auto">
           
          </div>
          <div class="col-auto ms-auto">
            <!-- Button trigger modal -->
               <div class="right">
                
            </div>

          </div>
        </div>
     <div class="row">
  <div class="col-12">

    <div class="card ">

      <!-- Card Header -->
      <div class="card-header">
        <h4 class="mb-0">Warranty Product</h4>
      </div>

      <!-- Card Body -->
      <div class="card-body">

        <form action="<?php echo base_url(); ?>service/warranty/search"
              method="post"
              enctype="multipart/form-data">

          <div class="row mb-3">

            <!-- Product Group -->
            <div class="col-md-2 mb-3">
              <div class="form-group">
                <label>Product Group</label>
                <div class="select_2_container">
                  <select name="group_id" class="form-control select2">
                    <option value="">Select</option>
                    <?php foreach($allCat as $cat){ ?>
                      <option value="<?= $cat->id ?>"><?= $cat->name ?></option>
                    <?php } ?>
                  </select>
                  <i class="fas fa-caret-down"></i>
                </div>
              </div>
            </div>

            <!-- Product Name -->
            <div class="col-md-4 mb-3">
              <div class="form-group">
                <label>Product Name</label>
                <div class="select_2_container">
                  <select name="product_id" class="form-control select2">
                    <option value="">Select</option>
                    <?php foreach($allPro as $pro): ?>
                      <option value="<?= $pro->id ?>"><?= $pro->name ?></option>
                    <?php endforeach; ?>
                  </select>
                  <i class="fas fa-caret-down"></i>
                </div>
              </div>
            </div>

            <!-- Supplier -->
            <div class="col-md-3 mb-3">
              <div class="form-group">
                <label>Select Supplier</label>
                <div class="select_2_container">
                  <select name="supplier_id" class="form-control select2">
                    <option value="">Select</option>
                    <?php foreach($allSuplier as $customer){ ?>
                      <option value="<?= $customer->id ?>">
                        <?= $customer->name ?> - <?= $customer->contact_no ?>
                      </option>
                    <?php } ?>
                  </select>
                  <i class="fas fa-caret-down"></i>
                </div>
              </div>
            </div>

            <!-- IMEI -->
            <div class="col-md-3 mb-3">
              <div class="form-group">
                <label>Serial / IMEI No</label>
                <input type="text" name="mobile_no" class="form-control">
              </div>
            </div>

          </div>

          <!-- Button -->
          <div class="row">
            <div class="col-12 text-end">
              <button type="submit" class="btn btn_bg px-5">
                Search
              </button>
            </div>
          </div>

        </form>

      </div>
    </div>

  </div>
</div>



