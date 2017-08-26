
<%@include file="base.jsp"%>
<head>
	<title>Post Something</title>
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
				<p>Something New today | share with your friend.</p>
				<hr>
				<form action="Postprocess.jsp" method="POST">

					<div class="md-form">
						<i class="fa fa-pencil prefix"></i>
						<textarea type="text" id="form8" class="md-textarea" name="post"></textarea>
						<label for="form8">What's on your mind......</label>
					</div>



					<div class="text-center mt-2">
						<input type="submit" value="Submit" class="btn btn-info">
					</div>
				</form>
			</div>

		</div>
	</div>
	<!--/.First row-->

	<hr class="extra-margins">









	<%
		   	System.out.println(currentUser);
    		Connection cn = GetConnection.getCn();
		   	try{
		   		
		   		String sql = "select * from post join user on post.useremail=user.useremail where post.useremail=? ORDER BY postdate DESC";
		   		PreparedStatement ps = cn.prepareStatement(sql);
		   		ps.setString(1, currentUser);

		   		
		   				
		   		ResultSet rs = ps.executeQuery();
		   		
		   		%>

	<%
		   		while(rs.next()){
		   			String post = rs.getString(3);
		   			String username = rs.getString(6);
		   			String time = rs.getString(4);
		   			
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
			<p><%=post %></p>

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
<script>
		function postData() {
			var txt = document.getElementById("postText");
			alert(txt.value);
			var p = document.createElement("p");
			p.innerHTML = txt.value;
			var d = document.getElementById("post");
			d.appendChild(p);
		}
	</script> <!--/.Second row--> <!--/.Main layout--> </main>
<%@include file="footer.jsp"%>




