<style>
/* Optional enhancement for a sleek admin look */
.table th,
.table td {
  vertical-align: middle;
}

.table thead th {
  font-size: 0.9rem;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.table tbody td {
  font-size: 0.95rem;
}

.form-check-input {
  cursor: pointer;
  width: 1.1rem;
  height: 1.1rem;
}

.card-header {
  font-size: 1.05rem;
  border-bottom: 1px solid #e9ecef;
}

</style>

<div class="container-fluid">





  <div class="row px-3">

    <div class="content_header">
        <div class="header-row">

            <div class="left">
                <h3>  Roles & Permissions</h3>
            </div>

          

        </div>
    </div>

    <form method="post" action="<?= base_url()."settings/menupathpermissions/users" ?>">

        <div class="row filter-row">


            <div class="col-sm-6 col-md-3">
                <div class="form-group">

                    <select name="employee_id" id="employee_id" class="form-control select2">
                      <option value="">Select Employee</option>
                                   <?php
                                     foreach($allStaff as $staff){
                                        if($employee_id == $staff->id){
                                 echo "<option value='{$staff->id}' selected>$staff->first_name $staff->last_name - $staff->contact_no </option>";
                                        }else{
                                     echo "<option value='{$staff->id}'> $staff->first_name $staff->last_name  - $staff->contact_no</option>";
                                        }
                                
                                                    }
                                                    ?>
                    </select>
                 
            </div>
                    <span class="text-error small"><?php echo form_error("employee_id"); ?></span>
                
            </div>
          
          



            <div class="col-sm-6 col-md-3 ">
                <button type="submit" class="btn btn-success ">
                    <i class="fa fa-search"></i> Search
                </button>

            </div>


        </div>
    </form>
    <div class="main-content pb-3">
        <div class="row justify-content-center pb-5">
        <div class="col-md-4 col-12 pb-5">
            <div class="card shadow-sm border-0" style="margin-top:1rem;">
            <div class="card-header bg-primary text-white fw-bold">
            <i class="bi bi-people-fill me-2"></i> Roles Menu
            </div>
            <div class="card-body p-4">
            <ul class="list-group list-group-flush roles-menu">
            
            <!-- Administrator -->
            <li class="list-group-item <?php if($active == 'roles_permissions'){ echo 'active'; } ?>">
            <a href="<?php echo base_url()."settings/menupathpermissions"?>" 
                        class="text-decoration-none d-block <?php if($active == 'roles_permissions'){ echo 'text-white'; } else { echo 'text-dark'; } ?>">
                        <i class="bi bi-person-gear me-2"></i> Administrator
            </a>
            </li>

            <!-- Dynamic Roles -->
            <?php foreach($allRoles as $roles){ ?>
            <li class="list-group-item <?php if($roles->id==$id){ echo 'active'; } ?>">
            <a href="<?php echo base_url()."settings/menupathpermissions/view/$roles->id"?>" 
                        class="text-decoration-none d-block <?php if($roles->id==$id){ echo 'text-white'; } else { echo 'text-dark'; } ?>">
                        <i class="bi bi-person-badge me-2"></i> <?php echo $roles->name; ?>
            </a>
            </li>
            <?php } ?>
            
            </ul>
            </div>
            </div>
            </div>

         <div class="col-md-8 col-12 pb-5">
  <div class="card shadow-sm border-0 rounded-3">
    <div class="card-header bg-light fw-semibold d-flex align-items-center">
      <i class="bi bi-shield-lock me-2 text-primary fs-5"></i>
      <span>Role Permissions</span>
    </div>

    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-hover align-middle">
          <thead class="table-light">
            <tr>
              <th scope="col">Module Permission</th>
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
                <td class="fw-semibold text-capitalize"><?= ucfirst($controller); ?></td>
                <?php foreach (['read', 'create','view', 'edit','update', 'delete', 'import', 'export'] as $method): ?>
                  <td class="text-center">
                    <?php if (isset($actions[$method])): ?>
                      <div class="form-check d-flex justify-content-center">
                        <input 
                          class="form-check-input perm-checkbox" 
                          type="checkbox"
                          data-role-id="<?= $role_id; ?>"
                          data-permission-id="<?= $actions[$method]; ?>"
                          <?= isset($assigned[$actions[$method]]) ? 'checked' : ''; ?>>
                      </div>
                    <?php else: ?>
                      <span class="text-muted">—</span>
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
</div>

        </div>
    </div>
</div>
</div>
 </div>

<!--- Add New -->


        <script>
$(document).ready(function () {
    $('.perm-checkbox').on('change', function () {
        var roleId = $(this).data('role-id');
        var permissionId = $(this).data('permission-id');
        var isChecked = $(this).is(':checked') ? 1 : 0;

        $.ajax({
            url: '<?= base_url("settings/menupathpermissions/update"); ?>',
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