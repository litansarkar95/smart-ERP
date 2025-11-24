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

                                     <div class="col-md-2 mb-2">
																<div class="form-group">
																<label for="invoice_no">Invoice No <span class="text-error"> *</span></label>
									      						<input type="text"  name="invoice_no" id="invoice_no" value="<?= $invoice_no; ?>"   class="form-control" readonly>
																<span class="text-error small"><?php echo form_error('invoice_no'); ?></span>
																</div>
									      					</div>   
                                                             <div class="col-md-2 mb-2">
																<div class="form-group">
																<label for="purchase_date">Sales Date<span class="text-error"> *</span></label>
									      						<input type="text"  name="purchase_date" id="purchase_date" value=""   class="form-control" >
																<span class="text-error small"><?php echo form_error('purchase_date'); ?></span>
																</div>
									      					</div>     

                                  <div class="col-md-3 mb-3">
                                <div class="form-group">
                                    <label for="supplier_id">Select Customer</label>
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

                                  <div class="col-md-3 mb-3">
                                <div class="form-group">
                                    <label for="customer_name">Customer Name</label>
                          
                                       <input type="text" name="customer_name" id="customer_name" value="" class="form-control ">
                                 
                                    <span class="text-error small"><?= form_error('customer_name'); ?></span>
                                </div>
                                </div>

                                <!-- Brand -->  
                                        <div class="col-md-3 mb-3">
                                <div class="form-group">
                                    <label for="mobile_no">Mobile No</label>
                            
                                      <input type="text" name="mobile_no" id="mobile_no" value="" class="form-control ">
                              
                                </div>
                                </div>

                                <!-- Brand -->  

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


       
                                                         

                                                            <div class="col-md-4 mb-2" id="unique_input" >
																<div class="form-group">
																<label for="item_serial">প্রতি পণ্যে আলাদা সিরিয়াল  <span class="text-error"> *</span></label>
									      						<input type="text"  name="item_serial" id="item_serial" value=""   class="form-control serial_number" >
																<span class="text-error small"><?php echo form_error('item_serial'); ?></span>
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
            <th>Warranty</th>
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




<script>
$('#addItemBtn').on('click', function() {
    var invoice_id = $('#invoice_id').val();
    var product_id = $('#product_id').val();
    var product_name = $('#product_id option:selected').text();



    if(!product_id){
        alert("Select a product!");
        return;
    }

     $.ajax({
        url: '<?= base_url("sales/add_item_ajax") ?>',
        type: 'POST',
        dataType: 'json',
        data: {
            invoice_id: invoice_id,
            product_id: product_id,
      
        },
       success: function(res){

         if(res.status == 'success'){
          var newRow = '<tr data-id="'+res.item.id+'">'+
                '<td>'+($('#itemsTable tbody tr').length+1)+'</td>'+
                '<td>'+res.item.product_name+'</td>'+
                '<td>'+res.item.warrenty+ ' '+res.item.warrenty_days +'</td>'+
                '<td><input type="number" class="price form-control" value="'+res.item.price+'" ></td>'+
                '<td><input type="number" class="qty form-control" value="'+res.item.qty+'" ></td>'+
                '<td><input type="number" class="sub_total form-control" value="'+res.item.sub_total+'" readonly></td>'+
                '<td><input type="number" class="sub_total form-control" value="" placeholder="%"></td>'+
                '<td><input type="number" class="sub_total form-control" value="" ></td>'+
                '<td><input type="number" class="sub_total form-control" value="" ></td>'+
                '<td><textarea class="serial_number form-control" readonly>'+res.item.serial_number+'</textarea></td>'+
               
             
            '</tr>';

            $('#itemsTable tbody').append(newRow);
       }
    }

        });

    });
    </script>

 