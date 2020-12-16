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
<title>Create Company</title>

<body>
	<jsp:include page="header.jsp" />
	<div id="main">

		<nav class="navbar navbar-dark bg-primary">
			
			<div><a href="${pageContext.request.contextPath}/bouser/home" id="primaryNavigators">Back Office Dashboard</a></div>
			<div align="center">
			<h2>Add Company</h2>
			</div>
			<div align="right">	
		<p><a href="${pageContext.request.contextPath}/logout">Logout</a></p>
		</div>
		</nav>
	</div>
	
	<div id=addCompanyForm>
	
		
		<spring:form action="${pageContext.request.contextPath}/bouser/createCompany" method="POST" modelAttribute="createCompany">
			<div align="center">
			<table>
				<tr>
					<td><spring:label path="companyTitle">Company Title</spring:label></td>
					<td><spring:input path="companyTitle" type="text" /></td>
					<td><spring:errors path="companyTitle" cssClass="error" id="errors"/></td>
				</tr>
				<tr>
					<td><spring:label path="operation">Operation</spring:label></td>
					<td><spring:input path="operation" type="text" /></td>
					<td><spring:errors path="operation" cssClass="error" id="errors"/></td>
				</tr>
				
				
				<tr>
					<td><spring:label path="sector">Sector</spring:label></td>
					<td><spring:input path="sector" type="text" /></td>
					<td><spring:errors path="sector" cssClass="error" id="errors"/></td>
				</tr>
				<tr>
					<td><spring:label path="currency">Currency</spring:label></td>
					<td><spring:input path="currency" type="text" /></td>
					<td><spring:errors path="currency" cssClass="error" id="errors"/></td>
				</tr>
				<tr>
					<td><spring:label path="turnover">Turnover</spring:label></td>
					<td><spring:input path="turnover" type="text" /></td>
					<td><spring:errors path="turnover" cssClass="error" id="errors"/></td>
				</tr>
				<tr>
					<td><spring:label path="shareCount">Share Count</spring:label></td>
					<td><spring:input path="shareCount" type="text" /></td>
					<td><spring:errors path="shareCount" cssClass="error" id="errors"/></td>
				</tr>
				<tr>
					<td><spring:label path="sharePrice">Share Price</spring:label></td>
					<td><spring:input path="sharePrice" type="text" /></td>
					<td><spring:errors path="sharePrice" cssClass="error" id="errors"/></td>
				</tr>
				<tr>
					<td><spring:label path="stockExchange">Stock Exchange</spring:label></td>
					<td><spring:input path="stockExchange" type="text" /></td>
					<td><spring:errors path="stockExchange" cssClass="error" id="errors"/></td>
				</tr>
				<tr>
					<td><spring:label path="ipoPrice">IPO Price</spring:label></td>
					<td><spring:input path="ipoPrice" type="text" /></td>
					<td><spring:errors path="ipoPrice" cssClass="error" id="errors"/></td>
				</tr>
				<tr>
					<td><spring:label path="dateTimeIPO">Date Time</spring:label></td>
					<td><spring:input path="dateTimeIPO" type="text" /></td>
					<td><spring:errors path="dateTimeIPO" cssClass="error" id="errors"/></td>
				</tr>
				
				<tr>
					<td colspan=2><input type="submit" Value="Add Company"></td></div>
				</tr> 
			</table>
			</div>
		</spring:form>
	</div>
	
<jsp:include page="footer.jsp" />
</body>
</html>