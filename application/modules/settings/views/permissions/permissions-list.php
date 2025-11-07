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
            <h3>Permissions Menu </h3>
          </div>
          <div class="col-auto ms-auto">
            <!-- Button trigger modal -->
               <div class="right">
                <button type="button" class="btn btn_bg" data-bs-toggle="modal" data-bs-target="#add_new">
                    <i class="fa fa-plus"></i> Add New Menu
                </button>
            </div>

          </div>
        </div>
        <div class="row">
          <div class="col-12">
                <div class="table-responsive">
                    <table id="tableData" class="table table-striped table-responsive" data-page-length="10">

                        <thead class="table-success">
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                        <th>Controller</th>
                                        <th>Method</th>
                                         <th>Url</th>
                                         <th>Status</th>
                                <th class=" no-sort">Action</th>
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
                                           <td><?php echo $pdt->name;?>    </td>
                                        <td><?php echo $pdt->controller;?>    </td>
                                         <td><?php echo $pdt->method;?>    </td>
                                          <td><?php echo $pdt->url;?>    </td>
                                      
                                               
                                      
                                       
                                    

                                        <td>
                                            <?php if (
                                                              $pdt->is_active
                                                            ): ?>
                                                <span class="badge bg-success">Active</span>
                                                <?php else: ?>
                                                    <span class="badge bg-danger">Inactive</span>
                                                    <?php endif; ?>
                                        </td>
                                        <td class="text-center">
                                            <a href="#" data-id="<?php echo $pdt->id;?>"   data-name="<?php echo $pdt->name;?>" data-bs-toggle="modal" 
                                                        data-bs-target="#edit_modals<?php echo $pdt->id?>"  class="btn btn-sm btn-primary me-1">
                                                <i class="fa fa-pencil"></i> Edit
                                            </a>
                                            <a href="#" class="btn btn-sm btn-danger" onclick="confirmDelete(<?php echo $pdt->id; ?>)">
                                                <i class="fa fa-trash"></i> Delete
                                            </a>
                                        </td>

                                    </tr>


                                    <!-- Start Edit Modal -->
<div class="modal fade" id="edit_modals<?php echo $pdt->id?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5 text-bold" id="exampleModalLabel">
                                     Edit Permissions Menu
                                    </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                    <form action="<?php echo base_url(); ?>settings/permissions/update" method="post">
                    <div class="row mb-3">
                   <input class="form-control " type="hidden" name="id"  id="id" value="<?php echo $pdt->id; ?>" >

                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="ename">Name <span class="text-error"> *</span></label>
                                <input type="text" name="ename" id="ename" value="<?php echo $pdt->name; ?>" class="form-control">
                                <span class="text-error small"><?php echo form_error("ename"); ?></span>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="econtroller">Controller <span class="text-error"> *</span></label>
                                <input type="text" name="econtroller" id="econtroller" value="<?php echo $pdt->controller; ?>" class="form-control">
                                <span class="text-error small"><?php echo form_error("econtroller"); ?></span>
                            </div>
                        </div>

                 

                          <div class="col-md-12 mb-3">
                                    <div class="form-group">
                                    <label for="emethod">Method <span class="text-error"> *</span></label>
                                  <div class="select_2_container">
                                    <select name="emethod"  id="emethod"     class="form-control frm_select select2">
                                 <option value="">Select</option>
                                                           <option value="read" <?php if($pdt->method == 'read'){ echo "selected"; } ?> >Read</option>
                                              <option value="create" <?php if($pdt->method == 'create'){ echo "selected"; } ?> >Create</option>edit
                                              <option value="view" <?php if($pdt->method == 'view'){ echo "selected"; } ?> >View</option>
                                              <option value="view" <?php if($pdt->method == 'view'){ echo "selected"; } ?> >Details</option>
                                              <option value="delete" <?php if($pdt->method == 'delete'){ echo "selected"; } ?> >Delete</option>
                                              <option value="edit" <?php if($pdt->method == 'edit'){ echo "selected"; } ?> >Edit</option>
                                              <option value="update" <?php if($pdt->method == 'update'){ echo "selected"; } ?> >Update</option>
                                              <option value="import" <?php if($pdt->method == 'import'){ echo "selected"; } ?> >Import</option>
                                              <option value="export" <?php if($pdt->method == 'export'){ echo "selected"; } ?> >Export</option>
                                              <option value="approve" <?php if($pdt->method == 'approve'){ echo "selected"; } ?> >Approve</option>
                                              <option value="settings" <?php if($pdt->method == 'settings'){ echo "selected"; } ?> >manage</option>
                         
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('emethod'); ?>   </span>
                                </div></div>
                                <!-- end Brand -->
                      
                         <div class="col-md-12">
                            <div class="form-group">
                                <label for="eurl">URL <span class="text-error"> *</span></label>
                                <input type="text" name="eurl" id="eurl" value="<?php echo $pdt->url; ?>" class="form-control">
                                <span class="text-error small"><?php echo form_error("eurl"); ?></span>
                            </div>
                        </div>

                          <div class="col-md-12 mb-3">
                                    <div class="form-group">
                                    <label for="is_active">Status <span class="text-error"> *</span></label>
                                  <div class="select_2_container">
                                    <select name="is_active"  id="is_active"     class="form-control frm_select select2">
                       <option value="">Select </option>
								<option value="1" <?php if ($pdt->is_active == 1) {
            echo "selected";
        } ?> >Active</option>
            <option value="0" <?php if ($pdt->is_active == 0) {
            echo "selected";
        } ?>>Deactive</option>  
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('is_active'); ?>   </span>
                                </div></div>
                                <!-- end Brand -->
                     
                        <div class="row">
                            <div class="col-12">
                              <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">
                        Cancel
                    </button>
                    <button type="submit" class="btn btn-primary">
                        Update
                    </button>
                </div>
                            </div>
                        </div>
                   
                </form>

              
            </div>
        </div>
    </div>
</div>
</div>

<!-- End Edit modal -->
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



<!--- Add New -->
<!-- Modal -->
<div class="modal fade" id="add_new" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5 text-bold" id="exampleModalLabel">
                                      Add New Permissions Menu
                                    </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                    <form action="<?php echo base_url(); ?>settings/permissions" method="post">
                    <div class="row mb-3">


                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="name">Name <span class="text-error"> *</span></label>
                                <input type="text" name="name" id="name" value="<?php echo set_value("name"); ?>" class="form-control">
                                <span class="text-error small"><?php echo form_error("name"); ?></span>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="controller">Controller <span class="text-error"> *</span></label>
                                <input type="text" name="controller" id="controller" value="<?php echo set_value("controller"); ?>" class="form-control">
                                <span class="text-error small"><?php echo form_error("controller"); ?></span>
                            </div>
                        </div>

                   <!-- Brand -->  

                          <div class="col-md-12 mb-3">
                                    <div class="form-group">
                                    <label for="method">Method <span class="text-error"> *</span></label>
                                  <div class="select_2_container">
                                    <select name="method"  id="method"     class="form-control frm_select select2">
                                 <option value="">Select</option>
                                              <option value="read">Read</option>
                                              <option value="create">Create</option>
                                              <option value="view">View</option>
                                              <option value="view">Details</option>
                                              <option value="delete">Delete</option>
                                              <option value="edit">Edit</option>
                                              <option value="update">Update</option>
                                              <option value="import">Import</option>
                                              <option value="export">Export</option>
                                              <option value="approve">Approve</option>
                                              <option value="settings">manage</option>
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('method'); ?>   </span>
                                </div></div>
                                <!-- end Brand -->

                      
                    
                         <div class="col-md-12">
                            <div class="form-group">
                                <label for="url">URL <span class="text-error"> *</span></label>
                                <input type="text" name="url" id="url" value="<?php echo set_value("url"); ?>" class="form-control">
                                <span class="text-error small"><?php echo form_error("url"); ?></span>
                            </div>
                        </div>
 </div>
                        <div class="row">
                            <div class="col-12">
                              <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">
                        Cancel
                    </button>
                    <button type="submit" class="btn btn-success">
                        Save
                    </button>
                </div>
                            </div>
                        </div>
                   
                </form>

              
            </div>
        </div>
    </div>
</div>
</div>

<!-- End Add New -->

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
          window.location.href = "<?php echo base_url(); ?>settings/permissions/delete/"+userId;
        }
        }); 

        }
</script>





