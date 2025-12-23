<!DOCTYPE html>
<html lang="en" class="bg_login">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="<?php echo base_url(); ?>assets/static/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<link rel="stylesheet" href="<?php echo base_url(); ?>assets/static/css/dataTables.bootstrap5.css">
		<link rel="stylesheet" href="<?php echo base_url(); ?>assets/static/css/dataTables.dataTables.css">
		<link rel="stylesheet" href="<?php echo base_url(); ?>assets/static/css/style.css">
		<link rel="stylesheet" href="<?php echo base_url(); ?>assets/static/css/responsive.css">
		<title>Sign In || ERP</title>
	</head>
	<body class="bg_login">
		<div class="wrapper_login">
			<div class="container ">
				<div class="row justify-content-center align-items-center ">
					<div class="col-md-7">
						<div class="login_form_wrapper">
							<div class="container">
								<div class="row justify-content-center align-items-center">
									<div class="col-md-6 text-center login_image_container">
										<div class="login_image">
											<img src="<?php echo base_url(); ?>assets/static/imgs/gear-wheel.gif" alt="">
										</div>
									</div>
									<div class="col-md-6 w_full">
										<div class="form_container">

										   
											  <form class="login-form" action="<?php echo base_url(); ?>login" method="post">
												<div class="row">
													<div class="col">
														<div class="login_title">
															<!-- <img src="<?php echo base_url(); ?>public/assets/imgs/labibait.png" alt=""> -->
															<h4>Sign in</h4>
														</div>
													</div>
												</div>

												 <?php  $error =  $this->session->userdata('error'); 
													if($error){
													
													?>
														<span class="text-error small"><?php echo $this->session->userdata('error'); ?></span>  
												
													<?php
													$this->session->unset_userdata('error'); 
																		
													}
													?>
												<div class="row mb-3 mt-4">
													<div class="col-12">
														<label for="username">Username</label>
														<input type="text" name="username" id="username" value="<?php echo set_value('username'); ?>"   class="form-control">
														<span class="text-error small"><?php echo form_error('username'); ?></span>
													</div>
												</div>
												<div class="row mb-3">
													<div class="col-12">
														<div class="pass_label">
															<label for="user">Password</label><a href="" class="forget_link">Forget Password</a>
														</div>
														<span class="pass">
															<input type="password" name="password" class="form-control mb-2" id="password">
															<button class="eye_btn" type="button" id="showPw">
																<i class="fa fa-eye eye_icn"></i>
															</button>
														</span>
														<span class="text-error small"><?php echo form_error('password'); ?></span>
														<input type="checkbox" value="remember"> Remember Me
														
													</div>
												</div>
												<div class="row mb-3">
													<div class="col-12 text-center">
														<button  type="submit" class="btn  login_btn"><i class="fa fa-sign-in"></i> Login </button>
													</div>
												</div>
												<div class="row">
													<!-- <div class="col-12 text-center">
														<a href="" class="forget_link">Create New Account</a>
													</div> -->
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<script src="<?php echo base_url(); ?>assets/static/js/bootstrap.bundle.min.js"></script>
	<script src="<?php echo base_url(); ?>assets/static/js/jquery.min.js"></script>
	<script src="<?php echo base_url(); ?>assets/static/js/dataTables.js"></script>
	<script src="<?php echo base_url(); ?>assets/static/js/main.js"></script>
	</body>
</html>