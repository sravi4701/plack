
<%@include file="base.jsp"%>
<head>
	<title>All Post</title>
</head>
<main> <%@page
	import="javax.servlet.http.*,java.sql.*,getData.GetConnection"%>



<!--Main layout-->
<div class="container">
	<!--First row-->
	<div class="row wow fadeIn" data-wow-delay="0.2s">
		<div class="col-md-12">
		
			<div class="jumbotron">
				<h2 class="h2-responsive">Get Social | A medium to connect people</h2>
				<br>
				<p>We provide best feature to our user</p>
				<hr>
				 <a href="discussion.jsp" class="btn btn-unique btn-ptc"
					rel="nofollow">Start discussion
				</a>
				</div>
			
			</div>
			
			
			
			<%
		String post = request.getParameter("post");
						System.out.println(post);
						Connection cn = GetConnection.getCn();
		if (post != null && !post.equals("")) {
			String sql = "insert into post(useremail, text, postdate) values(?,?,NOW())";
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, currentUser);
			ps.setString(2, post);
			ps.execute();
			System.out.println("data inserted successfully");
		}
		else{
			System.out.println("data not inserted successfully");
		}

		
		try{
			String sql1 = "select * from post join user on post.useremail=user.useremail ORDER BY post.postdate DESC";
			PreparedStatement ps1 = cn.prepareStatement(sql1);
			ResultSet rs1 = ps1.executeQuery();
			while(rs1.next()){
			String post1 = rs1.getString(3);
   			String username = rs1.getString(6);
   			String time = rs1.getString(4);
			
			%>
	<!--Main column-->
	<div class="col-lg-12">

		<!--Post-->
		<div class="post-wrapper wow fadeIn" data-wow-delay="0.2s">
			<!--Post data-->
			<h1 class="h1-responsive"><%=username %></h1>
			<h5>
				Published on
				<%=time %></h5>

			<br>

			<!--Featured image -->
			<div class="view overlay hm-white-light z-depth-1-half">
				<img src="" class="img-fluid " alt="">
				<div class="mask"></div>
			</div>

			<br>

			<!--Post excerpt-->
			<p><%=post1 %></p>

			<!--"Read more" button-->
			<button class="btn btn-info">Read more</button>
		</div>
		<!--/.Post-->

		<hr>
	</div>
			
			<%
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	%>
		</div>
	</div>
	<%@include file="footer.jsp"%>




