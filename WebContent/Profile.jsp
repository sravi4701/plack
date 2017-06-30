
<%@include file="base.jsp"%>

<main> <%@page
	import="javax.servlet.http.*,java.sql.*,getData.GetConnection"%>



<!--Main layout-->
<div class="container">
	<!--First row-->
	<div class="row wow fadeIn" data-wow-delay="0.2s">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2 class="h2-responsive">Material Design for</h2>
				<br>
				<p>Powerful and free Material Design UI KIT</p>
				<hr>
				<p>Register for free and get access to amazing framework and
					beautiful components</p>
				<a href="Post.jsp" class="btn btn-mdb btn-stc"
					rel="nofollow">Post
					New Update <i class="fa fa-download right"></i>
				</a> <a target="_blank" href="" class="btn btn-unique btn-ptc"
					rel="nofollow" data-toggle="modal" data-target="#modalEDForm">Edit
					Profile <i class="fa fa-book right"></i>
				</a>
			</div>
		</div>
	</div>
	<!--/.First row-->

	<hr class="extra-margins">

	<!--Second row-->
	<div class="row">
		<!--First columnn-->
		<div class="col-lg-4">
			<!--Card-->
			<div class="view hm-zoom">
				<img src="img/img.jpg" class="img-fluid " alt="">
				<div class="mask flex-center"></div>
			</div>

		</div>
		<!--First columnn-->

		<div class="col-lg-8">
			<!--Card-->
			<div class="card wow fadeIn" data-wow-delay="0.4s">


				<div class="card-block">
					<!--Title-->
					<h4 class="card-title text-center">Profile detail</h4>
					<hr>
					<!-- list group -->


					<% 
//HttpSession s = request.getSession();
//String currentUser = (String)s.getAttribute("email");
Connection cn = GetConnection.getCn();
  try{
	
	String sql = "select * from dashboard join user on dashboard.useremail=user.useremail where dashboard.useremail=?;";
	PreparedStatement ps = cn.prepareStatement(sql);
	ps.setString(1,currentUser);
    
	ResultSet rs = ps.executeQuery();
	if(rs.next()) {
		
			String email = rs.getString(1);
			String furl = rs.getString(3);
			String quote = rs.getString(4);
			String username = rs.getString(6);
			String phone = rs.getString(8);

%>


					<ul class="list-group">
						<li class="list-group-item justify-content-between">User Name
							&nbsp;&nbsp;&nbsp; &nbsp; -:
							<h5 style="color: #2BBBAD; margin-right: 300px;"><%=username %></h5>
						</li>
					</ul>
					<br>
					<ul class="list-group">
						<li class="list-group-item justify-content-between">Your
							Email &nbsp;&nbsp;&nbsp; &nbsp; -:
							<h4 style="color: #2BBBAD; margin-right: 290px;"><%=email %></h4>

						</li>
					</ul>
					<br>
					<ul class="list-group">
						<li class="list-group-item justify-content-between">your Name
							&nbsp;&nbsp;&nbsp; &nbsp; -:
							<h4 style="color: #2BBBAD; margin-right: 290px;"><%=quote %></h4>

						</li>
					</ul>
					<br>
					<ul class="list-group">
						<li class="list-group-item justify-content-between">Profile
							&nbsp;&nbsp;&nbsp; &nbsp; -:
							<h4 style="color: #2BBBAD; margin-right: 290px;"><%=furl %></h4>

						</li>
					</ul>

					<br>
					<ul class="list-group">
						<li class="list-group-item justify-content-between">Mobile
							No. &nbsp;&nbsp;&nbsp; &nbsp; -:
							<h4 style="color: #2BBBAD; margin-right: 290px;"><%=phone %></h4>

						</li>
					</ul>





					<%
			}
			else{
				System.out.println("no record found");
			}
			
	
  }
		catch(Exception e){
			e.printStackTrace();
		}
	%>
				</div>

				<a href="#" class="btn btn-info">Read more</a>
			</div>
			<!--/.Card content-->

		</div>
		<!--/.Card-->
	</div>
	<!--First columnn-->
</div>
<!--/.Second row--> <!--/.Main layout--> </main>
<%@include file="footer.jsp"%>






<!--  sign up form  -->




<div class="modal fade" id="modalEDForm" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog cascading-modal" role="document">
		<!--Content-->
		<div class="modal-content">

			<!--Modal cascading tabs-->
			<div class="modal-c-tabs">

				<!-- Nav tabs -->
				<ul class="nav nav-tabs tabs-2 light-blue darken-3" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="#panel17" role="tab">Add Detail</a></li>

				</ul>

				<!-- Tab panels -->
				<div class="tab-content">
					<!--Panel 17-->
					<div class="tab-pane fade in show active" id="panel17"
						role="tabpanel">
						<form action="AddDetail" method="POST">
							<div class="modal-body">



								<div class="md-form form-sm">

									<input type="text" id="form14" class="form-control" name="furl">
									<label for="form14">College</label>
								</div>
								<div class="md-form form-sm">

									<input type="text" id="form14" class="form-control"
										name="quote"> <label for="form14">Add quote</label>
								</div>

								<div class="text-center mt-2">
									<button class="btn btn-info">
										Log in <i class="fa fa-sign-in ml-1"></i>
									</button>
								</div>
							</div>
						</form>
						<!--Footer-->
						<div class="modal-footer">

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
</div>










<div class="modal fade" id="modalpost" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog cascading-modal" role="document">
		<!--Content-->
		<div class="modal-content">

			<!--Modal cascading tabs-->
			<div class="modal-c-tabs">

				<!-- Nav tabs -->
				<ul class="nav nav-tabs tabs-2 light-blue darken-3" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="#panel17" role="tab"><i
							class="fa fa-user mr-1"></i> Post New Update</a></li>

				</ul>

				<!-- Tab panels -->
				<div class="tab-content">
					<!--Panel 17-->
					<div class="tab-pane fade in show active" id="panel17"
						role="tabpanel">

						<!--Body-->
						<div class="modal-body mb-1">
							<form action="Login" method="POST">


								<div class="md-form">
									<i class="fa fa-pencil prefix"></i>
									<textarea type="text" id="form8" class="md-textarea"></textarea>
									<label for="form8">What's on your mind....</label>
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
