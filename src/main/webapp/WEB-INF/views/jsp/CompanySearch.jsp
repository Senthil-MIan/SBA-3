<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>   
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Company Name</title>


<body>
	<jsp:include page="header.jsp" />
	
	<div id="main">

		<nav class="navbar navbar-dark bg-primary">
			
			<div><a href="${pageContext.request.contextPath}/user/home" class="text-light font-weight-bold" id="primaryNavigators">Home</a></div>
			
			<div align="right"> <a href="${pageContext.request.contextPath}/logout" class="text-light font-weight-bold">Logout</a></div>
		</nav>
		<h4 id="errors" class="search">${message}</h4>
		<div class="search">
			<spring:form action="${pageContext.request.contextPath}/user/searchCompanyName" method="post" modelAttribute="company">
				<spring:input type="search" path="companyName" placeholder="Search Company Name"></spring:input>
				<button type=Submit name=Submit>Submit</button>
				<br>
				<spring:errors path="companyName" cssClass="error" id="errors"/>
			</spring:form>
		</div>
	</div>
	<hr/>
	<div class="search">
		<table border=2>
			<thead>
				<tr>
					<td>Company Code</td>
					<td>Company Title</td>
					<td>Sector</td>
					<td>Current Price</td>
					<td>Stock Exchange</td>
				</tr>
			</thead>
			<tbody>
				<core:forEach var="company" begin="0" end="10" items="${companyDto}">
					<tr>
						<td>${company.companyCode}</td>
						<td>
						<a href ="${pageContext.request.contextPath}/user/company/${company.companyTitle}">${company.companyTitle}</a>
						</td>
						<td>${company.sector}</td>
						<td>${company.sharePrice}</td>
						<td>${company.stockExchange}</td>
					</tr>
				</core:forEach>
			</tbody>
		</table>
	</div>
	
<jsp:include page="footer.jsp" />
</body>
</html>