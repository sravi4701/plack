<%@include  file="base.jsp" %>
<head>
	<title>Please Login</title>
</head>
	<main>
		<div class="container">
			<p></p>
			<p></p>
			<p>
				Welcome, Please login 
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalLRFormDemo">Login Please</button>
			</p>
		</div>
	</main>
	
	<div class="modal fade" id="modalLRFormDemo" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog cascading-modal" role="document">
			<!--Content-->
			<div class="modal-content">

				<!--Modal cascading tabs-->
				<div class="modal-c-tabs">

					<!-- Nav tabs -->
					<ul class="nav nav-tabs tabs-2 light-blue darken-3" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#panel17" role="tab"><i
								class="fa fa-user mr-1"></i> Login</a></li>

					</ul>

					<!-- Tab panels -->
					<div class="tab-content">
						<!--Panel 17-->
						<div class="tab-pane fade in show active" id="panel17"
							role="tabpanel">

							<!--Body-->
							<div class="modal-body mb-1">
								<form action="Login" method="POST">
	                                    <div class="md-form form-sm">
	                                        <i class="fa fa-envelope prefix"></i>
	                                        <input type="text" id="form2" class="form-control" name="email">
	                                        <label for="form2">Your email</label>
	                                    </div>
	
	                                    <div class="md-form form-sm">
	                                        <i class="fa fa-lock prefix"></i>
	                                        <input type="password" id="form3" class="form-control" name="pass">
	                                        <label for="form3">Your password</label>
	                                    </div>
	                                    <div class="text-center mt-2">
	                                        <button class="btn btn-info">Log in <i class="fa fa-sign-in ml-1"></i></button>
	                                    </div>
                                   </form>
							</div>
							<!--Footer-->
							<div class="modal-footer">
								<div class="options text-center text-md-right mt-1">
									<p>
										Not a member? <a data-toggle="modal"
											data-target="#modalLRForm" class="blue-text">Sign Up</a>
									</p>
									<p>
										Forgot <a href="#" class="blue-text">Password?</a>
									</p>
								</div>
								<button type="button"
									class="btn btn-outline-info waves-effect ml-auto"
									data-dismiss="modal">
									Close <i class="fa fa-times-circle ml-1"></i>
								</button>
							</div>

						</div>
						<!--/.Panel 7-->

						<!--Panel 18-->

					</div>

				</div>
			</div>
			<!--/.Content-->
		</div>
	</div>
	<!--Modal: Login / Register Form Demo-->
	
	<%@include  file="footer.jsp" %>
	