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
             <strong>Service Bill </strong></div>
<form id="salesReturnForm" action="<?php echo base_url(); ?>sales/salesreturn/save_sales_return" method="post" enctype="multipart/form-data">
    <input type="hidden" name="items" id="itemsInput">

              
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
					<label for="sales_date">Entry Date<span class="text-error"> *</span></label>
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