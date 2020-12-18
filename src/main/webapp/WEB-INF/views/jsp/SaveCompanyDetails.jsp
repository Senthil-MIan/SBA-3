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
<title>Company Details Added</title>

</head>
<body>
<jsp:include page="header.jsp" />
<div>
<a href="${pageContext.request.contextPath}/bouser/home" id="primaryNavigators">Back Office Dashboard</a></div>
	<div align="right">
		<p>
			<a href="${pageContext.request.contextPath}/logout">Logout</a>
		</p>
	</div>
	<div align="center">
		<h3>Company
				Saved Successfully.....
		</h3>
	</div>
	<hr />
	<div id=output>

		<h4>Company Code : ${CompanyOutput.companyCode}</h4>
		<h4>Company Title : ${CompanyOutput.companyTitle}</h4>
		<h4>Share Count: ${CompanyOutput.shareCount}</h4>
		<h4>Share Price: ${CompanyOutput.sharePrice}</h4>
		<h4>Stock Exchange: ${CompanyOutput.stockExchange}</h4>
		<h4>IPO Price: ${CompanyOutput.ipoPrice}</h4>
		<h4>Currency: ${CompanyOutput.currency}</h4>
		<h4>Turnover: ${CompanyOutput.turnover}</h4>
		<h4>Date Time IPO: ${CompanyOutput.dateTimeIPO}</h4>

	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>