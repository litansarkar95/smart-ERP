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
        <h3>  System Menu Definition  List</h3>
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
                                        <th>Url</th>
                                        <th>Position</th>
                                        <th>Icons</th>
                                        <th>Child Menu</th>
                                        <th>Set Authorization</th>
                                        <th>Status</th>
                                        <!-- <th>Create Date</th> -->
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
                                        <td><?php echo $pdt->url;?>    </td>
                                         <td><?php echo $pdt->position;?>    </td>
                                          <td><?php echo $pdt->icon;?>    </td>
                                        <td> <a  class="btn btn-primary m-r-5" href="<?php echo base_url()."settings/sidebarmenu/childmenu/{$pdt->id}"; ?>" ><i class="fa fa-list"></i> Child Menu</a>   </td>
                                               <td>
                                                
                                               <a  class="btn btn-success m-r-5 text-white" href="<?php echo base_url()."settings/sidebarmenu/definition/role/{$pdt->id}"; ?>" ><i class="fa fa-pencil"></i> Role</a> 
                                            
                                             <a  class="btn btn-danger m-r-5 text-white" href="<?php echo base_url()."settings/sidebarmenu/definition/user/{$pdt->id}"; ?>" ><i class="fa fa-pencil"></i> User</a>
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
                                        <td class="text-center">
                                            <a href="<?= base_url(
                                                  "settings/sidebarmenu/edit/".$pdt->id) ?>" class="btn btn-sm btn-primary me-1">
                                                <i class="fa fa-pencil"></i> Edit
                                            </a>
                                            <a href="#" class="btn btn-sm btn-danger" onclick="confirmDelete(<?php echo $pdt->id; ?>)">
                                                <i class="fa fa-trash"></i> Delete
                                            </a>
                                        </td>

                                    </tr>
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
                                      Add New Sidebar Menu Definition
                                    </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                    <form action="<?php echo base_url(); ?>settings/sidebarmenu/insert" method="post">
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
                                <label for="url">URL <span class="text-error"> *</span></label>
                                <input type="text" name="url" id="url" value="<?php echo set_value("url"); ?>" class="form-control">
                                <span class="text-error small"><?php echo form_error("url"); ?></span>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="position">Position <span class="text-error"> *</span></label>
                                <input type="text" name="position" id="position" value="<?php echo set_value("position" ); ?>" class="form-control">
                                <span class="text-error small"><?php echo form_error("position"); ?></span>
                            </div>
                        </div>

                       <div class="col-md-12">
                            <div class="form-group">
                                <label for="icon">Icon <span class="text-error"> *</span></label>
                                <input type="text" name="icon" id="icon" value="<?php echo set_value("icon"); ?>" class="form-control">
                                <span class="text-error small"><?php echo form_error("icon"); ?></span>
                            </div>
                        </div>

                                       <!-- Brand -->  

                          <div class="col-md-12 mb-3">
                                    <div class="form-group">
                                  <label for="parent_id">Parent</label>
                                  <div class="select_2_container">
                                    <select name="parent_id"  id="parent_id"     class="form-control frm_select select2">
                                       <option  value="">  Select  </option>
                                                       <?php
                                                    if(isset($allPdt)){
                                                        foreach($allPdt as $shift){
                                                            
                                                             
                                                                echo "<option value='$shift->id'>{$shift->name}</option>";
                                                              
                                                        }
                                                    }
                                                    ?>
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('parent_id'); ?>   </span>
                                </div></div>
                                <!-- end Brand --> 
                   
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
               window.location.href = "<?php echo base_url(); ?>settings/sidebarmenu/delete/"+userId;
        }
        }); 

        }
</script>





