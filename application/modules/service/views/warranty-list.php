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
                                           <td><?php echo $pdt->product_name;?>  <br><b>Serial : <?php echo $pdt->serial;?>  </b> </td>
                                           <td><?php echo date("d-m-Y",$pdt->create_date);?>    </td>
                                           <td><?php echo date("d-m-Y",$pdt->delivery_date);?>    </td>
                                           <td><?php echo $pdt->customer;?>  </td>
                                           <td><?php echo $pdt->supplier;?>  </td>
                                          <td>
    <?php 
        $status_class = '';
        switch($pdt->status) {
            case 'Received':
                $status_class = 'bg-success';
                break;
            case 'Send to Service Center':
                $status_class = 'bg-warning';
                break;
            case 'Completed':
                $status_class = 'bg-primary';
                break;
            case 'Handover':
                $status_class = 'bg-danger';
                break;
            default:
                $status_class = 'bg-secondary';
        }
    ?>
    <span class="badge <?= $status_class ?>"><?= $pdt->status; ?></span>
</td>

                                     
                                      
                                               
                                   
                                       <td>
                                    <div class="btn-group" role="group">

                                      <a href="<?php echo base_url()."service/warranty/invoice/$pdt->id"?>" target="_blank" class="btn btn-sm btn-primary me-1">
                                            <i class="fa fa-eye"></i> 
                                        </a>
                                     <a onclick="modal_form('<?= $pdt->id; ?>')" 
   class="btn btn-primary btn-sm"
   data-bs-toggle="modal" 
   data-bs-target="#changeStatusModal<?= $pdt->id; ?>">
   <i class="fa fa-refresh"></i> Change Status
</a>

<!-- Modal -->
<div class="modal fade" id="changeStatusModal<?= $pdt->id; ?>" tabindex="-1" aria-labelledby="changeStatusLabel<?= $pdt->id; ?>" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h5 class="modal-title" id="changeStatusLabel<?= $pdt->id; ?>">Change Service Status</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>

      <!-- Modal Body -->
      <div class="modal-body">
        <p><strong>Product:</strong> <?= $pdt->product_name ?? 'N/A'; ?></p>
        <p><strong>Serial:</strong> <?= $pdt->serial; ?></p>
<form id="changeServiceForm<?= $pdt->id; ?>" 
      action="<?= base_url('service/warranty/change_status/'.$pdt->id) ?>" 
      method="post">

        <form id="changeServiceForm<?= $pdt->id; ?>">
          <!-- Status -->
          <div class="mb-3">
            <label for="status<?= $pdt->id; ?>" class="form-label">Status</label>
            <select class="form-select" id="status<?= $pdt->id; ?>" name="status" required>
              <option value="">Select Status</option>
              <option value="Received">Received</option>
              <option value="Send to Service Center">Send to Service Center</option>
              <option value="Completed">Completed</option>
              <option value="Handover">Handover</option>
            </select>
          </div>

          <!-- Checkboxes -->
          <div class="d-flex gap-3 mb-3">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" id="replace_given<?= $pdt->id; ?>" name="replace_given" value="1">
              <label class="form-check-label fw-bold" for="replace_given<?= $pdt->id; ?>">Replace Given</label>
            </div>

            <div class="form-check">
              <input class="form-check-input" type="checkbox" id="old_product_stock_in<?= $pdt->id; ?>" name="old_product_stock_in" value="1">
              <label class="form-check-label fw-bold" for="old_product_stock_in<?= $pdt->id; ?>">Old Product Stock In</label>
            </div>

            <div class="form-check">
              <input class="form-check-input" type="checkbox" id="replace_from_stock<?= $pdt->id; ?>" name="replace_from_stock" value="1">
              <label class="form-check-label fw-bold" for="replace_from_stock<?= $pdt->id; ?>">Replace From Stock</label>
            </div>
          </div>

          <!-- Replace Serial No -->
          <div class="mb-3">
            <label for="replace_serial<?= $pdt->id; ?>" class="form-label">Replace Serial No</label>
            <input type="text" class="form-control" id="replace_serial<?= $pdt->id; ?>" name="replace_serial">
          </div>

          <!-- Handover To -->
          <div class="mb-3">
            <label for="handover_to<?= $pdt->id; ?>" class="form-label">Handover To</label>
            <input type="text" class="form-control" id="handover_to<?= $pdt->id; ?>" name="handover_to">
          </div>

          <input type="hidden" name="product_id" id="product_id<?= $pdt->id; ?>" value="<?= $pdt->id; ?>">
        </form>
      </div>

      <!-- Modal Footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" form="changeServiceForm<?= $pdt->id; ?>" class="btn btn-primary">Save Changes</button>
      </div>

    </div>
  </div>
</div>


                                       
                                    
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





