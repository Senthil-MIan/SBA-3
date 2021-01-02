<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<title>Recent Viewed Companies</title>
</head>
<body>
<jsp:include page="header.jsp" />
	
	
	<div id=content>
		<table id=footer border=2>
			<thead>
				<tr>
					<td colspan="4" style="color: white;font-size:20px;text-align:center"><b>Recent Companies Viewed</b></td>
				<tr>
					<th scope="col" colspan="1">Company ID</th>
					<th scope="col" colspan="1">Company Name</th>
					<th scope="col" colspan="1">Price</th>
					<th>View</th>
				</tr>
			</thead>
			<tbody>
				<core:choose>
				    <core:when test="${empty recentViewCompanies}">
				   		<td>NA</td>
						<td>NA</td>
						<td>NA</td>
						<td>NA</td>
				    </core:when>
				<core:otherwise>
					<core:forEach var="company" items="${recentViewCompanies}">
						<tr>
							<td>${company.companyCode}</td>
							<td>${company.companyTitle}</td>
							<td>${company.sharePrice}</td>
							<td>
								<a href ="${pageContext.request.contextPath}/user/company/${company.companyTitle}">View Company</a>
							</td>
						</tr>
					</core:forEach>
				</core:otherwise>
				</core:choose>
			</tbody>
		</table>
	</div>
<jsp:include page="footer.jsp" />
</body>
</html>