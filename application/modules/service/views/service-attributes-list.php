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
            <h3> Service Attributes</h3>
          </div>
          <div class="col-auto ms-auto">
            <!-- Button trigger modal -->
               <div class="right">
            
            </div>

          </div>
        </div>
        <div class="row">
             <div class="col-md-4">
     <form action="<?php echo base_url(); ?>service/serviceattributes/create" method="post" enctype="multipart/form-data">
    <div class="card">
        <div class="card-header">
        <h3 class="mb-0">Add Service Attributes</h3>
    </div>
    <div class="card-body">
               <div class="col-md-12 mb-3">
                                    <div class="form-group">
                                  <label for="service_id">Select Service</label>
                                  <div class="select_2_container">
                                    <select name="service_id"  id="service_id"     class="form-control frm_select select2">
                                       <option  value="">  Select  </option>
                                                       <?php
                                                                     foreach($allCat as $cat){
                                                                        echo "<option value='{$cat->id}'>$cat->name </option>";
                                                                        }
																?>
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('service_id'); ?>   </span>
                                </div></div>
                                <!-- end Brand -->
                                             <!-- start input -->
                                 
                                            <div class="col-md-12 mb-3 ">
                                                              <div class="form-group">
                                  <label for="attributesName">Attributes Name</label>
                                  <input type="text"   name="attributesName" id="attributesName"      class="form-control" >
                                   <span class="text-error small"> <?php echo form_error('attributesName'); ?>   </span>
                                </div></div>
                                 <!-- end input --> 
                                   <div class="col-12 mb-3">
                                  <div class="switcher-pricing text-left lh-1">
                                    <div class="frm_toggle_container">
                                      <input
                                        type="checkbox" name="is_checkbox"
                                        class="pricing-toggle frm_toggle_deselect deselect_toggle_container"
                                        value="1" />
                                      <label for="">Is Checkbox</label>
                                    </div>
                                  </div>
                                </div>
                                   <!-- end input --> 
                                   <div class="col-12 mb-3">
                                  <div class="switcher-pricing text-left lh-1">
                                    <div class="frm_toggle_container">
                                      <input
                                        type="checkbox" name="is_input"
                                        class="pricing-toggle frm_toggle_deselect deselect_toggle_container"
                                        value="1" />
                                      <label for="">Is Input /Text</label>
                                    </div>
                                  </div>
                                </div>



                                                            <div class="row">
                                                                        <div class="col-12">
                                                                                    <button type="submit"
                                                                                                class="btn btn_bg">Save</button>
                                                                        </div>
                                                            </div>  </div>
   </form>
                </div>    </div>
          <div class="col-md-8">
                 <div class="table-responsive">
                    <table id="tableData" class="table table-striped table-responsive" data-page-length="10">

                        <thead class="table-success">
                            <tr>
                                <th>#</th>
                                <th>Service Name</th>
                                <th>Name</th>
                                <th>Checkbox</th>
                                <th>Input /Text</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if (!empty($allPdt)):
                                              $i = 1; ?>
                                <?php foreach (
                                                  $allPdt
                                                  as $pdt
                                                ): ?>
                                    <tr>
                                        <td>
                                            <?= $i++ ?>
                                        </td>
                                           <td><?php echo $pdt->service_name;?>    </td>
                                     
                                                  <td><?php echo $pdt->name;?>    </td>
                                        <td>
                                            <?php if (
                                                              $pdt->is_checkbox
                                                            ): ?>
                                                <span class="badge bg-success">Yes</span>
                                                <?php else: ?>
                                                    <span class="badge bg-danger">No</span>
                                                    <?php endif; ?>
                                        </td>
                                        <td>
                                            <?php if (
                                                              $pdt->is_input_entry
                                                            ): ?>
                                                <span class="badge bg-success">Yes</span>
                                                <?php else: ?>
                                                    <span class="badge bg-danger">No</span>
                                                    <?php endif; ?>
                                        </td>
                                        <td>
                                            <?php if (
                                                              $pdt->is_active
                                                            ): ?>
                                                <span class="badge bg-success">Active</span>
                                                <?php else: ?>
                                                    <span class="badge bg-danger">Inactive</span>
                                                    <?php endif; ?>
                                        </td>
                                        <td >
                                            <?php if (has_permission('service/serviceattributes', 'edit')): ?>
                                            <a href="#" data-id="<?php echo $pdt->id;?>"   data-name="<?php echo $pdt->name;?>" data-bs-toggle="modal" 
                                                        data-bs-target="#edit_modals<?php echo $pdt->id?>"  class="btn btn-sm btn-primary me-1">
                                                <i class="fa fa-pencil"></i> Edit
                                            </a>
                                             <?php endif; ?>
                                            <?php if (has_permission('products/groups', 'delete')): ?>
                                            <a href="#" class="btn btn-sm btn-danger" onclick="confirmDelete(<?php echo $pdt->id; ?>)">
                                                <i class="fa fa-trash"></i> Delete
                                            </a>
                                             <?php endif; ?>
                                        </td>

                                    </tr>


                                   <!-- ===================== Start Edit   ======================= --> 
        <div class="modal fade" id="edit_modals<?php echo $pdt->id?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white" style="background: linear-gradient(90deg, #FF6B6B, #FFA05A);">
                <h5 class="modal-title" id="exampleModalLabel">Edit Service Name</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="<?php echo base_url(); ?>service/servicename/update" method="post" enctype="multipart/form-data">
                    <div class="row">
                              <input class="form-control " type="hidden" name="id"  id="id" value="<?php echo $pdt->id; ?>" >
                        <!-- Name Field -->
                        <div class="col-md-12 mb-3">
                            <div class="form-group">
                                <label for="ename">Name <span class="text-danger">*</span></label>
                                <input type="text" name="ename" id="ename" class="form-control" value="<?php echo $pdt->name; ?>"  required>
                                <span class="text-danger small"><?php echo form_error('ename'); ?></span>
                            </div>
                        </div>
                        

                                    <div class="col-md-12">
							<div class="form-group">
							<label for="is_active">Status <span class="text-error"> *</span></label>
								<select name="is_active" id="is_active" class="form-control">
									<option value="">Select </option>
								<option value="1" <?php if ($pdt->is_active == 1) {    echo "selected";
                                        } ?> >Active</option>
                                            <option value="0" <?php if ($pdt->is_active == 0) {
                                            echo "selected";
                                        } ?>>Deactive</option>
                                            </select>
                                       		</div>
                                        <span class="text-error small"><?php echo form_error('is_active'); ?></span>
                                                                                        
                                                                                            </div>
                                </div>
                   
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary w-30" 
                            style="background: linear-gradient(90deg, #FF6B6B, #FFA05A);border:1px solid #FF6B6B;">
                        Update
                    </button>

                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
                                    
                                   <!-- ======================= End Edit ========================== -->
                                    <?php endforeach; ?>
                                        <?php
                                            endif; ?>
                        </tbody>


                    </table>
                </div>
      </div>
    </div>
  </div>
</div>
</div>
</div>


<!-- Add New Brand Modal -->
<div class="modal fade" id="add_new" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white" style="background: linear-gradient(90deg, #FF6B6B, #FFA05A);">
                <h5 class="modal-title" id="exampleModalLabel">Add New Service Name</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="<?php echo base_url(); ?>service/servicename/create" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <!-- Name Field -->
                        <div class="col-md-12 mb-3">
                            <div class="form-group">
                                <label for="name">Name <span class="text-danger">*</span></label>
                                <input type="text" name="name" id="name" class="form-control" value="<?php echo set_value('name'); ?>"  required>
                                <span class="text-danger small"><?php echo form_error('name'); ?></span>
                            </div>
                        </div>

                       
                       
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary w-30" 
                            style="background: linear-gradient(90deg, #FF6B6B, #FFA05A);border:1px solid #FF6B6B;">
                        Save
                    </button>

                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- End Add New Brand Modal -->

<script>
    $('#add_new').on('shown.bs.modal', function () {
      $('.select2').select2({
        dropdownParent: $('#add_new')
      });
    });

   
$(document).on('shown.bs.modal', '[id^="edit_modals"]', function () {
  $(this).find('.select2').select2({
    dropdownParent: $(this)
  });
});
</script>

<!-- Delete Confirmation Modal -->
<script>
    function confirmDelete(userId){
        Swal.fire({
        title: "Confirm Delete",
        text: "Are you sure want to delete this Data ?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes, delete it!"
        }).then((result) => {
        if (result.value) {
           window.location.href = "<?php echo base_url(); ?>service/serviceattributes/delete/"+userId;
        }
        }); 

        }
</script>





