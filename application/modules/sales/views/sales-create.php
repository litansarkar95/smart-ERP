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





  <div class="row ">
    <div class="col-12">
      <div class="">
       
        <div class="row">
          <div class="col-12">
           <div class="panel-heading p-3 border rounded bg-light">
            
    <i class="fa fa-shopping-bag me-2"></i>
    <strong>Add New  Sales --   Sales Order :: Order No - IN1764256114</strong>
    
    <div class="order-buttons mt-2 d-flex flex-wrap gap-1">
        <a href="#" class="btn btn-primary btn-sm" target="_blank">IN1764088446</a>
        <a href="#" class="btn btn-success btn-sm" target="_blank"><i class="fa fa-edit"></i></a>
        
        <a href="#" class="btn btn-primary btn-sm" target="_blank">IN1764088333</a>
        <a href="#" class="btn btn-success btn-sm" target="_blank"><i class="fa fa-edit"></i></a>
        
        <a href="/Sales/sales_invoice_print/IN1764088022.html" class="btn btn-primary btn-sm" target="_blank">IN1764088022</a>
        <a href="#" class="btn btn-success btn-sm" target="_blank"><i class="fa fa-edit"></i></a>
        
        <a href="#" class="btn btn-primary btn-sm" target="_blank">IN1764087571</a>
        <a href="#" class="btn btn-success btn-sm" target="_blank"><i class="fa fa-edit"></i></a>
        
        <a href="#l" class="btn btn-primary btn-sm" target="_blank">IN1764087304</a>
        <a href="#" class="btn btn-success btn-sm" target="_blank"><i class="fa fa-edit"></i></a>
    </div>
</div>

                <form  action="<?php echo base_url(); ?>sales/create" method="post" enctype="multipart/form-data">
                                                            <div class="row mb-3">
    <!-- <div class="col-md-12 ">
        <div class="form-group">
           
           <input type="text" name="previousDue" placeholder="Scan Barcode & Hit Enter....."     class="form-control " autofocus>

        </div>
    </div> -->
                                     <div class="col-md-2 ">
																<div class="form-group">
																<label for="invoice_no">Invoice No <span class="text-error"> *</span></label>
									      						<input type="text"   name="invoice_no" id="invoice_no" value="<?= $invoice_no; ?>"   class="form-control" readonly>
																<span class="text-error small"><?php echo form_error('invoice_no'); ?></span>
																</div>
									      					</div>   
                                                             <div class="col-md-2 ">
																<div class="form-group">
																<label for="sales_date">Sales Date<span class="text-error"> *</span></label>
									      						<input type="text"  name="sales_date" id="sales_date" value=""   class="form-control" >
																<span class="text-error small"><?php echo form_error('sales_date'); ?></span>
																</div>
									      					</div>     

                                  <div class="col-md-3 mb-3">
                                <div class="form-group">
                                    <label for="customer_id">Select Customer</label>
                                    <div class="select_2_container">
                                   <select name="customer_id" id="customer_id" class="form-control frm_select select2" required>
                                    <option value="">Select</option>
                                    <?php foreach($allCustomer as $customer){ ?>
                                        <option value="<?= $customer->id; ?>" 
                                            <?= ($customer->name=='Cash') ? 'selected' : '' ?>>
                                            <?= $customer->name . ' - ' . $customer->contact_no; ?>
                                        </option>
                                    <?php } ?>
                                </select>

                                    <i class="fas fa-caret-down"></i>
                                    </div>
                                    <span class="text-error small"><?= form_error('customer_id'); ?></span>
                                </div>
                                </div>

                                  <div class="col-md-2 mb-3">
                                <div class="form-group">
                                    <label for="customer_name">Customer Name</label>
                          
                                       <input type="text"  name="customer_name" id="customer_name" value="" class="form-control ">
                                 
                                    <span class="text-error small"><?= form_error('customer_name'); ?></span>
                                </div>
                                </div>

                                <!-- Mobile No -->  
                                        <div class="col-md-2 mb-3">
                                <div class="form-group">
                                    <label for="mobile_no">Mobile No</label>
                            
                                      <input type="text" name="mobile_no" id="mobile_no" value="" class="form-control ">
                              
                                </div>
                                </div>

                                <!-- Address -->  

                                <div class="col-md-2 mb-3">
                                <div class="form-group">
                                    <label for="address">Address</label>
                            
                                             <input type="text" name="address" id="address" value="" class="form-control ">
                                
                                    <span class="text-error small"><?= form_error('address'); ?></span>
                                </div>
                                </div>
                                <div class="col-md-2 mb-3">
                                <div class="form-group">
                                    <label for="customer_group_id">Select Customer Group</label>
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

                          <div class="col-md-2 mb-3" style="display:none;">
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

                          <div class="col-md-2 mb-3">
                                    <div class="form-group">
                                  <label for="group_id">Select Product Group </label>
                                  <div class="select_2_container">
                                    <select name="group_id"  id="group_id"     class="form-control frm_select select2">
                                       <option  value="">Select </option>
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
                                                                                        <label for="product_id">Select Product  </label>
                                                                                        <div class="select_2_container">
                                                                                            <select name="product_id"  id="product_id"     class="form-control frm_select select2">
                                                                                            <option  value="">  Select Product </option>
                                                                                            <?php foreach($allPro as $pro): ?>
                                                                                    <option value="<?= $pro->id ?>" ><?= $pro->name ?></option>
                                                                                <?php endforeach; ?>
                                                                                            </select>
                                                                                            <i class="fas fa-caret-down"></i>
                                                                                        </div>
                                                                                        <span class="text-error small"> <?php echo form_error('product_id'); ?>   </span>
                                                                                        </div></div>
                                                                                        <!-- end Brand -->


                                                            
                                                                                                                
                                                        <div class="col-md-3 " id="uniqueSerialBox" style="display:none;">
                                                            <div class="form-group">
                                                                <label for="unique_serial">Select Serial <span class="text-error">*</span></label>
                                                                <div class="select_2_container">
                                                                    <select name="unique_serial" id="unique_serial" class="form-control frm_select select2">
                                                                        <option value="">Select</option>
                                                                    </select>
                                                                    <i class="fas fa-caret-down"></i>
                                                                </div>
                                                                <span class="text-error small"></span>
                                                            </div>
                                                        </div>


                                                                                                                    
                                                        

                                                            
                                                              <div class="col-md-2 "  id="remarks"  >
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
                                                                        </div>


                                                                        <div class="card">
                                                    <div class="card-header bg-light">Lines</div>
                                                    <div class="card-body">

    
      
    <div class="table-responsive">
<table class="table table-bordered" id="itemsTable">
    <thead>
        <tr>
            <th>Line#</th>
            <th>Product Name <span class="text-danger">*</span></th>
            <th>Warranty</th>
            <th>Stock Qty</th>
            <th>Price</th>
            <th>Qty</th>
            <th>Total </th>
            <th>Discount(%)</th>
            <th>Discount Amnt</th>
            <th>Net Total</th>
            <th>Item Serials</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <!-- rows will append here -->
    </tbody>
   
</table>

</div>
 <div class="row">
            <div class="col-md-2 ">
        <div class="form-group">
            <label for="previousDue">Previous Due </label>
            <input type="text" name="previousDue" id="previousDue" value="" class="form-control previousDue" >
        </div>
    </div>
    <div class="col-md-2 ">
        <div class="form-group">
            <label for="totalOrder">Total Order </label>
            <input type="text" name="totalOrder" id="totalOrder" value="" class="form-control totalOrder" >
        </div>
    </div>


     <div class="col-md-2 ">
        <div class="form-group">
            <label for="subtotalAmount">Sub Total </label>
            	<span class="text-error small"><?php echo form_error('subtotalAmount'); ?></span>
            <input type="text" name="subtotalAmount" id="subtotalAmount" value="" class="form-control price" >
        </div>
    </div>

      <div class="col-md-2 ">
        <div class="form-group">
            <label for="totalDiscount">Total Discount  </label>
            <input type="text" name="totalDiscount" id="totalDiscount" value="" class="form-control totalDiscount" >
        </div>
    </div>

     <div class="col-md-2 ">
        <div class="form-group">
             <span class="text-error small"><?php echo form_error('totalAmount'); ?></span>
            <label for="totalAmount"> Total </label>
           
            <input type="text" name="totalAmount" id="totalAmount" value="" class="form-control " >
        </div>
    </div>

     <div class="col-md-2 ">
        <div class="form-group">
            <label for="adjustment"> Adjustment </label>
            <input type="text" name="adjustment" id="adjustment" value="0" class="form-control " >
        </div>
    </div>

    <div class="col-md-2 ">
        <div class="form-group">
            <label for="payableAmount">Payable Amount </label>
            <input type="text" name="payableAmount" id="payableAmount" value="" class="form-control payableAmount" >
        </div>
    </div>
<div class="col-md-2 ">
        <div class="form-group">
            <label for="dueAmount">Due Amount </label>
            <input type="text" name="dueAmount" id="dueAmount" value="" class="form-control dueAmount" >
        </div>
    </div>
    
    <div class="col-md-2 ">
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

       <div class="col-md-2 ">
        <div class="form-group">
            <label for="paidAmount">Paid Amount </label>
            <input type="text" name="paidAmount" id="paidAmount" value="" class="form-control paidAmount" >
        </div>
    </div>
    <div class="col-md-2 ">
																<div class="form-group">
																<label for="due_paid_date">Next Due Paid Date<span class="text-error"> *</span></label>
									      						<input type="text"  name="due_paid_date" id="due_paid_date" value=""   class="form-control" >
																<span class="text-error small"><?php echo form_error('due_paid_date'); ?></span>
																</div>
									      					</div> 

                      
                                     </div>
<div class="row align-items-center">
    <!-- Left side: checkboxes -->
    <div class="col-md-8" >
        <div class="form-check" id="save_customer_box">
            <input class="form-check-input" type="checkbox" name="save_customer" value="1" id="saveCustomer">
            <label class="form-check-label" for="saveCustomer">Is Customer Save?</label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="checkbox" name="send_bill_sms" value="1" id="sendBillSMS">
            <label class="form-check-label" for="sendBillSMS">Send Bill SMS</label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="checkbox" name="send_bill_email" value="1" id="sendBillEmail">
            <label class="form-check-label" for="sendBillEmail">Send Bill Invoice Email</label>
        </div>
    </div>

    <!-- Right side: button -->
    <div class="col-md-4 text-end">
        <button type="submit" class="btn btn_bg">Confirm Order</button>
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
    <label>Serial Numbers</label>
    <table class="table table-bordered table-sm" id="serial_list_container">
        <thead>
    <tr>
        <th>#</th>
        <th>Serial Number</th>
        <th>Purchase Date</th>
        <th>Remaining Warranty</th>
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

<script>
$(document).ready(function() {
  
    $('#group_id').change(function() {
        var group_id = $(this).val();  

        if(group_id) {
            $.ajax({
                url: '<?php echo base_url("sales/get_products_by_group"); ?>',  
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

    
$('#product_id').change(function() {

    var product_id = $(this).val();  

    if(product_id) {

        $.ajax({
            url: '<?= base_url("sales/get_unique_serial_by_products"); ?>',
            type: 'POST',
            data: {product_id: product_id},

            success: function(response) {

                // destroy old select2
                $('#unique_serial').select2('destroy');

                if(response.trim() === "common"){
                    $('#uniqueSerialBox').hide();

                    // empty dropdown
                    $('#unique_serial').html('<option value="">Select</option>');
                } 
                else {
                    $('#uniqueSerialBox').show();

                    // load new serial list
                    $('#unique_serial').html(response);
                }

                // reinitialize select2
                $('#unique_serial').select2();
            }
        });

    } else {

        $('#uniqueSerialBox').hide();

        // destroy + reset + reinit select2
        $('#unique_serial').select2('destroy');
        $('#unique_serial').html('<option value="">Select</option>');
        $('#unique_serial').select2();
    }
});


});

function updateOrderSummary(){
    let sqty = 0;
    let subtotal = 0;
    let totalDiscount = 0;

    $('#itemsTable tbody tr').each(function(){
        let sub_total = parseFloat($(this).find('.sub_total').val()) || 0;
        let qty = parseFloat($(this).find('.qty').val()) || 0;
        let discount_amount = parseFloat($(this).find('.discount_amount').val()) || 0;

        subtotal += sub_total;
        sqty += qty;
        totalDiscount += discount_amount;
    });

    let total = subtotal - totalDiscount;
    let adjustment = parseFloat($('#adjustment').val()) || 0;
    let payable = total + adjustment;

    let customerName = $('#customer_id option:selected').text().split(' - ')[0];

    let paid = parseFloat($('#paidAmount').val()) || 0;
    let due = 0;

    if(customerName === "Cash") {
        // Cash হলে paidAmount = payable, due = 0
        paid = payable;
        due = 0;
        $('#paidAmount').prop('readonly', true);
    } else {
        // Non-Cash, due calculate
        if(paid > payable) paid = payable;
        due = payable - paid;
        $('#paidAmount').prop('readonly', false);
    }

    // Update fields
    $('#subtotalAmount').val(subtotal.toFixed(2));
    $('#totalDiscount').val(totalDiscount.toFixed(2));
    $('#totalOrder').val(sqty);
    $('#totalAmount').val(total.toFixed(2));
    $('#payableAmount').val(payable.toFixed(2));
    $('#dueAmount').val(due.toFixed(2));
    $('#paidAmount').val(paid.toFixed(2));
}




function updateSalesItem(row) {

    let item_id = row.data("id");
    let price = parseFloat(row.find(".price").val()) || 0;
    let qty = parseInt(row.find(".qty").val()) || 0;
    let discount_percent = parseFloat(row.find(".discount_percent").val()) || 0;
    let discount_amount = parseFloat(row.find(".discount_amount").val()) || 0;
    let sub_total = parseFloat(row.find(".sub_total").val()) || 0;
    let net_total = parseFloat(row.find(".net_total").val()) || 0;
    let warrenty = parseFloat(row.find(".warrenty").val()) || 0;

    $.ajax({
        url: "<?= base_url('sales/update_item_ajax') ?>",
        type: "POST",
        dataType: "json",
        data: {
            item_id: item_id,
            price: price,
            qty: qty,
            discount_percent: discount_percent,
            discount_amount: discount_amount,
            sub_total: sub_total,
            net_total: net_total,
            warrenty : warrenty,
        },
        success: function(res) {
            if (res.status !== "success") {
                iziToast.error({
                    message: "Update failed!",
                    position: "topRight"
                });
            }
        }
    });
}
// Paid amount input check
$('#paidAmount').on('input', function() {
    let total = parseFloat($('#totalAmount').val()) || 0;
    let adjustment = parseFloat($('#adjustment').val()) || 0;
    let payable = total + adjustment;

    let customerName = $('#customer_id option:selected').text().split(' - ')[0];


        let paid = parseFloat($(this).val()) || 0;
        if(paid > payable){
            iziToast.error({
                message: "Paid amount cannot exceed payable (" + payable.toFixed(2) + ")",
                position: "topRight"
            });
            paid = payable;
            $(this).val(payable.toFixed(2));
        }
        $('#dueAmount').val((payable - paid).toFixed(2));
        $(this).prop('readonly', false);
   
});



</script>


<script>
$('#addItemBtn').on('click', function() {

    var product_id     = $('#product_id').val();
    var invoice_id     = $('#invoice_id').val();
    var product_name   = $('#product_id option:selected').text();
    var unique_serial   = $('#unique_serial').val();

    if (!product_id) {
        iziToast.error({
            message: "Please select a product!",
            position: 'topRight'
        });
        return;
    }

    $.ajax({
        url: "<?= base_url('sales/add_item_ajax') ?>",
        type: "POST",
        dataType: "json",
        data: { product_id: product_id ,invoice_id: invoice_id ,unique_serial: unique_serial },
        success: function(res) {

            if(res.status !== "success"){
                iziToast.error({
                    message: "Error: " + (res.msg || "Something went wrong!"),
                    position: "topRight"
                });
                return;
            }

            let serial_type = res.item.serial_type;

           /* *********************
                    UNIQUE SERIAL PRODUCT
                    *********************** */
                    if (serial_type === "unique") {

                        if (unique_serial === "") {
                            iziToast.error({
                                message: "Please select a serial first!",
                                position: 'topRight'
                            });
                            return;
                        }

                        let found = false;
                        let stockExceeded = false;

                        $('#itemsTable tbody tr').each(function () {

                            let rowProduct = $(this).attr("data-product");
                            let serialField = $(this).find(".serial_number");

                            if (rowProduct == product_id) {

                                found = true;

                                // OLD SERIAL LIST
                                let oldSerials = serialField.val() ? serialField.val().split(",") : [];

                                if (oldSerials.includes(unique_serial)) {
                                    iziToast.error({
                                        message: "This serial already added!",
                                        position: "topRight"
                                    });
                                    return false;
                                }

                                // NEW SERIAL ADD
                                oldSerials.push(unique_serial);
                                serialField.val(oldSerials.join(","));

                                // QTY UPDATE
                                let qtyInput = $(this).find(".qty");
                                let currentQty = parseInt(qtyInput.val());
                                let newQty = currentQty + 1;

                                // STOCK CHECK
                                if (newQty > res.item.stockQty) {
                                    iziToast.error({
                                        message: "Stock limit exceeded! Only " + res.item.stockQty + " available!",
                                        position: "topRight"
                                    });
                                    stockExceeded = true;
                                    return false;
                                }

                                qtyInput.val(newQty);

                                let price = parseFloat($(this).find(".price").val());
                                let subTotal = price * newQty;

                                $(this).find(".sub_total").val(subTotal);
                                $(this).find(".net_total").val(subTotal);

                                iziToast.success({
                                    message: "Serial added successfully!",
                                    position: "topRight"
                                });

                                return false;
                            }
                        });

                        if (stockExceeded) return; // STOP FULL PROCESS IF STOCK ERROR

                        // ADD NEW ROW IF NOT FOUND
                        if (!found) {
                            addNewRow(res, unique_serial);
                            iziToast.success({
                                message: "Item added successfully!",
                                position: "topRight"
                            });
                        }

                        updateOrderSummary();
                        return;
                    }



                   /* *********************
       COMMON PRODUCT
*********************** */
let exists = false;
let stockExceeded = false;

$('#itemsTable tbody tr').each(function () {

    let rowProduct = $(this).attr("data-product");

    if (rowProduct == product_id) {

        exists = true;

        let qtyInput = $(this).find(".qty");
        let currentQty = parseInt(qtyInput.val());

        let newQty = currentQty + 1; // <-- NEXT TARGET QTY

        // 🔥 STOCK CHECK (correct logic)
        // Example: Stock=5, Already=3 → newQty=4 → (4 > 5)=false → Allow
        // Example: Stock=5, Already=4 → newQty=5 → (5 > 5)=false → Allow
        // Example: Stock=5, Already=5 → newQty=6 → (6 > 5)=true → BLOCK
        if (newQty > res.item.stockQty) {

            let remaining = res.item.stockQty - currentQty;

            iziToast.error({
                message: "স্টকে মোট " + res.item.stockQty + 
                         " পিস ছিল, আপনি নিয়েছেন " + currentQty + 
                         ". বাকি আছে " + remaining + " পিস! তাই আরো নিতে পারবেন না।",
                position: "topRight"
            });

            stockExceeded = true;
            return false; // STOP LOOP
        }

        // UPDATE QTY (only if allowed)
        qtyInput.val(newQty);

        let price = parseFloat($(this).find(".price").val());
        let subTotal = price * newQty;

        $(this).find(".sub_total").val(subTotal);
        $(this).find(".net_total").val(subTotal);

        iziToast.success({
            message: "Quantity updated successfully!",
            position: "topRight"
        });

        return false;
    }
});

// STOP EVERYTHING IF STOCK ERROR
if (stockExceeded) return;

// ADD NEW ROW IF PRODUCT NOT FOUND
if (!exists) {
    addNewRow(res, "");
    iziToast.success({
        message: "Item added successfully!",
        position: "topRight"
    });
}

updateOrderSummary();


              
        },

        error: function(xhr, status, error){
            iziToast.error({
                message: "Request failed: " + error,
                position: "topRight"
            });
        }
    });

});



// ---------------- ADD NEW ROW FOR BOTH UNIQUE & COMMON ----------------
function addNewRow(res, serial){
  
    let product_id = $('#product_id').val();
    let serial_type = res.item.serial_type; // unique / common
    let qtyValue = (serial_type === 'unique') ? 1 : res.item.qty;
    let priceValue = res.item.price;
    let subTotal = priceValue * qtyValue;

    // Qty readonly for unique, editable for common
    let qtyField = (serial_type === 'unique') ? 
        '<input type="number" class="qty form-control"  name="qty" value="'+qtyValue+'" readonly>' : 
        '<input type="number" class="qty form-control" name="qty" value="'+qtyValue+'">';

    let editBtn = (serial_type === 'unique') ? 
        '<button type="button" class="btn btn-sm btn-info editItem">✎</button> ' : ''  

  
        // Discount fields (editable for all products)
    let discountPercentField = '<input type="number" class="discount_percent form-control" value="">';
    let discountAmountField = '<input type="number" class="discount_amount form-control" value="">';

    let newRow = '<tr data-id="'+res.item.item_id+'"  data-product="'+product_id+'">'+
        '<td>' + ($('#itemsTable tbody tr').length + 1) + '</td>'+
        '<td>' + res.item.product_name + '</td>'+
        '<td><input type="number" class="warrenty form-control" name="warrenty" value="'+res.item.warrenty+'" >'  + res.item.warrenty_days + '</td>'+
        '<td><input type="number" class="stock_qty form-control" name="stock_qty" value="'+res.item.stockQty+'" readonly></td>'+
        '<td><input type="number" class="price form-control" name="price" value="'+priceValue+'" ></td>'+
        '<td>' + qtyField + '</td>'+
        '<td><input type="number" class="sub_total form-control" value="'+subTotal+'" readonly></td>'+
        '<td>' + discountPercentField + '</td>'+
        '<td>' + discountAmountField + '</td>'+
        '<td><input type="number" class="net_total form-control" value="'+subTotal+'" readonly></td>'+
        '<td><textarea class="serial_number form-control" readonly>'+serial+'</textarea></td>'+
         '<td>' +
                editBtn +
                    '<button type="button" class="btn btn-sm btn-outline-danger removeItem">✖</button>' +
                '</td>'+
    '</tr>';

    $('#itemsTable tbody').append(newRow);

    // ----------------- Event Handlers -----------------
    let $row = $('#itemsTable tbody tr').last();

    // When discount_percent changes
    $row.find('.discount_percent').on('input', function(){
        let percent = parseFloat($(this).val()) || 0;
        let sub_total = parseFloat($row.find('.sub_total').val()) || 0;
        let discount_amount = (sub_total * percent / 100).toFixed(2);

        $row.find('.discount_amount').val(discount_amount);
        $row.find('.net_total').val((sub_total - discount_amount).toFixed(2));
         updateOrderSummary();
         updateSalesItem($row);
    });

    $('#adjustment').on('input', function(){
    updateOrderSummary();
});

    // When discount_amount changes
   $row.find('.discount_amount').on('input', function(){
    let discount_amount = parseFloat($(this).val()) || 0;
    let sub_total = parseFloat($row.find('.sub_total').val()) || 0;

    $row.find('.net_total').val((sub_total - discount_amount).toFixed(2));

    updateOrderSummary(); // <-- ADD
    updateSalesItem($row);
});

    // When discount_amount changes
   $row.find('.warrenty').on('input', function(){

    //$row.find('.warrenty').val(warrenty);

    updateOrderSummary(); // <-- ADD
    updateSalesItem($row);
});


    // When qty changes (only for common products)
 $row.find('.qty').on('input', function(){
    let qty = parseFloat($(this).val()) || 0;
    let price = parseFloat($row.find('.price').val()) || 0;

    let stockQty = parseFloat($row.find('.stock_qty').val());

    // 🚨 STOCK CHECK HERE TOO
    if(qty > stockQty){
        iziToast.error({
            message: "Stock limit exceeded! Available: " + stockQty,
            position: "topRight"
        });

        $(this).val(stockQty);
        qty = stockQty;
    }

    let sub_total = (qty * price).toFixed(2);
    $row.find('.sub_total').val(sub_total);

    let discount_amount = parseFloat($row.find('.discount_amount').val()) || 0;
    $row.find('.net_total').val((sub_total - discount_amount).toFixed(2));

    updateOrderSummary();
    updateSalesItem($row);
});


    // When price changes (only for common products)
    $row.find('.price').on('input', function(){
        let qty = parseFloat($row.find('.qty').val()) || 0;
        let price = parseFloat($(this).val()) || 0;
        let sub_total = (qty * price).toFixed(2);
        $row.find('.sub_total').val(sub_total);

        let discount_amount = parseFloat($row.find('.discount_amount').val()) || 0;
        $row.find('.net_total').val((sub_total - discount_amount).toFixed(2));

        updateOrderSummary();
        updateSalesItem($row);
    });


   
}




  

 $(document).ready(function () {

    function loadCustomerInfo(customer_id) {
        $.ajax({
            url: "<?= base_url('sales/get_customer_info'); ?>",
            type: "POST",
            data: { id: customer_id },
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
    let defaultCustomer = $("#customer_id").val();
    if (defaultCustomer) {
        loadCustomerInfo(defaultCustomer);
    }

    // Dropdown Change
    $("#customer_id").change(function () {
        let id = $(this).val();
        if (id !== "") {
            loadCustomerInfo(id);
        }
    });
});


$(document).on('click', '.removeItem', function(){
    if(!confirm('Are you sure to remove this item?')) return;

    var row = $(this).closest('tr');
    var item_id = row.data('id');

    $.ajax({
        url: "<?= base_url('sales/delete_item_ajax'); ?>",
        type: "POST",
        data: { item_id: item_id },
        dataType: "json",
        success: function(res){
            if(res.status === 'success'){

                row.remove();

                // iziToast success message
                iziToast.success({
                    message: "Item delete successfully!",
                    position: "topRight"
                });

                // Reorder SL number
                $('#itemsTable tbody tr').each(function(index){
                    $(this).find('td:first').text(index + 1);
                });

                updateOrderSummary(); // total calculation
                
            } else {
                iziToast.error({
                    message: res.msg,
                    position: "topRight"
                });
            }
        },
        error: function(){
            iziToast.error({
                message: "AJAX Error!",
                position: "topRight"
            });
        }
    });
});


$(document).on('click', '.editItem', function(){

    let row = $(this).closest('tr');

    let item_id = row.data('id');

    $('#edit_row_id').val(item_id);
    $('#edit_price').val(row.find('.price').val());

    // Load serials via AJAX
    refreshSerialList(item_id);

    $('#editModal').modal('show');
});

function formatDate(dateObj) {
    let d = dateObj.getDate().toString().padStart(2, '0');
    let m = (dateObj.getMonth() + 1).toString().padStart(2, '0');
    let y = dateObj.getFullYear();
    return `${d}/${m}/${y}`;
}
function refreshSerialList(item_id) {

    let tbody = $('#serial_list_container tbody');
    tbody.empty();

    $.ajax({
        url: "<?= base_url('sales/get_item_serials') ?>",
        type: "GET",
        data: { item_id: item_id },
        dataType: "json",
        success: function(res){

            if(res.status === 'success' && res.serials.length > 0){

                let sl = 1;

                res.serials.forEach(function(s){

                    let purchaseDate = new Date(s.purchase_date * 1000);  
                    let today = new Date();

                    // warranty calculation
                    let expireDate = new Date(purchaseDate);

                    if(s.warrenty_days === "Days"){
                        expireDate.setDate(expireDate.getDate() + parseInt(s.warrenty));
                    }
                    else if(s.warrenty_days === "Month"){
                        expireDate.setMonth(expireDate.getMonth() + parseInt(s.warrenty));
                    }

                    let diff = expireDate - today;
                    let remaining = Math.ceil(diff / (1000 * 3600 * 24));
                    if(remaining < 0) remaining = 0;

                    // purchase_price hide field
                    let purchase_price_hidden = `
                        <span class="purchase_price d-none">${s.purchase_price}</span>
                    `;

                    let html = `
                        <tr data-id="${s.id}">
                            <td>${sl++}</td>
                            <td>
                                ${s.serial_number}
                                ${purchase_price_hidden}
                            </td>
                            <td>${formatDate(purchaseDate)}</td>
                            <td>${remaining} Days</td>
                            <td>
                                <button class="btn btn-sm btn-info show-cost">Show Price</button>
                                <button class="btn btn-sm btn-danger delete-serial">Delete</button>
                            </td>
                        </tr>
                    `;

                    tbody.append(html);
                });

            } else {
                tbody.append('<tr><td colspan="5" class="text-center text-muted">No serials found.</td></tr>');
            }
        }
    });
}

$(document).on("click", ".show-cost", function(){
    let row = $(this).closest("tr");
    let price = row.find(".purchase_price").text();

    iziToast.info({
        message: "Purchase Price: " + price,
        position: 'topRight'
    });
});


  </script>


 <script>
    $(document).ready(function() {
   

   $("#sales_date ,#due_paid_date").datepicker({
  dateFormat: "dd-mm-yy",
  changeMonth: true,
  changeYear: true,
  yearRange: "1900:2100",
});


// Set a default date (e.g., today's date)
var today = $.datepicker.formatDate("dd-mm-yy", new Date());
$("#sales_date,.to_date").val(today);

  });

function updateItemRowUI(item_id, qty){
    let row = $('#itemsTable tbody tr[data-id="'+item_id+'"]');

    // qty update
    row.find('.qty').val(qty);

    // price
    let price = parseFloat(row.find('.price').val());

    // sub total
    let sub_total = price * qty;
    row.find('.sub_total').val(sub_total);

    // discount
    let discount = parseFloat(row.find('.discountAmount').val() || 0);

    // net total
    let net_total = sub_total - discount;
    row.find('.net_total').val(net_total);

    // Global total update
    updateOrderSummary();
}

function removeSerialFromTextArea(item_id, serial_number){

    let row = $('#itemsTable tbody tr[data-id="'+item_id+'"]');

    let textarea = row.find('.serial_number');

    // Serial list split by comma
    let serialList = textarea.val().split(',');

    // Remove matched serial
    serialList = serialList.filter(s => s.trim() !== serial_number.trim());

    // Join again with comma
    textarea.val(serialList.join(","));
}



     $(document).on("click", ".delete-serial", function(){

    if(!confirm("Are you sure to delete this serial?")) return;

    let row = $(this).closest("tr");
    let serial_id = row.data("id");  // sales_item_serials.id
    let item_id = $("#edit_row_id").val(); // sales_items.id

    $.ajax({
        url: "<?= base_url('sales/delete_serial_ajax') ?>",
        type: "POST",
        data: { serial_id: serial_id },
        dataType: "json",
        success: function(res){

            if(res.status === "success"){

                // Remove Serial Row
                row.remove();

                iziToast.success({
                    message: "Serial removed successfully",
                    position: "topRight"
                });

                // Update Main Items Table
                updateItemRowUI(res.item_id, res.new_qty, res.sub_total, res.net_total);
                removeSerialFromTextArea(res.item_id, res.serial_number);

            } else {
                iziToast.error({
                    message: res.msg,
                    position: "topRight"
                });
            }
        }
    });
});

    </script>