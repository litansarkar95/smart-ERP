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
            <h3>  Organization List</h3>
          </div>
          <div class="col-auto ms-auto">
            <!-- Button trigger modal -->
               <div class="right">
               
                <a type="button" href="<?php echo base_url(); ?>branch/organization/create" class="btn btn_bg" >
                    <i class="fa-solid fa-plus"></i>  Add New  Organization
                </a>
                 
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
                                                        <td><?= htmlspecialchars($pdt->name); ?></td>
                                                        <td><?= htmlspecialchars($pdt->mobile_no); ?></td>
                                                        <td><?= htmlspecialchars($pdt->email); ?></td>
                                                        <td><?= htmlspecialchars($pdt->address); ?></td>
                                                        <td>
                                                            <img src="<?= base_url('public/images/organization/'.($pdt->picture ?: 'default.png')); ?>" width="80px" alt="Image">
                                                        </td>
                                                        <td>
                                                            <?php if ($pdt->is_active): ?>
                                                                <span class="badge bg-success">Active</span>
                                                            <?php else: ?>
                                                                <span class="badge bg-danger">Inactive</span>
                                                            <?php endif; ?>
                                                        </td>
                                                     <td class="text-center">
                                                <a href="<?= base_url('branch/organization/edit/'.$pdt->id); ?>" class="btn btn-sm btn-primary me-1">
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
                 window.location.href = "<?php echo base_url();?>branch/organization/delete/"+userId;
        }
        }); 

        }
</script>





