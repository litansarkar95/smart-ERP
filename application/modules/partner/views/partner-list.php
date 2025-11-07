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
           <h3>Partner  </h3>
          </div>
          <div class="col-auto ms-auto">
            <!-- Button trigger modal -->
               <div class="right">
                 <?php if (has_permission('products', 'create')): ?>
                <a type="button" href="<?php echo base_url(); ?>partner/create" class="btn btn_bg" >
                    <i class="fa-solid fa-plus"></i> Add New Partner 
                </a>
                   <?php endif; ?>
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
                                <th>Group</th>
                                <th>Brand</th>
                                <th>Serial Type</th>
                                <th>Inventory</th>
                                <th>Stock</th>
                                <th>Status</th>
                                <th class=" no-sort">Action</th>	
                            </tr>
                        </thead>
                        <tbody>
                            <?php if (!empty($allPdt)):
                                              $i = 1; ?>
                                <?php foreach (
                                                  $allPdt
                                                  as $pdt
                                                ): ?>
                                    <tr>
                                        <td>
                                            <?= $i++ ?>
                                        </td>
                                           <td><?php echo $pdt->name;?>    </td>
                                           <td><?php echo $pdt->groups;?>    </td>
                                           <td><?php echo $pdt->brands;?>    </td>
                                           <td><?php echo $pdt->serial_type;?>  </td>
                                     
                                      
                                               
                                      <td>
                                            <?php if (
                                                              $pdt->is_inventory
                                                            ){ ?>
                                                <span class="badge bg-success">Yes</span>
                                                <?php } ?>
                                                  
                                        </td>
                                       
                                    <td>
                                           0
                                        </td>

                                        <td>
                                            <?php if (
                                                              $pdt->is_active
                                                            ): ?>
                                                <span class="badge bg-success">Active</span>
                                                <?php else: ?>
                                                    <span class="badge bg-danger">Inactive</span>
                                                    <?php endif; ?>
                                        </td>
                                       <td>
                                    <div class="btn-group" role="group">
                                        <?php if (has_permission('products', 'edit')): ?>
                                        <a href="<?php echo base_url()."products/edit/$pdt->id"?>" class="btn btn-sm btn-primary me-1">
                                            <i class="fa fa-pencil"></i> 
                                        </a>
                                        <?php endif; ?>

                                        <?php if (has_permission('products', 'delete')): ?>
                                        <a href="#" class="btn btn-sm btn-danger" onclick="confirmDelete(<?php echo $pdt->id; ?>)">
                                            <i class="fa fa-trash"></i> 
                                        </a>
                                        <?php endif; ?>
                                    </div>
                                </td>


                                    </tr>


                                    <?php endforeach; ?>
                                        <?php
                                            endif; ?>
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
             window.location.href = "<?php echo base_url(); ?>partner/delete/"+userId;
        }
        }); 

        }
</script>





