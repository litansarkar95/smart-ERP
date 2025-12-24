<style>
.print-btn{
 
  
    padding:10px !important;
}
  </style>
<div class="container-fluid">





  <div class="row px-3">
    <div class="col-12">
      <div class="content">
        <div class="row">
          <div class="col-auto">
           <h3>Create Products  Print Labels</h3>
          </div>
          <div class="col-auto ms-auto">
            <!-- Button trigger modal -->
            

          </div>
        </div>
        <div class="row">
          <div class="col-12">
                <form  action="<?php echo base_url(); ?>products/barcode/print_barcode" target="_blank" method="post" enctype="multipart/form-data">
                                                            <div class="row mb-3">

                                             

                                <div class="col-md-5 ">
                                                                                            <div class="form-group">
                                                                                        <label for="product_id">Select Product  </label>
                                                                                        <div class="select_2_container">
                                                                                            <select name="product_id"  id="product_id"     class="form-control frm_select select2">
                                                                                            <option  value="">  Select Product </option>
                                                                                           <?php foreach ($allPro as $pro): ?>
                                                                                                    <option value="<?= $pro->id ?>"  data-type="<?= $pro->serial_type ?>">
                                                                                                        
                                                                                                        <?= $pro->product_name ?>  
                                                                                                        — <span class="group-name" style="color:red;">(<?= $pro->group_name ?>)</span> 
                                                                                                        — <span class="stock-count">Stock: <?= $pro->available_stock ?> </span>
                                                                                                        — <span class="price-tag">Price: <?= number_format($pro->sales_price,2) ?></span>

                                                                                                    </option>
                                                                                                <?php endforeach; ?>
                                                                                            </select>
                                                                                            <i class="fas fa-caret-down"></i>
                                                                                        </div>
                                                                                        <span class="text-error small"> <?php echo form_error('product_id'); ?>   </span>
                                                                                        </div></div>

                                <!-- Brand -->  

                          <div class="col-md-3 mb-3">
                                    <div class="form-group">
                                 <label>Batch or Item Serial No</label>
                                  <div class="select_2_container">
                                    <select name="item_ref"  id="item_ref"     class="form-control frm_select select2">
                                    <option value="">Select Batch / Serial</option>
                                    
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('item_ref'); ?>   </span>
                                </div></div>
                              
                                  <!-- start input -->
                        
                                   <!-- Brand -->  
  <!-- end Brand -->
                                   <div class="col-md-3 mb-3">
                                                        <div class="form-group">
                                                            <label for="print_qty">Print Quantity<span class="text-error">*</span></label>
                                                            
                                                            <div class="input-group">
                                                            <input type="text" name="print_qty" id="print_qty" 
                                                                    value="<?php echo set_value('print_qty'); ?>" 
                                                                    class="form-control" placeholder="Enter product code">
                                                            
                                                            <span class="input-group-text pointer random_num" id="random_num" style="cursor:pointer;">
                                                                <i class="fa fa-random"></i>
                                                            </span>
                                                            </div>

                                                            <span class="text-error small"><?php echo form_error('print_qty'); ?></span>
                                                        </div>
                                                        </div>
                                                        <div class="col-md-3 mb-3">
                        <div class="form-check mb-3">
                  <input class="form-check-input" type="checkbox" value="1" name="show_price" id="show_price" checked>
                  <label class="form-check-label" for="show_price">
                      Show Price
                  </label>
              </div></div>


                          <div class="col-md-3 mb-3">
                                    <div class="form-group">
                                  <label for="paper_size">Paper size</label>
                                  <div class="select_2_container">
                                    <select name="paper_size"  id="paper_size"     class="form-control frm_select select2">
                                     <option value="a4_40">A4 (40 Labels)</option>
                                    <option value="a4_24">A4 (24 Labels)</option>
                                    <option value="a4_21">A4 (21 Labels)</option>
                                    <option value="single">Single Label</option>

                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('paper_size'); ?>   </span>
                                </div></div>
                              
                                  <!-- start input -->
                                
                                                                       

                                  <!-- start input -->
                                 
                                                            </div>



                                                            <div class="row">
                                                                        <div class="col-12">
                                                                                    <button type="submit"
                                                                                                class="btn btn_bg">Print</button>
                                                                        </div>
                                                            </div>
                                                </form>
      </div>
    </div>
  </div>
</div>
</div>
</div>

<script>
$('#product_id').on('change', function () {
    let productId = $(this).val();
    let serialType = $('#product_id option:selected').data('type');

    $('#item_ref').html('<option>Loading...</option>');
    $('#print_qty').val(1).prop('disabled', false);

    if (!productId) return;

    $.ajax({
        url: "<?= base_url('products/barcode/get_product_stock') ?>",
        type: "POST",
        dataType: "json",
        data: { product_id: productId },
        success: function (res) {

            let options = '<option value="">Select</option>';

            if (serialType === 'unique') {
                res.items.forEach(item => {
                    options += `<option value="${item.serial}">
                        Serial: ${item.serial}
                    </option>`;
                });

                // unique → qty always 1
                $('#print_qty').val(1).prop('disabled', true);

            } else {
                res.items.forEach(item => {
                    options += `<option value="${item.batch_number}">
                        Batch: ${item.batch_number} (Qty: ${item.quanity})
                    </option>`;
                });
            }

            $('#item_ref').html(options).trigger('change');
        }
    });
});
</script>










