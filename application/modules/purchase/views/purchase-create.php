<style>
.print-btn{
 
  
    padding:10px !important;
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

                                     <div class="col-md-2 mb-2">
																<div class="form-group">
																<label for="invoice_no">Invoice No <span class="text-error"> *</span></label>
									      						<input type="text"  name="invoice_no" id="invoice_no" value="<?= $invoice_no; ?>"   class="form-control" readonly>
																<span class="text-error small"><?php echo form_error('invoice_no'); ?></span>
																</div>
									      					</div>   
                                                             <div class="col-md-2 mb-2">
																<div class="form-group">
																<label for="purchase_date">Purchase Date<span class="text-error"> *</span></label>
									      						<input type="text"  name="purchase_date" id="purchase_date" value=""   class="form-control" >
																<span class="text-error small"><?php echo form_error('purchase_date'); ?></span>
																</div>
									      					</div>     

                                  <div class="col-md-3 mb-3">
                                <div class="form-group">
                                    <label for="supplier_id">Select Supplier</label>
                                    <div class="select_2_container">
                                    <select name="supplier_id" id="supplier_id" class="form-control frm_select select2" required>
                                        <option value="">Select</option>
                                        <?php foreach($allSuplier as $suplier){ ?>
                                            <option value="<?= $suplier->id; ?>">
                                                <?= $suplier->name . ' - ' . $suplier->contact_no; ?>
                                            </option>
                                        <?php } ?>
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                    </div>
                                    <span class="text-error small"><?= form_error('supplier_id'); ?></span>
                                </div>
                                </div>

                                <!-- Brand -->  

                          <div class="col-md-2 mb-3">
                                    <div class="form-group">
                                  <label for="store_id">Receiving Store </label>
                                  <div class="select_2_container">
                                    <select name="store_id"  id="store_id"     class="form-control frm_select select2">
                                                       <?php
                                                                      foreach($allInv as $store){
                                                                        echo "<option value='{$store->id}'>$store->name </option>";
                                                                        }
																?>
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('store_id'); ?>   </span>
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

                          <div class="col-md-5 mb-3">
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

                                <div class="col-md-2 mb-2">
        <div class="form-group">
            <label for="price">Price <span class="text-error"> *</span></label>
            <input type="text" name="price" id="price" value="" class="form-control price" >
        </div>
    </div>

    <div class="col-md-2 mb-2">
        <div class="form-group">
            <label for="qty">Qty <span class="text-error"> *</span></label>
            <input type="text" name="qty" id="qty" value="1" class="form-control qty">
        </div>
    </div>

    <div class="col-md-2 mb-2">
        <div class="form-group">
            <label for="subtotal">Sub Total <span class="text-error"> *</span></label>
            <input type="text" name="subtotal" id="subtotal" value="" class="form-control sub_total" readonly>
        </div>
    </div>

    <div class="col-md-2 mb-2">
        <div class="form-group">
            <label for="sales_price">Unit Sales Price <span class="text-error"> *</span></label>
            <input type="text" name="sales_price" id="sales_price" value="" class="form-control sales_price">
        </div>
    </div>
                                                          <div class="col-md-1 mb-2" id="warrenty_input" style="display:none;">
																<div class="form-group">
																<label for="warrenty">Warrenty <span class="text-error"> *</span></label>
									      						<input type="text"  name="warrenty" id="warrenty" value=""   class="form-control " >
																<span class="text-error small"><?php echo form_error('warrenty'); ?></span>
																</div>
									      					</div>

                                                            <div class="col-md-2 mb-2" id="warrenty_days_input" style="display:none;">
																<div class="form-group">
																<label for="warrenty_days">Warrenty Days <span class="text-error"> *</span></label>
									      						<input type="text"  name="warrenty_days" id="warrenty_days" value=""   class="form-control " >
																<span class="text-error small"><?php echo form_error('warrenty_days'); ?></span>
																</div>
									      					</div>

  <div class="col-md-6 mb-2" id="unique_input" style="display:none;">
																<div class="form-group">
																<label for="item_serial">প্রতি পণ্যে আলাদা সিরিয়াল  <span class="text-error"> *</span></label>
									      						<input type="text"  name="item_serial" id="item_serial" value=""   class="form-control serial_number" >
																<span class="text-error small"><?php echo form_error('item_serial'); ?></span>
																</div>
									      					</div>
                                  
                                   <div class="col-md-6 mb-2"  id="common_input"  style="display:none;">
																<div class="form-group">
																<label for="barcode_serial">একই সিরিয়ালে  একাধিক  পণ্য<span class="text-error"> *</span></label>
									      						<input type="text"  name="barcode_serial" id="barcode_serial" value=""   class="form-control serial_number" >
																<span class="text-error small"><?php echo form_error('barcode_serial'); ?></span>
																</div>
									      					</div>
<input type="hidden" id="invoice_id" name="invoice_id" value="<?php echo date("dmYHis")?>">
                                                           
                                   <!-- Brand -->  
	<div class="row">
                              <div class="col-12">
                                <button type="button" id="addItemBtn" width="100%" class="btn btn_bg">Add to Cart</button>
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
    <tfoot class="table-secondary">
        <tr>
            <td colspan="5" class="text-end fw-bold">Total Quantity:</td>
            <td>
                <input type="number" name="totalOrderAmount" id="totalOrderAmount"
                       class="form-control text-end" readonly>
            </td>
            <td colspan="2"></td>
        </tr>
       <!-- Previous Due -->
                <tr>
                <td colspan="5" class="text-end fw-bold">Previous Due:</td>
                <td>
                    <input type="number" name="previousDue" id="previousDue"
                            class="form-control text-end" readonly>
                </td>
                <td colspan="2"></td>
                </tr>
        <tr>
            <td colspan="5" class="text-end fw-bold">Total Order:</td>
            <td>
                <input type="number" name="totalAmount" id="totalAmount"
                       class="form-control text-end" readonly required>
            </td>
            <td colspan="2"></td>
        </tr>
        <tr>
            <td colspan="5" class="text-end fw-bold">Paid Amount:</td>
            <td>
                <input type="number" name="paidAmount" id="paidAmount"
                       class="form-control text-end" >
            </td>
            <td colspan="2"></td>
        </tr>
        <tr>
            <td colspan="5" class="text-end fw-bold">Payable Amount:</td>
            <td>
                <input type="number" name="dueAmount" id="dueAmount"
                       class="form-control text-end" readonly>
            </td>
            <td colspan="2"></td>
        </tr>
    </tfoot>
</table>

</div>
<div class="row">
                                                                        <div class="col-12 text-end">
                                                                                    <button type="submit"
                                                                                                class="btn btn_bg">Confirm Order</button>
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




                                	

									      				
									      			
									      		
											
                                                                        

                                                                  


                                                                    



                                                            </div>



                                                           
                                                            </div>
                                                </form>
      </div>
    </div>
  </div>
</div>
</div>
</div>


    <!-- Payment  Method -->  

                          <div class="col-md-4 mb-3" style="display:none;">
                                    <div class="form-group">
                                  <label for="payment_method_id">Payment Method</label>
                                  <div class="select_2_container">
                                    <select name="payment_method_id"  id="payment_method_id"     class="form-control frm_select select2">
                                      
                                        <?php foreach($allPayment as $payment): ?>
                        <option value="<?= $payment->id ?>"><?= $payment->name ?></option>
                    <?php endforeach; ?>
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('payment_method_id'); ?>   </span>
                                </div></div>
                                <!-- end Payment Method -->

  <script>

       function calculateTotals() {
             let totalOrder = 0;
             let totalQtyOrder = 0;

            
            $('#itemsTable tbody tr').each(function() {
                let subTotal = parseFloat($(this).find('.sub_total').val()) || 0;
                totalOrder += subTotal;

                //
                let subQty = parseFloat($(this).find('.qty').val()) || 0;
                totalQtyOrder += subQty;
            });

            let totalReceived = parseFloat($('#paidAmount').val()) || 0;
          if (totalReceived > totalOrder) {
        alert("Paid amount cannot exceed the total order amount!");
        totalReceived = totalOrder; // সীমাবদ্ধ করো
        $('#paidAmount').val(totalOrder.toFixed(2));
    }
            // Due = Total Order - Received
            let dueAmount = totalOrder - totalReceived;

            // ফিল্ডগুলো আপডেট করো
            $('#totalOrderAmount').val(totalQtyOrder.toFixed(2));
            $('#totalAmount').val(totalOrder.toFixed(2));
            $('#dueAmount').val(dueAmount.toFixed(2));
        }

        // যখন paid amount পরিবর্তন হবে, due amount অটো আপডেট করো
$('#paidAmount').on('input', function() {
    calculateTotals();
});

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
    var sales_price = parseFloat($('#sales_price').val());
    var serial_number = $('#item_serial').val();
    var barcode_serial = $('#barcode_serial').val();
    var warrenty = $('#warrenty').val();
    var warrenty_days = $('#warrenty_days').val();

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
            sales_price: sales_price,
            warrenty: warrenty,
            warrenty_days: warrenty_days,
            serial_number: serial_number,
            barcode_serial: barcode_serial
        },
       success: function(res){
    if(res.status == 'success'){
        var existingRow = $('#itemsTable tbody tr[data-id="'+res.item.id+'"]');
        if(existingRow.length){
            existingRow.find('.qty').val(res.item.qty);
            existingRow.find('.sub_total').val(res.item.sub_total);
            existingRow.find('.serial_number').val(res.item.serial_number);
             calculateTotals();
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
             // টোটাল হিসাব আপডেট করো
             calculateTotals();
        }

        // reset input fields
        $('#product_id').val('').trigger('change');
        $('#price').val('');
        $('#qty').val(1);
        $('#subtotal').val('');
        $('#item_serial').val('');
        $('#barcode_serial').val('');
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
            if(res.status === 'success'){
                // রো রিমুভ করো
                row.remove();

                // লাইন নম্বর আবার সাজাও
                $('#itemsTable tbody tr').each(function(index){
                    $(this).find('td:first').text(index + 1);
                });

                // ✅ টোটাল রিক্যালকুলেট করো
                calculateTotals();
            } else {
                alert('Error deleting item: ' + res.msg);
            }
        },
        error: function(){
            alert('AJAX error deleting item.');
        }
    });
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
                    $('#warrenty').val(data.warrenty);
                    $('#warrenty_days').val(data.warrenty_days);
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

                    if (data.warrenty > 0) {
                        $("#warrenty_input").slideDown();
                        $("#warrenty_days_input").slideDown();
                    }else{
                        $("#warrenty_input").slideUp();
                        $("#warrenty_days_input").slideUp();
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
        var qty = $('#qty').val();
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




 <script>
    $(document).ready(function() {
   

   $("#purchase_date").datepicker({
  dateFormat: "dd-mm-yy",
  changeMonth: true,
  changeYear: true,
  yearRange: "1900:2100",
});


// Set a default date (e.g., today's date)
var today = $.datepicker.formatDate("dd-mm-yy", new Date());
$("#purchase_date,.to_date").val(today);

  });



     
    </script>

<script>
$(document).ready(function() {
    $('#supplier_id').on('change', function() {
        var supplier_id = $(this).val();

        if(supplier_id != '') {
            $.ajax({
                url: '<?= base_url("purchase/get_supplier_balance"); ?>', // controller path
                type: 'POST',
                dataType: 'json',
                data: { supplier_id: supplier_id },
                success: function(response) {
                    $('#previousDue').val(response.balance);
                },
                error: function() {
                    alert('Something went wrong while fetching balance.');
                }
            });
        } else {
            $('#previousDue').val('');
        }
    });
});
</script>

