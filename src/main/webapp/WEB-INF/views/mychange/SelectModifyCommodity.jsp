<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@taglib uri= "http://www.springframework.org/tags/form" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify Commodity</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>

	
	
<jsp:include page="header.jsp" />
	
		<div>
			<a href="${pageContext.request.contextPath}/bouser/home"
				id="primaryNavigators">Back Office Dashboard</a>
		</div>
		<div align="center">
			<h2>Modify Commodity</h2>
		</div>
		<div align="right">
			<p>
				<a href="${pageContext.request.contextPath}/logout">Logout</a>
			</p>
		</div>


	<div align="center">
		<spring:form action="${pageContext.request.contextPath}/bouser/returnModifyCommodity" method="POST" modelAttribute="selectCommodity">
			<spring:label path="commodityName">Enter Commodity Name</spring:label>
			<spring:input path="commodityName"/>
			<td><spring:errors path="commodityName" cssClass="error" id="errors"/></td>
			<hr/>
			<button>Submit</button>
		</spring:form>
	</div>
	<jsp:include page="footer.jsp" />
	
</body>
</html>