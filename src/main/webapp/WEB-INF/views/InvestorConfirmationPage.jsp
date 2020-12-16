<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PMS Register Confirmation Page</title>
</head>
<body>

<jsp:include page="header.jsp"/>
<hr/>

<h2 align ="center">Investor Registered Successfully.....</h2>
<hr/>

<h3>User ID : ${investor.userid}</h3>
<h3>First Name : ${investor.firstname}</h3>
<h3>Last Name : ${investor.lastname}</h3>
<h3>PAN Number : ${investor.pannumber}</h3>
<h3>DOB : ${investor.dob}</h3>
<h3>Mobile : ${investor.mobile}</h3>
<h3>Email : ${investor.email}</h3>
<h3>Amount Invested : ${investor.amountinvested}</h3>

<hr/>
	<jsp:include page="footer.jsp"/>
	
</body>
</html>