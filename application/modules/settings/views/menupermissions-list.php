 <div class="page-wrapper">

<div class="content container-fluid">

                <div class="page-header">
                    <div class="row">
                        <div class="col-sm-12">
                            <h3 class="page-title">Menu & Permissions</h3>
                        </div>
                    </div>
                </div>
                <!-- <div class="row">
                     <div class="col-sm-12">
                  <form method="post"  action="<?= base_url()."menu/menupermissions/users" ?>">

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
                    <i class="fas fa-search"></i> Search
                </button>
                    
                    </div>
            
                </div>
        </form>
 </div>
  </div> -->
                <div class="row">
                    <div class="col-sm-4 col-md-4 col-lg-4 col-xl-3">
                       
                 
                        <div class="roles-menu">
                            <ul>
                                  
                                <?php
                                foreach($allRoles as $roles){
                                ?>
                                <li <?php if($roles->id==$id){ echo 'class="active"'; }?>>
                                    <a href="<?php echo base_url()."settings/menupermissions/view/$roles->id"?>"><?php echo $roles->name; ?>
                                       
                                    </a>
                                </li>
                                <?php
                                }
                                ?>
                                
                           
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-8 col-md-8 col-lg-8 col-xl-9">
                       
    


                      <style>
.menu-list {
    list-style-type: none;
    padding: 0;
    margin: 0;
}

.menu-item {
    margin: 10px 0;
}

.submenu-list {
    list-style-type: none;
    padding-left: 30px;  /* ডানে সরানোর জন্য */
    margin-top: 5px;
    border-left: 2px solid #eee;
}
.custom_check {
    position: relative;
    padding-left: 28px;
    cursor: pointer;
    display: inline-block;
    line-height: 20px;
    user-select: none;
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
    border: 1px solid #e4e4e8;
    background-color: #fff;
    border-radius: 5px;
    transition: all .3s ease-in-out;
}

.custom_check input:checked ~ .checkmark {
    background-color: #4CAF50;
    border-color: #4CAF50;
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
                    <?= $menu['name'] ?>
                </label>

                <!-- Submenus -->
                <ul class="submenu-list">
                    <?php foreach ($menus as $submenu): ?>
                        <?php if ($submenu['parent_id'] == $menu['id']): ?>
                            <li>
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
<script>
$(document).ready(function(){
    $('.perm-checkbox').change(function(){
        let menuId = $(this).data('menu-id');
        let roleId = $(this).data('role-id');
        let isChecked = $(this).is(':checked');

        $.ajax({
            url: '<?= base_url('settings/menupermissions/update') ?>',
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


       
<script src="<?php echo base_url();?>public/assets/js/select2.min.js" type="text/javascript"></script>
<script src="<?php echo base_url();?>public/assets/plugins/select2/js/custom-select.js" type="5d2b74917cc35b47561004e3-text/javascript"></script>
  <script src="<?php echo base_url();?>public/assets/js/moment.min.js" type="text/javascript"></script>
<script src="<?php echo base_url();?>public/assets/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<script>

  $('.select2').select2({
    
  });


    </script>