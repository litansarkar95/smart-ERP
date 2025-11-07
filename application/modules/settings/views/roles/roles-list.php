
        <div class="page-wrapper">

            <div class="content container-fluid">

                <div class="page-header">
                    <div class="row align-items-center">
                        <div class="col">
                            <h3 class="page-title">Roles</h3>
                           
                        </div>
                        <div class="col-auto float-end ms-auto">
                             <?php if (has_permission('settings/roles', 'insert')): ?>
                            <a href="#" class="btn add-btn" data-bs-toggle="modal" data-bs-target="#add_department"><i
                                    class="fa-solid fa-plus"></i> Create Roles</a>
                                      <?php endif; ?>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div>
                            <table class="table table-striped custom-table mb-0 datatable">
                                <thead>
                                    <tr>
                                        <th class="width-thirty">#</th>
                                        <th>Name</th>
                                        <th>Status</th> 
                                        <th>Create Date</th> 
                                        <th class="text-end">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                        $i=1;
                                        if(isset($allPdt)){
                                        foreach ($allPdt as $pdt){
                                        ?>
                                    <tr>
                                      <td><?php  echo $i; $i++;?></td>
                                         <td><?php echo $pdt->name;?></td>
                                      <td class="text-center">
                                 <label class="switch">
                                    <input type="checkbox" <?php if($pdt->is_active == 1) { echo "checked"; }?> class="status" data-url="">
                                    <span class="slider round"></span>
                                 </label>
                              </td>
                                          <td><?php echo date('d-m-Y',$pdt->create_date); ?></td>
                                        <td class="text-end">
                                            <div class="dropdown dropdown-action">
                                                <a href="#" class="action-icon dropdown-toggle"
                                                    data-bs-toggle="dropdown" aria-expanded="false"><i
                                                        class="material-icons">more_vert</i></a>
                                                <div class="dropdown-menu dropdown-menu-right">
                                                     <?php if (has_permission('settings/roles', 'edit')): ?>
                                                    <a class="dropdown-item edit-dept" href="javascript:void(0);" data-id="<?php echo $pdt->id;?>" data-name="<?php echo $pdt->name;?>"  data-level="<?php echo $pdt->level;?>" 
                                                         data-status="<?php echo $pdt->is_active;?>" data-bs-toggle="modal"
                                                        data-bs-target="#edit_department"><i
                                                            class="fa-solid fa-pencil m-r-5"></i> Edit</a>
                                                                <?php endif; ?>
                                                    <?php if (has_permission('settings/roles', 'delete')): ?>
                                                    <a class="dropdown-item delete-dept" href="#" data-id="<?php echo $pdt->id;?>" data-name="<?php echo $pdt->name;?>" data-bs-toggle="modal" data-bs-target="#delete_department">
                                                 <i class="fa-regular fa-trash-can m-r-5"></i> Delete</a>
                                                  <?php endif; ?>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    
                                    <?php
                                        }
                                       }
                                        ?>
                                   
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>


            <div id="add_department" class="modal custom-modal fade" role="dialog">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Add Roles</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="<?php echo base_url(); ?>settings/roles/insert" method="post">
                                <div class="input-block mb-3">
                                    <label class="col-form-label" for="name"> Name <span
                                            class="text-danger">*</span></label>
                                    <input class="form-control"  type="text" name="name" value="<?php echo set_value('name'); ?>" id="name">
                                     <span class="text-red mdall text-danger"><?php echo form_error('name'); ?></span>
                                </div>
                            
                                <div class="submit-section">
                                    <button class="btn btn-primary submit-btn">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


            <div id="edit_department" class="modal custom-modal fade" role="dialog">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Edit Roles</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                         <form method="post" action="<?= base_url('settings/roles/update'); ?>" id="edit_department_form">
                            <input type="hidden" name="id" id="edit_dept_id">
                                <div class="input-block mb-3">
                                    <label class="col-form-label"> Name <span
                                            class="text-danger">*</span></label>
                                 <input class="form-control" name="ename" id="edit_dept_name" type="text">
                                </div>
                               
                            <div class="input-block mb-3">
                                    <label class="col-form-label">Status <span
                                            class="text-danger">*</span></label>
                                  <select class="form-control" name="status" id="edit_dept_status">
                                    <option value="">Select</option>
                                    <option value="1">Active</option>
                                    <option value="0">Inactive</option>
                                </select>
                                    </div>
                               
                             
                                <div class="submit-section">
                                    <button class="btn btn-primary submit-btn">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


            <div class="modal custom-modal fade" id="delete_department" role="dialog">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <form method="post" action="<?php echo base_url('settings/roles/delete'); ?>">
                 <input type="hidden" name="id" id="delete_dept_id">
                        <div class="modal-body">
                            <div class="form-header">
                                <h3>Delete Roles</h3>
                              <p id="delete_dept_text">Are you sure want to delete?</p>
                            </div>
                            <div class="modal-btn delete-action">
                                <div class="row">
                                    <div class="col-6">
                                     <button style="width:100%" href="javascript:void(0);" type="submit" class="btn btn-primary continue-btn">Delete</button>
                                </div>
                                    <div class="col-6">
                                        <a href="javascript:void(0);" data-bs-dismiss="modal"
                                            class="btn btn-primary cancel-btn">Cancel</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>


   <script>
    $(document).ready(function () {
        $('.edit-dept').on('click', function () {
            var id = $(this).data('id');
            var name = $(this).data('name');
            var level = $(this).data('level');
            var status = $(this).data('status');

            $('#edit_dept_id').val(id);
            $('#edit_dept_name').val(name);
            $('#edit_level').val(level);
            $('#edit_dept_status').val(status);
        });
    });
</script>

<!-- ✅ Make sure jQuery is loaded before this -->
<script>
    $(document).ready(function () {
        $('.delete-dept').click(function () {
            var id = $(this).data('id');
            var name = $(this).data('name');

            $('#delete_dept_id').val(id);
            $('#delete_dept_text').text("Are you sure you want to delete '" + name + "' Roles?");
        });
    });
</script>
