<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>base</title>

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Material Design Bootstrap -->
<link href="css/mdb.min.css" rel="stylesheet">

<!-- Template styles -->
<style>
/* TEMPLATE STYLES */
main {
	padding-top: 3rem;
	padding-bottom: 2rem;
}

.extra-margins {
	margin-top: 1rem;
	margin-bottom: 2.5rem;
}

.jumbotron {
	text-align: center;
}

.navbar {
	background-color: #3b295a;
}

footer.page-footer {
	background-color: #3b295a;
	margin-top: 2rem;
}
</style>

</head>
<body>
	<%@page import="javax.servlet.http.*,java.sql.*,getData.GetConnection"%>
	<header>


		<nav
			class="navbar fixed-top  navbar-toggleable-md navbar-dark default-color">
			<div class="container">
				<button class="navbar-toggler navbar-toggler-right" type="button"
					data-toggle="collapse" data-target="#navbarNav3"
					aria-controls="navbarNav3" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<a class="navbar-brand" href="#"> <strong>AngelGo</strong>
				</a>
				<div class="collapse navbar-collapse" id="navbarNav3">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active"><a
							class="nav-link waves-effect waves-light"><i
								class="fa fa-envelope"></i> Contact</a></li>
						<%  HttpSession s = request.getSession();
						String currentUser = (String)s.getAttribute("email");
						
                                  if(currentUser != null && !currentUser.equals("")){
                                  }
                                  else{
                                	  %>

						<li class="nav-item"><a
							class="nav-link waves-effect waves-light" data-toggle="modal"
							data-target="#modalLRFormDemo"><i class="fa fa-gear"></i>
								Login</a></li>
						<li class="nav-item"><a
							class="nav-link waves-effect waves-light" data-toggle="modal"
							data-target="#modalLRForm"><i class="fa fa-gear"></i> SignUp</a>
						</li>
						 <li class="nav-item"><a
               							class="nav-link waves-effect waves-light" ><i class="fa fa-gear"></i>
               								Contact Us</a></li>
						<% } %>
						<%     if(currentUser != null && !currentUser.equals("")){%>
                            	   <li class="nav-item"><a href="Postprocess.jsp"
               							class="nav-link waves-effect waves-light" ><i class="fa fa-gear"></i>
               								Home</a></li>
               								 <li class="nav-item"><a href="Profile.jsp" 
               							class="nav-link waves-effect waves-light" ><i class="fa fa-gear"></i>
               								profile</a></li>
 <li class="nav-item"><a
							class="nav-link waves-effect waves-light" href="Logout"><i
								class="fa fa-gear"></i> Logout</a></li>
								<li class="nav-item"><a
               							class="nav-link waves-effect waves-light" ><i class="fa fa-gear"></i>
               								Help</a></li>
						<% } %>
					</ul>
				</div>
			</div>
		</nav>

	</header>


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
										<i class="fa fa-envelope prefix"></i> <input type="text"
											id="form2" class="form-control" name="email"> <label
											for="form2">Your email</label>
									</div>

									<div class="md-form form-sm">
										<i class="fa fa-lock prefix"></i> <input type="password"
											id="form3" class="form-control" name="pass"> <label
											for="form3">Your password</label>
									</div>
									<div class="text-center mt-2">
										<button class="btn btn-info">
											Log in <i class="fa fa-sign-in ml-1"></i>
										</button>
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







	<!--  sign up form  -->




	<div class="modal fade" id="modalLRForm" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog cascading-modal" role="document">
			<!--Content-->
			<div class="modal-content">

				<!--Modal cascading tabs-->
				<div class="modal-c-tabs">

					<!-- Nav tabs -->
					<ul class="nav nav-tabs tabs-2 light-blue darken-3" role="tablist">
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#panel17" role="tab"><i class="fa fa-user mr-1"></i>
								Sign Up</a></li>

					</ul>

					<!-- Tab panels -->
					<div class="tab-content">
						<!--Panel 17-->
						<div class="tab-pane fade in show active" id="panel17"
							role="tabpanel">
							<form action="Register" method="POST">
								<div class="modal-body">
									<div class="md-form form-sm">
										<i class="fa fa-envelope prefix"></i> <input type="text"
											id="form14" class="form-control" name="name"> <label
											for="form14">Your Name</label>
									</div>

									<div class="md-form form-sm">
										<i class="fa fa-envelope prefix"></i> <input type="email"
											id="form14" class="form-control" name="email"> <label
											for="form14">Your email</label>
									</div>

									<div class="md-form form-sm">
										<i class="fa fa-envelope prefix"></i> <input type="text"
											id="form14" class="form-control" name="phone"> <label
											for="form14">Your Phone</label>
									</div>

									<div class="md-form form-sm">
										<i class="fa fa-lock prefix"></i> <input type="password"
											id="form5" class="form-control" name="pass1"> <label
											for="form5">Your password</label>
									</div>

									<div class="md-form form-sm">
										<i class="fa fa-lock prefix"></i> <input type="password"
											id="form6" class="form-control" name="pass2"> <label
											for="form6">Repeat password</label>
									</div>

									<div class="text-center form-sm mt-2">
										<button class="btn btn-info">
											Sign up <i class="fa fa-sign-in ml-1"></i>
										</button>
									</div>
								</div>
							</form>
							<!--Footer-->
							<div class="modal-footer">
								<div class="options text-right">
									<p class="pt-1">
										Already have an account? <a data-toggle="modal"
											data-target="#modalLRFormDemo" class="blue-text">Log In</a>
									</p>
								</div>
								<button type="button"
									class="btn btn-outline-info waves-effect ml-auto"
									data-dismiss="modal">
									Close <i class="fa fa-times-circle ml-1"></i>
								</button>
							</div>
						</div>
						<!--/.Panel 8-->

					</div>


				</div>

			</div>
		</div>
		<!--/.Content-->
	</div>
	<!--Modal: Login / Register Form Demo-->