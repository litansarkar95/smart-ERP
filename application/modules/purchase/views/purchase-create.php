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
                    <option value="<?= $pro->id ?>" ><?= $pro->name ?></option>
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

    <div class="col-md-1 mb-2">
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
            <label for="rebate"> Rebate</label>
            <input type="text" name="rebate" id="rebate" value="0" class="form-control rebate">
        </div>
    </div>
    <div class="col-md-2 mb-2">
        <div class="form-group">
            <label for="total_rebate">Total Rebate</label>
            <input type="text" name="total_rebate" id="total_rebate" value="0" class="form-control total_rebate" readonly>
        </div>
    </div>

    <div class="col-md-2 mb-2">
        <div class="form-group">
            <label for="sales_price">Unit Sales Price </label>
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

                                                            <div class="col-md-4 mb-2" id="unique_input" style="display:none;">
																<div class="form-group">
																<label for="item_serial">প্রতি পণ্যে আলাদা সিরিয়াল  <span class="text-error"> *</span></label>
									      						<input type="text"  name="item_serial" id="item_serial" value=""   class="form-control serial_number" >
																<span class="text-error small"><?php echo form_error('item_serial'); ?></span>
																</div>
									      					</div>

                                                              <div class="col-md-4 mb-2"  id="common_input"  style="display:none;">
																<div class="form-group">
																<label for="barcode_serial">একই সিরিয়ালে  একাধিক  পণ্য<span class="text-error"> *</span></label>
									      						<input type="text"  name="barcode_serial" id="barcode_serial" value=""   class="form-control serial_number" autofocus>
																<span class="text-error small"><?php echo form_error('barcode_serial'); ?></span>
																</div>
									      					</div>
                                                            
                                                              <div class="col-md-2 mb-2"  id="remarks"  >
																<div class="form-group">
																<label for="remarks">Remarks</label>
									      						<textarea type="text"  name="remarks" id="remarks" value=""   class="form-control remarks" ></textarea>
																<span class="text-error small"><?php echo form_error('remarks'); ?></span>
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
            <th>Price</th>
            <th>Rebate</th>
            <th>Unit</th>
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
        <div class="col-md-1 mb-2">
        <div class="form-group">
            <label for="previousDue">Previous Due </label>
            <input type="text" name="previousDue" id="previousDue" value="" class="form-control previousDue" >
        </div>
    </div>
    <div class="col-md-2 mb-2">
        <div class="form-group">
            <label for="totalOrderAmount">Total Order </label>
            <input type="text" name="totalOrderAmount" id="totalOrderAmount" value="" class="form-control totalOrderAmount" >
        </div>
    </div>


    <div class="col-md-1 mb-2">
        <div class="form-group">
            <label for="subtotalAmount">Sub Total </label>
            <input type="text" name="subtotalAmount" id="subtotalAmount" value="" class="form-control price" >
        </div>
    </div>

     <div class="col-md-1 mb-2">
        <div class="form-group">
            <label for="totalRebate">Total Rebate  </label>
            <input type="text" name="totalRebate" id="totalRebate" value="" class="form-control totalRebate" >
        </div>
    </div>

     <div class="col-md-2 mb-2">
        <div class="form-group">
            <label for="totalAmount"> Total </label>
            <input type="text" name="totalAmount" id="totalAmount" value="" class="form-control " >
        </div>
    </div>

    <div class="col-md-1 mb-2">
        <div class="form-group">
            <label for="totaldiscount"> Discount </label>
            <input type="text" name="totaldiscount" id="totaldiscount" value="" class="form-control " >
        </div>
    </div>

    <div class="col-md-2 mb-2">
        <div class="form-group">
            <label for="dueAmount">Payable Amount </label>
            <input type="text" name="dueAmount" id="dueAmount" value="" class="form-control dueAmount" >
        </div>
    </div>

    
    <div class="col-md-2 mb-2">
        <div class="form-group">
            <label for="paidAmount">Paid Amount </label>
            <input type="text" name="paidAmount" id="paidAmount" value="" class="form-control paidAmount" >
        </div>
    </div>

                      
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

<div class="modal fade" id="editModal">
  <div class="modal-dialog">
    <div class="modal-content">
      
      <div class="modal-header">
        <h5 class="modal-title">Edit Item</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body">

        <input type="hidden" id="edit_row_id">

        <div class="mb-2">
            <label>Price</label>
            <input type="number" id="edit_price" class="form-control">
        </div>

        <div class="mb-2">
            <label>Rebate</label>
            <input type="number" id="edit_rebate" class="form-control">
        </div>

        <div class="mb-2">
            <label>Serial Number</label>
            <textarea id="edit_serial" class="form-control"></textarea>
        </div>

      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-primary updateItem">Update</button>
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
             let totalRebateOrder = 0;

            
            $('#itemsTable tbody tr').each(function() {
                let subTotal = parseFloat($(this).find('.sub_total').val()) || 0;
                totalOrder += subTotal;

                //
                let subQty = parseFloat($(this).find('.qty').val()) || 0;
                totalQtyOrder += subQty;

                let subrebate = parseFloat($(this).find('.total_rebate').val()) || 0;
                totalRebateOrder += subrebate;
            });

            let totalReceived = parseFloat($('#paidAmount').val()) || 0;
          if (totalReceived > totalOrder) {
        alert("Paid amount cannot exceed the total order amount!");
        totalReceived = totalOrder; // সীমাবদ্ধ করো
        $('#paidAmount').val(totalOrder.toFixed(2));
    }
          
            //
           let submtotal = totalOrder-totalRebateOrder;

             // Due = Total Order - Received
            let dueAmount = submtotal - totalReceived;

            // ফিল্ডগুলো আপডেট করো
            $('#totalOrderAmount').val(totalQtyOrder.toFixed(2));
            $('#totalRebate').val(totalRebateOrder.toFixed(2));
            $('#subtotalAmount').val(totalOrder.toFixed(2));
            $('#totalAmount').val(submtotal.toFixed(2));
            $('#dueAmount').val(dueAmount.toFixed(2));
        }

$('#paidAmount').on('input', function() {
    calculateTotals();
});

//discount
$('#totaldiscount').on('input', function() {
       var total =  $('#totalAmount').val();
      var discount = parseFloat($(this).val()) || 0;
    var price = total - discount;
      $('#dueAmount').val(price);
    
});

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
    var rebate = parseFloat($('#rebate').val()) || 0;
    $('#subtotal').val((price * qty).toFixed(2));
    $('#total_rebate').val((rebate * qty).toFixed(2));
});

// Update total_rebate when qty changes
$('#rebate').on('input', function(){
    var rebate = parseFloat($('#rebate').val()) || 0;
    var qty = parseFloat($('#qty').val()) || 1;
    $('#total_rebate').val((rebate * qty).toFixed(2));
});
// Example: assume invoice_id is generated when creating invoice
var invoice_id =  $('#invoice_id').val();


$('#addItemBtn').on('click', function() {
    var invoice_id = $('#invoice_id').val();
    var product_id = $('#product_id').val();
    var product_name = $('#product_id option:selected').text();
    var price          = parseFloat($('#price').val())          || 0;
    var qty            = parseInt($('#qty').val())              || 1;
    var sub_total      = parseFloat($('#subtotal').val())       || 0;
    var rebate         = parseFloat($('#rebate').val())         || 0;
    var total_rebate   = parseFloat($('#total_rebate').val())   || 0;
    var sales_price    = parseFloat($('#sales_price').val())    || 0;
    var serial_number  = $('#item_serial').val()                || "";
    var barcode_serial = $('#barcode_serial').val()             || "";
    var warrenty       = $('#warrenty').val()                   || 0;
    var warrenty_days  = $('#warrenty_days').val()              || 0;


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
            total_rebate: total_rebate,
            rebate: rebate,
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
                '<td><input type="number" class="total_rebate form-control" value="'+res.item.total_rebate+'" readonly></td>'+
                '<td>'+res.item.unit_name+'</td>'+
                '<td><input type="number" class="sub_total form-control" value="'+res.item.sub_total+'" readonly></td>'+
                '<td><textarea class="serial_number form-control" readonly>'+res.item.serial_number+'</textarea></td>'+
                 '<td>' +
                '<button type="button" class="btn btn-sm btn-info editItem">✎</button> ' + 
                '<button type="button" class="btn btn-sm btn-outline-danger removeItem">✖</button>' +
            '</td>'+
            '</tr>';
            $('#itemsTable tbody').append(newRow);
             // টোটাল হিসাব আপডেট করো
             calculateTotals();
        }

        //start show
        	iziToast.success({
				//title: 'Success',
				message: 'Add to cart Success !',
				position: 'topRight'
				});

        //end show 

        // reset input fields
       // $('#product_id').val('').trigger('change');
        // $('#price').val('');
        // $('#qty').val(1);
        // $('#subtotal').val('');
        // $('#item_serial').val('');
         $('#rebate').val('');
         $('#total_rebate').val('');
         //$('#barcode_serial').val('');
    } else {
        iziToast.error({
				// title: 'Error',
				message: 'Error saving item: !'+res.msg ,
				position: 'topRight'
				});
       // alert('Error saving item: '+res.msg);
    }
},error: function(){
            alert('AJAX error!');
        }
    });
});

let lastTime = 0;
let fastCount = 0;   // দ্রুত input গোনা হবে
let scanTimer;

$('#barcode_serial, #item_serial').on('input', function(){

    let inputField = $(this);
    let now = Date.now();

    let delta = now - lastTime;
    lastTime = now;

    if(delta < 40){
        fastCount++;
    } else {
        fastCount = 0; // টাইপ করলে reset
    }

    if(fastCount >= 5){

        clearTimeout(scanTimer);

        scanTimer = setTimeout(function(){
            // স্ক্যান নিশ্চিত!
            inputField.trigger('scan');
            fastCount = 0;
        }, 10);
    }
});

// এখন scan event handle করুন
$('#barcode_serial, #item_serial').on('scan', function(){
    let inputField = $(this);

    $('#addItemBtn').click(); // Auto Add

    inputField.val('');
    inputField.focus();
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
                row.remove();

                $('#itemsTable tbody tr').each(function(index){
                    $(this).find('td:first').text(index + 1);
                });

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
                      //  $('#qty').prop('readonly', false);  // Make Qty editable
                        $('#qty').val(1);  // Default value for common serial type
                        $("#common_input").slideDown();
                        $("#unique_input").slideUp();
                    } else if (data.serial_type === 'unique') {
                      //  $('#qty').prop('readonly', true);  // Make Qty readonly
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

    $(document).on('keyup', '#purchase_price', function () {
        let cost = parseFloat($(this).val()) || 0;
        $("#total_amount").val(cost.toFixed(2));
    });

    $(document).on('keyup', '#product_tax', function () {
        let taxPercent = parseFloat($(this).val()) || 0;
        let price = parseFloat($("#purchase_price").val()) || 0;

        let taxAmount = price * taxPercent / 100;
        let total = price + taxAmount;

        $("#product_tax_amount").val(taxAmount.toFixed(2));
        $("#total_amount").val(total.toFixed(2));
    });

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
    document.getElementById('barcode_serial').focus();
    document.getElementById('item_serial').focus();
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



$(document).on('click', '.editItem', function(){

    let row = $(this).closest('tr');

    $('#edit_row_id').val(row.data('id'));
    $('#edit_price').val(row.find('.price').val());
    $('#edit_rebate').val(row.find('.total_rebate').val());
    $('#edit_serial').val(row.find('.serial_number').val());

    $('#editModal').modal('show');
});

</script>
<script>
$('.updateItem').on('click', function(){

    let id = $('#edit_row_id').val();
    let price = parseFloat($('#edit_price').val()) || 0;
    let rebate = parseFloat($('#edit_rebate').val()) || 0;
    let serial = $('#edit_serial').val();

    $.ajax({
        url: "<?= base_url('purchase/update_item_ajax') ?>",
        type: "POST",
        dataType: "json",
        data: {
            id: id,
            price: price,
            rebate: rebate,
            serial_number: serial
        },
        success: function(res){

            if(res.status === "success"){

                // Update table row without refresh
                let row = $('#itemsTable tbody tr[data-id="'+id+'"]');
                row.find('.price').val(price);
                row.find('.total_rebate').val(rebate);
                row.find('.serial_number').val(serial);

                let qty = parseFloat(row.find('.qty').val());
                let sub_total = (price * qty) - rebate;
                if(sub_total < 0) sub_total = 0;

                row.find('.sub_total').val(sub_total);

                calculateTotals();

                $('#editModal').modal('hide');

                iziToast.success({
                    message: 'Item updated!',
                    position: 'topRight'
                });
            }
        }
    });
});

</script>