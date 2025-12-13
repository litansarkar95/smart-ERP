
  	  <link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
<style>
        /* Custom styles for better mobile experience */
     
        .panel-bd {
            border: 1px solid #ddd;
            border-radius: 4px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
        
        .panel-heading {
            background-color: #f8f8f8;
            border-bottom: 1px solid #e7e7e7;
            padding: 15px;
        }
        
        .panel-heading h4 {
            margin: 0;
            font-weight: bold;
            color: #333;
        }
        
        .panel-body {
            padding: 20px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
       
        
        .button {
            padding: 8px 16px;
            float: left;
           
        }
        
        /* Mobile-specific adjustments */
        @media (max-width: 768px) {
            .col-md-7.col-md-offset-3 {
                width: 100%;
                margin-left: 0;
            }
            
            .panel-body {
                padding: 15px;
            }
            
            .button {
                display: block;
                width: 100%;
                margin-bottom: 10px;
            }
            
          
        }
        
        @media (max-width: 480px) {
          
            .panel-heading {
                padding: 10px;
            }
            
            .panel-heading h4 {
                font-size: 18px;
            }
        }
    </style>
<!-- Main content -->
<section class="content">
  <div class="row justify-content-center">
    <!-- Form controls -->
    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
      <div class="panel panel-bd">
        <div class="panel-heading d-flex justify-content-between align-items-center">
          <h4 class="m-0">  Individual Party Ledger</h4>
        </div>
        <div class="panel-body">
          <form action="<?php echo base_url(); ?>reports/partyledger/view" method="post" target="_blank">
    <div class="row mb-3">
        <!-- From Date Input -->
        <div class="col-md-12">
            <div class="form-group">
                <label for="p_from">From Date</label>
                <input type="text" name="p_from" id="p_from" value="<?php echo set_value('p_from'); ?>" class="form-control from_date">
                <span class="text-error small"><?php echo form_error('p_from'); ?></span>
            </div>
        </div>
        
        <!-- To Date Input -->
        <div class="col-md-12">
            <div class="form-group">
                <label for="p_to">To Date</label>
                <input type="text" name="p_to" id="p_to" value="<?php echo set_value('p_to'); ?>" class="form-control to_date">
                <span class="text-error small"><?php echo form_error('p_to'); ?></span>
            </div>
        </div>
        
        <!-- Party Name Dropdown -->
        <div class="col-md-12 mb-3">
            <div class="form-group">
                <label for="party_id">Party Name</label>
                <div class="select_2_container">
                    <select name="party_id" id="party_id" class="form-control frm_select select2">
                        <option value="">Select</option>
                        <?php foreach($allPro as $pro): ?>
                            <option value="<?= $pro->id ?>" <?php echo set_select('party_id', $pro->id); ?>><?= $pro->name ?></option>
                        <?php endforeach; ?>
                    </select>
                    <i class="fas fa-caret-down"></i>
                </div>
                <span class="text-error small"><?php echo form_error('party_id'); ?></span>
            </div>
        </div>
    </div>
    
    <!-- Submit Buttons -->
    <div class="row">
        <div class="col-12">
            <button type="submit" name="report_type" value="pdf" class="btn btn-primary">PDF</button>
            <!-- <button type="submit" name="report_type" value="excel" class="btn btn-success">Excel</button> -->
        </div>
    </div>
</form>

        </div>
      </div>
    </div>

  </div>
</section>

  

   <script>
    $(document).ready(function() {
   

   $(".from_date, .to_date , #p_from").datepicker({
  dateFormat: "dd-mm-yy",
  changeMonth: true,
  changeYear: true,
  yearRange: "1900:2100",
});


// Set a default date (e.g., today's date)
var today = $.datepicker.formatDate("dd-mm-yy", new Date());
$(".from_date, .to_date").val(today);

  });


  </script>
     