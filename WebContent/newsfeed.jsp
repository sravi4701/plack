
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
				</div>
			
			</div>
			
			
			
			<%
		String post = request.getParameter("post");
		if (post != null && !post.equals("")) {
		    System.out.println("ok");
		}
		else{
			response.sendRedirect("Post.jsp");
		}
		Connection cn = GetConnection.getCn();
		try{
			String sql = "insert into post(useremail, text, postdate) values(?,?,NOW())";
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, currentUser);
			ps.setString(2, post);
			ps.execute();
			System.out.println("data inserted successfully");
			ps.close();
			String sql1 = "select * from post join user on post.useremail=user.useremail ORDER BY post.postdate DESC";
			PreparedStatement ps1 = cn.prepareStatement(sql1);
			ResultSet rs1 = ps1.executeQuery();
			while(rs1.next()){
			String post1 = rs1.getString(2);
   			String username = rs1.getString(5);
   			String time = rs1.getString(3);
			
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




