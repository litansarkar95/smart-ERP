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
                <form  action="<?php echo base_url(); ?>purchase/purchasebatch/insert" method="post" enctype="multipart/form-data">
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

                                <div class="col-md-2 ">
                                <div class="form-group">
                                    <label for="customer_name">Supplier Name</label>
                          
                                       <input type="text"  name="customer_name" id="customer_name" value="" class="form-control ">
                                 
                                    <span class="text-error small"><?= form_error('customer_name'); ?></span>
                                </div>
                                </div>

                                <!-- Mobile No -->  
                                        <div class="col-md-2 ">
                                <div class="form-group">
                                    <label for="mobile_no">Mobile No</label>
                            
                                      <input type="text" name="mobile_no" id="mobile_no" value="" class="form-control ">
                              
                                </div>
                                </div>

                                <!-- Address -->  

                                <div class="col-md-2 ">
                                <div class="form-group">
                                    <label for="address">Address</label>
                            
                                             <input type="text" name="address" id="address" value="" class="form-control ">
                                
                                    <span class="text-error small"><?= form_error('address'); ?></span>
                                </div>
                                </div>

                                <div class="col-md-2 ">
                                <div class="form-group">
                                    <label for="customer_group_id">Select Supplier Group</label>
                                    <div class="select_2_container">
                                   <select name="customer_group_id" id="customer_group_id" class="form-control frm_select select2" >
                                    <option value="">Select</option>
                                    <?php foreach($allGroup as $group){ ?>
                                        <option value="<?= $group->id; ?>"  >
                                            <?= $group->name ; ?>
                                        </option>
                                    <?php } ?>
                                </select>

                                    <i class="fas fa-caret-down"></i>
                                    </div>
                                    <span class="text-error small"><?= form_error('customer_group_id'); ?></span>
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
                    <option value="<?= $pro->id ?>" > <?= $pro->product_code ?> - <?= $pro->name ?></option>
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
<input type="hidden" id="invoice_code" name="invoice_code" value="<?php echo date("dmYHis")?>">
                                                           
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
                                                                             <div class="form-check mb-2 " id="save_customer_box">
            <input class="form-check-input float-end" type="checkbox" name="save_customer" value="1" id="saveCustomer">
            <label class="form-check-label me-4" for="saveCustomer">Is Supplier Save?</label>
        </div>
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

<!-- Serial Numbers Modal -->
<div class="modal fade" id="serialModal" tabindex="-1" aria-labelledby="serialModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-md modal-dialog-centered">
    <div class="modal-content">

      <div class="modal-header">
        <h5 class="modal-title" id="serialModalLabel">Serial Numbers</h5>
        <!-- Bootstrap 5 close button -->
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>

      <div class="modal-body">
        <table class="table table-bordered table-sm" id="serial_list_container">
          <thead>
            <tr>
              <th>#</th>
              <th>Serial Number</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody></tbody>
        </table>
      </div>

    </div>
  </div>
</div>


                     

  <script>

  $('#product_id').change(function(){
    var price = $(this).find(':selected').data('price') || 0;
    $('#price').val(price);
    var qty = parseFloat($('#qty').val()) || 1;
    $('#subtotal').val((price * qty).toFixed(2));
});

function calculateItemSubtotal(){
    let price  = parseFloat($('#price').val()) || 0;
    let qty    = parseInt($('#qty').val()) || 1;
    let rebate = parseFloat($('#total_rebate').val()) || 0;

    let subtotal = (price * qty) - rebate;
    $('#subtotal').val(subtotal.toFixed(2));
}
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
$('#price, #qty, #total_rebate').on('input', function(){
    calculateItemSubtotal();
});


$('#item_serial, #barcode_serial').on('keydown', function(e){
    if(e.key === 'Enter'){
        e.preventDefault();     // 🚫 form submit বন্ধ
        $('#addItemBtn').click(); // ✅ Add to cart
    }
});
$('form').on('keydown', function(e){
    if(e.key === 'Enter'){
        e.preventDefault();
    }
});
$(document).on('input', '.qty, .price, .total_rebate', function(){

    let row   = $(this).closest('tr');
    let qty   = parseFloat(row.find('.qty').val()) || 0;
    let price = parseFloat(row.find('.price').val()) || 0;
    let rebate= parseFloat(row.find('.total_rebate').val()) || 0;

    let subtotal = (qty * price) - rebate;
    row.find('.sub_total').val(subtotal.toFixed(2));

    calculateGrandTotals();
});

$(document).on('blur', '.qty, .price, .total_rebate', function(){

    let row = $(this).closest('tr');

    $.post(
        '<?= base_url("purchase/purchasebatch/update_item") ?>',
        {
            item_id: row.data('item-id'),
            qty: row.find('.qty').val(),
            price: row.find('.price').val(),
            total_rebate: row.find('.total_rebate').val(),
            sub_total: row.find('.sub_total').val()
        }
    );
});

function calculateGrandTotals(){

    let totalOrder   = 0;
    let subtotal     = 0;
    let totalRebate  = 0;

    $('#itemsTable tbody tr').each(function(){

        let qty   = parseFloat($(this).find('.qty').val()) || 0;
        let price = parseFloat($(this).find('.price').val()) || 0;
        let rowSub = parseFloat($(this).find('.sub_total').val()) || 0;
        let rowRebate = parseFloat($(this).find('.total_rebate').val()) || 0;

        totalOrder  += qty;
        subtotal    += rowSub;
        totalRebate += rowRebate;
    });

    $('#totalOrderAmount').val(totalOrder.toFixed(2));
    $('#subtotalAmount').val(subtotal.toFixed(2));
    $('#totalRebate').val(totalRebate.toFixed(2));
    $('#totalAmount').val(subtotal.toFixed(2));

    calculateDue();
}
function calculateDue(){
    let total    = parseFloat($('#totalAmount').val()) || 0;
    let discount = parseFloat($('#totaldiscount').val()) || 0;
    let paid     = parseFloat($('#paidAmount').val()) || 0;

    let payable = total - discount;
    let due     = payable - paid;

    $('#dueAmount').val(due.toFixed(2));
}

$('#totaldiscount, #paidAmount').on('input', calculateDue);

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
                       // $('#qty').val(1);  // Default value for common serial type
                       $('#qty').prop('readonly', false);

                        $("#common_input").slideDown();
                        $("#common_extra").slideDown();
                        $("#unique_input").slideUp();

                         // Fill Last purchase info
                        $('#last_purchase_price').val(data.last_price);
                        $('#last_barcode_serial').val(data.barcode_serial);
                    } else if (data.serial_type === 'unique') {
                      //  $('#qty').prop('readonly', true);  // Make Qty readonly
                       // $('#qty').val(1);  // Set Qty to 1 for unique serial type
                        $('#qty').val(1).prop('readonly', true);
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
// product change
$('#addItemBtn').on('click', function () {

    let supplier_id = $('#supplier_id').val();
    let product_id  = $('#product_id').val();
    if (!product_id) {
        iziToast.error({ message: 'Select product!', position: 'topRight' });
        return;
    }

    let invoice_code = $('#invoice_code').val();
    if (!invoice_code) {
        iziToast.error({ message: 'Invoice code required!', position: 'topRight' });
        return;
    }

    let price  = parseFloat($('#price').val()) || 0;
    let qty    = parseInt($('#qty').val()) || 1;
    let rebate = parseFloat($('#rebate').val()) || 0;

    let serialType = $('#unique_input').is(':visible') ? 'unique' : 'common';

  let serialVal = serialType === 'unique'
    ? $('#item_serial').val().trim()
    : $('#barcode_serial').val().trim();

if (serialType === 'unique' && !serialVal) {
    iziToast.error({
        message: 'Unique Serial required!',
        position: 'topRight'
    });
    return;
}
    let rowKey = serialType === 'unique'
        ? product_id + '_' + price + '_unique'
        : product_id + '_' + price + '_common';

 
    let row = $('#itemsTable tbody tr[data-key="' + rowKey + '"]');

    if (serialType === 'unique' && row.length) {

        let existingSerials = row.find('.serial_number').val()
            .split(',')
            .map(s => s.trim())
            .filter(s => s !== '');

        if (existingSerials.includes(serialVal)) {
            iziToast.error({
                message: 'এই Serial আগেই যোগ করা হয়েছে!',
                position: 'topRight'
            });
            return;
        }
    }

    // ===============================
    // CALCULATION
    // ===============================
    let newQty = row.length ? parseInt(row.find('.qty').val()) + 1 : qty;

    let totalRebate = rebate * newQty;
    let subtotal = (price * newQty) - totalRebate;

    // ===============================
    // AJAX
    // ===============================
    $.ajax({
        url: '<?= base_url("purchase/purchasebatch/add_item_ajax") ?>',
        type: 'POST',
        dataType: 'json',
        data: {
            supplier_id: supplier_id,
            invoice_code: invoice_code,
            product_id: product_id,
            serial_type: serialType,
            price: price,
            qty: newQty,
            rebate: rebate,
            total_rebate: totalRebate,
            sub_total: subtotal,
            sales_price: $('#sales_price').val(),
            warrenty: $('#warrenty').val(),
            warrenty_days: $('#warrenty_days').val(),
            barcode_serial: serialType === 'common' ? serialVal : '',
            serials: serialType === 'unique' ? serialVal.split(',') : []
        },
        success: function (res) {

            if (row.length) {

                row.find('.qty').val(newQty);
                row.find('.total_rebate').val(totalRebate.toFixed(2));
                row.find('.sub_total').val(subtotal.toFixed(2));

                if (serialType === 'unique') {
                    let oldSerial = row.find('.serial_number').val();
                    row.find('.serial_number').val(oldSerial + ', ' + serialVal);
                }

            } else {

                let newRow = `
                <tr data-key="${rowKey}" data-item-id="${res.item_id}" data-serial-type="${res.item_id}">
                    <td>${$('#itemsTable tbody tr').length + 1}</td>
                    <td>${$('#product_id option:selected').text()}</td>
                    <td><input type="number" class="form-control qty" value="${newQty}"></td>
                    <td><input type="number" class="form-control price" value="${price}"></td>
                    <td><input type="number" class="form-control total_rebate" value="${totalRebate.toFixed(2)}"></td>
                    <td><input type="text" class="form-control sub_total" value="${subtotal.toFixed(2)}" readonly></td>
                    <td><textarea class="form-control serial_number" readonly>${serialVal}</textarea></td>
                    <td>
                        <button type="button" class="btn btn-sm btn-success modelsviw">edit</button>
                        <button type="button" class="btn btn-sm btn-danger removeItem">✖</button>
                    </td>
                </tr>`;
                $('#itemsTable tbody').append(newRow);
            }

            iziToast.success({ message: 'Add to cart Success!', position: 'topRight' });

            $('#item_serial').val('');
            $('#barcode_serial').val('');
            $('#qty').val(1);

            calculateGrandTotals();
        }
    });
});




function resetInputs(){
    $('#item_serial').val('');
  //  $('#subtotal').val('');
    $('#total_rebate').val(0);
    $('#qty').val(1);
}
// remove

$(document).on('click', '.removeItem', function(){
    let row = $(this).closest('tr');
    let itemId = row.data('item-id');

    if(!itemId){
        alert('Item ID missing!');
        return;
    }

    $.ajax({
        url: '<?= base_url("purchase/purchasebatch/delete_item") ?>',
        type: 'POST',
        data: { item_id: itemId },
        dataType: 'json',
        success: function(res){
            if(res.status === 'success'){
                row.remove();
                calculateGrandTotals();
            } else {
                alert('Delete failed');
            }
        },
        error: function(err){
            console.log(err);
            alert('AJAX error');
        }
    });
});
// ===============================
// SHOW SERIALS IN MODAL
// ===============================
let activeRow = null;

$(document).on('click', '.modelsviw', function(){

    let itemRow = $(this).closest('tr');

    $('#serialModal')
        .data('item-id', itemRow.data('item-id'))
        .data('row-key', itemRow.data('key'));

    let serialText = itemRow.find('.serial_number').val();
    let serials = serialText.split(',').map(s => s.trim()).filter(s => s);

    let tbody = '';
    serials.forEach((s, i) => {
        tbody += `
        <tr data-serial="${s}">
            <td>${i+1}</td>
            <td>${s}</td>
            <td>
                <button class="btn btn-sm btn-danger deleteSerial">Delete</button>
            </td>
        </tr>`;
    });

    $('#serial_list_container tbody').html(tbody);
    $('#serialModal').modal('show');
});

// ===============================
// DELETE SINGLE SERIAL
// ===============================


$(document).on('click', '.deleteSerial', function(){

    let serialRow = $(this).closest('tr');
    let serialToDelete = serialRow.data('serial');

    let modal = $('#serialModal');
    let itemId = modal.data('item-id');
    let rowKey = modal.data('row-key');

    let itemRow = $('#itemsTable tbody tr[data-key="' + rowKey + '"]');
    if (!itemRow.length) return;

    let textarea = itemRow.find('.serial_number');

    let serials = textarea.val()
        .split(',')
        .map(s => s.trim())
        .filter(s => s !== '');

    // remove selected serial
    serials = serials.filter(s => s !== serialToDelete);

    // 🔁 SERVER UPDATE
    $.post(
        '<?= base_url("purchase/purchasebatch/delete_item_serial") ?>',
        {
            item_id: itemId,
            serial_number: serialToDelete
        }
    );

    if (serials.length === 0) {
        // 🔥 last serial → remove full row
        itemRow.remove();

        $.post(
            '<?= base_url("purchase/purchasebatch/delete_item") ?>',
            { item_id: itemId }
        );
    } else {
        // ✅ update row
        textarea.val(serials.join(', '));

        let newQty = serials.length;
        itemRow.find('.qty').val(newQty);

        let price = parseFloat(itemRow.find('.price').val()) || 0;
        let rebatePerItem =
            parseFloat(itemRow.find('.total_rebate').val()) / (newQty + 1);

        let totalRebate = rebatePerItem * newQty;
        let subtotal = (price * newQty) - totalRebate;

        itemRow.find('.total_rebate').val(totalRebate.toFixed(2));
        itemRow.find('.sub_total').val(subtotal.toFixed(2));
    }

    calculateGrandTotals();
    serialRow.remove(); // modal row remove
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