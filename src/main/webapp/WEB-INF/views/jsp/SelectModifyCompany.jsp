<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify Company</title>
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
	<div id=centre>
		<div align="center">
			<spring:form
				action="${pageContext.request.contextPath}/bouser/returnModifyCompany"
				method="POST" modelAttribute="selectCompany">
				<spring:label path="companyName">Search Company Name</spring:label>
				<spring:input path="companyName" />
				<td><spring:errors path="companyName" cssClass="error"
						id="errors" /></td>

				<button>Search</button>
			</spring:form>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	
<hr>
<jsp:include page="footer.jsp" />
</body>
</html>