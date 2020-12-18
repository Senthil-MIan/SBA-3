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
<title>Deposit Money</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>

<body>
	
	
<jsp:include page="header.jsp" />
	
		<div>
			<a href="${pageContext.request.contextPath}/user/home"
				id="primaryNavigators">Investor Dashboard</a>
		</div>
		<div align="center">
			<h2>Wallet Balance</h2>
		</div>
		<div align="center">
			<h2>${balance}</h2>
		</div>
		<div align="right">
			<p>
				<a href="${pageContext.request.contextPath}/logout">Logout</a>
			</p>
		</div>

	<div align="center">
		<spring:form action="${pageContext.request.contextPath}/user/AddMoney" method="POST" modelAttribute="addWalletMoney">
		<table>
			
				<tr>
					<td><spring:label path="addAmount">Add Amount</spring:label></td>
					<td><spring:input path="addAmount"/></td>
					<td><spring:errors path="addAmount" cssClass="error" id="errors"/></td>
				</tr>
				
				<tr>
				
					<td colspan=2><button>Add</button></td>
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