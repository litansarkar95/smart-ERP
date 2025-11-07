 <div class="page-wrapper">

<div class="content container-fluid">

                <div class="page-header">
                    <div class="row">
                        <div class="col-sm-12">
                            <h3 class="page-title">User & Permissions</h3>
                        </div>
                    </div>
                </div>
                 <?php if (has_permission('settings/userspermissions', 'create')): ?>
                <div class="row">
                     <div class="col-sm-12">
                  <form method="post"  action="<?= base_url()."settings/userspermissions/create" ?>">

                <div class="row filter-row">

                <div class="col-sm-6 col-md-3">
            <span class="text-red small"><?php echo form_error('employee_id'); ?></span>
            <div class="input-group time">
               <select class="form-control floating select2" name="employee_id" required>
                              
                                <option value="">Select Employee</option>
                                  <?php
                                     foreach($allStaff as $staff){
                                        if($employee_id == $staff->id){
                                 echo "<option value='{$staff->id}' selected>$staff->employee_id - $staff->first_name $staff->last_name</option>";
                                        }else{
                                     echo "<option value='{$staff->id}'>$staff->employee_id - $staff->first_name $staff->last_name</option>";
                                        }
                                
                                                    }
                                                    ?>
                            </select>
                     </div>  
                    
                    </div>

                    
                    <div class="col-sm-6 col-md-3 ">
                            <button type="submit" class="btn btn-success w-100">
                    <i class="fas fa-search"></i> Action
                </button>
                    
                    </div>
            
                </div>
        </form>
 </div>
  </div>
   <?php endif; ?>
                     <div class="row">
                        <div class="col-sm-12">
                            <br>
                            <h3 class="page-title">Roles & Permissions</h3>
                        </div>
                  
                    <div class="col-sm-4 col-md-4 col-lg-4 col-xl-3">
                       
                 
                        <div class="roles-menu">
                            <ul>
                                   
                                <?php
                                foreach($allRoles as $roles){
                                ?>
                                <li <?php if($roles->id==$id){ echo 'class="active"'; }?>>
                                    <a href="<?php echo base_url()."settings/rolespermissions/view/$roles->id"?>"><?php echo $roles->name; ?>
                                       
                                    </a>
                                </li>
                                <?php
                                }
                                ?>
                                
                           
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-8 col-md-8 col-lg-8 col-xl-9">
                      
                        <br>
    


                        <div class="table-responsive">
                            <table class="table table-striped custom-table">
                                <thead>
                                    <tr>
                                        <th>Module Permission</th>
                                        <th class="text-center">Read</th>
                                        <th class="text-center">Create</th>
                                        <th class="text-center">View</th>
                                        <th class="text-center">Edit</th>
                                        <th class="text-center">Update</th>
                                        <th class="text-center">Delete</th>
                                        <th class="text-center">Import</th>
                                        <th class="text-center">Export</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($permissions as $controller => $actions): ?>
            <tr>
                <td><?= ucfirst($controller); ?></td>
                <?php foreach (['read', 'create','view', 'edit','update', 'delete', 'import', 'export'] as $method): ?>
                    <td class="text-center">
                          <?php if (isset($actions[$method])): ?>
                             <label class="custom_check">
                            <input type="checkbox"
                                   class="perm-checkbox"
                                   data-role-id="<?= $role_id; ?>"
                                   data-permission-id="<?= $actions[$method]; ?>"
                                   <?= isset($assigned[$actions[$method]]) ? 'checked' : ''; ?>>
                                   <span class="checkmark"></span>
                                            </label>
                        <?php else: ?>
                            —
                        <?php endif; ?>
                    </td>
                        <?php endforeach; ?>
                            </tr>
                        <?php endforeach; ?>
                                    
                               
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>   
        
        
        
        
        </div>


        <script>
$(document).ready(function () {
    $('.perm-checkbox').on('change', function () {
        var roleId = $(this).data('role-id');
        var permissionId = $(this).data('permission-id');
        var isChecked = $(this).is(':checked') ? 1 : 0;

        $.ajax({
            url: '<?= base_url("settings/rolespermissions/update"); ?>',
            type: 'POST',
            data: {
                role_id: roleId,
                permission_id: permissionId,
                status: isChecked,
                '<?= $this->security->get_csrf_token_name(); ?>': '<?= $this->security->get_csrf_hash(); ?>'
            },
            success: function (res) {
                console.log('Permission updated:', res);
                // Optional: success toast
            },
            error: function () {
                alert('Permission update failed.');
            }
        });
    });
});
</script>
<script src="<?php echo base_url();?>public/assets/js/select2.min.js" type="text/javascript"></script>
<script src="<?php echo base_url();?>public/assets/plugins/select2/js/custom-select.js" type="5d2b74917cc35b47561004e3-text/javascript"></script>
  <script src="<?php echo base_url();?>public/assets/js/moment.min.js" type="text/javascript"></script>
<script src="<?php echo base_url();?>public/assets/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<script>

  $('.select2').select2({
    
  });


    </script>