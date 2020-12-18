<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<style>
body {
	background-image: url("paper.jpg");
	background-color: #cccccc;
}
</style>
<title>Admin Home Page</title>
</head>
<jsp:include page="header.jsp" />
<body>	
			
		<div align="right">	
		<p><a href="${pageContext.request.contextPath}/logout">Logout</a></p>
		</div>
		<div class="container">
			<div align="center">
			<h3> Admin HomePage:</h3>
			<p><a href="${pageContext.request.contextPath}/bocreate"><b>Create BackOffice user</b></a></p>
			</div>
		</div>
<jsp:include page="footer.jsp" />
</body>
</html>