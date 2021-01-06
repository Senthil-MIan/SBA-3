<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${transactionType} Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>

<body>
<jsp:include page="header.jsp" />
	
	<div id="main">
		<nav >			
			<div><a href="${pageContext.request.contextPath}/user/home" id="primaryNavigators">Home</a>
			<div><a  href="${pageContext.request.contextPath}/logout" id="primaryNavigators">Logout</a></div>
		</nav>
	</div>
		<h4 id="errors" class="search">${message}</h4><br>
		<div class="search">
			<div id="mainForm">
				<spring:form action="${pageContext.request.contextPath}/user/${transactionType}${commodtiyCompany}Shares/${stockName}" method="post" modelAttribute="shareCount">
					<spring:label path="shareCount">Enter the ${transactionType} quantity for ${stockName}</spring:label>
					<br>
					<spring:input type="text" path="shareCount" id="quantity" placeholder="Enter Stock Amount"></spring:input>
					<br>
					<spring:errors path="shareCount" cssClass="error" id="errors"/>
					<br>
					<label>${commodtiyCompany} Name : <b>${stockName}</b></label>
					<br>
					<label>Current Price : 
					<c:choose>
					    <c:when test="${commodtiyCompany == 'Company'}">
					   		<b id=currentPrice>${stockDto.sharePrice}</b>
					    </c:when>
					    <c:otherwise>
					        <b id=currentPrice>${stockDto.price}</b>
					    </c:otherwise>
					</c:choose>
					</label>
					<br>
					<label>Total Amount : <b id="totalAmount">0</b></label>
					<hr/>
					<button type=Submit name=Submit>${transactionType}</button>
				</spring:form>
			</div>
		</div>
	</div>
	
<jsp:include page="footer.jsp" />
</body>
</html>