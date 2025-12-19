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
           <h3>Warranty  </h3>
          </div>
          <div class="col-auto ms-auto">
            <!-- Button trigger modal -->
               <div class="right">
               
                <a type="button" href="<?php echo base_url(); ?>service/warranty/create" class="btn btn_bg" >
                    <i class="fa-solid fa-plus"></i> Add New Warranty 
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
                                <th>Invoice</th>
                                <th>Description</th>
                                <th>Entry Date</th>
                                <th>Delivery Date</th>
                                <th>Customer</th>
                                <th>Supplier</th>
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
                                           <td><?php echo $pdt->invoice_no;?>    </td>
                                           <td><?php echo $pdt->invoice_no;?>  <br><b>Serial : <?php echo $pdt->serial;?>  </b> </td>
                                           <td><?php echo date("d-m-Y",$pdt->create_date);?>    </td>
                                           <td><?php echo date("d-m-Y",$pdt->delivery_date);?>    </td>
                                           <td><?php echo $pdt->customer;?>  </td>
                                           <td><?php echo $pdt->supplier;?>  </td>
                                           <td><span class="badge bg-success">Completed</span> </td>
                                     
                                      
                                               
                                   
                                       <td>
                                    <div class="btn-group" role="group">

                                      <a href="<?php echo base_url()."service/warranty/invoice/$pdt->id"?>" target="_blank" class="btn btn-sm btn-primary me-1">
                                            <i class="fa fa-eye"></i> 
                                        </a>
                                         <a onclick="modal_form('<?php echo $pdt->id;?> ','change_service_status')" data-toggle="modal" href="#modal-form1" class="btn btn-primary btn-xs" style="padding: 0 5px !important;"><i class="fa fa-refresh"></i> Change Status</a>
                                       
                                    
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
             window.location.href = "<?php echo base_url(); ?>warranty/delete/"+userId;
        }
        }); 

        }
</script>





