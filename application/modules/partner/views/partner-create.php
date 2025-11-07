<style>
.print-btn{
 
  
    padding:10px !important;
}
  </style>
<div class="container-fluid">





  <div class="row px-3">
    <div class="col-12">
      <div class="content">
        <div class="row">
          <div class="col-auto">
           <h3>Add New Partner  </h3>
          </div>
          <div class="col-auto ms-auto">
            <!-- Button trigger modal -->
               <div class="right">
                 <?php if (has_permission('products', 'index')): ?>
                <a type="button" href="<?php echo base_url(); ?>partner" class="btn btn_bg" >
                    <i class="fa-solid fa-list"></i> Partner List
                </a>
                   <?php endif; ?>
            </div>

          </div>
        </div>
        <div class="row">
          <div class="col-12">
                <form  action="<?php echo base_url(); ?>partner/create" method="post" enctype="multipart/form-data">
                                                            <div class="row mb-3">

                                             

                                  <!-- start input -->
                                 
                                            <div class="col-md-3 mb-3">
                                                              <div class="form-group">
                                  <label for="name"> Name</label>
                                  <input type="text"   name="name"id="name"  value="<?php echo set_value('name'); ?>"    class="form-control">
                               <span class="text-error small"> <?php echo form_error('name'); ?>   </span>
                                </div></div>
                                 <!-- end input -->
                                     <!-- start input -->
                                 
                                            <div class="col-md-3 mb-3">
                                                              <div class="form-group">
                                  <label for="name"> Email</label>
                                  <input type="text"   name="name"id="name"  value="<?php echo set_value('name'); ?>"    class="form-control">
                               <span class="text-error small"> <?php echo form_error('name'); ?>   </span>
                                </div></div>
                                 <!-- end input -->

                                    <!-- start input -->
                                 
                                            <div class="col-md-3 mb-3">
                                                              <div class="form-group">
                                  <label for="name"> Mobile No</label>
                                  <input type="text"   name="name"id="name"  value="<?php echo set_value('name'); ?>"    class="form-control">
                               <span class="text-error small"> <?php echo form_error('name'); ?>   </span>
                                </div></div>
                                 <!-- end input -->

                                    
                                   <!-- Brand -->  

                          <div class="col-md-3 mb-3">
                                    <div class="form-group">
                                  <label for="unit_id">Type</label>
                                  <div class="select_2_container">
                                    <select name="unit_id"  id="unit_id"     class="form-control frm_select ">
                                    	<option value="">Select </option>
																	<option value="Customer">Customer</option>
																			<option value="Supplier">Supplier</option>
																			<option value="Both">Both</option>
															
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('unit_id'); ?>   </span>
                                </div></div>
                                <!-- end Brand -->
                                   <!-- Brand -->  

                                   <!-- start input -->
                                 
                                            <div class="col-md-3 mb-3">
                                                              <div class="form-group">
                                  <label for="purchase_price">Opening Balance</label>
                                  <input type="text"   name="purchase_price"id="purchase_price"  value="<?php echo set_value('purchase_price'); ?>"    class="form-control">
                                  <span class="text-error small">  <?php echo form_error('purchase_price'); ?>  </span>
                                </div></div>
                                 <!-- end input -->
                                   <!-- Brand -->  

                         

                                  <!-- start input -->
                                 
                                            <div class="col-md-3 mb-3 " id="customer_opening_display" style="display:none;">
                                      <div class="form-group">
                                  <label for="customer_opening">Opening Balance</label>
                                  <input type="text"   name="customer_opening" id="customer_opening"  value="<?php echo set_value('customer_opening'); ?>"    class="form-control">
                                </div></div>
                                 <!-- end input -->
                                   <!-- start input -->
                                 
                                            <div class="col-md-3 mb-3 " id="suplier_opening_display" tyle="display:none;">
                                                              <div class="form-group">
                                  <label for="suplier_opening">Suplier Opening Balance</label>
                                  <input type="text"   name="suplier_opening" id="suplier_opening"  value="<?php echo set_value('suplier_opening'); ?>"    class="form-control">
                                </div></div>
                                 <!-- end input -->
                              

                                 
                                   
                                                                       

                                          
                                  <!-- start input -->
                                 
                                      <div class="col-md-3 mb-3 " >
                                                              <div class="form-group">
                                  <label for="note">Note</label>
                                <textarea type="text"  name="note" id="note"   class="form-control" ><?php echo set_value('note'); ?></textarea>
                                    <span class="text-error small"> <?php echo form_error('note'); ?>   </span>
                                </div></div>
                                 <!-- end input -->
                                  
                                  

                                                                        

                                                                      


                                                                    



                                                            </div>



                                                            <div class="row">
                                                                        <div class="col-12">
                                                                                    <button type="submit"
                                                                                                class="btn btn_bg">Save</button>
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

    // ✅ Purchase price টাইপ করলে মোট Amount আপডেট হবে
    $(document).on('keyup', '#purchase_price', function () {
        let cost = parseFloat($(this).val()) || 0;
        $("#total_amount").val(cost.toFixed(2));
    });

    // ✅ Product Tax টাইপ করলে ট্যাক্স ও টোটাল হিসাব হবে
    $(document).on('keyup', '#product_tax', function () {
        let taxPercent = parseFloat($(this).val()) || 0;
        let price = parseFloat($("#purchase_price").val()) || 0;

        let taxAmount = price * taxPercent / 100;
        let total = price + taxAmount;

        $("#product_tax_amount").val(taxAmount.toFixed(2));
        $("#total_amount").val(total.toFixed(2));
    });

    // ✅ Tax Method পরিবর্তন হলে ট্যাক্স ফিল্ড show/hide হবে
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




