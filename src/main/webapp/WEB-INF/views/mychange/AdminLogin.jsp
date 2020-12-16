<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%--Add reference to tag library --%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
body {
	background-image: url("paper.gif");
	background-color: #cccccc;
}
</style>
<title>Admin Login Page</title>
</head>
<body>
<jsp:include page="header.jsp" />
	<div align="center">
		<nav class="navbar navbar-dark bg-primary">
			<div><a href="${pageContext.request.contextPath}/index" id="primaryNavigators">Home Page</a></div>
			<span class="text-light font-weight-bold" ><b>Admin Login</b></span>
		</nav>
	</div>
	<br/>
	<div id=login align="center">
	<h4 id =error>${Message}</h4>
	<spring:form action="${pageContext.request.contextPath}/validate" method="POST" modelAttribute="superuser"> 
		<div>
			<div><label >Username</label></div>
			<div><spring:input path="superUserId" type="text" />
			<spring:errors path="superUserId" cssClass="error"/></div>
		</div>
			<br/>
		<div>
			<div><spring:label path="password">Password</spring:label></div>
			<div><spring:input path="password" type="password" />
			<spring:errors path="password" cssClass="error"/></div>
		</div>
			<br/>
		<div>
			<input type="submit" value="Login"> 
		</div>
	</spring:form>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>