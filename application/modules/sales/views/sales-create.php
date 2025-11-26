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
            <h3>Add New  Sales </h3>
          </div>
          <div class="col-auto ms-auto">
            <!-- Button trigger modal -->
               <div class="right">
                 <?php if (has_permission('products', 'index')): ?>
                <a type="button" href="<?php echo base_url(); ?>sales" class="btn btn_bg" >
                    <i class="fa-solid fa-list"></i> Sales  List
                </a>
                   <?php endif; ?>
            </div>

          </div>
        </div>
        <div class="row">
          <div class="col-12">
                <form  action="<?php echo base_url(); ?>sales/create" method="post" enctype="multipart/form-data">
                                                            <div class="row mb-3">
    <div class="col-md-12 mb-2">
        <div class="form-group">
           
           <input type="text" name="previousDue" placeholder="Scan Barcode & Hit Enter....."     class="form-control " autofocus>

        </div>
    </div>
                                     <div class="col-md-2 mb-2">
																<div class="form-group">
																<label for="invoice_no">Invoice No <span class="text-error"> *</span></label>
									      						<input type="text"   name="invoice_no" id="invoice_no" value="<?= $invoice_no; ?>"   class="form-control" readonly>
																<span class="text-error small"><?php echo form_error('invoice_no'); ?></span>
																</div>
									      					</div>   
                                                             <div class="col-md-2 mb-2">
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

                                  <div class="col-md-3 mb-3">
                                <div class="form-group">
                                    <label for="customer_name">Customer Name</label>
                          
                                       <input type="text"  name="customer_name" id="customer_name" value="" class="form-control ">
                                 
                                    <span class="text-error small"><?= form_error('customer_name'); ?></span>
                                </div>
                                </div>

                                <!-- Mobile No -->  
                                        <div class="col-md-3 mb-3">
                                <div class="form-group">
                                    <label for="mobile_no">Mobile No</label>
                            
                                      <input type="text" name="mobile_no" id="mobile_no" value="" class="form-control ">
                              
                                </div>
                                </div>

                                <!-- Address -->  

                                <div class="col-md-3 mb-3">
                                <div class="form-group">
                                    <label for="address">Address</label>
                            
                                             <input type="text" name="address" id="address" value="" class="form-control ">
                                
                                    <span class="text-error small"><?= form_error('address'); ?></span>
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

                                                                                <div class="col-md-5 mb-3">
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


                                                            
                                                                                                                
                                                        <div class="col-md-4 mb-2" id="uniqueSerialBox" style="display:none;">
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
<div class="col-md-12 mb-3" id="save_customer_box" style="display:none;">
    <label><input type="checkbox" name="save_customer" value="1"> Is Customer Save?</label>
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
            <label for="totalDiscount">Total Discount  </label>
            <input type="text" name="totalDiscount" id="totalDiscount" value="" class="form-control totalDiscount" >
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
            <label for="adjustment"> Adjustment </label>
            <input type="text" name="adjustment" id="adjustment" value="0" class="form-control " >
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
    let subtotal = 0;
    let totalDiscount = 0;

    $('#itemsTable tbody tr').each(function(){
        let sub_total = parseFloat($(this).find('.sub_total').val()) || 0;
        let discount_amount = parseFloat($(this).find('.discount_amount').val()) || 0;

        subtotal += sub_total;
        totalDiscount += discount_amount;
    });

    let total = subtotal - totalDiscount;

    let adjustment = parseFloat($('#adjustment').val()) || 0;
    let payable = total + adjustment;

    // Update fields
    $('#subtotalAmount').val(subtotal.toFixed(2));
    $('#totalDiscount').val(totalDiscount.toFixed(2));
    $('#totalOrderAmount').val(subtotal.toFixed(2)); // if totalOrder = subtotal
    $('#totalAmount').val(total.toFixed(2));
    $('#dueAmount').val(payable.toFixed(2));
}
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
        '<input type="number" class="qty form-control" value="'+qtyValue+'" readonly>' : 
        '<input type="number" class="qty form-control" value="'+qtyValue+'">';

  
        // Discount fields (editable for all products)
    let discountPercentField = '<input type="number" class="discount_percent form-control" value="">';
    let discountAmountField = '<input type="number" class="discount_amount form-control" value="">';

    let newRow = '<tr data-product="'+product_id+'">'+
        '<td>' + ($('#itemsTable tbody tr').length + 1) + '</td>'+
        '<td>' + res.item.product_name + '</td>'+
        '<td><input type="number" class="warrenty form-control" name="warrenty" value="'+res.item.warrenty+'" >'  + res.item.warrenty_days + '</td>'+
        '<td><input type="number" class="stock_qty form-control" name="stock_qty" value="'+res.item.stockQty+'" ></td>'+
        '<td><input type="number" class="price form-control" name="price" value="'+priceValue+'" ></td>'+
        '<td>' + qtyField + '</td>'+
        '<td><input type="number" class="sub_total form-control" value="'+subTotal+'" readonly></td>'+
        '<td>' + discountPercentField + '</td>'+
        '<td>' + discountAmountField + '</td>'+
        '<td><input type="number" class="net_total form-control" value="'+subTotal+'" readonly></td>'+
        '<td><textarea class="serial_number form-control" readonly>'+serial+'</textarea></td>'+
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
  </script>


 <script>
    $(document).ready(function() {
   

   $("#sales_date").datepicker({
  dateFormat: "dd-mm-yy",
  changeMonth: true,
  changeYear: true,
  yearRange: "1900:2100",
});


// Set a default date (e.g., today's date)
var today = $.datepicker.formatDate("dd-mm-yy", new Date());
$("#sales_date,.to_date").val(today);

  });



     
    </script>