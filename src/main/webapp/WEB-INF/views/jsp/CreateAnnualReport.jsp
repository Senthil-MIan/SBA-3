<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@taglib uri= "http://www.springframework.org/tags/form" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Generate Report</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>

<body>
	<jsp:include page="header.jsp" />
	<div align="center">
		<spring:form action="${pageContext.request.contextPath}/bouser/returnAnnualReport" method="POST" modelAttribute="annualreport">
			<spring:label path="year">Select year</spring:label>
			<spring:select path="year">
							<spring:option value="2015" label="2015"/>
							<spring:option value="2016" label="2016"/>
							<spring:option value="2017" label="2017"/>
							<spring:option value="2018" label="2018"/>
							<spring:option value="2019" label="2019"/>
							<spring:option value="2020" label="2020"/>
							<spring:option value="2021" label="2021"/>	
						</spring:select>
			<td><spring:errors path="year" cssClass="error" id="errors"/></td>
			<hr/>
			<button>Submit</button>
		</spring:form>
	</div>
	
	<jsp:include page="footer.jsp" />

</body>
</html>