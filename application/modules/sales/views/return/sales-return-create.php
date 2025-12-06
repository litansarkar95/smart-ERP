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
<form id="salesReturnForm" action="<?php echo base_url(); ?>sales/salesreturn/save_sales_return" method="post" enctype="multipart/form-data">
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
					<label for="sales_date">Sales Date<span class="text-error"> *</span></label>
					<input type="text"  name="sales_date" id="sales_date" value=""   class="form-control" >
					<span class="text-error small"><?php echo form_error('sales_date'); ?></span>
				
				</div>
				</div>     



	<div class="col-md-3">
    <div class="form-group">
        <label for="customer_id">Select Customer</label>
        <div class="select_2_container">
            <select name="customer_id" id="customer_id" class="form-control frm_select select2" >
                <option value="">Select</option>
               
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
                          
                                



                                                                                                                    
                                     
                                                            
                                                              <div class="col-md-2 "  id="remarks"  >
																<div class="form-group">
																<label for="remarks">Remarks</label>
									      						<textarea type="text"  name="remarks" id="remarks" value=""   class="form-control remarks" ></textarea>
																<span class="text-error small"><?php echo form_error('remarks'); ?></span>
																</div>
									      					</div>
                                                <input type="hidden" id="invoice_id" name="invoice_id" value="<?php echo date("dmYHis")?>">
                                                                                                        
                                                 


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
            



document.getElementById('item_serial').focus();

// ========================
// Serial Scan Event
// ========================
$('#item_serial').on('keypress', function (e) {

    if (e.which === 13) {
        e.preventDefault();

        let serial = $(this).val().trim();
        let customer_id = $("#customer_id").val();
   

        
        $.ajax({
            url: "<?= base_url('sales/salesreturn/add_item_from_serial_ajax') ?>",
            type: "POST",
            dataType: "json",
            data: {
                serial: serial,
                customer_id: customer_id
            },

            success: function (res) {

                if (res.status !== "success") {
                    iziToast.error({
                        message: res.msg,
                        position: "topRight"
                    });
                    $('#item_serial').val("").focus();
                    return;
                }

                // ===============================
                // First Scan → Auto Set Customer
                // ===============================
                // Customer auto-set
if (!$("#customer_id").val()) {
    $("#customer_id").val(res.customer.id).trigger('change'); // trigger('change') দিলে select2 আপডেট হয়
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


// ====================================
// Add Item to Table (Merge Logic)
// ====================================
function addItemToTable(item) {

    let serialType = item.serial_type;
    let serial = item.batch_number;
    let price = parseFloat(item.sales_price);

 
  // CHECK EXISTING ROW
let existingRow = null;

$("#itemsTable tbody tr").each(function () {
    if ($(this).data("product-id") == item.product_id &&
        $(this).data("serial-type") == serialType &&
        $(this).data("customer-id") == item.customer_id) {  // <-- নতুন চেক
        existingRow = $(this);
    }
});


    // ==================================================
    // CASE 1: ROW EXISTS → MERGE
    // ==================================================
   
if (existingRow) {
    let qtyInput = existingRow.find(".qty");
    let oldQty = parseInt(qtyInput.val());

    if (serialType === "unique") {
        let serialBox = existingRow.find(".serial-box");
        if (!serialBox.text().includes(serial)) {
            serialBox.append(
                `<span class="serial-item badge bg-primary m-1" 
                       data-serial="${serial}" style="cursor:pointer;">
                    ${serial} <b>×</b>
                </span>`
            );

            let arr = JSON.parse(existingRow.attr("data-price-array"));
            arr.push(price);
            existingRow.attr("data-price-array", JSON.stringify(arr));

            let net = arr.reduce((a, b) => a + b, 0);
            existingRow.find(".net_total").text(net.toFixed(2));
            qtyInput.val(arr.length);
        }
    } else {
        // ====================== COMMON TYPE ======================
        qtyInput.val(oldQty + 1);
        let newTotal = (oldQty + 1) * price;
        existingRow.find(".total").text(newTotal.toFixed(2));
        existingRow.find(".net_total").text(newTotal.toFixed(2));

        // Common → batch_number show
        existingRow.find(".serial-box").text(item.batch_number);
    }

    updateLineNumbers();
    updateSummary();
    return;
}



    // ==================================================
    // CASE 2: NEW ROW
    // ==================================================
    let priceArray = [price];
let row = `
<tr data-product-id="${item.product_id}"
    data-serial-type="${serialType}"
    data-customer-id="${item.customer_id}" data-batch-number="${item.batch_number}"
    data-price-array='${JSON.stringify(priceArray)}'>

    <td class="line_no"></td>
    <td>${item.product_name}</td>
    <td><input type="text" class="form-control price" value="${price}" readonly></td>
    <td>
        <input type="number" class="form-control qty" 
               value="1" min="1"
               ${serialType === "unique" ? "readonly" : ""}>
    </td>
    <td class="total">${price}</td>
    <td class="net_total">${price}</td>
    <td class="serial-box">
        ${serialType === "unique" 
            ? `<span class="serial-item badge bg-primary m-1" data-serial="${serial}" style="cursor:pointer;">
                   ${serial} <b>×</b>
               </span>`
            : item.batch_number // Common type → শুধু batch_number দেখাবে
        }
    </td>
    <td><button class="btn btn-danger btn-sm removeRow">X</button></td>
</tr>`;



    $("#itemsTable tbody").append(row);
    updateLineNumbers();
    updateSummary();
}


// ============================
// Remove Whole Row
// ============================
$(document).on("click", ".removeRow", function () {
    $(this).closest("tr").remove();
    updateLineNumbers();
    updateSummary();
});


// ============================
// Remove Unique Serial
// ============================
$(document).on("click", ".serial-item", function () {

    let serial = $(this).data("serial");
    let row = $(this).closest("tr");

    if (!confirm(serial + " remove করবেন?")) return;

    let arr = JSON.parse(row.attr("data-price-array"));
    arr.shift(); // remove price (advanced mapping চাইলে বলবেন)

    row.attr("data-price-array", JSON.stringify(arr));

    $(this).remove();

    if (arr.length === 0) {
        row.remove();
        updateLineNumbers();
        updateSummary();
        return;
    }

    let net = arr.reduce((a, b) => a + b, 0);
    row.find(".net_total").text(net.toFixed(2));
    row.find(".qty").val(arr.length);
    updateSummary();
});


// ============================
// Qty Change (Only Common)
// ============================
$(document).on("input", ".qty", function () {

    let tr = $(this).closest("tr");
    let price = parseFloat(tr.find(".price").val());
    let qty = parseInt($(this).val());

    let total = qty * price;

    tr.find(".total").text(total.toFixed(2));
    tr.find(".net_total").text(total.toFixed(2));

    updateSummary();
});


// ============================
// LINE NUMBER UPDATE
// ============================
function updateLineNumbers() {
    $("#itemsTable tbody tr").each(function (i) {
        $(this).find(".line_no").text(i + 1);
    });
}
$(document).on("input", "#paidAmount", function() {
    updateSummary();
});

function updateSummary() {

    let subtotal = 0;
    let totalQty = 0;

    $("#itemsTable tbody tr").each(function () {
        subtotal += parseFloat($(this).find(".net_total").text());
        totalQty += parseInt($(this).find(".qty").val());
    });

    // Subtotal
    $("#subtotalAmount").val(subtotal.toFixed(2));

    // Total Qty
    $("#totalOrder").val(totalQty);

    // Previous Due
    let previousDue = parseFloat($("#previousDue").val()) || 0;

    // Total
    let total = subtotal + previousDue;
    $("#totalAmount").val(total.toFixed(2));

    // Adjustment
    let adjustment = parseFloat($("#adjustment").val()) || 0;

    // Payable
    let payable = total + adjustment;
    $("#payableAmount").val(payable.toFixed(2));

    // Paid
    let paid = parseFloat($("#paidAmount").val()) || 0;

    // Due
    let due = payable - paid;
    $("#dueAmount").val(due.toFixed(2));
}


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
    e.preventDefault(); // prevent normal submit


 // Table থেকে items সংগ্রহ করার সময়
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

// তারপর hidden input বা ajax এ পাঠাতে পারেন
$('input[name="items"]').val(JSON.stringify(items));

    // Hidden input এ JSON stringify করে বসানো
    $('#itemsInput').val(JSON.stringify(items));

    // এবার ফর্ম সাবমিট
    this.submit();
});

</script>