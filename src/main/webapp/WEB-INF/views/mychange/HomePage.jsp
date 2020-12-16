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
<title>PMS Home Page</title>
</head>

<jsp:include page="header.jsp" />
<body>
	<div class="container">
		<div class="card">
			<div class="card-body d-flex flex-column justify-content-center">
				<hr />
				<H4>
					<U> Investor </U>
				</H4>
				<div class="d-flex flex-column align-items-center">
					<div class="p-2">
						<label for="New User"> <b> New User </b>
						</label> <a href="${pageContext.request.contextPath}/InvestorRegistration">
							<b> Register </b>
						</a>
					</div>
					<div class="p-2">
						<label for="Existing User"> <b> Existing User </b>
						</label> <a href="${pageContext.request.contextPath}/LoginPage"> <b>
								Login </b>
						</a>
					</div>
				</div>
				<H4>
					<U> BackOffice User </U>
				</H4>
				<div class="d-flex flex-column align-items-center">
				<div class="p-2">
						<label for="SuperUser Login"><b> Admin Login </b> </label> <a
							href="${pageContext.request.contextPath}/AdminLogin"> <b>
								Login </b>
						</a>
					</div>
					<div class="p-2">
						<label for="BackOffice Login"> <b> BackOffice Login </b>
						</label> <a href="${pageContext.request.contextPath}/BackOfficeUserLogin"> <b>
								Login </b>
						</a>
					</div>
					
				</div>
				<hr />
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp" />
</body>


</html>