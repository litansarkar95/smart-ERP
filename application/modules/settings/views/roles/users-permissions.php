 <div class="page-wrapper">

<div class="content container-fluid">

                <div class="page-header">
                    <div class="row">
                        <div class="col-sm-12">
                            <h3 class="page-title">Users & Permissions</h3>
                        </div>
                    </div>
                </div>
       <div class="row">
                   
                    <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12">
                        <h6 class="card-title m-b-20 mt-1">Module Access</h6>
                     


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
                                   data-role-id="<?= $user_id; ?>"
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
            url: '<?= base_url("settings/userspermissions/update"); ?>',
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
