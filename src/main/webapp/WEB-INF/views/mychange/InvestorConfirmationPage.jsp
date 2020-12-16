<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>    
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
<title>PMS Confirmation Page</title>
</head>
<body>

<jsp:include page="header.jsp"/>
<hr/>

<h2>Investor Registered Successfully.....</h2>
<hr/>

<div>
		<nav class="navbar navbar-dark bg-primary">
			<div><a href="${pageContext.request.contextPath}" id="primaryNavigators">Home</a></div>
		</nav>
	</div>
	<hr/>
	<div id = output>
		<h2>Investor Details:</h2>
		<hr/>
		<h5>Investor Id: ${newInvestorOut.investorId}</h5>
		<h5>First Name: ${newInvestorOut.firstName}</h5>
		<h5>Last Name: ${newInvestorOut.lastName}</h5>
		<h5>Gender: ${newInvestorOut.gender}</h5>
		<h5>Mobile Number: ${newInvestorOut.mobileNumber}</h5>
		<h5>Pan Id: ${newInvestorOut.panId}</h5>
		<h5>Email Id: ${newInvestorOut.emailId}</h5>
		<h5>Login Key: ${newInvestorOut.loginKey}</h5>
	</div>

<hr/>
	<jsp:include page="footer.jsp"/>
	
</body>
</html>