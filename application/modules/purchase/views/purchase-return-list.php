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
           <h3>Purchase Return  </h3>
          </div>
          <div class="col-auto ms-auto">
            <!-- Button trigger modal -->
               <div class="right">
              
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
                                <th>Invoice</th>
                                <th>Name</th>
                                <th>Mobile No</th>
                                <th>Total Amout</th>
                                <th>Paid Amount</th>
                                <th>Due</th>
                                <th>Date</th>
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
                                           <td><?php echo $pdt->invoice_no;?>    </td>
                                           <td><?php echo $pdt->customer_name;?>    </td>
                                           <td><?php echo $pdt->mobile_no;?>    </td>
                                           <td><?php echo $pdt->total_amount;?>  </td>
                                           <td><?php echo $pdt->paid_amount;?>  </td>
                                           <td><?php echo $pdt->due_amount;?>  </td>
                                           <td><?php echo date("d-m-Y",$pdt->return_date);?>  </td>
                                     
                                      
                                               
                                   
                                       <td>
                                    <div class="btn-group" role="group">

                                      <a href="<?php echo base_url()."purchase/preturn/invoice/$pdt->id"?>" target="_blank" class="btn btn-sm btn-primary me-1">
                                            <i class="fa fa-eye"></i> 
                                        </a>
                                        <?php if (has_permission('sales/sreturn', 'edit')): ?>
                                        <a href="<?php echo base_url()."purchase/preturn/edit/$pdt->id"?>" class="btn btn-sm btn-primary me-1">
                                            <i class="fa fa-pencil"></i> 
                                        </a>
                                        <?php endif; ?>

                                        <?php if (has_permission('sales/sreturn', 'delete')): ?>
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
             window.location.href = "<?php echo base_url(); ?>purchase/preturn/delete/"+userId;
        }
        }); 

        }
</script>





