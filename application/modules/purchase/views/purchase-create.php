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
            <h3>Add New  Purchase</h3>
          </div>
          <div class="col-auto ms-auto">
            <!-- Button trigger modal -->
               <div class="right">
                 <?php if (has_permission('products', 'index')): ?>
                <a type="button" href="<?php echo base_url(); ?>purchase" class="btn btn_bg" >
                    <i class="fa-solid fa-list"></i> Purchase List
                </a>
                   <?php endif; ?>
            </div>

          </div>
        </div>
        <div class="row">
          <div class="col-12">
                <form  action="<?php echo base_url(); ?>purchase/create" method="post" enctype="multipart/form-data">
                                                            <div class="row mb-3">

                                     <div class="col-md-3 mb-2">
																<div class="form-group">
																<label for="name">Invoice No <span class="text-error"> *</span></label>
									      						<input type="text"  name="name" id="name" value="GRN-2511001"   class="form-control" >
																<span class="text-error small"><?php echo form_error('name'); ?></span>
																</div>
									      					</div>   
                                                             <div class="col-md-3 mb-2">
																<div class="form-group">
																<label for="name">Purchase Date<span class="text-error"> *</span></label>
									      						<input type="text"  name="name" id="name" value="05-11-2025"   class="form-control" >
																<span class="text-error small"><?php echo form_error('name'); ?></span>
																</div>
									      					</div>     

                                   <div class="col-md-3 mb-3">
                                    <div class="form-group">
                                  <label for="supplier_id">Select Supplier</label>
                                  <div class="select_2_container">
                                    <select name="supplier_id"  id="supplier_id"     class="form-control frm_select select2">
                                       <option  value="">  Select  </option>
                                                       <?php
                                                                        foreach($allCat as $cat){
                                                                        echo "<option value='{$cat->id}'>$cat->name </option>";
                                                                        }
																?>
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                   <span class="text-error small"> <?php echo form_error('supplier_id'); ?>   </span>
                                </div></div>

                                <!-- Brand -->  

                          <div class="col-md-3 mb-3">
                                    <div class="form-group">
                                  <label for="store">Receiving Store </label>
                                  <div class="select_2_container">
                                    <select name="store"  id="store"     class="form-control frm_select select2">
                                       <option  value="">  Select  </option>
                                                       <?php
                                                                      foreach($allBrand as $bnd){
                                                                        echo "<option value='{$bnd->id}'>$bnd->name </option>";
                                                                        }
																?>
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('store'); ?>   </span>
                                </div></div>
                                <!-- end Brand -->
                                 
                                   <!-- Brand -->  

                          <div class="col-md-3 mb-3">
                                    <div class="form-group">
                                  <label for="group_id">Product Group </label>
                                  <div class="select_2_container">
                                    <select name="group_id"  id="group_id"     class="form-control frm_select select2">
                                       <option  value="">  Select  </option>
                                                      <?php
                              foreach($allCat as $cat){
                                  echo "<option value='{$cat->id}'>$cat->name </option>";
                              }
                              ?>
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('group_id'); ?>   </span>
                                </div></div>
                                <!-- end Brand -->
                                  <!-- Brand -->  

                          <div class="col-md-3 mb-3">
                                    <div class="form-group">
                                  <label for="product_id">Product Name </label>
                                  <div class="select_2_container">
                                    <select name="product_id"  id="product_id"     class="form-control frm_select select2">
                                       <option  value="">  Select  </option>
                                     <?php foreach($allPro as $pro): ?>
                    <option value="<?= $pro->id ?>" data-price="<?= $pro->price ?>"><?= $pro->name ?></option>
                <?php endforeach; ?>
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('product_id'); ?>   </span>
                                </div></div>
                                <!-- end Brand -->

                                <div class="col-md-3 mb-2">
        <div class="form-group">
            <label for="price">Price <span class="text-error"> *</span></label>
            <input type="text" name="price" id="price" value="" class="form-control price" >
        </div>
    </div>

    <div class="col-md-3 mb-2">
        <div class="form-group">
            <label for="qty">Qty <span class="text-error"> *</span></label>
            <input type="text" name="qty" id="qty" value="1" class="form-control qty">
        </div>
    </div>

    <div class="col-md-3 mb-2">
        <div class="form-group">
            <label for="subtotal">Sub Total <span class="text-error"> *</span></label>
            <input type="text" name="subtotal" id="subtotal" value="" class="form-control sub_total" readonly>
        </div>
    </div>

    <div class="col-md-3 mb-2">
        <div class="form-group">
            <label for="sales_price">Unit Sales Price <span class="text-error"> *</span></label>
            <input type="text" name="sales_price" id="sales_price" value="" class="form-control sales_price">
        </div>
    </div>

  <div class="col-md-6 mb-2" id="unique_input" style="display:none;">
																<div class="form-group">
																<label for="item_serial3">প্রতি পণ্যে আলাদা সিরিয়াল  <span class="text-error"> *</span></label>
									      						<input type="text"  name="item_serial3" id="item_serial3" value=""   class="form-control serial_number" >
																<span class="text-error small"><?php echo form_error('item_serial'); ?></span>
																</div>
									      					</div>
                                  
                                   <div class="col-md-6 mb-2"  id="common_input"  style="display:none;">
																<div class="form-group">
																<label for="item_serial">একই সিরিয়ালে  একাধিক  পণ্য<span class="text-error"> *</span></label>
									      						<input type="text"  name="item_serial" id="item_serial" value=""   class="form-control serial_number" >
																<span class="text-error small"><?php echo form_error('item_serial'); ?></span>
																</div>
									      					</div>
                                   <!-- Brand -->  
	<div class="row">
                              <div class="col-12">
                                <button type="button" id="addItemBtn" class="btn btn_bg">Add items</button>
                              </div>
                          </div><br><br><br>

                           <div class="card">
    <div class="card-header bg-light">Lines</div>
    <div class="card-body">

    
      
    <div class="table-responsive">
<table class="table table-bordered" id="itemsTable">
    <thead>
        <tr>
            <th>Line#</th>
            <th>Product Name <span class="text-danger">*</span></th>
            <th>Quantity</th>
            <th>Rate</th>
            <th>UoM</th>
            <th>Sub Total</th>
            <th>Item Serials / Lot</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <!-- rows will append here -->
    </tbody>
</table>

</div>

     	<div class="row">
									      					<div class="col-12">
									      		  
									      					</div>
									      				</div>
    </div>
  </div>

  
											</div>
											</div>
										</div>
									</div>

<input type="hidden" id="invoice_id" value="<?php echo date("dmYHis")?>">


                                	

									      				
									      			
									      		
											
                                                                        

                                                                      


                                                                    



                                                            </div>



                                                            <div class="row">
                                                                        <div class="col-12">
                                                                                    <button type="submit"
                                                                                                class="btn btn_bg">Save</button>
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
                      // Auto update price and subtotal when product changes
$('#product_id').change(function(){
    var price = $(this).find(':selected').data('price') || 0;
    $('#price').val(price);
    var qty = parseFloat($('#qty').val()) || 1;
    $('#subtotal').val((price * qty).toFixed(2));
});

// Update subtotal when qty changes
$('#qty').on('input', function(){
    var price = parseFloat($('#price').val()) || 0;
    var qty = parseFloat($(this).val()) || 1;
    $('#subtotal').val((price * qty).toFixed(2));
});
// Example: assume invoice_id is generated when creating invoice
var invoice_id =  $('#invoice_id').val();

$('#addItemBtn').on('click', function() {
    var invoice_id = $('#invoice_id').val();
    var product_id = $('#product_id').val();
    var product_name = $('#product_id option:selected').text();
    var price = parseFloat($('#price').val());
    var qty = parseInt($('#qty').val());
    var sub_total = parseFloat($('#subtotal').val());
    var serial_number = $('#item_serial').val();

    if(!product_id){
        alert("Select a product!");
        return;
    }

    $.ajax({
        url: '<?= base_url("purchase/add_item_ajax") ?>',
        type: 'POST',
        dataType: 'json',
        data: {
            invoice_id: invoice_id,
            product_id: product_id,
            price: price,
            qty: qty,
            sub_total: sub_total,
            serial_number: serial_number
        },
       success: function(res){
    if(res.status == 'success'){
        var existingRow = $('#itemsTable tbody tr[data-id="'+res.item.id+'"]');
        if(existingRow.length){
            existingRow.find('.qty').val(res.item.qty);
            existingRow.find('.sub_total').val(res.item.sub_total);
            existingRow.find('.serial_number').val(res.item.serial_number);
        } else {
            var newRow = '<tr data-id="'+res.item.id+'">'+
                '<td>'+($('#itemsTable tbody tr').length+1)+'</td>'+
                '<td>'+res.item.product_name+'</td>'+
                '<td><input type="number" class="qty form-control" value="'+res.item.qty+'" readonly></td>'+
                '<td><input type="number" class="price form-control" value="'+res.item.price+'" readonly></td>'+
                '<td>'+res.item.unit_name+'</td>'+
                '<td><input type="number" class="sub_total form-control" value="'+res.item.sub_total+'" readonly></td>'+
                '<td><textarea class="serial_number form-control" readonly>'+res.item.serial_number+'</textarea></td>'+
                '<td><button type="button" class="btn  btn-sm btn-outline-danger removeItem">✖</button></td>'+
            '</tr>';
            $('#itemsTable tbody').append(newRow);
        }

        // reset input fields
        $('#product_id').val('').trigger('change');
        $('#price').val('');
        $('#qty').val(1);
        $('#subtotal').val('');
        $('#item_serial').val('');
    } else {
        alert('Error saving item: '+res.msg);
    }
},
        error: function(){
            alert('AJAX error!');
        }
    });
});


$(document).on('click', '.removeItem', function(){
    if(!confirm('Are you sure to remove this item?')) return;

    var row = $(this).closest('tr');
    var item_id = row.data('id');

    $.ajax({
        url: '<?= base_url("purchase/delete_item_ajax") ?>',
        method: 'POST',
        data: { item_id: item_id },
        dataType: 'json',
        success: function(res){
            if(res.status == 'success'){
                row.remove();
                // Optional: re-number line#
                $('#itemsTable tbody tr').each(function(index){
                    $(this).find('td:first').text(index+1);
                });
            } else {
                alert('Error deleting item: '+res.msg);
            }
        },
        error: function(){
            alert('AJAX error deleting item.');
        }
    });
});

// Remove row
$(document).on('click', '.removeRow', function(){
    $(this).closest('tr').remove();
});

</script>
<script>
$(document).ready(function() {
    // When Product Name changes
    $('#product_id').change(function() {
        var product_id = $(this).val();  // Get selected product id

        if (product_id) {
            $.ajax({
                url: '<?php echo base_url("purchase/get_product_details"); ?>',  // AJAX URL
                type: 'POST',
                data: {product_id: product_id},
                success: function(response) {
                    var data = JSON.parse(response);  // Parse JSON response
                    
                    // Populate Price, Sales Price, Sub Total
                    $('#price').val(data.price);
                    $('#sales_price').val(data.sales_price);
                    $('#subtotal').val(data.price * $('#qty').val());  // Subtotal = Price * Qty

                    // Check serial_type and update Qty field accordingly
                    if (data.serial_type === 'common') {
                        $('#qty').prop('readonly', false);  // Make Qty editable
                        $('#qty').val(1);  // Default value for common serial type
                        $("#common_input").slideDown();
                        $("#unique_input").slideUp();
                    } else if (data.serial_type === 'unique') {
                        $('#qty').prop('readonly', true);  // Make Qty readonly
                        $('#qty').val(1);  // Set Qty to 1 for unique serial type
                        $("#unique_input").slideDown();
                        $("#common_input").slideUp();
                    }
                }
            });
        } else {
            // Reset fields if no product selected
            $('#price').val('');
            $('#sales_price').val('');
            $('#subtotal').val('');
            $('#qty').val(1).prop('readonly', false);  // Default Qty to 1 and editable
        }
    });

    // Update subtotal when qty changes
    $('#qty').on('input', function() {
        var qty = $(this).val();
        var price = $('#price').val();
        $('#subtotal').val(qty * price);
    });

      $('#price').on('input', function() {
        var price = $(this).val();
        var qty = $('#price').val();
        $('#subtotal').val(qty * price);
    });
});
</script>

<script>
$(document).ready(function() {
  
    $('#group_id').change(function() {
        var group_id = $(this).val();  

        if(group_id) {
            $.ajax({
                url: '<?php echo base_url("purchase/get_products_by_group"); ?>',  
                type: 'POST',
                data: {group_id: group_id},
                success: function(response) {
                    $('#product_id').html(response);
                }
            });
        } else {
            $('#product_id').html('<option value="">Select</option>');
        }
    });
});
</script>
<script>
$(document).ready(function () {

    // ✅ Purchase price টাইপ করলে মোট Amount আপডেট হবে
    $(document).on('keyup', '#purchase_price', function () {
        let cost = parseFloat($(this).val()) || 0;
        $("#total_amount").val(cost.toFixed(2));
    });

    // ✅ Product Tax টাইপ করলে ট্যাক্স ও টোটাল হিসাব হবে
    $(document).on('keyup', '#product_tax', function () {
        let taxPercent = parseFloat($(this).val()) || 0;
        let price = parseFloat($("#purchase_price").val()) || 0;

        let taxAmount = price * taxPercent / 100;
        let total = price + taxAmount;

        $("#product_tax_amount").val(taxAmount.toFixed(2));
        $("#total_amount").val(total.toFixed(2));
    });

    // ✅ Tax Method পরিবর্তন হলে ট্যাক্স ফিল্ড show/hide হবে
    $('#tax_method').on('change', function() {
        let method = $(this).val();

        if (method === "Exclusive") {
            $(".product_tax_display").slideDown(); // smooth animation
        } else {
            $(".product_tax_display").slideUp();
            $("#product_tax").val('');
            $("#product_tax_amount").val('0.00');
            $("#total_amount").val($("#purchase_price").val());
        }
    });

});
</script>


		<script> 

             $(".random_num").click(function() {
                $("#product_code").val(Math.floor(Math.random() * 100000000) );
            });



		</script> 




