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
    min-width: 90px; 
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
             <strong>Sales Return</strong></div>
<form id="salesReturnForm" action="<?php echo base_url(); ?>sales/sreturn/save_sales_return" method="post" enctype="multipart/form-data">
    <input type="hidden" name="items" id="itemsInput">

                <div class="row">
                      <div class="col-md-6 ">
        <div class="form-group">
           
           <input type="text" name="item_serial" id="item_serial" placeholder="Scan Barcode & Hit Enter....."     class="form-control " autofocus>

        </div>
    </div>
                </div>
                                                            <div class="row ">
  
                                     <div class="col-md-2 ">
																<div class="form-group">
																<label for="invoice_no">Invoice No <span class="text-error"> *</span></label>
									      						<input type="text"   name="invoice_no" id="invoice_no" value="<?= $invoice_no; ?>"   class="form-control" readonly>
																<span class="text-error small"><?php echo form_error('invoice_no'); ?></span>
																</div>
									      					</div>   
                                                             <div class="col-md-2 ">
					<div class="form-group">
					<label for="sales_date">Return Date<span class="text-error"> *</span></label>
					<input type="text"  name="sales_date" id="sales_date" value=""   class="form-control" >
					<span class="text-error small"><?php echo form_error('sales_date'); ?></span>
				
				</div>
				</div>     



	<div class="col-md-3">
    <div class="form-group">
        <label for="customer_id">Select Supplier</label>
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
                                                                                    <div class="col-md-5 ">
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
                                

                                                                                                <div class="col-md-2 ">
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

                                                                                                                    
                                     
                                                            
                                                              <div class="col-md-2 "  id="remarks"  >
																<div class="form-group">
																<label for="remarks">Remarks</label>
									      						<textarea type="text"  name="remarks" id="remarks" value=""   class="form-control remarks" ></textarea>
																<span class="text-error small"><?php echo form_error('remarks'); ?></span>
																</div>
									      					</div>
                                                <input type="hidden" id="invoice_id" name="invoice_id" value="<?php echo date("dmYHis")?>">
                                                                                                        
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
         
            <th>Price</th>
            <th>Qty</th>
            <th>Total </th>
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
            <!-- <div class="col-md-2 ">
        <div class="form-group">
            <label for="previousDue">Previous Due </label>
            <input type="text" name="previousDue" id="previousDue" value="" class="form-control previousDue" >
        </div>
    </div> -->
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
            <label for="paidAmount"> Amount Return </label>
            <input type="text" name="paidAmount" id="paidAmount" value="" class="form-control paidAmount" >
        </div>
    </div>
                                                         <!-- <div class="col-md-2 ">
																<div class="form-group">
																<label for="due_paid_date">Next Due Paid Date<span class="text-error"> *</span></label>
									      						<input type="text"  name="due_paid_date" id="due_paid_date" value=""   class="form-control" >
																<span class="text-error small"><?php echo form_error('due_paid_date'); ?></span>
																</div>
									      					</div>  -->

                      
                                     </div>
<div class="row justify-content-end">
    <div class="col-md-6 text-end">



    <button type="submit" class="btn btn_bg px-4">Confirm Order</button>
</form>

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

    // =======================
    // Focus on serial input
    // =======================
    $("#item_serial").focus();

    // =======================
    // Serial Scan Event
    // =======================
    $('#item_serial').on('keypress', function(e) {
        if (e.which === 13) {
            e.preventDefault();

            let serial = $(this).val().trim();
            let customer_id = $("#customer_id").val();

            if (!serial) return;

            // Duplicate check for UNIQUE serial
            let alreadyAdded = false;
            $("#itemsTable tbody tr").each(function() {
                $(this).find(".serial-item").each(function() {
                    if ($(this).data("serial") == serial) {
                        alreadyAdded = true;
                        return false;
                    }
                });
                if (alreadyAdded) return false;
            });

            if (alreadyAdded) {
                iziToast.error({ message: serial + " already added!", position: "topRight" });
                $('#item_serial').val("").focus();
                return;
            }

            // Ajax call
            $.ajax({
                url: "<?= base_url('sales/sreturn/add_item_from_serial_ajax') ?>",
                type: "POST",
                dataType: "json",
                data: { serial: serial, customer_id: customer_id },
                success: function(res) {
                    if (res.status !== "success") {
                        iziToast.error({ message: res.msg, position: "topRight" });
                        $('#item_serial').val("").focus();
                        return;
                    }

                    // Auto-set customer if first scan
                    if (!$("#customer_id").val()) {
                        $("#customer_id").val(res.customer.id).trigger('change');
                        $("#customer_name").val(res.customer.name);
                        $("#mobile_no").val(res.customer.contact_no);
                        $("#address").val(res.customer.address);
                        $("#previousDue").val(res.customer.previous_due);
                        updateSummary();
                    }

                    addItemToTable(res.item);
                    $('#item_serial').val("").focus();
                }
            });
        }
    });

    // =======================
    // Add Item Button Click
    // =======================
    $('#addItemBtn').click(function() {
        let product_id = $("#product_id").val();
        let invoice_id = $("#invoice_id").val();
        let batch_number = $("#serial_list").val();

        if (!product_id || !batch_number) {
            iziToast.error({ message: "Select product & batch first!", position: "topRight" });
            return;
        }

        $.ajax({
            url: "<?= base_url('sales/sreturn/get_serial_items_by_product') ?>",
            type: "POST",
            dataType: "json",
            data: { product_id, invoice_id, batch_number },
            success: function(res) {
                if (res.status !== "success") {
                    iziToast.error({ message: "No items found!", position: "topRight" });
                    return;
                }

                let items = res.item;
                if (!Array.isArray(items)) items = [items];

                items.forEach(item => addItemToTable(item));
            }
        });
    });

    // =======================
    // Add Item to Table
    // =======================


    function addItemToTable(item) {
    let serialType = item.serial_type;
    let serial = item.serial || item.batch_number;
    let price = parseFloat(item.sales_price);
    let availableQty = parseInt(item.available_qty);

    // UNIQUE SERIAL
    if(serialType === "unique") {
        // check if this exact serial already added
        let serialExists = false;
        $("#itemsTable tbody tr .serial-item").each(function() {
            if($(this).data("serial") == serial) serialExists = true;
        });
        if(serialExists) {
            iziToast.error({ message: serial + " already added!", position: "topRight" });
            return;
        }

        // find existing row for this sales_item_id + customer + unique type
        let existingRow = null;
        $("#itemsTable tbody tr").each(function() {
            if($(this).data("product-id") == item.product_id &&
               $(this).data("serial-type") == "unique" &&
               $(this).data("customer-id") == item.supplier_id) {
                existingRow = $(this);
                return false;
            }
        });

        if(existingRow) {
            // append serial
            existingRow.find(".serial-box").append(
                `<span class="serial-item badge bg-primary m-1" data-serial="${serial}" style="cursor:pointer;">
                    ${serial} <b>×</b>
                </span>`
            );

            // update qty and total
            let qtyInput = existingRow.find(".qty");
            let oldQty = parseInt(qtyInput.val());
            qtyInput.val(oldQty + 1);

            let newTotal = (oldQty + 1) * price;
            existingRow.find(".total, .net_total").text(newTotal.toFixed(2));
            updateSummary();
            return;
        }
    }

    // New row (for COMMON or first UNIQUE)
    if(availableQty <= 0) {
        iziToast.error({ message: "No stock available for this batch!", position: "topRight" });
        return;
    }

    let row = `<tr data-product-id="${item.product_id}" data-serial-type="${serialType}" data-customer-id="${item.supplier_id}" data-batch-number="${item.batch_number}">
        <td class="line_no"></td>
        <td>${item.product_name}</td>
        <td><input class="form-control price" value="${price}" readonly></td>
        <td><input class="form-control qty" value="1" min="1" max="${availableQty}" ${serialType==='unique'?'readonly':''}></td>
        <td class="total">${price}</td>
        <td class="net_total">${price}</td>
        <td class="serial-box">
            ${serialType==='unique'?`<span class="serial-item badge bg-primary m-1" data-serial="${serial}" style="cursor:pointer;">${serial} <b>×</b></span>`:serial}
        </td>
        <td><button class="btn btn-danger btn-sm removeRow">X</button></td>
    </tr>`;

    $("#itemsTable tbody").append(row);
    updateLineNumbers();
    updateSummary();
}


    

// Remove Unique Serial
$(document).on("click", ".serial-item", function() {
    let serial = $(this).data("serial");
    let row = $(this).closest("tr");

    if (!confirm(serial + " remove করবেন?")) return;

    $(this).remove();

    // Update qty and net_total after removing serial
    let serialCount = row.find(".serial-item").length;
    if (serialCount === 0) {
        row.remove();
        updateLineNumbers();
        updateSummary();
        return;
    }

    let price = parseFloat(row.find(".price").val());
    row.find(".qty").val(serialCount);
    row.find(".total, .net_total").text((serialCount * price).toFixed(2));
    updateSummary();
});

    // =======================
    // Remove Unique Serial
    // =======================
  

    // =======================
    // Update Line Numbers
    // =======================
    function updateLineNumbers() {
        $("#itemsTable tbody tr").each(function(i) {
            $(this).find(".line_no").text(i + 1);
        });
    }

    // =======================
    // Update Summary
    // =======================
    function updateSummary() {
        let subtotal = 0, totalQty = 0;
        $("#itemsTable tbody tr").each(function() {
            subtotal += parseFloat($(this).find(".net_total").text());
            totalQty += parseInt($(this).find(".qty").val());
        });
        $("#subtotalAmount").val(subtotal.toFixed(2));
        $("#totalOrder").val(totalQty);
        let previousDue = parseFloat($("#previousDue").val()) || 0;
        let total = subtotal + previousDue;
        $("#totalAmount").val(total.toFixed(2));
        let adjustment = parseFloat($("#adjustment").val()) || 0;
        let payable = total + adjustment;
        $("#payableAmount").val(payable.toFixed(2));
        let paid = parseFloat($("#paidAmount").val()) || 0;
        let due = payable - paid;
        $("#dueAmount").val(due.toFixed(2));
    }

});
</script>

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
$('#salesReturnForm').on('submit', function(e) {
    e.preventDefault();


let items = [];

$("#itemsTable tbody tr").each(function() {
    let tr = $(this);
    let serialType = tr.data("serial-type");
    let product_id = tr.data("product-id");
    let qty = parseInt(tr.find(".qty").val());
    let price = parseFloat(tr.find(".price").val());
    let total = parseFloat(tr.find(".net_total").text());

    let serials = null;
    if(serialType === 'unique') {
        serials = [];
        tr.find('.serial-item').each(function() {
            serials.push($(this).data('serial'));
        });
        serials = serials.join(',');
    } else if(serialType === 'common') {
        // common type → data attribute থেকে নেয়া
        serials = tr.data('batch-number'); 
    }

    items.push({
        serial_type: serialType,
        product_id: product_id,
        qty: qty,
        price: price,
        total: total,
        serials: serials
    });
});


$('input[name="items"]').val(JSON.stringify(items));

    $('#itemsInput').val(JSON.stringify(items));

    this.submit();
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
        url: "<?= base_url('sales/sreturn/get_serial_by_product'); ?>",
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


$('#addItemBtn').click(function() {
    let product_id = $("#product_id").val();
    let invoice_id = $("#invoice_id").val();
    let batch_number = $("#serial_list").val();

    $.ajax({
        url: "<?= base_url('sales/sreturn/get_serial_items_by_product') ?>",
        type: "POST",
        data: { product_id: product_id, invoice_id: invoice_id ,  batch_number: batch_number},
        dataType: "json",
        success: function(res){
            if(res.status !== "success") {
                iziToast.error({ message: "No items found!", position: "topRight" });
                return;
            }

            let items = res.item;

            // যদি item এক object হয় না array, তাহলে array বানান
            if(!Array.isArray(items)) {
                items = [items];
            }

            items.forEach(function(item){
                addItemToTable(item);
            });
        }
    });
});



</script>
