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
<title>Modify Company</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>

<body>

	
<jsp:include page="header.jsp" />
	<div id="main">



		<div>
			<a href="${pageContext.request.contextPath}/bouser/home"
				id="primaryNavigators">Back Office Dashboard</a>
		</div>
		<div align="center">
			<h2>Modify Company Details</h2>
		</div>
		<div align="right">
			<p>
				<a href="${pageContext.request.contextPath}/logout">Logout</a>
			</p>
		</div>

	</div>
	
		<div align="center">
		<spring:form action="${pageContext.request.contextPath}/bouser/modifyCompany" method="POST" modelAttribute="companyNewOutputDto">
			<table>
				<tr>
					<td><spring:label path="companyCode">Company ID</spring:label></td>
					<td><spring:input path="companyCode" type="text" value="${searchCompanyDto.companyCode}" readonly="true"/></td>
					<td><spring:errors path="companyCode" cssClass="error" id ="error"/></td>
				</tr>
				<tr>
					<td><spring:label path="companyTitle">Company Title</spring:label></td>
					<td><spring:input path="companyTitle" type="text" value="${searchCompanyDto.companyTitle}"/></td>
					<td><spring:errors path="companyTitle" cssClass="error" id ="error"/></td>
				</tr>
				<tr>
					<td><spring:label path="operation">Operation</spring:label></td>
					<td><spring:input path="operation" type="text" value="${searchCompanyDto.operation}"/></td>
					<td><spring:errors path="operation" cssClass="error" id ="error"/></td>
				</tr>
				<tr>
					<td><spring:label path="shareCount">Share Count</spring:label></td>
					<td><spring:input path="shareCount" type="text" value="${searchCompanyDto.shareCount}"/></td>
					<td><spring:errors path="shareCount" cssClass="error" id ="error"/></td>
				</tr>
				<tr>
					<td><spring:label path="sharePrice">Share Price</spring:label></td>
					<td><spring:input path="sharePrice" type="text" value="${searchCompanyDto.sharePrice}"/></td>
					<td><spring:errors path="sharePrice" cssClass="error" id ="error"/></td>
				</tr>
				<tr>
					<td><spring:label path="stockExchange">Stock Exchange</spring:label></td>
					<td><spring:input path="stockExchange" type="text" value="${searchCompanyDto.stockExchange}"/></td>
					<td><spring:errors path="stockExchange" cssClass="error" id ="error"/></td>
				</tr>
				<tr>
					<td><spring:label path="ipoPrice">IPO Price</spring:label></td>
					<td><spring:input path="ipoPrice" type="text" value="${searchCompanyDto.ipoPrice}"/></td>
					<td><spring:errors path="ipoPrice" cssClass="error" id ="error"/></td>
				</tr>
				<tr>
					<td><spring:label path="sector">Sector</spring:label></td>
					<td><spring:input path="sector" type="text" value="${searchCompanyDto.sector}"/></td>
					<td><spring:errors path="sector" cssClass="error" id ="error"/></td>
				</tr>
				<tr>
					<td><spring:label path="currency">Currency</spring:label></td>
					<td><spring:input path="currency" type="text" value="${searchCompanyDto.currency}"/></td>
					<td><spring:errors path="currency" cssClass="error" id ="error"/></td>
				</tr>
				<tr>
					<td><spring:label path="turnover">Turnover</spring:label></td>
					<td><spring:input path="turnover" type="text" value="${searchCompanyDto.turnover}"/></td>
					<td><spring:errors path="turnover" cssClass="error" id ="error"/></td>
				</tr>
				<tr>
					<td><spring:label path="dateTimeIPO">Date Time</spring:label></td>
					<td><spring:input path="dateTimeIPO" type="text" value="${searchCompanyDto.dateTimeIPO}"/></td>
					<td><spring:errors path="dateTimeIPO" cssClass="error" id ="error"/></td>
				</tr>
				
				<tr><td colspan=2><input type="submit" value="Submit"></td></tr>
			</table>
		</spring:form>
	</div>
	<hr>
<jsp:include page="footer.jsp" />
</body>
</html>