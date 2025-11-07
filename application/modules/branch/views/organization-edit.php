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
                                    </div>
                                      <?php
                                      if(isset($allPdt)){
                               foreach($allPdt as $pdt){
                               ?>
                                    </div>
											<div class="main-content">
											<div class="row justify-content-center pb-5">
												<div class="col-md-12">
												    <form  action="<?php echo base_url(); ?>branch/organization/update" method="post" enctype="multipart/form-data">
									      				<div class="row mb-3">
                                                                <input type="hidden" name="id" id="id" value="<?php echo $pdt->id; ?>" class="form-control">
													    <div class="col-md-6">
																<div class="form-group">
																<label for="name">Name <span class="text-error"> *</span></label>
									      						<input type="text"  name="name" id="name" value="<?php echo $pdt->name; ?>"   class="form-control" >
																<span class="text-error small"><?php echo form_error('name'); ?></span>
																</div>
									      					</div>
															<div class="col-md-6">
																<div class="form-group">
																<label for="mobile_no">Contact No <span class="text-error"> *</span></label>
									      						<input type="text"  name="mobile_no" id="mobile_no" value="<?php echo $pdt->mobile_no; ?>"   class="form-control" >
																<span class="text-error small"><?php echo form_error('mobile_no'); ?></span>
																</div>
									      					</div>

															<div class="col-md-6">
																<div class="form-group">
																<label for="email">Email </label>
									      						<input type="email"  name="email" id="email" value="<?php echo $pdt->email; ?>"   class="form-control" >
																<span class="text-error small"><?php echo form_error('email'); ?></span>
																</div>
									      					</div>


															<div class="col-md-6">
																<div class="form-group">
																<label for="is_active">Status <span class="text-error"> *</span></label>
									      							<select name="is_active" id="is_active" class="form-control">
																		<option value="">Select </option>
																		   <option value="1" <?php if($pdt->is_active == 1){ echo "selected"; } ?> >Active</option>
                                                                             <option value="0" <?php if($pdt->is_active == 0 ){ echo "selected"; } ?>>Deactive</option>
																		</select>
																		
																<span class="text-error small"><?php echo form_error('is_active'); ?></span>
																</div>
									      					</div>

															<div class="col-md-6">
																<div class="form-group">
																<label for="address">Address <span class="text-error"> *</span></label>
									      						<textarea type="text"  name="address" id="address"   class="form-control" ><?php echo $pdt->address; ?></textarea>
																<span class="text-error small"><?php echo form_error('address'); ?></span>
																</div>
									      					</div>

															<div class="col-md-6">
                                                                 <div class="row">
                                                            <div class="col-md-10">
                                                            <label for="pic">Picture</label>
                                                                <input type="file" accept="image/*" name="pic" class="form-control file-input-change" data-id="image" aria-invalid="false">
                                                            </div>
                                                            <div class="col-md-2 align-self-center mt-3">
                                                                <img src="<?php echo base_url(); ?>public/assets//imgs/upload.png" id="image" class="table-img">
                                                            </div>
                                                        </div>
															
									      					</div>

															

									      					
									      			
									      				</div>
									      			
									      				
									      				
									      				<div class="row">
									      					<div class="col-12">
									      						<button type="submit"  class="btn btn_bg">Save</button>
									      					</div>
									      				</div>
									      			</form>
												</div>
											</div>
											</div>
										</div>
									</div></div>

                                     <?php
                               }
                            }
                                    ?>