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
       <h3>Add New  Staff</h3>
          </div>
          <div class="col-auto ms-auto">
            <!-- Button trigger modal -->
               <div class="right">
                  <a href="<?php echo base_url();?>branch/staff" class="btn btn_bg">Staff List</a>
            </div>

          </div>
        </div>
        <div class="row">
          <div class="col-12">
                 <form  action="<?php echo base_url(); ?>branch/staff/create" method="post" enctype="multipart/form-data">
                                                            <div class="row mb-3">

                                             

                                   <div class="col-md-3 mb-3">
                                    <div class="form-group">
                                  <label for="org_id">Organization</label>
                                  <div class="select_2_container">
                                    <select name="org_id"  id="org_id"     class="form-control frm_select select2">
                    		<option value="">Select</option>
                                                                               <?php foreach($allorg as $org): ?>
                                                                                                <option value="<?= $org->id ?>" <?= set_select('org_id', $org->id); ?> >
                                                                                                <?= $org->name ?> - <?= $org->mobile_no ?>
                                                                                                </option>
                                                                                            <?php endforeach; ?>
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                   <span class="text-error small"> <?php echo form_error('org_id'); ?>   </span>
                                </div></div>

                                <!-- Brand -->  

                          <div class="col-md-3 mb-3">
                                    <div class="form-group">
                                  <label for="branch_id">Branch Name</label>
                                  <div class="select_2_container">
                                    <select name="branch_id"  id="branch_id"     class="form-control frm_select select2">
                                       <option  value="">  Select  </option>
                                                       
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('branch_id'); ?>   </span>
                                </div></div>
                                <!-- end Brand -->
                                 <div class="col-md-3">
																<div class="form-group">
																<label for="name">Name <span class="text-error"> *</span></label>
									      						<input type="text"  name="name" id="name" value="<?php echo set_value('name'); ?>"   class="form-control" >
																<span class="text-error small"><?php echo form_error('name'); ?></span>
																</div>
									      					</div>
                                                            <div class="col-md-3">
																<div class="form-group">
																<label for="email">Email </label>
									      						<input type="email"  name="email" id="email" value="<?php echo set_value('email'); ?>"   class="form-control" >
																<span class="text-error small"><?php echo form_error('email'); ?></span>
																</div>
									      					</div>
															<div class="col-md-3">
																<div class="form-group">
																<label for="mobile_no">Mobile No ( Username ) <span class="text-error"> *</span></label>
									      						<input type="text"  name="mobile_no" id="mobile_no" value="<?php echo set_value('mobile_no'); ?>"   class="form-control" >
																<span class="text-error small"><?php echo form_error('mobile_no'); ?></span>
																</div>
									      					</div>

															<div class="col-md-3">
																<div class="form-group">
																<label for="password">Password </label>
									      						<input type="text"  name="password" id="password" value="<?php echo set_value('password'); ?>"   class="form-control" >
																<span class="text-error small"><?php echo form_error('password'); ?></span>
																</div>
									      					</div>

                          <div class="col-md-3 mb-3">
                                    <div class="form-group">
                                  <label for="roles_id">Role</label>
                                  <div class="select_2_container">
                                    <select name="roles_id"  id="roles_id"     class="form-control frm_select select2">
                                       <option  value="">  Select  </option>
                                                     <?php foreach($allRoles as $role): ?>
                                                                                                <option value="<?= $role->id ?>" <?= set_select('roles_id', $role->id); ?> >
                                                                                                <?= $role->name ?> 
                                                                                                </option>
                                                                                            <?php endforeach; ?>
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('roles_id'); ?>   </span>
                                </div></div>
                                <!-- end Brand -->
                                  
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
                                                                                                            <img src="<?php echo base_url(); ?>assets/images/upload.png"
                                                                                                                        id="image"
                                                                                                                        class="table-img">
                                                                                                </div>
                                                                                    </div>
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
$(document).ready(function() {
    $('#org_id').on('change', function() {
        var org_id = $(this).val();
        $('#branch_id').html('<option value="">Loading...</option>');

        if (org_id !== '') {
            $.ajax({
                url: '<?php echo base_url(); ?>branch/staff/getBranchByOrg',
                type: 'POST',
                data: { org_id: org_id },
                dataType: 'json',
                success: function(data) {
                    var options = '<option value="">Select Branch</option>';
                    if (data.length > 0) {
                        $.each(data, function(index, branch) {
                            options += '<option value="' + branch.id + '">' + branch.name + '</option>';
                        });
                    } else {
                        options += '<option value="">No Branch Found</option>';
                    }
                    $('#branch_id').html(options);
                },
                error: function() {
                    $('#branch_id').html('<option value="">Error Loading</option>');
                }
            });
        } else {
            $('#branch_id').html('<option value="">Select</option>');
        }
    });
});
</script>
