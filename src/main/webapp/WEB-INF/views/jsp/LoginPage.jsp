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
<title>Investor Login</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<hr />
	<div align="center">
	<h2>Investor Login</h2>
	</div>
	<hr />
	
	<div id=login>
		<spring:form action="${pageContext.request.contextPath}/LoginValidate"
			method="post" modelAttribute="investorLoginDto">
			<div align="center">
			<table>
				<tr>
					<td><spring:label path="loginKey">Username</spring:label></td>
					<td colspan=2><spring:input type="text" path="loginKey"></spring:input>
					</td>
				</tr>
				<tr>
					<td></td>
					<td colspan=2><spring:errors path="loginKey" cssClass="error"
							id="errors" /></td>
				</tr>
				<tr>
					<td><spring:label path="password">Password</spring:label></td>
					<td colspan=2><spring:input type="password" path="password"></spring:input>
					</td>
				</tr>
				<tr>
					<td></td>
					<td colspan=2><spring:errors path="password" cssClass="error"
							id="errors" /></td>
				</tr>
				<tr>
					<td></td>
					<td><input type=Submit name=Submit Value=Submit></td>
				
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
			</div>
		</spring:form>
	</div>
	<hr />
	<jsp:include page="footer.jsp" />
</body>
</html>