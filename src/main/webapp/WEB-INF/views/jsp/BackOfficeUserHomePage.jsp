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
<title>BackOffice User Home</title>

</head>

<body>
	<jsp:include page="header.jsp" />



	<div id="main">


		<div align="right">
			<p>
				<a href="${pageContext.request.contextPath}/logout">Logout</a>
			</p>
		</div>

		<div class="container" align="center">
			<h4>Back Office User Dashboard</h4>
		</div>
		<div align="center">
			<a href="${pageContext.request.contextPath}/bouser/AddCompany">Add
				Company</a><br> <a
				href="${pageContext.request.contextPath}/bouser/selectModifyCompany">Modify
				Company</a><br> <a
				href="${pageContext.request.contextPath}/bouser/addCompanyStockPrice">Add
				Company Stock Price</a><br> <a
				href="${pageContext.request.contextPath}/bouser/returnCreateCommodity">Create
				Commodity</a><br> <a
				href="${pageContext.request.contextPath}/bouser/selectModifyCommodity">Modify
				Commodity</a><br> <a
				href="${pageContext.request.contextPath}/bouser/addCommodityPrice">Add
				Commodity Price</a><br>
			<br>
			<br> <label> <b>Generate Commission</b>
			<!-- </label><br> <a href="#">Annual Report</a><br> <a href="#">Monthly
				Report</a><br> <a href="#">Periodic Report</a><br> -->

		</div>
	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>