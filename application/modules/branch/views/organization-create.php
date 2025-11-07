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
           <h3>Add New Organization  </h3>
          </div>
          <div class="col-auto ms-auto">
            <!-- Button trigger modal -->
               <div class="right">
                  <a href="<?php echo base_url();?>branch/organization" class="btn btn_bg">Organization List</a>
            </div>

          </div>
        </div>
        <div class="row">
          <div class="col-12">
                 <form  action="<?php echo base_url(); ?>branch/organization/create" method="post" enctype="multipart/form-data">
                                                            <div class="row mb-3">

                                             

                                  
													    <div class="col-md-4 mb-3">
																<div class="form-group">
																<label for="name">Name <span class="text-error"> *</span></label>
									      						<input type="text"  name="name" id="name" value="<?php echo set_value('name'); ?>"   class="form-control" >
																<span class="text-error small"><?php echo form_error('name'); ?></span>
																</div>
									      					</div>
															<div class="col-md-4 mb-3">
																<div class="form-group">
																<label for="mobile_no">Contact No <span class="text-error"> *</span></label>
									      						<input type="text"  name="mobile_no" id="mobile_no" value="<?php echo set_value('mobile_no'); ?>"   class="form-control" >
																<span class="text-error small"><?php echo form_error('mobile_no'); ?></span>
																</div>
									      					</div>

															<div class="col-md-4 mb-3">
																<div class="form-group">
																<label for="email">Email </label>
									      						<input type="email"  name="email" id="email" value="<?php echo set_value('email'); ?>"   class="form-control" >
																<span class="text-error small"><?php echo form_error('email'); ?></span>
																</div>
									      					</div>


															

															<div class="col-md-4 mb-3">
																<div class="form-group">
																<label for="address">Address <span class="text-error"> *</span></label>
									      						<textarea type="text"  name="address" id="address"   class="form-control" ><?php echo set_value('address'); ?></textarea>
																<span class="text-error small"><?php echo form_error('address'); ?></span>
																</div>
									      					</div>
                                                            	<div class="col-md-6">

                                                              <div class="row">
                                            <div class="col-md-10">
                                            <label for="pic">Picture</label>
                                                <input type="file" accept="image/*" name="pic" class="form-control file-input-change" data-id="image" aria-invalid="false">
                                                 <span class="text-error small"><?php echo form_error('pic'); ?></span>
                                            </div>
                                            <div class="col-md-2 align-self-center mt-3">
                                                <img src="<?php echo base_url(); ?>assets/images/upload.png" id="image" class="table-img">
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









