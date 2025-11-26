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
                                  <label for="email"> Email</label>
                                  <input type="text"   name="email"   id="email"  value="<?php echo set_value('email'); ?>"    class="form-control">
                               <span class="text-error small"> <?php echo form_error('email'); ?>   </span>
                                </div></div>
                                 <!-- end input -->

                                    <!-- start input -->
                                 
                                            <div class="col-md-3 mb-3">
                                                              <div class="form-group">
                                  <label for="mobile_no"> Mobile No</label>
                                  <input type="text"   name="mobile_no" id="mobile_no"  value="<?php echo set_value('mobile_no'); ?>"    class="form-control">
                               <span class="text-error small"> <?php echo form_error('mobile_no'); ?>   </span>
                                </div></div>
                                 <!-- end input -->

                                    
                                   <!-- Brand -->  

                          <div class="col-md-3 mb-3">
                                    <div class="form-group">
                                  <label for="type_id">Type</label>
                                  <div class="select_2_container">
                                    <select name="type_id"  id="type_id"     class="form-control frm_select ">
                                    	<option value="">Select </option>
																	<option value="Customer">Customer</option>
																			<option value="Supplier">Supplier</option>
																			<option value="Both">Both</option>
															
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('type_id'); ?>   </span>
                                </div></div>
                                <!-- end Brand -->
                                   <!-- Brand -->  
                              <div class="col-md-3 mb-3">
                                  <div class="form-group">
                                      <label for="balance_type">Opening Balance Type</label>
                                      <div class="select_2_container">
                                          <select name="balance_type" id="balance_type" class="form-control frm_select">
                                              <option value="">Select</option>
                                              <option value="Customer">কাস্টমারের কাছ থেকে টাকা পাওনা</option>
                                              <option value="Supplier">দেনা: সরবরাহকারীদের টাকা দিতে হবে</option>
                                          </select>
                                          <i class="fas fa-caret-down"></i>
                                      </div>
                                      <span class="text-error small" id="type_error"></span>
                                  </div>
                              </div>

                              <!-- Customer Balance Field -->
                              <div class="col-md-3 mb-3" id="customer_balance_div" style="display:none;">
                                  <div class="form-group">
                                      <label for="customer_balance">Opening Balance (Customer)</label>
                                      <input type="number" name="customer_balance" id="customer_balance" class="form-control" placeholder="Enter Customer Balance" />
                                  </div>
                              </div>

                              <!-- Supplier Balance Field -->
                              <div class="col-md-3 mb-3" id="supplier_balance_div" style="display:none;">
                                  <div class="form-group">
                                      <label for="supplier_balance">Opening Balance (Supplier)</label>
                                      <input type="number" name="supplier_balance" id="supplier_balance" class="form-control" placeholder="Enter Supplier Balance" />
                                  </div>
                              </div>



                                   <!-- start input -->
                                  <div class="col-md-3 mb-3">
                                    <div class="form-group">
                                  <label for="cgroup_id">Customer Group</label>
                                  <div class="select_2_container">
                                    <select name="cgroup_id"  id="cgroup_id"     class="form-control frm_select select2">
                                    	<option value="">Select </option>
																                  <?php
                                                   foreach($allCgroup as $group){
                                                  echo "<option value='{$group->id}'>$group->name </option>";
                                                   }
															                  	?>
															
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('cgroup_id'); ?>   </span>
                                </div></div>
                                   <!-- Brand -->  

                         
<!-- start input -->
                                  <div class="col-md-3 mb-3">
                                    <div class="form-group">
                                  <label for="reference_id">Reference</label>
                                  <div class="select_2_container">
                                    <select name="reference_id"  id="reference_id"     class="form-control frm_select select2">
                                    	<option value="">Select </option>
																	 <?php
                                                   foreach($allRef as $ref){
                                                  echo "<option value='{$ref->id}'>$ref->first_name </option>";
                                                   }
															                  	?>
															
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('reference_id'); ?>   </span>
                                </div></div>
                                   <!-- Brand -->  

                                 
                                   
                                               <!-- start input -->
                                 
                                      <div class="col-md-3 mb-3 " >
                                                              <div class="form-group">
                                  <label for="address">Address</label>
                                <textarea type="text"  name="address" id="address"   class="form-control" ><?php echo set_value('address'); ?></textarea>
                                    <span class="text-error small"> <?php echo form_error('address'); ?>   </span>
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
document.getElementById('balance_type').addEventListener('change', function() {
    var selectedType = this.value;

    // দুটি ইনপুট হাইড করে দেই আগে
    document.getElementById('customer_balance_div').style.display = 'none';
    document.getElementById('supplier_balance_div').style.display = 'none';

    // এখন শর্ত অনুযায়ী দেখানো হবে
    if (selectedType === "Customer") {
        document.getElementById('customer_balance_div').style.display = 'block';
    } else if (selectedType === "Supplier") {
        document.getElementById('supplier_balance_div').style.display = 'block';
    }
});
</script>




