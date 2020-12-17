<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@taglib uri= "http://www.springframework.org/tags/form" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
body {
	background-image: url("paper.jpg");
	background-color: #cccccc;
}
</style>
<title>Add Commodity Price</title>
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
			<h2>Add Commodity Price</h2>
		</div>
		<div align="right">
			<p>
				<a href="${pageContext.request.contextPath}/logout">Logout</a>
			</p>
		</div>

	<div align="center">
		<spring:form action="${pageContext.request.contextPath}/bouser/newCommodityPrice" method="POST" modelAttribute="commodityPrice">
		<table>
				<tr>
					<td><spring:label path="commodityName">Commodity Name</spring:label></td>
					<td>	<spring:select path="commodityName">
							<spring:options items="${commodityNames}"/>	
						</spring:select> </td>
					<td><spring:errors path="commodityName" cssClass="error" id="errors"/></td>
				</tr>
				<tr>
					<td><spring:label path="commodityPrice">Share price</spring:label></td>
					<td><spring:input path="commodityPrice"/></td>
					<td><spring:errors path="commodityPrice" cssClass="error" id="errors"/></td>
				</tr>
				
				<tr>
				
					<td colspan=2><button>Submit</button></td>
				</tr>
				<tr>
					<td></td>

					<td>
						<h4 style="margin-left: -87px; color: red; font-size: 20px;"
							id="errors">${Message}</h4>
					</td>
					<td></td>
				</tr>
		</table>
		<hr>
		</spring:form>
		</div>
		<jsp:include page="footer.jsp" />
</body>
</html>