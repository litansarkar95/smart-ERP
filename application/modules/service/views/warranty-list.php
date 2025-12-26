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
      <input type="hidden" name="product_id" id="product_id<?= $pdt->product_id; ?>" value="<?= $pdt->product_id; ?>">
     <input  type="hidden"  name="purchase_price" value="<?= $pdt->purchase_price; ?>">
     <input  type="hidden"  name="sales_price" value="<?= $pdt->sales_price; ?>">
     <input  type="hidden"  name="sales_date" value="<?= $pdt->sales_date; ?>">
     <input  type="hidden"  name="warrenty" value="<?= $pdt->warrenty; ?>">
     <input  type="hidden"  name="warrenty_days" value="<?= $pdt->warrenty_days; ?>">

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
   <div class="delivery-wrapper">

  <!-- Stock e nite chacchen -->
  <div class="form-check">
    <input class="form-check-input take_from_stock"
           type="checkbox" value="1" name="replace_given">
    <label class="form-check-label fw-bold">
    সাপ্লায়ার থেকে  স্টক এ পণ্য নিতে চাচ্ছেন
    </label>
  </div>

  <!-- Take from stock box -->
  <div class="mb-3 take-stock-box d-none">
    <label class="form-label">Stock Receive Serial</label>
    <input type="text" class="form-control" name="StockReceiveSerial"
           placeholder="বার কোড স্ক্যান করুন অথবা লিখে দিন">
  </div>

  <!-- Delivered from stock -->
  <div class="form-check mt-2">
    <input class="form-check-input delivered_from_stock"
           type="checkbox" value="1" name="delivered_from_stock">
    <label class="form-check-label fw-bold">
      স্টক থেকে পণ্য ডেলিভারি দিতে চাচ্ছেন
    </label>
  </div>

  <div class="mb-3 replace-serial-box d-none">
    <label class="form-label">Replace Serial No</label>
    <input type="text" name="replace_serial" class="form-control"
           placeholder="বার কোড স্ক্যান করুন অথবা লিখে দিন">
  </div>

  <!-- Delivered from supplier -->
  <div class="form-check mt-2">
    <input class="form-check-input delivered_from_supplier"
           type="checkbox" value="1" name="delivered_from_supplier">
    <label class="form-check-label fw-bold">
      সাপ্লায়ার থেকে পুরাতন পণ্য ডেলিভারি দিতে চাচ্ছেন
    </label>
  </div>

    <!-- Delivered from supplier -->
  <div class="form-check mt-2">
    <input class="form-check-input input_from_supplier_others_item"
           type="checkbox" value="1" name="input_from_supplier_others_item">
    <label class="form-check-label fw-bold">
      সাপ্লায়ার থেকে ভিন্ন পণ্য স্টক এ নিতে  চাচ্ছেন
    </label>
  </div>

     <!-- Delivered from supplier -->
  <div class="form-check mt-2">
    <input class="form-check-input input_from_customer_others_item"
           type="checkbox" value="1" name="input_from_customer_others_item">
    <label class="form-check-label fw-bold">
      স্টক থেকে  ভিন্ন পণ্য ডেলিভারি  দিতে  চাচ্ছেন
    </label>
  </div>

<div class="mb-3 customer_others_item-box d-none">

  <label for="customer_product_id">Product Name </label>
                                  <div class="select_2_container">
                                    <select name="customer_product_id"  id="customer_product_id"     class="form-control frm_select ">
                                       <option  value="">  Select  </option>
                                     <?php foreach($allPro as $pro): ?>
                                    <option value="<?= $pro->id ?>" ><?= $pro->name ?></option>
                                <?php endforeach; ?>
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>

    <label class="form-label"> Serial</label>
    <input type="text" class="form-control" name="customer_serial"
           placeholder="বার কোড স্ক্যান করুন অথবা লিখে দিন">
  </div>


    


  <div class="mb-3 supplier_others_item-box d-none">

  <label for="new_product_id">Product Name </label>
                                  <div class="select_2_container">
                                    <select name="new_product_id"  id="new_product_id"     class="form-control frm_select ">
                                       <option  value="">  Select  </option>
                                     <?php foreach($allPro as $pro): ?>
                                    <option value="<?= $pro->id ?>" ><?= $pro->name ?></option>
                                <?php endforeach; ?>
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>

    <label class="form-label"> Serial</label>
    <input type="text" class="form-control" name="new_serial"
           placeholder="বার কোড স্ক্যান করুন অথবা লিখে দিন">
  </div>


    <div class="mb-3 supplier-box d-none">
    <label class="form-label">Supplier Serial</label>
    <input type="text" class="form-control"
           placeholder="বার কোড স্ক্যান করুন অথবা লিখে দিন">
  </div>

</div>


          <!-- Handover To -->
          <div class="mb-3">
            <label for="handover_to<?= $pdt->id; ?>" class="form-label">Handover To</label>
            <input type="text" class="form-control" id="handover_to<?= $pdt->id; ?>" name="handover_to">
          </div>

    

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
    $('#changeStatusModal2').on('shown.bs.modal', function () {
      $('.select2').select2({
        dropdownParent: $('#changeStatusModal2')
      });
    });

   
$(document).on('shown.bs.modal', '[id^="changeStatusModal2"]', function () {
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



<script>
document.addEventListener('change', function (e) {

  const wrapper = e.target.closest('.delivery-wrapper');
  if (!wrapper) return;

  // স্টক এ পণ্য নিতে চাচ্ছেন
  if (e.target.classList.contains('take_from_stock')) {
    const box = wrapper.querySelector('.take-stock-box');
    if (!box) return;

    e.target.checked
      ? box.classList.remove('d-none')
      : box.classList.add('d-none');
  }

  // স্টক থেকে ডেলিভারি
  if (e.target.classList.contains('delivered_from_stock')) {
    const box = wrapper.querySelector('.replace-serial-box');
    if (!box) return;

    e.target.checked
      ? box.classList.remove('d-none')
      : box.classList.add('d-none');
  }

  // সাপ্লায়ার থেকে ডেলিভারি
  if (e.target.classList.contains('delivered_from_supplier')) {
    const box = wrapper.querySelector('.supplier-box');
    if (!box) return;

    e.target.checked
      ? box.classList.remove('d-none')
      : box.classList.add('d-none');
  }
  // সাপ্লায়ার থেকে ডেলিভারি
  if (e.target.classList.contains('input_from_supplier_others_item')) {
    const box = wrapper.querySelector('.supplier_others_item-box');
    if (!box) return;

    e.target.checked
      ? box.classList.remove('d-none')
      : box.classList.add('d-none');
  }

    // সাপ্লায়ার থেকে ডেলিভারি
  if (e.target.classList.contains('input_from_customer_others_item')) {
    const box = wrapper.querySelector('.customer_others_item-box');
    if (!box) return;

    e.target.checked
      ? box.classList.remove('d-none')
      : box.classList.add('d-none');
  }
});
</script>
