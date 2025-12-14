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
            <h3>Transaction No</h3>
          </div>
        <div class="card">
        <div class="card-body">

            <div class="row g-3">
            <div class="col-md-8 mb-3">
                                    <div class="form-group">
                                  <label for="cgroup_id" class="form-label">Receipt From</label>
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
                          
                                <div class="col-md-4 mb-3">
                        <div class="form-group">
                    <label class="form-label">Discount</label>
                    <input type="text" class="form-control" value="0.00" >
                </div> </div>

               

                  <div class="col-md-4 mb-3">
                        <div class="form-group">
                    <label class="form-label">Previous Due</label>
                    <input type="text" class="form-control" value="0.00" disabled>
                </div> </div>

                <div class="col-md-4 mb-3">
                          <div class="form-group">
                    <label class="form-label">Payable</label>
                    <input type="text" class="form-control" value="0" disabled>
                </div></div>

               <div class="col-md-4 mb-3">
                       <div class="form-group">
                    <label class="form-label">Date</label>
                    <input type="date" class="form-control" value="2025-12-14">
                </div>   </div>

               <div class="col-md-4 mb-3">
                       <div class="form-group">
                    <label class="form-label">
                        Paid Amount
                    </label>
                    <input type="number" class="form-control">
                </div></div>

                 <div class="col-md-4 mb-3">
                       <div class="form-group">
                    <label class="form-label">Description</label>
                    <input type="text" class="form-control">
                </div>   </div>

                  <div class="col-md-4 mb-3">
                                    <div class="form-group">
                                  <label for="payment_method_id" class="form-label">Payment Method</label>
                                  <div class="select_2_container">
                                    <select name="payment_method_id"  id="payment_method_id"     class="form-control frm_select select2">
                                    	 <?php foreach($allPayment as $payment): ?>
                                        <option value="<?= $payment->id ?>"><?= $payment->name ?></option>
                                    <?php endforeach; ?>
															
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('payment_method_id'); ?>   </span>
                                </div></div>
                                   <!-- Brand -->  

            </div>

            <div class="mt-4">
                <button class="btn btn-primary w-100 save-btn">
                    💾 Save & Print
                </button>
            </div>


          </div>
        </div>
        <div class="row">
          <div class="col-12">
   
      </div>
    </div>
  </div>
</div>
</div>
</div>








