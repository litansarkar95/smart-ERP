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
          
            <!-- Supplier -->
                                                                   <div class="col-md-3">
                                                        <div class="form-group">
                                                            <label for="customer_id">Select Customer</label>
                                                            <div class="select_2_container">
                                                                <select name="customer_id" id="customer_id" class="form-control frm_select select2" >
                                                                    <option value="">Select</option>
                                                                
                                                                </select>
                                                                <i class="fas fa-caret-down"></i>
                                                            </div>
                                                            <span class="text-error small"><?= form_error('customer_id'); ?></span>
                                                        </div>
                                                    </div>


               <div class="col-md-3 ">
                                                                                            <div class="form-group">
                                                                                        <label for="invoice_id">Select Invoice  </label>
                                                                                        <div class="select_2_container">
                                                                                            <select name="invoice_id"  id="invoice_id"     class="form-control frm_select select2">
                                                                                            <option  value="">  Select Invoice </option>
                                                                                     
                                                                                            </select>
                                                                                            <i class="fas fa-caret-down"></i>
                                                                                        </div>
                                                                                        <span class="text-error small"> <?php echo form_error('invoice_id'); ?>   </span>
                                                                                        </div></div>
                                                                                        <!-- end Brand -->
                                                                                    <div class="col-md-4 ">
                                                                                            <div class="form-group">
                                                                                        <label for="product_id">Select Product  </label>
                                                                                        <div class="select_2_container">
                                                                                            <select name="product_id"  id="product_id"     class="form-control frm_select select2">
                                                                                            <option  value="">  Select Product </option>
                                                                               
                                                                                            </select>
                                                                                            <i class="fas fa-caret-down"></i>
                                                                                        </div>
                                                                                        <span class="text-error small"> <?php echo form_error('product_id'); ?>   </span>
                                                                                        </div></div>
                                                                                        <!-- end Brand -->
                                

                                                                                                <div class="col-md-3 ">
                                                                                            <div class="form-group">
                                                                                        <label for="serial_list">Select Serial  </label>
                                                                                        <div class="select_2_container">
                                                                                            <select id="serial_list" name="serial_list" class="form-control select2">
                                                                                                    <option value="">Select Serial</option>
                                                                                                </select>

                                                                                            <i class="fas fa-caret-down"></i>
                                                                                        </div>
                                                                                        <span class="text-error small"> <?php echo form_error('serial_list'); ?>   </span>
                                                                                        </div></div>
                                                                                        <!-- end Brand -->
                                                                                         <div class="col-md-3 ">
																<div class="form-group">
																<label for="enter_serial">Enter Serial <span class="text-error"> *</span></label>
									      						<input type="text"   name="enter_serial" id="enter_serial" value=""   class="form-control" >
																<span class="text-error small"><?php echo form_error('enter_serial'); ?></span>
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


<script>
$.ajax({
    url: "<?= base_url('sales/salesreturn/get_all_ajax') ?>",
    type: "GET",
    dataType: "json",
    success: function(customers) {
        let select = $("#customer_id");
        select.empty();
        select.append('<option value="">Select</option>');
        customers.forEach(c => {
            select.append(`<option value="${c.id}">${c.name} - ${c.contact_no}</option>`);
        });
        select.trigger('change'); // select2 update
    }
});
$("#customer_id").val(customer_id_from_scan).trigger('change');
</script>

<script>
$(document).on('change', '#customer_id', function () {
    var customer_id = $(this).val();

    $('#invoice_id').html('<option value="">Loading...</option>');

    $.ajax({
        url: "<?= base_url('sales/sreturn/get_invoice_by_customer'); ?>",
        type: "POST",
        data: {customer_id: customer_id},
        dataType: "json",
        success: function (res) {
            $('#invoice_id').html('<option value="">Select Invoice</option>');
            $.each(res, function (i, item) {
                $('#invoice_id').append(
                    '<option value="'+ item.id +'">'+ item.invoice_no +'</option>'
                );
            });
        }
    });
});
</script>
<script>
$(document).on('change', '#invoice_id', function () {
    var invoice_id = $(this).val();

    $('#product_id').html('<option value="">Loading...</option>');

    $.ajax({
        url: "<?= base_url('sales/sreturn/get_products_by_invoice'); ?>",
        type: "POST",
        data: {invoice_id: invoice_id},
        dataType: "json",
        success: function (res) {
            $('#product_id').html('<option value="">Select Product</option>');
            $.each(res, function (i, item) {
                $('#product_id').append(
                    '<option value="'+ item.id +'">'+ item.name +'</option>'
                );
            });
        }
    });
});
</script>
<script>
$(document).on('change', '#product_id', function () {
    var product_id = $(this).val();
    var invoice_id = $('#invoice_id').val();

    $('#serial_list').html('Loading...');

    $.ajax({
        url: "<?= base_url('service/warranty/get_serial_by_product'); ?>",
        type: "POST",
        data: {
            product_id: product_id,
            invoice_id: invoice_id
        },
        dataType: "json",
        success: function (res) {

            $('#serial_list').html('');

            $.each(res, function (i, row) {
                $('#serial_list').append(
                    '<option value="'+ row.value +'">'+ row.label +'</option>'
                );
            });
        }
    });
});
</script>

<script>
$('#enter_serial').on('keyup', function () {
    if ($(this).val().length > 0) {
        $('#serial_list').prop('disabled', true);
    } else {
        $('#serial_list').prop('disabled', false);
    }
});

$('#serial_list').on('change', function () {
    if ($(this).val() !== '') {
        $('#enter_serial').prop('readonly', true);
    } else {
        $('#enter_serial').prop('readonly', false);
    }
});
</script>
