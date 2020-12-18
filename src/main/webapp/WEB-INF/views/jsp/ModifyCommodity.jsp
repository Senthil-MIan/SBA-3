<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@taglib uri= "http://www.springframework.org/tags/form" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify Commodity</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>


<body>
	
	
<jsp:include page="header.jsp" />
	
		<div>
			<a href="${pageContext.request.contextPath}/bouser/home"
				id="primaryNavigators">Back Office Dashboard</a>
		</div>
		<div align="center">
			<h2>Modify Commodity</h2>
		</div>
		<div align="right">
			<p>
				<a href="${pageContext.request.contextPath}/logout">Logout</a>
			</p>
		</div>
	
	<div align="center" >
		<spring:form action="${pageContext.request.contextPath}/bouser/modifyCommodity" method="POST" modelAttribute="comDto">
			<table>
				<tr>
					<td><spring:label path="commodityId">Commodity ID</spring:label></td>
					<td><spring:input path="commodityId" type="text" value="${searchCommodityDto.commodityId}" readonly="true"/></td>
					<td><spring:errors path="commodityId" cssClass="error" id="errors"/></td>
				</tr>
				<tr>
					<td><spring:label path="commodityName">Commodity Name</spring:label></td>
					<td><spring:input path="commodityName" type="text" value="${searchCommodityDto.commodityName}" /></td>
					<td><spring:errors path="commodityName" cssClass="error" id="errors"/></td>
				</tr>
				<tr>
					<td><spring:label path="currency">Currency</spring:label></td>
					<td><spring:input path="currency" type="text" value="${searchCommodityDto.currency}" /></td>
					<td><spring:errors path="currency" cssClass="error" id="errors"/></td>
				</tr>
				<tr>
					<td><spring:label path="price">Price</spring:label></td>
					<td><spring:input path="price" type="text" value="${searchCommodityDto.price}"/></td>
					<td><spring:errors path="price" cssClass="error" id="errors"/></td>
				</tr>
				<tr>
					<td><spring:label path="dateTime">Date Time</spring:label></td>
					<td><spring:input path="dateTime" type="text" value="${searchCommodityDto.dateTime}"/></td>
					<td><spring:errors path="dateTime" cssClass="error" id="errors"/></td>
				</tr>
				<tr>
					<td colspan=2><hr/><input type="submit" Value="Modify Commodity"></td>
				</tr> 
			</table>
		</spring:form>
	</div>
	
<jsp:include page="footer.jsp" />
</body>
</html>