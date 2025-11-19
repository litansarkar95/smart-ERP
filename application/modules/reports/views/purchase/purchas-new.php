
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
          <h4 class="m-0"> Purchase Statement</h4>
        </div>
        <div class="panel-body">
          <form  action="<?php echo base_url(); ?>reports/purchase/purchase_statement" method="post" target="_blank">
                                                            <div class="row mb-3">

                                             

                               <!-- start input -->
                                 
                                       <div class="col-md-12">
                                                              <div class="form-group">
                                  <label for="p_from">From Date</label>
                                  <input type="text"   name="p_from" id="p_from"  value="<?php echo set_value('p_from'); ?>"    class="form-control from_date">
                               <span class="text-error small"> <?php echo form_error('p_from'); ?>   </span>
                                </div></div>
                                 <!-- end input -->

                                  <!-- start input -->
                                 
                                       <div class="col-md-12">
                                                              <div class="form-group">
                                  <label for="p_to">To Date</label>
                                  <input type="text"   name="p_to"   id="p_to"  value="<?php echo set_value('p_to'); ?>"    class="form-control to_date">
                               <span class="text-error small"> <?php echo form_error('p_to'); ?>   </span>
                                </div></div>
                                 <!-- end input -->

                                <!-- Brand -->  

                          <div class="col-md-12 ">
                                    <div class="form-group">
                                  <label for="p_group">Product Group</label>
                                  <div class="select_2_container">
                                    <select name="p_group"  id="p_group"     class="form-control frm_select select2">
                                       <option  value="">  Select  </option>
                                                       <?php
                                                                      foreach($allCat as $bnd){
                                                                        echo "<option value='{$bnd->id}'>$bnd->name </option>";
                                                                        }
																?>
                                    </select>
                                    <i class="fas fa-caret-down"></i>
                                  </div>
                                  <span class="text-error small"> <?php echo form_error('p_group'); ?>   </span>
                                </div></div>
                                <!-- end Brand -->
                                 
                                   <!-- Brand -->  


                           

                                                                        

                                                                      


                                                                    



                                                            </div>



                                                            <div class="row">
                                                                        <div class="col-12">
                                                                                    <button type="submit"
                                                                                                class="btn btn_bg">Search</button>
                                                                        </div>
                                                            </div>
                                                </form>
        </div>
      </div>
    </div>

    <!-- Form controls -->
    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="display:none;">
      <div class="panel panel-bd">
        <div class="panel-heading d-flex justify-content-between align-items-center">
          <h4 class="m-0">Student Fee</h4>
        </div>
        <div class="panel-body">
          <form action="<?php echo base_url(); ?>reports/feesearch" method="post" enctype="multipart/form-data">
            
            <!-- Course Dropdown -->
                        <div class="form-group col-md-12">
                                 <label for="from_month">From Date</label>
                                 <input type="text" id="from_month" class="form-control" name="from_month"  value="<?php echo set_value('from_month'); ?>" >
                                 <span class="text-red mdall"><?php echo form_error('from_month'); ?></span>
                              </div>

                              <div class="form-group col-md-12">
                                 <label for="to_month">To Date</label>
                                 <input type="text" id="to_month" class="form-control" name="to_month"  value="<?php echo set_value('to_month'); ?>" >
                                 <span class="text-red mdall"><?php echo form_error('to_month'); ?></span>
                                 </div>

                                   <!-- Course Dropdown -->
                            <div class="form-group col-md-12">
                              <label for="stu_course_id">Course</label>
                              <select id="stu_course_id" class="form-control select2" name="stu_course_id" >
                                <option value=""><?php echo display('select'); ?></option>
                                <?php foreach ($allCourse as $cls) {
                                  echo "<option value='{$cls->id}'>{$cls->course_name}</option>";
                                } ?>
                              </select>
                              <span class="text-red small"><?php echo form_error('stu_course_id'); ?></span>
                            </div>


                 <!-- Course Dropdown -->
            <div class="form-group col-md-12">
              <label for="payment_status">Status</label>
              <select id="payment_status" class="form-control" name="payment_status">
                <option value=""><?php echo display('select'); ?></option>
                <option value="Due">Due</option>
                <option value="Paid">Paid</option>
              
              </select>
              <span class="text-red small"><?php echo form_error('payment_status'); ?></span>
            </div>

            <!-- Buttons -->
          <div class="form-group col-md-12">
            
              <button type="submit" class="button btn btn-warning">
                Search
              </button>
            </div>

          </form>
        </div>
      </div>
    </div>


         <!-- Form controls -->
    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="display:none;">
      <div class="panel panel-bd">
        <div class="panel-heading d-flex justify-content-between align-items-center">
          <h4 class="m-0">Daily Attendance Summary</h4>
        </div>
        <div class="panel-body">
          <form action="<?php echo base_url(); ?>reports/attendancesummary" method="post" enctype="multipart/form-data">
            
            <!-- Course Dropdown -->
                        <div class="form-group col-md-12">
                                 <label for="attendance_from">From Date</label>
                                 <input type="text" id="attendance_from" class="form-control from_date" name="attendance_from"  value="<?php echo set_value('attendance_from'); ?>" >
                                 <span class="text-red mdall"><?php echo form_error('attendance_from'); ?></span>
                              </div>

                              <div class="form-group col-md-12">
                                 <label for="attendance_to">To Date</label>
                                 <input type="text" id="attendance_to" class="form-control to_date" name="attendance_to"  value="<?php echo set_value('attendance_to'); ?>" >
                                 <span class="text-red mdall"><?php echo form_error('attendance_to'); ?></span>
                                 </div>

                                   <!-- Course Dropdown -->
                            <div class="form-group col-md-12">
                              <label for="attendance_course_id">Course</label>
                              <select id="attendance_course_id" class="form-control select2" name="attendance_course_id" >
                                <option value=""><?php echo display('select'); ?></option>
                                <?php foreach ($allCourse as $cls) {
                                  echo "<option value='{$cls->id}'>{$cls->course_name}</option>";
                                } ?>
                              </select>
                              <span class="text-red small"><?php echo form_error('attendance_course_id'); ?></span>
                            </div>


            

            <!-- Buttons -->
          <div class="form-group col-md-12">
            
              <button type="submit" class="button btn btn-success">
                Search
              </button>
            </div>

          </form>
        </div>
      </div>
          </div>

      <!-- Form controls -->
    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="display:none;">
      <div class="panel panel-bd">
        <div class="panel-heading d-flex justify-content-between align-items-center">
          <h4 class="m-0">Student Attendance</h4>
        </div>
        <div class="panel-body">
          <form action="<?php echo base_url(); ?>reports/attendancesearch" method="post" enctype="multipart/form-data">
            
            <!-- Course Dropdown -->
                        <div class="form-group col-md-12">
                                 <label for="attc_from">From Date</label>
                                 <input type="text" id="attc_from" class="form-control from_date" name="attc_from"  value="<?php echo set_value('attc_from'); ?>" >
                                 <span class="text-red mdall"><?php echo form_error('attc_from'); ?></span>
                              </div>

                              <div class="form-group col-md-12">
                                 <label for="attc_to">To Date</label>
                                 <input type="text" id="attc_to" class="form-control to_date" name="attc_to"  value="<?php echo set_value('attc_to'); ?>" >
                                 <span class="text-red mdall"><?php echo form_error('attc_to'); ?></span>
                                 </div>

                                   <!-- Course Dropdown -->
                            <div class="form-group col-md-12">
                              <label for="attc_course_id">Course</label>
                              <select id="attc_course_id" class="form-control select2" name="attc_course_id" >
                                <option value=""><?php echo display('select'); ?></option>
                                <?php foreach ($allCourse as $cls) {
                                  echo "<option value='{$cls->id}'>{$cls->course_name}</option>";
                                } ?>
                              </select>
                              <span class="text-red small"><?php echo form_error('attc_course_id'); ?></span>
                            </div>


                           <!-- Student Dropdown -->
            <div class="form-group col-md-12">
              <label for="attc_student_id">Student</label>
              <select id="attc_student_id" class="form-control select2" name="attc_student_id">
                <option value="">All Students</option> <!-- ✅ All student দেখতে চাইলে ফাঁকা রাখবে -->
                <?php foreach ($allStu as $stu): ?>
                  <option value="<?= $stu->id ?>"><?= $stu->student_name ?> - <?= $stu->mobile ?></option>
                <?php endforeach; ?>
              </select>
            </div>




                 <!-- Course Dropdown -->
            <div class="form-group col-md-12">
              <label for="payment_status">Status</label>
              <select id="attendance_status" class="form-control" name="attendance_status">
                <option value=""><?php echo display('select'); ?></option>
                <option value="1">Present</option>
                <option value="0">Absent</option>
              
              </select>
              <span class="text-red small"><?php echo form_error('attendance_status'); ?></span>
            </div>

            <!-- Buttons -->
          <div class="form-group col-md-12">
            
              <button type="submit" class="button btn btn-success">
                Search
              </button>
            </div>

          </form>
        </div>
      </div>
    </div>

    <!-- Form controls -->
    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="display:none;">
      <div class="panel panel-bd">
        <div class="panel-heading d-flex justify-content-between align-items-center">
          <h4 class="m-0">Individual Student Fee Summary</h4>
        </div>
        <div class="panel-body">
          <form action="<?php echo base_url(); ?>reports/individualstudent" method="post" enctype="multipart/form-data">
            
            <!-- Course Dropdown -->
                        <div class="form-group col-md-12">
                                 <label for="stu_from_month">From Date</label>
                                 <input type="text" id="stu_from_month" class="form-control" name="stu_from_month"  value="<?php echo set_value('stu_from_month'); ?>" >
                                 <span class="text-red mdall"><?php echo form_error('stu_from_month'); ?></span>
                              </div>

                              <div class="form-group col-md-12">
                                 <label for="stu_to_month">To Date</label>
                                 <input type="text" id="stu_to_month" class="form-control" name="stu_to_month"  value="<?php echo set_value('stu_to_month'); ?>" >
                                 <span class="text-red mdall"><?php echo form_error('stu_to_month'); ?></span>
                                 </div>

                        <!-- Course Dropdown -->
                     <div class="form-group col-md-12">
                     <label for="student_id">Student</label>
                     <select id="student_id" class="form-control select2" name="student_id">
                        <option value=""><?php echo display('select'); ?></option>
                         <?php foreach ($allStu as $stu) {
                                 echo "<option value='{$stu->id}'>{$stu->student_code} - {$stu->student_name} - {$stu->mobile}</option>";
                              } ?>
                     
                     </select>
                     <span class="text-red small"><?php echo form_error('student_id'); ?></span>
                     </div>

                                 <!-- Course Dropdown -->
                     <div class="form-group col-md-12">
                     <label for="stu_payment_status">Status</label>
                     <select id="stu_payment_status" class="form-control" name="stu_payment_status">
                        <option value=""><?php echo display('select'); ?></option>
                        <option value="Due">Due</option>
                        <option value="Paid">Paid</option>
                     
                     </select>
                     <span class="text-red small"><?php echo form_error('stu_payment_status'); ?></span>
                     </div>

            <!-- Buttons -->
          <div class="form-group col-md-12">
            
              <button type="submit" class="button btn btn-primary">
                Search
              </button>
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
     