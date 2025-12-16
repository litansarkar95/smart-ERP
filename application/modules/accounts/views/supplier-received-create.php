<style>
.print-btn{
 
  
    padding:10px !important;
}
  </style>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
<div class="container-fluid">





  <div class="row px-3">
    <div class="col-12">
      <div class="content">
        <div class="row">
          <div class="col-auto">
            <h3>Supplier Received</h3>
          </div>
          <form action="<?= base_url('accounts/supplierReceived/save_auto_paid') ?>" method="post">
        <div class="card">
        <div class="card-body">

            <div class="row g-3">
            <div class="col-md-4 mb-3">
                <input type="hidden" name="customer_id" value="<?= $customer_id ?>">
                                    <div class="form-group">
                                  <label for="customer_id" class="form-label">Supplier Name</label>
                                  <div class="select_2_container">
                                    <select name="customer_id"  id="customer_id"     class="form-control frm_select select2">
                                    	<option value="">Select </option>
																                  <?php
                                                   foreach($allCustomer as $customer){
                                                  echo "<option value='{$customer->id}'>$customer->name - $customer->contact_no</option>";
                                                   }
															                  	?>
															
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('customer_id'); ?>   </span>
                                </div></div>
                                   <!-- Brand -->  

                       
               

                 <div class="col-md-4 mb-3">
                <div class="form-group">
                    <label class="form-label">Previous Due</label>
                    <input type="text"
                          class="form-control"
                          id="previous_due"
                          value="0.00"
                          readonly>
                </div>
            </div>


               
               <div class="col-md-4 mb-3">
                       <div class="form-group">
                    <label class="form-label">Received Date</label>
                    <input type="text" class="form-control today" name="received_date" id="received_date" value="">
                </div>   </div>

               <div class="col-md-4 mb-3">
    <div class="form-group">
        <label class="form-label">
            Paid Amount
            <i class="fa fa-laptop text-primary ms-2"
               role="button"
               title="Add Bill"
               data-bs-toggle="modal"
               data-bs-target="#paidBillModal"></i>
        </label>

        <input type="number" name="total_paid" class="form-control" placeholder="Enter total paid" id="paidAmount">
    </div>
</div>

  <!-- start input -->
                          
                              

             

                  <div class="col-md-4 mb-3">
                                    <div class="form-group">
                                  <label for="payment_method_id" class="form-label">Payment Method</label>
                                  <div class="select_2_container">
                                    <select name="payment_method_id"  id="payment_method_id"     class="form-control frm_select select2">
                                    	 <?php foreach($allPayment as $payment): ?>
                                        <option value="<?= $payment->id ?>"><?= $payment->name ?></option>
                                    <?php endforeach; ?>
															
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('payment_method_id'); ?>   </span>
                                </div></div>
                                   <!-- Brand --> 
                                        <div class="col-md-4 mb-3">
                       <div class="form-group">
                    <label class="form-label">Note</label>
                    <textarea type="text" class="form-control" name="note" id="note"></textarea>
                </div>   </div> 

            </div>

            <div class="mt-4">
                  <button type="submit" class="btn btn-success">Save Paid</button>
            </div>


          </div>
        </div>
        <div class="row">
          <div class="col-12">
   
      </div>
    </div>
  </div>
</div>
</div>
</div>
</form>


<div class="modal fade" id="paidBillModal" tabindex="-1">
    <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">

            <form id="paidBillForm" method="post" action="<?= base_url('accounts/supplierReceived/save_due_collection'); ?>">
            <input type="hidden" name="received_date" id="modal_received_date">
            <input type="hidden" name="note" id="modal_note">

                <div class="modal-header">
                    <h5 class="modal-title" id="modalCustomerName">Customer</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">

                    <h6>Due Bill List</h6>

                    <table class="table table-bordered table-sm">
                        <thead class="table-light">
                            <tr>
                                <th>SL</th>
                                <th>Invoice No</th>
                                <th>Due</th>
                                <th>Discount</th>
                                <th>Payable</th>
                                <th>Paid</th>
                            </tr>
                        </thead>

                        <tbody id="dueInvoiceBody">
                            <!-- AJAX rows here -->
                        </tbody>
                    </table>

                    <div class="d-flex justify-content-between align-items-center mt-2">
                        <div>
                            <label for="bank_id">Payment Method</label>
                            <select name="bank_id" id="bank_id" class="form-control" required>
                             
                              <?php foreach($allPayment as $payment): ?>
                                        <option value="<?= $payment->id ?>"><?= $payment->name ?></option>
                                    <?php endforeach; ?>
                            </select>
                        </div>

                        <div>
                            <strong>Total Paid:</strong>
                            <input type="text" id="total_paid" name="total_paid" class="form-control" readonly>
                        </div>
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-save"></i> Save Collection
                    </button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>

            </form>

        </div>
    </div>
</div>



<script>
$(document).on('input', '.paid_amount', function () {
    let total = 0;
    $('.paid_amount').each(function () {
        total += parseFloat($(this).val()) || 0;
    });
    $('#total_paid').val(total.toFixed(2));
});
$('#paidBillModal').on('show.bs.modal', function () {
    $('#modal_received_date').val($('#received_date').val());
    $('#modal_note').val($('#note').val());
});

</script>

 <script>
    $(document).ready(function() {
   

   $(".today").datepicker({
  dateFormat: "dd-mm-yy",
  changeMonth: true,
  changeYear: true,
  yearRange: "1900:2100",
});


// Set a default date (e.g., today's date)
var today = $.datepicker.formatDate("dd-mm-yy", new Date());
$(".today,.to_date").val(today);

  });



     
    </script>


<script>
$(document).ready(function () {

    $('#customer_id').on('change', function () {
        let customer_id = $(this).val();

        if (customer_id === '') {
            $('#previous_due').val('0.00');
            return;
        }

        $.ajax({
            url: "<?= base_url('accounts/supplierReceived/get_customer_balance'); ?>",
            type: "POST",
            dataType: "json",
            data: { customer_id: customer_id },
            success: function (res) {
                if (res.status === 'success') {
                    $('#previous_due').val(parseFloat(res.current_balance).toFixed(2));
                } else {
                    $('#previous_due').val('0.00');
                }
            },
            error: function () {
                alert('Failed to load customer balance');
            }
        });
    });

});

$('#customer_id').on('change', function () {

    let customer_id = $(this).val();
    let customer_name = $('#customer_id option:selected').text();

    if (!customer_id) return;

    // modal title
    $('#modalCustomerName').text(customer_name);

    $.ajax({
        url: "<?= base_url('accounts/supplierReceived/get_supplie_due_invoices'); ?>",
        type: "POST",
        dataType: "json",
        data: { customer_id: customer_id },
        success: function (res) {

            let tbody = '';
            let sl = 1;

            if (res.status === 'success') {
                $.each(res.data, function (i, row) {
                    tbody += `
                        <tr>
                            <td>${sl++}</td>
                            <td><input type="text" name="invoice_no[]" class="form-control" value="${row.invoice_no}" readonly>
                            <input type="hidden" name="customer_id" class="form-control" value="${row.supplier_id}" >
                            </td>
                            <td><input type="text" name="due_amount[]" class="form-control" value="${row.dueAmount}" readonly></td>
                            <td><input type="number" name="discount_amount[]" class="form-control discount_amount" value="0"></td>
                            <td><input type="text" name="payable_amount[]" class="form-control payable_amount" value="${row.dueAmount}" readonly></td>
                            <td><input type="number" name="paid_amount[]" class="form-control paid_amount"></td>
                        </tr>
                    `;
                });
            } else {
                tbody = `
                    <tr>
                        <td colspan="6" class="text-center text-muted">No due invoices found</td>
                    </tr>`;
            }

            $('#dueInvoiceBody').html(tbody);
            $('#total_paid').val('0');
        }
    });
});

$(document).on('input', '.paid_amount', function () {
    let total = 0;
    $('.paid_amount').each(function () {
        total += parseFloat($(this).val()) || 0;
    });
    $('#total_paid').val(total.toFixed(2));
});


</script>

