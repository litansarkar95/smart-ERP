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


    .group-name {
        font-weight: bold;
        color: #1e07cdff !important;
    }
    .stock-count {
        color: #0a7cff;
        font-size: 15px;
        font-weight: bold;
    }
    .price-tag {
        color: #e60000 !important; 
        font-weight: bold;
    }

    .show-cost {
    white-space: nowrap;
    min-width: 90px; /* চাইলে কম/বেশি দিতে পারবেন */
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
    <strong> Sales Return</strong>
    


</div>

             <form id="returnForm" enctype="multipart/form-data" method="post" action="<?= base_url('sales/sreturn/create') ?>">

                <!-- <div class="row">
                      <div class="col-md-6 ">
        <div class="form-group">
           
           <input type="text" name="item_serial" id="item_serial" placeholder="Scan Barcode & Hit Enter....."     class="form-control " autofocus>

        </div>
    </div>
                </div> -->
                                                            <div class="row ">
  
                                   <div class="col-md-2 ">
																<div class="form-group">
																<label for="sales_date">Sales Return Date<span class="text-error"> *</span></label>
									      						<input type="text"  name="sales_date" id="sales_date" value=""   class="form-control" >
																<span class="text-error small"><?php echo form_error('sales_date'); ?></span>
																</div>
									      					</div>     

                                 <!-- Select Customer -->
<div class="col-md-3">
    <div class="form-group">
        <label for="customer_id">Select Customer</label>
        <div class="select_2_container">
            <select name="customer_id" id="customer_id" class="form-control frm_select select2" required>
                <option value="">Select</option>
                <?php foreach ($allCustomer as $customer) { ?>
                    <option value="<?= $customer->id; ?>" >
                        <?= $customer->name . ' - ' . $customer->contact_no; ?>
                    </option>
                <?php } ?>
            </select>
            <i class="fas fa-caret-down"></i>
        </div>
        <span class="text-error small"><?= form_error('customer_id'); ?></span>
    </div>
</div>

                                  <div class="col-md-2 ">
                                <div class="form-group">
                                    <label for="customer_name">Customer Name</label>
                          
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
                                

                                <!-- Brand -->  

                          <div class="col-md-2 " style="display:none;">
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
<div class="col-md-5">
    <div class="form-group">
        <label for="product_id">Select Product</label>
        <div class="select_2_container">
            <select name="product_id" id="product_id" class="form-control frm_select select2">
                <option value="">Select Product</option>
                <!-- Products will be dynamically loaded -->
            </select>
            <i class="fas fa-caret-down"></i>
        </div>
        <span class="text-error small"><?= form_error('product_id'); ?></span>
    </div>
</div>

<!-- Select Serial Number (Barcode) -->
<div class="col-md-3" id="uniqueSerialBox" style="display:none;">
    <div class="form-group">
        <label for="unique_serial">Select Serial <span class="text-error">*</span></label>
        <div class="select_2_container">
            <select name="unique_serial" id="unique_serial" class="form-control frm_select select2">
                <option value="">Select</option>
                <!-- Serial numbers will be dynamically loaded -->
            </select>
            <i class="fas fa-caret-down"></i>
        </div>
        <span class="text-error small"></span>
    </div>
</div>

                                                                                                                    
                                                        
                                        <div class="col-md-2 ">
                                <div class="form-group">
                                    <label for="sales_person_id">Select Sales Person</label>
                                    <div class="select_2_container">
                                   <select name="sales_person_id" id="sales_person_id" class="form-control frm_select select2" >
                                    <option value="">Select</option>
                                    <?php foreach($allSperson as $person){ ?>
                                        <option value="<?= $person->id; ?>"  >
                                            <?= $person->name ; ?>
                                        </option>
                                    <?php } ?>
                                </select>

                                    <i class="fas fa-caret-down"></i>
                                    </div>
                                    <span class="text-error small"><?= form_error('sales_person_id'); ?></span>
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


                      
                                     </div>
<div class="row justify-content-end">
    <div class="col-md-6 text-end">

     

        <!-- <div class="form-check mb-2">
            <input class="form-check-input float-end" type="checkbox" name="send_bill_sms" value="1" id="sendBillSMS">
            <label class="form-check-label me-4" for="sendBillSMS">Send Bill SMS</label>
        </div>

        <div class="form-check mb-3">
            <input class="form-check-input float-end" type="checkbox" name="send_bill_email" value="1" id="sendBillEmail">
            <label class="form-check-label me-4" for="sendBillEmail">Send Bill Invoice Email</label>
        </div> -->

          <button type="submit" class="btn btn_bg px-4">Confirm </button>
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





    </script>

<!--   ####################################################################
    #######################################################################
    ########################################################################## -->


    <script>

   


$(document).ready(function() {

    function loadSupplierBalance() {
        var customer_id = $('#customer_id').val();

        if (customer_id !== '') {
            $.ajax({
                url: '<?= base_url("sales/get_supplier_balance"); ?>',
                type: 'POST',
                dataType: 'json',
                data: { customer_id: customer_id },
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

    $('#customer_id').on('change', function() {
        loadSupplierBalance();
    });

    loadSupplierBalance();
});





$(document).ready(function() {


// Show
$('#uniqueSerialBox').show();
$('#unique_serial').select2({ width: '100%' }); // Reinitialize select2

    // When customer is selected
    $('#customer_id').change(function() {
        var customer_id = $(this).val();
        $('#product_id').empty().append('<option value="">Select Product</option>');
        $('#uniqueSerialBox').hide();

        if (customer_id) {
            $.ajax({
                url: '<?= base_url("sales/sreturn/get_products_by_customer/") ?>' + customer_id,
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    if(data.length > 0){
                        $.each(data, function(index, product) {
                            $('#product_id').append(
                    '<option value="' + product.id + '" data-stock="' + product.qty + '">' 
                    + product.name + ' - Qty: ' + product.qty + 
                    '</option>'
                );
                        });
                    }
                }
            });
        }
    });

    // When product is selected
    $('#product_id').change(function() {
        var product_id = $(this).val();
        var customer_id = $('#customer_id').val();
        //$('#uniqueSerialBox').hide();
        $('#unique_serial').empty().append('<option value="">Select</option>');

        if (product_id && customer_id) {
            $.ajax({
                url: '<?= base_url("sales/sreturn/get_serial_numbers_by_product/") ?>' + product_id + '/' + customer_id,
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    if(data.length > 0){
                        $('#uniqueSerialBox').show();
                        $.each(data, function(index, serial) {
$('#unique_serial').append('<option value="' + serial.batch_number + '" data-type="' + serial.serial_type + '">' + serial.batch_number + '</option>');

                        });
                    }
                }
            });
        }
    });

});






$('#addItemBtn').click(function () {

    let product_id = $('#product_id').val();
    let product_name = $('#product_id option:selected').text();
    let customer_id = $('#customer_id').val();
    let serial_val = $('#unique_serial').val();
    let serial_text = $('#unique_serial option:selected').text();
    let stockQty = parseInt($('#product_id option:selected').data('stock'));

    // **Serial type ধরার লাইন এখানে বসাও**
    let serial_type = $('#unique_serial option:selected').data('type');

    if (!product_id || !serial_val) {
        iziToast.error({ message: "Select a product and serial", position: "topRight" });
        return;
    }

    $.ajax({
        url: "<?= base_url('sales/sreturn/get_product_price/') ?>" + product_id + "/" + customer_id,
        type: "GET",
        dataType: "json",
        success: function (data) {

            let price = parseFloat(data.price);
            let row = $('#itemsTable tbody tr[data-product="' + product_id + '"]');

            if (row.length > 0) {
                let oldQty = parseInt(row.find('.qty').text());

                // **Serial type check ব্যবহার করুন**
                if(serial_type === 'unique') {
                    let serials = row.find('.serial-list').text().split(',').map(s => s.trim());

                    if (serials.includes(serial_text)) {
                        iziToast.error({
                            message: "This unique serial already added!",
                            position: "topRight"
                        });
                        return;
                    }

                    serials.push(serial_text);
                    row.find('.serial-list').text(serials.join(", "));
                    row.find('.qty').text(serials.length);
                    row.find('.total').text((serials.length * price).toFixed(2));
                    calculateSummary();
                    return;
                } else {
                    // common product logic
                    if (oldQty + 1 > stockQty) {
                        iziToast.error({
                            message: "Stock limit exceeded! Available: " + stockQty,
                            position: "topRight"
                        });
                        return;
                    }

                    row.find('.qty').text(oldQty + 1);
                    row.find('.total').text(((oldQty + 1) * price).toFixed(2));
                    calculateSummary();
                    return;
                }
            }

            // নতুন row add
            let rowCount = $('#itemsTable tbody tr').length + 1;
           let newRow = `
    <tr data-product="${product_id}">
        <td>${rowCount}</td>
        <td>${product_name}</td>
        <td>-</td>
        <td>${stockQty}</td>
        <td class="price">${price}</td>
        <td class="qty">1</td>
        <td class="total">${price}</td>
        <td>0</td>
        <td>0</td>
        <td>${price}</td>
        <td class="serial-list" data-type="${serial_type}">${serial_text}</td>
        <td><button type="button" class="btn btn-danger removeRow">X</button></td>
    </tr>
`;

            $('#itemsTable tbody').append(newRow);
            calculateSummary();
        }
    });
});



$(document).on('click', '.removeRow', function () {
    $(this).closest('tr').remove();
    calculateSummary();
});

$('#adjustment, #paidAmount').on('keyup change', function () {
    calculateSummary();
});

function calculateSummary() {

    let totalOrder = 0;
    let subTotal = 0;
    let totalDiscount = 0;

    $('#itemsTable tbody tr').each(function () {

        let qty = parseFloat($(this).find('.qty').text());
        let total = parseFloat($(this).find('.total').text());
        let discount = parseFloat($(this).find('.disc_amount')?.text() || 0);

        totalOrder += qty;
        subTotal += total;
        totalDiscount += discount;
    });

    // Fill fields
    $('#totalOrder').val(totalOrder);
    $('#subtotalAmount').val(subTotal.toFixed(2));
    $('#totalDiscount').val(totalDiscount.toFixed(2));

    let totalAmount = subTotal - totalDiscount;
    $('#totalAmount').val(totalAmount.toFixed(2));

    let adjustment = parseFloat($('#adjustment').val() || 0);
    let payable = totalAmount - adjustment;
    $('#payableAmount').val(payable.toFixed(2));

    let paidAmount = parseFloat($('#paidAmount').val() || 0);
    let due = payable - paidAmount;
    $('#dueAmount').val(due.toFixed(2));
}

$('#customer_id').change(function () {

    // previous reset codes...
    $('#itemsTable tbody').html("");

    // summary reset
    $('#totalOrder').val(0);
    $('#subtotalAmount').val(0);
    $('#totalDiscount').val(0);
    $('#totalAmount').val(0);
    $('#payableAmount').val(0);
    $('#dueAmount').val(0);
    $('#paidAmount').val(0);
});
$('#returnForm').submit(function(e){
    e.preventDefault(); // prevent default form submit

    let items = [];

    $('#itemsTable tbody tr').each(function(){
        let product_id = $(this).data('product');
        let qty = parseInt($(this).find('.qty').text());
        let price = parseFloat($(this).find('.price').text());
        let total = parseFloat($(this).find('.total').text());
        let serials = $(this).find('.serial-list').text();
        let serial_type = $(this).find('.serial-list').data('type');

        items.push({
            product_id: product_id,
            qty: qty,
            price: price,
            total: total,
            serials: serials,
              serial_type: serial_type
        });
    });

    // JSON হিসেবে hidden input
    if(items.length == 0){
        iziToast.error({message: 'Cart is empty!', position: 'topRight'});
        return;
    }

    $('<input>').attr({
        type: 'hidden',
        name: 'items',
        value: JSON.stringify(items)
    }).appendTo(this);

    this.submit(); // এখন form submit হবে
});


        </script>