<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%--Add reference to tag library --%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Investor Login</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<hr />
	<h2>Investor Login</h2>
	<hr />
	<%--
	Map the model object with spring form
	field level mapping : path 
	When a form loads
		call the getter method of class fields
	When form is submitted:
		call the setter methods	
 --%>

	<%-- <spring:form action="login" method="post" modelAttribute="loginpage">
		<div>
			<div>
				<spring:label path="userid">User ID</spring:label>
			</div>
			<div>
				<spring:input path="userid" type="text" />
				<spring:errors path="userid" cssClass="error" />
			</div>
		</div>
		<br />

		<div>
			<div>
				<spring:label path="password">Password</spring:label>
			</div>
			<div>
				<spring:input path="password" type="password" />
				<spring:errors path="password" cssClass="error" />
			</div>
		</div>
		<br />

		<input type="submit" value="Login" />
	</spring:form> --%>
	<div id=login>
		<spring:form action="${pageContext.request.contextPath}/invValidate"
			method="post" modelAttribute="investorLoginDto">
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
					<td><input type=reset name=reset Value=reset></td>
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
		</spring:form>
	</div>
	<hr />
	<jsp:include page="footer.jsp" />
</body>
</html>