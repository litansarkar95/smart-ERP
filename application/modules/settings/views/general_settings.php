
    </script>
  <!-- Content Header (Page header) -->
            <section class="content-header">
            
               <div >
               <h4><?php echo display('general_settings'); ?></h4>
               </div>
            </section>
            <!-- Main content -->
            <section class="content">
               <div class="row">
                  <!-- Form controls -->
                  <div class="col-sm-12">
                     <div class="panel panel-bd ">
                        <div class="panel-heading">
                        <div class="btn-group panel-defalut-two" >
                     
                     <h4><?php echo display('general_settings');  ?> </h4>

          
              
                
               </div>
                        </div>
                        <div class="panel-body">
                           <form  action="<?php echo base_url(); ?>settings/general_update" method="post" enctype="multipart/form-data">
                           <?php
                            if(isset($allPdt)){
                                foreach($allPdt as $pdt){
                                   
                                
                            
                            ?>
                              <div class="form-group col-sm-6">
                                 <label for="title"><?php echo display('title'); ?></label>
                                 <input type="text" id="title" class="form-control" name="title" value="<?php echo $pdt->title; ?>" >
                                 <span class="text-red small"><?php echo form_error('title'); ?></span>
                              </div>
                              <div class="form-group col-sm-6">
                                 <label for="name"><?php echo display('name'); ?></label>
                                 <input type="text" id="title" class="form-control" name="name" value="<?php echo $pdt->name; ?>" >
                                 <span class="text-red small"><?php echo form_error('name'); ?></span>
                              </div>
                              <div class="form-group col-sm-6">
                                 <label for="email"><?php echo display('email'); ?></label>
                                 <input type="text" id="title" class="form-control" name="email" value="<?php echo $pdt->email; ?>" >
                                 <span class="text-red small"><?php echo form_error('email'); ?></span>
                              </div>
                              <div class="form-group col-sm-6">
                                 <label for="phone"><?php echo display('contact_no'); ?></label>
                                 <input type="text" id="title" class="form-control" name="phone" value="<?php echo $pdt->phone; ?>" >
                                 <span class="text-red small"><?php echo form_error('phone'); ?></span>
                              </div>
                           
                           
                          
                              <div class="form-group col-sm-6">
                                 <label for="language"><?php echo display('language'); ?></label>
                                 <select type="text" id="language" class="form-control" name="language"  >
                                    <option value=""><?php echo display('select'); ?></option>
                                    <option value="english" <?php if($pdt->language == 'english') echo 'selected'; ?>>English</option>
                                    <option value="bangla" <?php if($pdt->language == 'bangla') echo 'selected'; ?>>Bangla</option>
                                    <option value="arbic" <?php if($pdt->language == 'arbic') echo 'selected'; ?>>Arbic</option>
                                
                                    </select>
                                 <span class="text-red small"><?php echo form_error('language'); ?></span>
                              </div>
                           
                             
                           
                              <div class="form-group col-sm-6">
                                 <label for="facebook"><?php echo display('facebook'); ?></label>
                                 <input type="text" id="facebook" class="form-control" name="facebook"  value="<?php echo $pdt->facebook; ?>"  >
                                 <span class="text-red small"><?php echo form_error('facebook'); ?></span>
                              </div>
                              <div class="form-group col-sm-6">
                                 <label for="twitter"><?php echo display('twitter'); ?></label>
                                 <input type="text" id="twitter" class="form-control" name="twitter"  value="<?php echo $pdt->twitter; ?>"  >
                                 <span class="text-red small"><?php echo form_error('twitter'); ?></span>
                              </div>
                              <div class="form-group col-sm-6">
                                 <label for="linkedin"><?php echo display('linkedin'); ?></label>
                                 <input type="text" id="linkedin" class="form-control" name="linkedin"  value="<?php echo $pdt->linkedin; ?>"  >
                                 <span class="text-red small"><?php echo form_error('linkedin'); ?></span>
                              </div>
                              <div class="form-group col-sm-6">
                                 <label for="instagram"><?php echo display('instagram'); ?></label>
                                 <input type="text" id="instagram" class="form-control" name="instagram"  value="<?php echo $pdt->instagram; ?>"  >
                                 <span class="text-red small"><?php echo form_error('instagram'); ?></span>
                              </div>
                              <div class="form-group col-sm-6">
                                 <label for="youtube"><?php echo display('youtube'); ?></label>
                                 <input type="text" id="youtube" class="form-control" name="youtube"  value="<?php echo $pdt->youtube; ?>"  >
                                 <span class="text-red small"><?php echo form_error('youtube'); ?></span>
                              </div>
                                 

                              <div class="form-group col-sm-6">
                                 <label for="short_description"><?php echo display('short_description'); ?></label>
                                 <textarea type="text" id="short_description" class="form-control" name="short_description" ><?php echo $pdt->short_description; ?></textarea>
                                 <span class="text-red small"><?php echo form_error('short_description'); ?></span>
                              </div>
                              <div class="form-group col-sm-6">
                                 <label for="address"><?php echo display('address'); ?></label>
                                 <textarea type="text" id="address" class="form-control" name="address" ><?php echo $pdt->address; ?></textarea>
                                 <span class="text-red small"><?php echo form_error('address'); ?></span>
                              </div>
                              <div class="form-group col-sm-6">
                                 <label for="icons"><?php echo display('icons'); ?></label>
                                 <input type="file" id="icons" class="form-control" name="favicon"  value="<?php echo set_value('icons'); ?>" >
                                 <span class="text-red small"><?php echo form_error('icons'); ?></span>
                              </div>
                              <div class="form-group col-sm-6">
                              <img src="<?php echo base_url()."assets/images/{$pdt->favicon}"; ?>"  width="60px">
                              </div>
                              <div class="form-group col-sm-6">
                                 <label for="pic"><?php echo display('picture'); ?></label>
                                 <input type="file" id="pic" class="form-control" name="pic"  value="<?php echo set_value('pic'); ?>" >
                                 <span class="text-red small"><?php echo form_error('pic'); ?></span>
                              </div>
                              <div class="form-group col-sm-6">
                              <img src="<?php echo base_url()."assets/images/{$pdt->logo}"; ?>"  width="60px">
                              </div>
                           
                              <div class="form-group col-sm-12">
                              <div class="reset-button left">
                                 <button   type="reset" class="btn btn-warning"><?php echo display('reset'); ?></button>
                                 <button type="submit" class="btn btn-success"><?php echo display('update'); ?></button>
                              </div></div>
                              <?php
                                    }
                                }
                            
                           ?>
                           </form>
                        </div>
                     </div>
                  </div>



 
               
                      
               </div>
            </section>
            <!-- /.content -->

          