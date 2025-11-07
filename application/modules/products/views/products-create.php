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
           <h3>Create Products  </h3>
          </div>
          <div class="col-auto ms-auto">
            <!-- Button trigger modal -->
               <div class="right">
                 <?php if (has_permission('products', 'index')): ?>
                <a type="button" href="<?php echo base_url(); ?>products" class="btn btn_bg" >
                    <i class="fa-solid fa-list"></i> Product List
                </a>
                   <?php endif; ?>
            </div>

          </div>
        </div>
        <div class="row">
          <div class="col-12">
                <form  action="<?php echo base_url(); ?>products/create" method="post" enctype="multipart/form-data">
                                                            <div class="row mb-3">

                                             

                                   <div class="col-md-3 mb-3">
                                    <div class="form-group">
                                  <label for="group_id">Product  Group</label>
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

                                <!-- Brand -->  

                          <div class="col-md-3 mb-3">
                                    <div class="form-group">
                                  <label for="brand_id">Brand Name</label>
                                  <div class="select_2_container">
                                    <select name="brand_id"  id="brand_id"     class="form-control frm_select select2">
                                       <option  value="">  Select  </option>
                                                       <?php
                                                                      foreach($allBrand as $bnd){
                                                                        echo "<option value='{$bnd->id}'>$bnd->name </option>";
                                                                        }
																?>
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('brand_id'); ?>   </span>
                                </div></div>
                                <!-- end Brand -->
                                  <!-- start input -->
                                 
                                            <div class="col-md-3 mb-3">
                                                              <div class="form-group">
                                  <label for="name">Product Name</label>
                                  <input type="text"   name="name"id="name"  value="<?php echo set_value('name'); ?>"    class="form-control">
                               <span class="text-error small"> <?php echo form_error('name'); ?>   </span>
                                </div></div>
                                 <!-- end input -->
                                   <!-- Brand -->  

                          <div class="col-md-3 mb-3">
                                    <div class="form-group">
                                  <label for="unit_id">Unit Name</label>
                                  <div class="select_2_container">
                                    <select name="unit_id"  id="unit_id"     class="form-control frm_select select2">
                                       <option  value="">  Select  </option>
                                                       <?php
                                                                     foreach($allUnit as $unit){
                                                                        echo "<option value='{$unit->id}'>$unit->name </option>";
                                                                        }
																?>
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('unit_id'); ?>   </span>
                                </div></div>
                                <!-- end Brand -->
                                   <!-- Brand -->  

                          <div class="col-md-3 mb-3">
                                    <div class="form-group">
                                  <label for="serial_type">Serial  Type</label>
                                  <div class="select_2_container">
                                    <select name="serial_type"  id="serial_type"     class="form-control frm_select select2">
                                       <option  value="">  সিরিয়াল টাইপ বেছে  নিন </option>
                                       <option value="common"> একই সিরিয়ালে  একাধিক  পণ্য </option>
                                        <option value="unique"> প্রতি পণ্যে আলাদা সিরিয়াল  </option>
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('serial_type'); ?>   </span>
                                </div></div>
                                <!-- end Brand -->
                                   <!-- start input -->
                                 
                                            <div class="col-md-3 mb-3">
                                                              <div class="form-group">
                                  <label for="purchase_price">Purchase Price</label>
                                  <input type="text"   name="purchase_price"id="purchase_price"  value="<?php echo set_value('purchase_price'); ?>"    class="form-control">
                                  <span class="text-error small">  <?php echo form_error('purchase_price'); ?>  </span>
                                </div></div>
                                 <!-- end input -->
                                   <!-- Brand -->  

                          <div class="col-md-3 mb-3">
                                    <div class="form-group">
                                  <label for="tax_method">Tax Method</label>
                                  <div class="select_2_container">
                                    <select name="tax_method"  id="tax_method"     class="form-control frm_select ">
                                       <option value="Inclusive"> Inclusive</option>
                                        <option value="Exclusive"> Exclusive</option>
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('tax_method'); ?>   </span>
                                </div></div>
                                <!-- end Brand -->

                                  <!-- start input -->
                                 
                                            <div class="col-md-3 mb-3 product_tax_display" style="display:none;">
                                      <div class="form-group">
                                  <label for="product_tax">Product Tax (%)</label>
                                  <input type="text"   name="product_tax" id="product_tax"  value="<?php echo set_value('product_tax'); ?>"    class="form-control">
                                </div></div>
                                 <!-- end input -->
                                   <!-- start input -->
                                 
                                            <div class="col-md-3 mb-3 product_tax_display" tyle="display:none;">
                                                              <div class="form-group">
                                  <label for="product_tax_amount">Tax Amount</label>
                                  <input type="text"   name="product_tax_amount" id="product_tax_amount"  value="<?php echo set_value('product_tax_amount'); ?>"    class="form-control">
                                </div></div>
                                 <!-- end input -->
                                  <!-- start input -->
                                 
                                            <div class="col-md-3 mb-3 product_tax_display" tyle="display:none;">
                                                              <div class="form-group">
                                  <label for="total_amount">Total Amount</label>
                                  <input type="text"   name="total_amount" id="total_amount"  value="0.00"    class="form-control" readonly>
                                </div></div>
                                 <!-- end input -->

                                  <!-- start input -->
                                 
                                      <div class="col-md-3 mb-3 " >
                                                              <div class="form-group">
                                  <label for="sales_price">Sales Price</label>
                                  <input type="text"   name="sales_price" id="sales_price"  value="<?php echo set_value('sales_price'); ?>"    class="form-control">
                                </div></div>
                                 <!-- end input -->
                                 
 <!-- start input -->
                                 
                                      <div class="col-md-3 mb-3 " >
                                                              <div class="form-group">
                                  <label for="warrenty">Warrenty</label>
                                  <input type="text"   name="warrenty" id="warrenty"  value="<?php echo set_value('warrenty'); ?>"    class="form-control">
                                </div></div>
                                 <!-- end input -->
                                  <div class="col-md-3 mb-3">
                                    <div class="form-group">
                                  <label for="warrenty_days">Days</label>
                                  <div class="select_2_container">
                                    <select name="warrenty_days"  id="warrenty_days"     class="form-control frm_select ">
                                       <option value="Days"> Days</option>
                                        <option value="Month"> Month</option>
                                        <option value="Year"> Year</option>
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('warrenty_days'); ?>   </span>
                                </div></div>
                                <!-- end Brand -->
                                                                       

                                              <!-- start input -->
                                 
                                      <div class="col-md-3 mb-3 " >
                                                              <div class="form-group">
                                  <label for="re_order_level">Re-order Level</label>
                                  <input type="text"   name="re_order_level" id="re_order_level"  value="<?php echo set_value('re_order_level'); ?>"    class="form-control">
                                    <span class="text-error small"> <?php echo form_error('re_order_level'); ?>   </span>
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
                                  
                                  <!-- start input -->
                                 
                                      <div class="col-md-3 mb-3 " >
                                        <div class="row">
                                                                                                <div class="col-md-10">
                                                               <label
                                                                                                                        for="pic">Picture</label>
                                                                                                            <input type="file"
                                                                                                                        accept="image/*"
                                                                                                                        name="pic"
                                                                                                                        class="form-control file-input-change"
                                                                                                                        data-id="image"
                                                                                                                        aria-invalid="false">
                                                                                                            <span
                                                                                                                        class="text-error small">
                                                                                                                        <?php echo form_error('pic'); ?>
                                                                                                            </span>
                                                                                                </div>
                                                                                                <div
                                                                                                            class="col-md-2 align-self-center mt-3">
                                                                                                            <img src="<?php echo base_url(); ?>public/assets/imgs/upload.png"
                                                                                                                        id="image"
                                                                                                                        class="table-img">
                                                                                                </div>
                                                                                    </div>
                                </div></div>
                                 <!-- end input --> 

                                  

                                 <div class="col-12 mb-3">
                                  <div class="switcher-pricing text-left lh-1">
                                    <div class="frm_toggle_container">
                                      <input
                                        type="checkbox" name="is_inventory"
                                        class="pricing-toggle frm_toggle_deselect deselect_toggle_container"
                                        value="1" />
                                      <label for="">আপনি কি এটি স্টকে রাখতে চান?</label>
                                    </div>
                                  </div>
                                </div>

                                <div class="col-12 mb-3">
                                  <div class="switcher-pricing text-left lh-1">
                                    <div class="frm_toggle_container">
                                      <input
                                        type="checkbox" id="is_quotation"   name="is_quotation"
                                        class="pricing-toggle frm_toggle_deselect deselect_toggle_container"
                                        value="1" />
                                      <label for="">আপনি   কি এই   পণ্যটির কোটেশন চাইবেন?</label>
                                    </div>
                                  </div>
                                </div>

                                <div class="col-12 mb-3">
                                  <div class="switcher-pricing text-left lh-1">
                                    <div class="frm_toggle_container">
                                      <input
                                        type="checkbox" id="is_short_bill"   name="is_short_bill"
                                        class="pricing-toggle frm_toggle_deselect deselect_toggle_container"
                                        value="0" />
                                      <label for="">আপনি   কি শট বিল এ  রাখতে চান ?</label>
                                    </div>
                                  </div>
                                </div>

                                                                        

                                                                      


                                                                    



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




