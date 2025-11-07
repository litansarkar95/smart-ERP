<style>
.menu-list {
  list-style-type: none;
  padding: 0;
  margin: 0;
}
.menu-item {
  margin: 15px 0;
}
.submenu-list {
  list-style-type: none;
  padding-left: 25px;
  margin-top: 8px;
  border-left: 2px solid #eaeaea;
}
.custom_check {
  position: relative;
  padding-left: 28px;
  cursor: pointer;
  display: inline-block;
  line-height: 22px;
  user-select: none;
  color: #333;
}
.custom_check input[type="checkbox"] {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}
.custom_check .checkmark {
  position: absolute;
  top: 3px;
  left: 0;
  height: 18px;
  width: 18px;
  border: 1px solid #ccc;
  background-color: #fff;
  border-radius: 4px;
  transition: all .2s ease-in-out;
}
.custom_check input:checked ~ .checkmark {
  background-color: #0d6efd;
  border-color: #0d6efd;
}
.custom_check .checkmark:after {
  content: "";
  position: absolute;
  display: none;
}
.custom_check input:checked ~ .checkmark:after {
  display: block;
}
.custom_check .checkmark:after {
  left: 6px;
  top: 2px;
  width: 5px;
  height: 10px;
  border: solid white;
  border-width: 0 2px 2px 0;
  transform: rotate(45deg);
}
</style>

<div class="container-fluid">





  <div class="row px-3">

    <div class="content_header">
        <div class="header-row">

            <div class="left">
                <h3>  Menu & Permissions</h3>
            </div>

          

        </div>
    </div>

    <form method="post" action="<?= base_url()."settings/sidebarpermissions/users" ?>">

        <div class="row filter-row">

 <div class="col-md-6 mb-3">
                                    <div class="form-group">
                                
                                  <div class="select_2_container">
                                    <select name="employee_id"  id="employee_id"     class="form-control frm_select select2">
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
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('employee_id'); ?>   </span>
                                </div></div>
                                <!-- end Brand -->


          
          
          



           <div class="col-md-6 mb-3">
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
            <li class="list-group-item <?php if($active == 'sidebarpermissions'){ echo 'active'; } ?>">
            <a href="<?php echo base_url()."settings/sidebarpermissions"?>" 
                        class="text-decoration-none d-block <?php if($active == 'sidebarpermissions'){ echo 'text-white'; } else { echo 'text-dark'; } ?>">
                        <i class="bi bi-person-gear me-2"></i> Administrator
            </a>
            </li>

            <!-- Dynamic Roles -->
            <?php foreach($allRoles as $roles){ ?>
            <li class="list-group-item <?php if($roles->id==$id){ echo 'active'; } ?>">
            <a href="<?php echo base_url()."settings/sidebarpermissions/view/$roles->id"?>" 
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
  <div class="card shadow-sm border-0">
    <div class="card-header bg-light fw-semibold">
      <i class="bi bi-shield-lock me-2 text-primary"></i> Role Permissions
    </div>
    <div class="card-body">
      
      <ul class="menu-list">
        <?php foreach ($menus as $menu): ?>
          <?php if ($menu['parent_id'] == 0): ?>
            <li class="menu-item">
              <label class="custom_check">
                <input type="checkbox" class="perm-checkbox"
                       data-menu-id="<?= $menu['id'] ?>"
                       data-role-id="<?= $role_id ?>"
                       <?= in_array($menu['id'], $perm_menu_ids) ? 'checked' : ''; ?>>
                <span class="checkmark"></span>
                <span class="fw-semibold"><?= $menu['name'] ?></span>
              </label>

              <!-- Submenus -->
              <ul class="submenu-list mt-2">
                <?php foreach ($menus as $submenu): ?>
                  <?php if ($submenu['parent_id'] == $menu['id']): ?>
                    <li class="mb-1">
                      <label class="custom_check">
                        <input type="checkbox" class="perm-checkbox"
                               data-menu-id="<?= $submenu['id'] ?>"
                               data-role-id="<?= $role_id ?>"
                               <?= in_array($submenu['id'], $perm_menu_ids) ? 'checked' : ''; ?>>
                        <span class="checkmark"></span>
                        <?= $submenu['name'] ?>
                      </label>
                    </li>
                  <?php endif; ?>
                <?php endforeach; ?>
              </ul>
            </li>
          <?php endif; ?>
        <?php endforeach; ?>
      </ul>

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
$(document).ready(function(){
    $('.perm-checkbox').change(function(){
        let menuId = $(this).data('menu-id');
        let roleId = $(this).data('role-id');
        let isChecked = $(this).is(':checked');

        $.ajax({
            url: '<?= base_url('settings/sidebarpermissions/update') ?>',
            method: 'POST',
            data: {
                menu_id: menuId,
                role_id: roleId,
                status: isChecked ? 1 : 0
            },
            success: function(res){
                // Optional: show feedback
                console.log(res);
            }
        });
    });
});
</script>