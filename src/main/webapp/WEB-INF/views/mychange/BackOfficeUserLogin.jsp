<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri= "http://www.springframework.org/tags/form" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
body {
	background-image: url("paper.jpg");
	background-color: #cccccc;
}
</style>
<title>BacK Office Login Page</title>
</head>
<body>
<jsp:include page="header.jsp" />
	<div align="center">
		<nav class="navbar navbar-dark bg-primary">
			<div><a href="${pageContext.request.contextPath}/index" id="primaryNavigators">Home</a></div>
			<span class="text-light font-weight-bold" >Back Office User Login</span>
		</nav>
	</div>
	<br/>
	<div id=login>
	<div align="center">
	<h4 id =error>${Message}</h4>
	<spring:form action="${pageContext.request.contextPath}/BackOfficeLoginvalidate" method="POST" modelAttribute="backofficeuser"> 
		<div>
			<div><label >User Name</label></div>
			<div><spring:input path="userName" type="text" />
			<spring:errors path="userName" cssClass="error"/></div>
		</div>
			<br/>
		<div>
			<div><label>Password</label></div>
			<div><spring:input path="password" type="password" />
			<spring:errors path="password" cssClass="error"/></div>
		</div>
			<br/>
		<div>
			<input type="submit" value="Login"> 
		</div>
	</spring:form>
	</div>
	</div>
	
	<jsp:include page="footer.jsp" />
</body>
</html>