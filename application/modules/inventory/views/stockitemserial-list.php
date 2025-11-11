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
           <h3>  Stock Item Serial</h3>
          </div>
          <div class="col-auto ms-auto">
            <!-- Button trigger modal -->
               
          </div>
        </div>
        <!-- <form method="get"  action="<?= base_url()."branch" ?>">

                <div class="row filter-row">
      <!-- Brand -->  

                          <!-- <div class="col-md-3 mb-3">
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

                                    
              
                                                           
                 
<!--                     
                    <div class="col-sm-6 col-md-3 ">
                            <button type="submit" class="btn btn-success ">
                                    <i class="fa fa-search"></i> Search
                                </button>
                    
                    </div>
   

                </div>
        </form>  -->
        <div class="row">
          <div class="col-12">
                <div class="table-responsive">
                   <table id="tableData" class="table table-striped table-responsive" data-page-length="10">

                                    <thead class="table-success">
													            <tr>
													                <th>#</th>
                                                                    <th>Organization</th>
                                                                    <th>Product Name</th>
                                                                    <th>Item Serial</th>
                                                                    <th>Serial Type</th>
                                                                    <th>is Available</th>
                                                                    <th>Create Date</th>
													            </tr>
													        </thead>
													       <tbody>
                                            <?php if (!empty($allPdt)): $i=1; ?>
                                                <?php foreach ($allPdt as $pdt): ?>
                                                    <tr>
                                                        <td><?= $i++; ?></td>
                                                        <td><?= htmlspecialchars($pdt->org_name); ?></td>
                                                        <td><?= htmlspecialchars($pdt->product); ?></td>
                                                        <td><?= htmlspecialchars($pdt->serial); ?></td>
                                                        <td><?= htmlspecialchars($pdt->serial_type); ?></td>
                                                        
                                                        
                                                        <td>
                                                            <?php if ($pdt->is_available): ?>
                                                                <span class="badge bg-success">Yes</span>
                                                            <?php else: ?>
                                                                <span class="badge bg-danger">No</span>
                                                            <?php endif; ?>
                                                        </td>
                                              <td><?= date("d-m-Y",$pdt->create_date); ?></td>

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
