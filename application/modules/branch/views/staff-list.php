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
        <h3>  Staff List</h3>
          </div>
          <div class="col-auto ms-auto">
            <!-- Button trigger modal -->
                <div class="right">
                 <a href="<?php echo base_url(); ?>branch/staff/create" class="btn btn_bg"><i class="fa fa-plus"></i> Add New  Staff </a>

            </div>

          </div>
        </div>
        <form method="get"  action="<?= base_url()."branch/staff" ?>">

                <div class="row filter-row">
      <!-- Brand -->  

                          <div class="col-md-3 mb-3">
                                    <div class="form-group">
                                  <div class="select_2_container">
                                    <select name="org_id"  id="org_id"     class="form-control frm_select select2">
                                      <option value="">ALL Organization</option>
																<?php
																foreach($allorg as $org){
                                                                     if($org_id == $org->id){
                                                                      echo "<option value='{$org->id}' selected>$org->name - $org->mobile_no</option>";
                                                                     }else{
                                                                      echo "<option value='{$org->id}'>$org->name - $org->mobile_no</option>";
                                                                     }
																
																}
																?>
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('org_id'); ?>   </span>
                                </div></div>
                                <!-- end Brand -->

                                      <!-- Brand -->  

                          <div class="col-md-3 mb-3">
                                    <div class="form-group">
                                  <div class="select_2_container">
                                    <select name="branch_id"  id="branch_id"     class="form-control frm_select select2">
                                      		<option value="">ALL Branch</option>
																 <?php
                                     foreach($allBranch as $branch){
                                        if($branch_id == $branch->id){
                                 echo "<option value='{$branch->id}' selected>$branch->name - $branch->mobile_no</option>";
                                        }else{
                                     echo "<option value='{$branch->id}'>$branch->name - $staff->mobile_no </option>";
                                        }
                                
                                                    }
                                                    ?>
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('branch_id'); ?>   </span>
                                </div></div>
                                <!-- end Brand -->

                                      <!-- Brand -->  

                          <div class="col-md-3 mb-3">
                                    <div class="form-group">
                                  <div class="select_2_container">
                                    <select name="roles_id"  id="roles_id"     class="form-control frm_select select2">
                                      	  <option value="0">Select Role</option>
                                                                   <?php
                                                    foreach($allRoles as $role){
                                                         if($roles_id== $role->id){
                                                          echo "<option value='{$role->id}' selected>$role->name</option>";
                                                        }else{
                                                        echo "<option value='{$role->id}'>$role->name</option>";
                                                        }
                                                    }
                                                    ?>
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('roles_id'); ?>   </span>
                                </div></div>
                                <!-- end Brand -->
              
                                                           
                 
                    
                    <div class="col-sm-6 col-md-3 ">
                            <button type="submit" class="btn btn-success ">
                                    <i class="fa fa-search"></i> Search
                                </button>
                    
                    </div>
   

                </div>
        </form>
        <div class="row">
          <div class="col-12">
                <div class="table-responsive">
                     <table id="tableData" class="table table-striped table-responsive" data-page-length="10">

                                    <thead class="table-success">
													            <tr>
													                <th>#</th>
                                                                      <th>Organization</th>
                                                                        <th>Branch</th>
                                                                       <th>Employee ID </th>
                                                                        <th>Name</th>
                                                                        <th>Mobile</th>
                                                                        <th>Role</th>
                                                                        <th>Status</th>
                                                                    <th class=" no-sort">Action</th>
													            </tr>
													        </thead>
													       <tbody>
                                            <?php if (!empty($allPdt)): $i=1; ?>
                                                <?php foreach ($allPdt as $pdt): ?>
                                                    <tr>
                                                        <td><?= $i++; ?></td>
                                                        <td><?= htmlspecialchars($pdt->org_name); ?></td>
                                                        <td><?= htmlspecialchars($pdt->branch_name); ?></td>
                                                        <td><?= htmlspecialchars($pdt->employee_id); ?></td>
                                                         <td>
                                                       
                                                            <a href="#" class="avatar">
                                                                  <img src="<?= base_url('public/images/staff/'.($pdt->picture ?: 'default.png')); ?>" width="40px" alt="Image">
                                                            
                                                          <?php echo $pdt->first_name." ";?> <span><?php echo $pdt->last_name;?></span></a>
                                                      
                                                    </td>
                                                        <td><?= htmlspecialchars($pdt->contact_no); ?></td>
                                                        <td><?= htmlspecialchars($pdt->role); ?></td>
                                                        
                                                        <td>
                                                            <?php if ($pdt->is_active): ?>
                                                                <span class="badge bg-success">Active</span>
                                                            <?php else: ?>
                                                                <span class="badge bg-danger">Inactive</span>
                                                            <?php endif; ?>
                                                        </td>
                                                     <td class="text-center">

                                                        <a href="#"  data-id="<?php echo $pdt->id;?>"   data-name="<?php echo $pdt->name;?>" data-bs-toggle="modal" 
                                                        data-bs-target="#edit_modals<?php echo $pdt->id?>"  title="Change Password"   class="btn btn-sm btn-success me-1">
                                                    <i class="fa fa-lock"></i> 
                                                </a>
                                                      
                                                <a href="<?= base_url('branch/staff/edit/'.$pdt->id); ?>" title="Edit" class="btn btn-sm btn-primary me-1">
                                                    <i class="fa fa-pencil"></i> 
                                                </a>
                                                <a href="#" class="btn btn-sm btn-danger"  title="Delete"
                                              onclick="confirmDelete(<?php echo $pdt->id; ?>)" >
                                                    <i class="fa fa-trash"></i> 
                                                </a>
                                            </td>

                                                    </tr>



                                                      <!-- Start Edit Modal -->
<div class="modal fade" id="edit_modals<?php echo $pdt->id?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5 text-bold" id="exampleModalLabel">
                                    Change Password
                                    </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                    <form action="<?php echo base_url(); ?>settings/permissions/update" method="post">
                    <div class="row mb-3">
                   <input class="form-control " type="hidden" name="id"  id="id" value="<?php echo $pdt->id; ?>" >

                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="password">Password <span class="text-error"> *</span></label>
                                <input type="text" name="password" id="password" value="" class="form-control">
                                <span class="text-error small"><?php echo form_error("password"); ?></span>
                            </div>
                        </div>
                      
														
									      				
 </div>
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

<!-- End Change Password modal -->
                                                <?php endforeach; ?>
                                            <?php endif; ?>
                                            </tbody>

													     
													    </table>
                </div>
      </div>
    </div>
  </div>
</div>
</div>
</div>


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
            window.location.href = "<?php echo base_url();?>branch/staff/delete/"+userId;
        }
        }); 

        }
   </script>
