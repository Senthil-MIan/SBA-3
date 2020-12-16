<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri= "http://www.springframework.org/tags/form" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

</head>
<body>
<jsp:include page="header.jsp" />
	<div align="right">	
		<p><a href="${pageContext.request.contextPath}/logout">Logout</a></p>
		</div>
	<div id=center>
	<div align="center">	
			<spring:form action="${pageContext.request.contextPath}/confirm" method="POST" modelAttribute="backofficeuser"> 
				<div>
					<div><label>First name: </label></div>
					<div><spring:input path="firstName" type="text" />
					<spring:errors path="firstName" cssClass="error"/></div>
				</div>
					<br/>
				<div>
					<div><label>Last Name:</label></div>
					<div><spring:input path="lastName" type="text" />
					<spring:errors path="lastName" cssClass="error"/></div>
				</div>
					<br/>
				<div>
					<div><label>Email ID:</label></div>
					<div><spring:input path="emailId" type="text" />
					<spring:errors path="emailId" cssClass="error"/></div>
				</div>
					<br/>
				<div>
					<div><label>Password: </label></div>
					<div><spring:input path="password" type="password" />
					<spring:errors path="password" cssClass="error"/></div>
				</div>
					<br/>
				<div>
					<input type="submit" value="Create User"> 
				</div>
			</spring:form>
			</div>
	</div>
	
		<jsp:include page="footer.jsp" />
</body>
</html>