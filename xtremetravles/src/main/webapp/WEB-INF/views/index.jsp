<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${css}/bootstrap.css">
<link rel="stylesheet" href="${css}/bootstrap-theme.css">
<link rel="stylesheet" href="${css}/style.css">

<link rel="stylesheet" href="${css}/dataTables.bootstrap4.css">

<script type="text/javascript">
window.contextRoot='${contextRoot}'
</script>
</head>
<body>

	<div class="wrapper">

		<!-- Navbar -->
		<%@ include file="navbar.jsp"%>
		<!-- Navbar  End-->

		<div class="content">
			<c:if test="${clickedFlight == true }">
				<%@include file="flight.jsp"%>
</c:if>
	
	<c:if test="${clickedViewFlight == true }">
				<%@include file="listFlight.jsp"%>
</c:if>

<c:if test="${clickedReviewFlight == true }">
				<%@include file="flightReview.jsp"%>
</c:if>


	<c:if test="${clickedBus == true }">
				<%@include file="bus.jsp"%>
</c:if>
	
		<c:if test="${clickedListBus == true }">
				<%@include file="busResult.jsp"%>
</c:if>
	
	<c:if test="${clickedReviewBus == true }">
				<%@include file="busReview.jsp"%>
</c:if>

<c:if test="${clickedPaymentSuccess == true }">
				<%@include file="paymentSuccess.jsp"%>
</c:if>
<c:if test="${clickedPaymentFail == true }">
				<%@include file="paymentFail.jsp"%>
</c:if>
<c:if test="${clickedPaymentCancel == true }">
				<%@include file="paymentCancel.jsp"%>
</c:if>

	<c:if test="${clickedCab == true }">
				<%@include file="cabs.jsp"%>
</c:if>


<c:if test="${clickedConfirmBooking == true }">
				<%@include file="confirmBooking.jsp"%>
</c:if>

<c:if test="${clickedDeals == true }">
				<%@include file="holidays.jsp"%>
</c:if>

<c:if test="${clickedManageBus == true }">
				<%@include file="manageBus.jsp"%>
</c:if>
	
	<c:if test="${clickedHotels == true }">
				<%@include file="hotels.jsp"%>
</c:if>
	
			<!-- Footer bottom -->
			<%@ include file="fb.jsp"%>

		</div>
		
		<script
	src="${js}/jquery.min.js"></script>
<script
	src="${js}/bootstrap.min.js"></script>

<script
	src="${js}/jquery.dataTables.js"></script>
<script
	src="${js}/dataTables.bootstrap4.js"></script>

<script
	src="${js}/bootbox.min.js"></script>

<script
	src="${js}/script.js"></script>
		
	</div>
</body>
</html>
