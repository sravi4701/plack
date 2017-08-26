
<%@include file="base.jsp"%>

<main> <%@page
	import="javax.servlet.http.*,java.sql.*,getData.GetConnection"%>

<script type="text/javascript">
	function show(){
		var x = new XMLHttpRequest();
		x.onreadystatechange=function(){
			if(x.readyState==4 && x.status == 200){
				document.getElementById("mydiv").innerHTML=x.responseText;
			}
		};
		x.open("GET","discussion.jsp",true);
		x.send();
			
	}
</script>

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
				     <form action="" method="POST">
				     
<div class="md-form">
    <input placeholder="Your message" type="text" id="form5" class="form-control" name="msg">
</div>
<div class="text-center mt-5">
	<input type="submit" value="Submit" class="btn btn-default" style="height:70px;">
					</div>
				     
				     </form>
				     
				     </div>
			
			</div>	
				<%
		String msg = request.getParameter("msg");
						System.out.println(msg);
						Connection cn = GetConnection.getCn();
						try{
						if (msg != null && !msg.equals("")) {
							
							String sql = "insert into chat(useremail,message,date) values(?,?,NOW())";
							PreparedStatement ps = cn.prepareStatement(sql);
							ps.setString(1, currentUser);
							ps.setString(2, msg);
							ps.execute();
							System.out.println("data inserted successfully");
							
							ps.close();
							cn.close();
						}
						else{
							System.out.println("data not inserted successfully");
						}
						}
						catch(Exception e){
							System.out.println(e);
						}
%>
			
						
		    <%
			try{
			Connection cnt = GetConnection.getCn();
			String sql1 = "select * from chat join user on chat.useremail=user.useremail ORDER BY chat.date DESC";
			PreparedStatement ps1 = cnt.prepareStatement(sql1);
			ResultSet rs1 = ps1.executeQuery();
			while(rs1.next()){
			String mssg = rs1.getString(2);
   			String username = rs1.getString(5);
   			String time = rs1.getString(3);
   			%>
			
<div class="col-md-12">
    <!--First review-->
    <div class="media mb-1">
        <a class="media-left waves-light">
            <img class="rounded-circle" src="img/img.jpg" alt="Generic placeholder image" style="height:80px;">
        </a>
        <div class="media-body" id="mydiv">
            <h4 class="media-heading"><%= username %></h4>
            <ul class="rating inline-ul">
                <li><i class="fa fa-star amber-text"></i></li>
                <li><i class="fa fa-star amber-text"></i></li>
                <li><i class="fa fa-star amber-text"></i></li>
                <li><%= time %></li>
                
            </ul>
            <p ><%= mssg %></p>
        </div>
    </div>

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
			<br><br>
        
        <br><br>
        
        <br><br>
        
        <br><br>
				
			</main>
	<%@include file="footer.jsp"%>




