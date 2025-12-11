<style>
.print-btn{
 
  
    padding:10px !important;
}
  </style>
  <!-- Include jQuery UI CSS -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- Include jQuery (Make sure this is loaded first) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Include jQuery UI JS -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<div class="container-fluid">





  <div class="row px-3">
    <div class="col-12">
      <div class="content">
        <div class="row">
          <div class="col-auto">
           <h3> Quotation </h3>
          </div>
          <div class="col-auto ms-auto">
            <!-- Button trigger modal -->
               <div class="right">
                 <?php if (has_permission('products/order', 'create')): ?>
                <a type="button" href="<?php echo base_url(); ?>purchase/create" class="btn btn_bg" >
                    <i class="fa-solid fa-plus"></i> Add New Order 
                </a>
                   <?php endif; ?>
            </div>

          </div>
        </div>
        <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="panel panel-default" data-select2-id="select2-data-5-6tom">
                 
                    <form action="/Sales/QAddToCart.html" id="SaleAddToCartForm" class="form-horizontal form-label-left" method="post" accept-charset="utf-8" data-select2-id="select2-data-SaleAddToCartForm">
<div class="row">
    <div class="col-md-4">
        <!-- Customer Fields -->
            <div class="row ">
  
                                                          <div class="col-md-6 ">
																<div class="form-group">
																<label for="invoice_id">Invoice No <span class="text-error"> *</span></label>
									      						<input type="text"   name="invoice_id" id="invoice_id" value="<?= $invoice->invoice_code; ?>"   class="form-control" readonly>
																<span class="text-error small"><?php echo form_error('invoice_id'); ?></span>
																</div>
									      					</div>
                                                            <div class="col-md-6 ">
																<div class="form-group">
																<label for="invoice_id">Invoice No <span class="text-error"> *</span></label>
									      						<input type="text"   name="invoice_id" id="invoice_id" value="<?= $invoice->invoice_code; ?>"   class="form-control" readonly>
																<span class="text-error small"><?php echo form_error('invoice_id'); ?></span>
																</div>
									      					</div>

                                                            <div class="col-md-6 ">
																<div class="form-group">
																<label for="invoice_id">Invoice No <span class="text-error"> *</span></label>
									      						<input type="text"   name="invoice_id" id="invoice_id" value="<?= $invoice->invoice_code; ?>"   class="form-control" readonly>
																<span class="text-error small"><?php echo form_error('invoice_id'); ?></span>
																</div>
									      					</div>
                                                             <div class="col-md-12 ">
                                <div class="form-group">
                                    <label for="customer_id">Select Customer</label>
                                    <div class="select_2_container">
                                   <select name="customer_id" id="customer_id" class="form-control frm_select select2" required>
                                    <option value="">Select</option>
                                    <?php foreach($allCustomer as $customer){ ?>
                                        <option value="<?= $customer->id; ?>" 
                                             <?= ($invoice->customer_id==$customer->id) ? 'selected' : '' ?>>
                                            <?= $customer->name . ' - ' . $customer->contact_no; ?>
                                        </option>
                                    <?php } ?>
                                </select>

                                    <i class="fas fa-caret-down"></i>
                                    </div>
                                    <span class="text-error small"><?= form_error('customer_id'); ?></span>
                                </div>
                                </div>
                                                        
                                                        </div> 

    </div>
    <div class="col-md-8">
          <div class="table-responsive">
                              <table id="normalinvoice" class="table table-striped table-bordered nowrap gui-products-table table-sm" width="100%" cellspacing="0">
                                <thead>
                                  <tr>
                                    <th>SL</th>
                                    <th>Product Name</th>
                                    <th>Brand</th>
                                    <th>Warranty</th>
                                    <th>Price</th>
                                    <th>Qty</th>
                                    <th>Total Price</th>
                                    <th>Action</th>
                                  </tr>
                                </thead>
                               <tbody id="addinvoiceItem">
            <tr>
                <td>
                    <input type="text" id="serial_1" name="serial[]" style="text-align:right;" placeholder="1" class="form-control" tabindex="0" value="1">
                </td>
                <td style="width:250px">
                    <input type="text" id="prod_name_1" name="prod_name[]" onkeyup="invoice_productList(1);" onkeypress="invoice_productList(1);" class="form-control productSelection ui-autocomplete-input" tabindex="1" autocomplete="off">
                    <input type="hidden" id="prod_id_1" name="prod_id[]" class="form-control autocomplete_hidden_value prod_id_1" style="width:100%;float:left;" value="">
                </td>
                <td>
                    <input type="text" id="brand_name_1" name="brand_name[]" style="text-align:right;" placeholder="Brand Name" class="form-control" tabindex="2" readonly>
                </td>
                <td>
                    <input type="text" id="warrenty_1" name="warrenty[]" class="form-control" style="width:50%;float:left;" tabindex="2" readonly>
                    <select id="warrenty_type_1" name="warrenty_type[]" class="form-control" style="width:50%;" tabindex="3">
                        <option>Month</option>
                    </select>
                </td>
                <td>
                    <input type="text" id="sale_price_1" name="sale_price[]" style="text-align:right;" onkeyup="quantity_calculate(1);" placeholder="0.00" class="form-control" tabindex="4">
                </td>
                <td style="width:85px">
                    <input type="text" id="prod_qty_1" name="prod_qty[]" style="text-align:right;" onkeyup="quantity_calculate(1);" placeholder="1" class="form-control" tabindex="5" value="1">
                </td>
                <td>
                    <input type="text" id="total_price_1" name="total_price[]" readonly="" style="text-align:right;" placeholder="0.00" class="form-control add">
                </td>
                <td style="text-align: center;">
                    <button style="text-align: right;" class="btn btn-info btn-xs" type="button" onclick="addInputField('addinvoiceItem');" tabindex="6" id="add_invoice_item"><i class="fa fa-plus"></i></button>
                </td>
            </tr>
         <tfoot>
                                    <tr>
                                        <th colspan="4" rowspan="6">
                                            <textarea class="form-control" style="height:196px" name="comments" id="comments" placeholder="Note...."></textarea>
                                        </th>
                                        <th colspan="3" style="text-align:right;">Total</th>
                                        <th><input autofocus="" type="text" style="margin:0px; text-align:right;" id="total_amount" readonly="" name="total_amount" class="form-control" value=""></th>
                                        <th></th>
                                    </tr>
                                    <tr>
                                        <th colspan="3" style="text-align:right;">Vat Percent (%)</th>
                                        <th><input type="text" style="margin:0px; text-align:right;" onkeyup="calc_vat();" id="vat_percent" name="vat_percent" class="form-control" value=""></th>
                                        <th></th>
                                    </tr>
                                    <tr>
                                        <th colspan="3" style="text-align:right;">Vat Amount</th>
                                        <th><input type="text" onchange="calc_total();" style="margin:0px; text-align:right;" id="vat_amount" name="vat_amount" class="form-control" value=""></th>
                                        <th></th>
                                    </tr>
                                    <tr>
                                        <th colspan="3" style="text-align:right;">Discount Percent (%)</th>
                                        <th><input type="text" style="margin:0px; text-align:right;" id="discount_percent" name="discount_percent" onkeyup="calc_dis()" class="form-control" value=""></th>
                                        <th></th>
                                    </tr>
                                    <tr>
                                        <th colspan="3" style="text-align:right;">Discount Amount</th>
                                        <th><input type="text" style="margin:0px; text-align:right;" id="discount_amount" name="discount_amount" onkeyup="calc_dis()" value="0.00" class="form-control">
</th>
                                        <th></th>
                                    </tr>
                                    <tr>
                                        <th colspan="3" style="text-align:right;">Payable Amount</th>
                                        <th><input type="text" style="margin:0px; text-align:right;" readonly="" id="payable_amount" name="payable_amount" value="0.00" class="form-control"></th>
                                        <th></th>
                                    </tr>
                                    <tr>
                                        <th colspan="6" style="text-align:center;"><button type="submit" class="btn btn-primary btn-xs btn-block" style="border-radius:0px;font-size: 23px !important;height:38px;"><i class="fa fa-save"></i> Save &amp; Print</button></th>
                                    </tr>
                                </tfoot>
                              </table>
                            </div>
    </div>
</div>

                 </form>



                 </div></div>
    </div>
  </div>
</div>
</div>
</div>







<script>
    function invoice_productList(row) {
        var product_name = $('#prod_name_' + row).val();
        $.ajax({
            url: '<?php echo site_url('sales/quotation/search_products'); ?>',
            type: 'GET',
            data: {term: product_name},
            dataType: 'json',
            success: function(response) {
                console.log("Search Results:", response); 
                if (response.length > 0) {
                    var suggestions = response.map(function(product) {
                        return {
                            label: product.name,
                            value: product.name, 
                            brand: product.brand_id,
                            warranty: product.warranty,
                            price: product.sales_price
                        };
                    });

                    $('#prod_name_' + row).autocomplete({
                        source: suggestions,
                        select: function(event, ui) {
                            $('#prod_id_' + row).val(ui.item.value); 
                            $('#brand_name_' + row).val(ui.item.brand); 
                            $('#warrenty_' + row).val(ui.item.warranty); 
                            $('#sale_price_' + row).val(ui.item.price);
                            quantity_calculate(row); 
                            $('#prod_name_' + row).val(ui.item.label); 
                        }
                    });
                } else {
                    console.log("No products found.");
                }
            },
            error: function(xhr, status, error) {
                console.error("Error in AJAX request:", status, error);
            }
        });
    }

function quantity_calculate(row) {
    var qty = parseFloat($('#prod_qty_' + row).val()) || 0;
    var price = parseFloat($('#sale_price_' + row).val()) || 0;
    var total_price = qty * price;
    $('#total_price_' + row).val(total_price.toFixed(2)); 
    updateTotal(); 
}


function updateTotal() {
    var totalAmount = 0;

   
    $('input[name="total_price[]"]').each(function() {
        var price = parseFloat($(this).val()) || 0;
        totalAmount += price;
    });

  
    var vatPercent = parseFloat($('#vat_percent').val()) || 0;
    var vatAmount = (vatPercent / 100) * totalAmount;
    $('#vat_amount').val(vatAmount.toFixed(2)); // Show VAT amount

   
    var discountPercent = parseFloat($('#discount_percent').val()) || 0;
    var discountAmount = parseFloat($('#discount_amount').val()) || 0;

   
    if (discountPercent > 0 && discountAmount > 0) {
        alert("Please enter only one discount method (percent or amount)!");
        return; // Don't proceed if both are filled
    }

  
    if (discountPercent > 0) {
        discountAmount = (discountPercent / 100) * totalAmount;
        $('#discount_amount').val(discountAmount.toFixed(2)); 
    }

   
    if (discountAmount > 0) {
        $('#discount_percent').val('');
    }

    $('#discount_amount').val(discountAmount.toFixed(2)); 

   
    var payableAmount = totalAmount + vatAmount - discountAmount;
    $('#payable_amount').val(payableAmount.toFixed(2)); 

    
    $('#total_amount').val(totalAmount.toFixed(2)); 
}




function addInputField(tableId) {
    var rowCount = $('#' + tableId + ' tr').length; 
    if (rowCount === 1) { 
        rowCount = 2;
    } else {
       
        rowCount++;
    }

    var newRow = `
        <tr id="row_${rowCount}">
            <td>
                <input type="text" id="serial_${rowCount}" name="serial[]" style="text-align:right;" placeholder="${rowCount}" class="form-control" tabindex="${rowCount}" value="${rowCount}">
            </td>
            <td style="width:250px">
                <input type="text" id="prod_name_${rowCount}" name="prod_name[]" onkeyup="invoice_productList(${rowCount});" onkeypress="invoice_productList(${rowCount});" class="form-control productSelection ui-autocomplete-input" tabindex="${rowCount}" autocomplete="off">
                <input type="hidden" id="prod_id_${rowCount}" name="prod_id[]" class="form-control autocomplete_hidden_value prod_id_${rowCount}" style="width:100%;float:left;" value="">
            </td>
            <td>
                <input type="text" id="brand_name_${rowCount}" name="brand_name[]" style="text-align:right;" placeholder="Brand Name" class="form-control" tabindex="${rowCount}" readonly>
            </td>
            <td>
                <input type="text" id="warrenty_${rowCount}" name="warrenty[]" class="form-control" style="width:50%;float:left;" tabindex="${rowCount}" readonly>
                <select id="warrenty_type_${rowCount}" name="warrenty_type[]" class="form-control" style="width:50%;" tabindex="${rowCount}">
                    <option>Month</option>
                </select>
            </td>
            <td>
                <input type="text" id="sale_price_${rowCount}" name="sale_price[]" style="text-align:right;" onkeyup="quantity_calculate(${rowCount});" placeholder="0.00" class="form-control" tabindex="${rowCount}">
            </td>
            <td style="width:85px">
                <input type="text" id="prod_qty_${rowCount}" name="prod_qty[]" style="text-align:right;" onkeyup="quantity_calculate(${rowCount});" placeholder="1" class="form-control" tabindex="${rowCount}" value="1">
            </td>
            <td>
                <input type="text" id="total_price_${rowCount}" name="total_price[]" readonly="" style="text-align:right;" placeholder="0.00" class="form-control add">
            </td>
            <td style="text-align: center;">
                <button style="text-align: right;" class="btn btn-danger btn-xs" type="button" onclick="removeInputField(${rowCount}, '${tableId}');" tabindex="${rowCount}" id="remove_invoice_item_${rowCount}"><i class="fa fa-minus"></i></button>
            </td>
        </tr>
    `;
    $('#' + tableId).append(newRow); 
    updateTotal(); 
}


function removeInputField(row, tableId) {
    $('#row_' + row).remove(); 
    updateTotal();
}


</script>
