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
           <h3>  Branch List</h3>
          </div>
          <div class="col-auto ms-auto">
            <!-- Button trigger modal -->
                <div class="right">
                 <a href="<?php echo base_url(); ?>branch/create" class="btn btn_bg"><i class="fa fa-plus"></i> Add New  Branch </a>

            </div>

          </div>
        </div>
        <form method="get"  action="<?= base_url()."branch" ?>">

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
                                                                    <th>Name</th>
                                                                    <th>Mobile</th>
                                                                    <th>Email</th>
                                                                    <th>Address</th>
                                                                    <th>Picture</th>
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
                                                        <td><?= htmlspecialchars($pdt->name); ?></td>
                                                        <td><?= htmlspecialchars($pdt->mobile_no); ?></td>
                                                        <td><?= htmlspecialchars($pdt->email); ?></td>
                                                        <td><?= htmlspecialchars($pdt->address); ?></td>
                                                        <td>
                                                            <img src="<?= base_url('public/images/branch/'.($pdt->picture ?: 'default.png')); ?>" width="40px" alt="Image">
                                                        </td>
                                                        <td>
                                                            <?php if ($pdt->is_active): ?>
                                                                <span class="badge bg-success">Active</span>
                                                            <?php else: ?>
                                                                <span class="badge bg-danger">Inactive</span>
                                                            <?php endif; ?>
                                                        </td>
                                                     <td class="text-center">
                                                <a href="<?= base_url('branch/edit/'.$pdt->id); ?>" class="btn btn-sm btn-primary me-1">
                                                    <i class="fa fa-pencil"></i> Edit
                                                </a>
                                                <a href="#" class="btn btn-sm btn-danger" 
                                              onclick="confirmDelete(<?php echo $pdt->id; ?>)" >
                                                    <i class="fa fa-trash"></i> Delete
                                                </a>
                                            </td>

                                                    </tr>
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
                     window.location.href = "<?php echo base_url();?>branch/delete/"+userId;
        }
        }); 

        }
   </script>
