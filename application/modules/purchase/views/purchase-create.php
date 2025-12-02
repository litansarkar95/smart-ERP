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

                                  

                                 <div class="col-md-3 ">
                                <div class="form-group">
                                    <label for="supplier_id">Select Supplier</label>
                                    <div class="select_2_container">
                                   <select name="supplier_id" id="supplier_id" class="form-control frm_select select2" required>
                                    <option value="">Select</option>
                                    <?php foreach($allSuplier as $customer){ ?>
                                        <option value="<?= $customer->id; ?>" 
                                            <?= ($customer->name=='Cash') ? 'selected' : '' ?>>
                                            <?= $customer->name . ' - ' . $customer->contact_no; ?>
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
																<label for="item_serial">প্রতি পণ্যে আলাদা সিরিয়াল” (Unique Serial per Item)  <span class="text-error"> *</span></label>
									      						<input type="text"  name="item_serial" id="item_serial" value=""   class="form-control serial_number" >
																<span class="text-error small"><?php echo form_error('item_serial'); ?></span>
																</div>
									      					</div>

                                                              <div class="col-md-4 mb-2"  id="common_input"  style="display:none;">
																<div class="form-group">
																<label for="barcode_serial">ব্যাচ নম্বর ( Batch Number) <span class="text-error"> *</span></label>
									      						<input type="text"  name="barcode_serial" id="barcode_serial" value=""   class="form-control serial_number" autofocus>
																<span class="text-error small"><?php echo form_error('barcode_serial'); ?></span>
																</div>
									      					</div>
                                                            <div class="col-md-4 mb-2" id="common_extra" style="display:none;">
                                                                <div class="row">
                                                                <div class="col-md-6 mb-2">
                                                               <div class="form-group">
                                                                    <label>Last Purchase Price</label>
                                                                    <input type="text" id="last_purchase_price" class="form-control" readonly>
                                                                </div></div>
                                                                   <div class="col-md-6 mb-2">
                                                                <div class="form-group">
                                                                    <label>Last Batch Number</label>
                                                                    <textarea id="last_barcode_serial" class="form-control" rows="2" readonly></textarea>
                                                                </div>
                                                                </div>
                                                            </div></div>

                                                            
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
            <div class="col-md-2 mb-2">
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


     <div class="col-md-2 mb-2">
        <div class="form-group">
            <label for="subtotalAmount">Sub Total </label>
            <input type="text" name="subtotalAmount" id="subtotalAmount" value="" class="form-control price" >
        </div>
    </div>

      <div class="col-md-2 mb-2">
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

     <div class="col-md-2 mb-2">
        <div class="form-group">
            <label for="totaldiscount"> Discount </label>
            <input type="text" name="totaldiscount" id="totaldiscount" value="0" class="form-control " >
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
            <label for="payment_method_id">Payment Method</label>
                                  <div class="select_2_container">
                                    <select name="payment_method_id"  id="payment_method_id"     class="form-control frm_select select2">
                                      
                                        <?php foreach($allPayment as $payment): ?>
                                        <option value="<?= $payment->id ?>"><?= $payment->name ?></option>
                                    <?php endforeach; ?>
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
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



<div class="modal fade" id="editBatchModal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">

      <!-- Header -->
      <div class="modal-header">
        <h5 class="modal-title">Edit Item</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Body -->
      <div class="modal-body">

        <input type="hidden" id="edit_batch_row_id">

        <!-- Price -->
        <div class="mb-2">
            <label>Price</label>
            <input type="number" id="edit_batch_price" class="form-control">
        </div>
         <!-- Price -->
        <div class="mb-2">
            <label>Qty</label>
            <input type="number" id="edit_batch_qty" class="form-control">
        </div>

        <!-- Rebate -->
        <div class="mb-2">
            <label>Total Rebate</label>
            <input type="number" id="edit_batch_rebate" class="form-control">
        </div>

        <!-- Serial List Table -->
         <div class="mb-2">
            <label>Barcode</label>
            <input type="text" id="edit_batch" class="form-control">
        </div>

      </div> <!-- modal-body end -->

      <!-- Footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-success" id="updateItemBtn">Update</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
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
    <label>Serial Numbers</label>
    <table class="table table-bordered table-sm" id="serial_list_container">
        <thead>
            <tr>
                <th>#</th>
                <th>Serial Number</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <!-- Serial rows will be injected here via JS -->
        </tbody>
    </table>
</div>


      </div>

      <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

    <!-- Payment  Method -->  

                     

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

             let discount = parseFloat($('#totaldiscount').val()) || 0;

             let distotalOrder = totalOrder - discount;

            let totalReceived = parseFloat($('#paidAmount').val() ) || 0;

           

          if (totalReceived > totalOrder) {
        alert("Paid amount cannot exceed the total order amount!");
        totalReceived = distotalOrder; // সীমাবদ্ধ করো
        $('#paidAmount').val(distotalOrder.toFixed(2));
    }
          
            //
           let submtotal = distotalOrder;

             // Due = Total Order - Received
            let dueAmount = submtotal - totalReceived;

            //total
            let totalOrderwith = totalOrder + totalRebateOrder;

            // ফিল্ডগুলো আপডেট করো
            $('#totalOrderAmount').val(totalQtyOrder.toFixed(2));
            $('#totalRebate').val(totalRebateOrder.toFixed(2));
            $('#subtotalAmount').val(totalOrderwith.toFixed(2));
            $('#totalAmount').val(submtotal.toFixed(2));
            $('#dueAmount').val(dueAmount.toFixed(2));
        }

    $('#paidAmount').on('input', function() {
        calculateTotals();
    });

//discount
$('#totaldiscount').on('input', function() {
       calculateTotals();
    
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
            existingRow.find('.price').val(res.item.price);
            existingRow.find('.sub_total').val(res.item.sub_total);
            existingRow.find('.total_rebate').val(res.item.total_rebate);
            existingRow.find('.serial_number').val(res.item.serial_number);
             calculateTotals();
        } else {
           let editBtn = '';
            if(res.item.serial_type == 'unique'){
                editBtn = '<button type="button" class="btn btn-sm btn-info editItem">✎</button> ';
            }else{
                  editBtn = '<button type="button" class="btn btn-sm btn-info editBatchItem">✎</button> ';
            }

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
                    editBtn + 
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
         $('#item_serial').val('');
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


/* ------------------------------------
   UNIVERSAL BARCODE / MANUAL ENTER HANDLER
   ------------------------------------ */

let scanBuffer = "";
let lastKeyTime = 0;

function resetScan() {
    scanBuffer = "";
    lastKeyTime = 0;
}

function isFastScan(timeDiff) {
    return timeDiff < 30; // barcode scanner usually sends keys <30ms apart
}

$('#barcode_serial, #item_serial').on('keydown', function(e) {
    const now = Date.now();
    const timeDiff = now - lastKeyTime;
    lastKeyTime = now;

    // If slow typing, reset buffer
    if (!isFastScan(timeDiff)) {
        scanBuffer = "";
    }

    // Only capture character keys
    if (e.key.length === 1) {
        scanBuffer += e.key;
    }

    // Enter key pressed
    if (e.key === "Enter") {
        e.preventDefault();

        // If buffer is likely a scan
        if (scanBuffer.length > 3) {
            $(this).val(scanBuffer);   // set input value from scanner
            $('#addItemBtn').click();  // trigger add item
        } else {
            // Normal Enter (manual typing)
            $('#addItemBtn').click();
        }

        // Reset and refocus input
        resetScan();
        $(this).val('').focus();
    }
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
   
    $('#product_id').change(function() {
        var product_id = $(this).val();  

        if (product_id) {
            $.ajax({
                url: '<?php echo base_url("purchase/get_product_details"); ?>',  // AJAX URL
                type: 'POST',
                data: {product_id: product_id},
                success: function(response) {
                    var data = JSON.parse(response);  
   
                    $('#price').val(data.price);
                    $('#sales_price').val(data.sales_price);
                    $('#subtotal').val(data.price * $('#qty').val());  // Subtotal = Price * Qty
                    $('#warrenty').val(data.warrenty);
                    $('#warrenty_days').val(data.warrenty_days);
               
                    if (data.serial_type === 'common') {
                      //  $('#qty').prop('readonly', false); 
                        $('#qty').val(1);  // Default value for common serial type
                        $("#common_input").slideDown();
                        $("#common_extra").slideDown();
                        $("#unique_input").slideUp();

                         // Fill Last purchase info
                        $('#last_purchase_price').val(data.last_price);
                        $('#last_barcode_serial').val(data.barcode_serial);
                    } else if (data.serial_type === 'unique') {
                      //  $('#qty').prop('readonly', true);  // Make Qty readonly
                        $('#qty').val(1);  // Set Qty to 1 for unique serial type
                        $("#unique_input").slideDown();
                        $("#common_input").slideUp();
                        $("#common_extra").slideUp();
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

    function loadSupplierBalance() {
        var supplier_id = $('#supplier_id').val();

        if (supplier_id !== '') {
            $.ajax({
                url: '<?= base_url("purchase/get_supplier_balance"); ?>',
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
    }

    // 1️⃣ Load balance when supplier changes
    $('#supplier_id').on('change', function() {
        loadSupplierBalance();
    });

    // 2️⃣ Load default balance on page load (Cash is selected by default)
    loadSupplierBalance();
});





</script>
<script>
$(document).on('click', '.editItem', function(){

    let row = $(this).closest('tr');

    let item_id = row.data('id');

    $('#edit_row_id').val(item_id);
    $('#edit_price').val(row.find('.price').val());
    $('#edit_rebate').val(row.find('.total_rebate').val());

    // Load serials via AJAX
    refreshSerialList(item_id);

    $('#editModal').modal('show');
});

function refreshSerialList(item_id) {
    let container = $('#serial_list_container');
    container.empty();

    $.ajax({
        url: "<?= base_url('purchase/get_item_serials') ?>",
        type: "GET",
        data: { item_id: item_id },
        dataType: "json",
        success: function(res){
            if(res.status === 'success' && res.serials.length > 0){
                res.serials.forEach(function(serial){
                    let html = `<div class="serial-item d-flex justify-content-between align-items-center mb-1 p-2 border rounded" data-id="${serial.id}">
                                    <span>${serial.serial_number}</span>
                                    <button type="button" class="btn btn-sm btn-danger delete-serial">Delete</button>
                                </div>`;
                    container.append(html);
                });
            } else {
                container.append('<div class="text-center text-muted">No serials found.</div>');
            }
        }
    });
}



function refreshSerialList(item_id) {
    
    $.ajax({
        url: "<?= base_url('purchase/get_item_serials') ?>",
        type: "GET",
        data: { item_id: item_id },
        dataType: "json",
        success: function(res){
            let container = $('#serial_list_container');
            container.empty();
            if(res.status === 'success'){
                res.serials.forEach(function(serial){
                 let html = `<div class="serial-item d-flex justify-content-between align-items-center mb-1 p-2 border rounded" data-id="${serial.id}">
                <span>${serial.serial_number}</span>
                <button type="button" class="btn btn-sm btn-danger delete-serial">Delete</button>
            </div>`;
            container.append(html);

                });
            } else {
                container.html('<p>No serials found.</p>');
            }
        }
    });
}

$(document).on('click', '.delete-serial', function(){
    let serialDiv = $(this).closest('.serial-item');
    let serial_id = serialDiv.data('id');
    let item_id = $('#edit_row_id').val();

    if(confirm('Are you sure you want to remove this serial?')){
        $.ajax({
            url: "<?= base_url('purchase/delete_item_serial') ?>",
            type: "POST",
            data: { serial_id: serial_id, item_id: item_id },
            dataType: "json",
            success: function(res){
                if(res.status === 'success'){
                    serialDiv.remove(); // remove the div

                    let mainRow = $('tr[data-id="'+item_id+'"]');

                    // update qty and subtotal
                    mainRow.find('.qty').val(res.item.qty);
                    mainRow.find('.sub_total').val(res.item.sub_total);

                    // 🔥 Update total rebate
                    mainRow.find('.total_rebate').val(res.item.total_rebate);

                    // 🔥 update serial textarea also
                    mainRow.find('.serial_number').val(res.item.serial_number);

                    // optional message if empty
                    if(res.item.qty === 0){
                        $('#serial_list_container').html('<div class="text-center text-muted">No serials left.</div>');
                    }
                     // 🔥 Recalculate totals
                    calculateTotals();
                } else {
                    alert(res.msg || 'Failed to delete serial.');
                }
            }
        });
    }
});



$(document).on('click', '.editBatchItem', function() {

    let row = $(this).closest('tr');
    let item_id = row.data('id');

    $('#edit_batch_row_id').val(item_id);
    $('#edit_batch_price').val(row.find('.price').val());
    $('#edit_batch_qty').val(row.find('.qty').val());
    $('#edit_batch_rebate').val(row.find('.total_rebate').val());
    $('#edit_batch').val(row.find('.serial_number').val());

    // Load serial list via AJAX
    $.ajax({
        url: "<?= site_url('purchase/get_serials'); ?>",
        type: "POST",
        dataType: "json",
        data: { item_id: item_id },
        success: function(res) {

            let tbody = $("#serial_list_container tbody");
            tbody.html("");


            $('#editBatchModal').modal('show');
        }
    });

});


$(document).on('click', '#updateItemBtn', function () {

    let item_id = $('#edit_batch_row_id').val();
    let price = $('#edit_batch_price').val();
    let qty = $('#edit_batch_qty').val();
    let rebate = $('#edit_batch_rebate').val();
    let batch = $('#edit_batch').val();

   

    $.ajax({
        url: "<?= site_url('purchase/update_item'); ?>",
        type: "POST",
        dataType: "json",
        data: {
            item_id: item_id,
            price: price,
            qty: qty,
            rebate: rebate,
            batch: batch
        },
        success: function(res) {
            if (res.success) {

                let row = $('tr[data-id="' + item_id + '"]');
                row.find('.price').val(price);
                row.find('.qty').val(qty);
                row.find('.total_rebate').val(rebate);
                row.find('.sub_total').val(price*qty);
                row.find('.serial_number').val(batch);

                $('#editBatchModal').modal('hide');
            }
        }
    });

});



 $(document).ready(function () {

    function loadCustomerInfo(supplier_id) {
        $.ajax({
            url: "<?= base_url('purchase/get_customer_info'); ?>",
            type: "POST",
            data: { id: supplier_id },
            dataType: "json",
            success: function (data) {

                $("#customer_name").val(data.name);
                $("#mobile_no").val(data.contact_no);
                $("#address").val(data.address);

                if (data.name === "Cash") {
                    // Editable
                    $("#customer_name").prop("readonly", false);
                    $("#mobile_no").prop("readonly", false);
                    $("#address").prop("readonly", false);

                    // Show Save Option
                    $("#save_customer_box").show();
                } else {
                    // Read only
                    $("#customer_name").prop("readonly", true);
                    $("#mobile_no").prop("readonly", true);
                    $("#address").prop("readonly", true);

                    // Hide Save Option
                    $("#save_customer_box").hide();
                }
            }
        });
    }

    // 🔥 Page Load হলে Cash লোড হবে
    let defaultCustomer = $("#supplier_id").val();
    if (defaultCustomer) {
        loadCustomerInfo(defaultCustomer);
    }

    // Dropdown Change
    $("#supplier_id").change(function () {
        let id = $(this).val();
        if (id !== "") {
            loadCustomerInfo(id);
        }
    });
});
</script>