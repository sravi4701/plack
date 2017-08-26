<%@include file="base.jsp"%>
<head>
	<title>Upload Photo</title>
</head>
<main>
<div class="container">
	<p></p>
	<p></p>
	<p></p>
	<form action="FileUpload" method="POST" enctype="multipart/form-data">
		Upload Photo : <input type="file" name="photo">
		<br>
		<input type="submit" value="Submit" class="btn btn-primary">
	</form>
</div>
</main>
<%@include file="footer.jsp"%>