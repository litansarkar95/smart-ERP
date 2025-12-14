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
           <h3> Order List  </h3>
          </div>
          <div class="col-auto ms-auto">
            <!-- Button trigger modal -->
               <div class="right">
                 <?php if (has_permission('products/order', 'create')): ?>
                <a type="button" href="<?php echo base_url(); ?>purchase/create" class="btn btn_bg" >
                    <i class="fa-solid fa-plus"></i> Add New Order 
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
                                <th>Cutomer</th>
                                <th>Order No</th>
                                <th>Order Date</th>
                                <th>Order By</th>
                                <th>Status</th>
                                <th class=" no-sort">Action</th>	
                            </tr>
                        </thead>
                        <tbody>
                            <?php if (!empty($allPdt)):
                                              $i = 1; ?>
                                <?php foreach ($allPdt  as $pdt   ): ?>
                                    <tr>
                                        <td>
                                            <?= $i++ ?>
                                        </td>
                                        <td><?php echo $pdt->partner ." - ".$pdt->mobile_no;?>    </td>
                                           <td><?php echo $pdt->invoice_code;?>    </td>
                                           <td><?php echo date("d-m-Y",$pdt->create_date);?>  </td>
                                           <td><?php echo $pdt->first_name;?>    </td>
                                           <td><?php echo $pdt->status;?>  </td>
                                          
                                     
                                      
                                               
                                   
                                       <td>
                                    <div class="btn-group" role="group">
                                      <a href="<?php echo base_url()."sales/order/invoice/$pdt->invoice_code"?>" target="_blank" class="btn btn-sm btn-success me-1">
                                            <i class="fa fa-eye"></i> 
                                        </a>
                                        <?php //if (has_permission('purchase', 'edit')): ?>
                                        <a href="<?php echo base_url()."sales/order/create/$pdt->invoice_code"?>" class="btn btn-sm btn-primary me-1">
                                            <i class="fa fa-pencil"></i> 
                                        </a>
                                        <?php //endif; ?>

                                        <?php //if (has_permission('purchase', 'delete')): ?>
                                        <a href="#" class="btn btn-sm btn-danger" onclick="confirmDelete(<?php echo $pdt->invoice_code; ?>)">
                                            <i class="fa fa-trash"></i> 
                                        </a>
                                        <?php //endif; ?>
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
             window.location.href = "<?php echo base_url(); ?>sales/order/delete/"+userId;
        }
        }); 

        }
</script>





