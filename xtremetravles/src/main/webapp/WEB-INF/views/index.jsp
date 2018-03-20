<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<title>Xtreme Travles - ${title}</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<link rel="stylesheet" href="${css}/bootstrap.css">
<link rel="stylesheet" href="${css}/bootstrap-theme.css">
<link rel="stylesheet" href="${css}/style.css">

<link rel="stylesheet" href="${css}/dataTables.bootstrap4.css">
<style type="text/css">
#place {
	position: relative;
	margin: 7px;
}

#place a {
	font-size: 0.6em;
}

#place li {
	list-style: none outside none;
	position: absolute;
}

#place .seat {
	background: url(${images}/available_seat_img.png) no-repeat scroll 0 0
		transparent;
	height: 100px;
	width: 100px;
	display: block;
}

#place .selectedSeat {
	background-image: url(${images}/booked_seat_img.png);
}

#place .selectingSeat {
	background-image: url(${images}/selected_seat_img.png);
}

#place .row-2, #place .row-3 {
	margin-top: 10px;
}

#seatDescription {
	padding: 0px;
}

#seatDescription li {
	verticle-align: middle;
	list-style: none outside none;
	padding-left: 35px;
	height: 35px;
	float: left;
}
</style>
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

			<c:if test="${clickedFlight == true}">
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
				<%@include file="busReviews.jsp"%>
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

			<c:if test="${clickedListCab == true }">
				<%@include file="cabsResult.jsp"%>
			</c:if>

			<c:if test="${clickedReviewCab == true }">
				<%@include file="cabReview.jsp"%>
			</c:if>



			<c:if
				test="${clickedConfirmBusBooking == true ||clickedConfirmFlightBooking==true || clickedConfirmCabBooking==true}">
				<%@include file="confirmBooking.jsp"%>
			</c:if>


			<c:if test="${clickedDeals == true }">
				<%@include file="holidays.jsp"%>
			</c:if>

			<c:if test="${clickedManageBus == true }">
				<%@include file="manageBus.jsp"%>
			</c:if>


			<c:if test="${clickedManageFlight == true }">
				<%@include file="manageFlight.jsp"%>
			</c:if>

			<c:if test="${clickedManageCab == true }">
				<%@include file="manageCab.jsp"%>
			</c:if>

			<c:if test="${clickedHotels == true }">
				<%@include file="hotels.jsp"%>
			</c:if>

			<c:if test="${clickedRegister == true }">
				<%@include file="register.jsp"%>
			</c:if>

			<c:if test="${clickedRegisterUser == true }">
				<%@include file="registerUser.jsp"%>
			</c:if>

			<c:if test="${clickFeedLogin == true }">
				<%@include file="login.jsp"%>
			</c:if>

			<!-- Footer bottom -->
			<%@ include file="fb.jsp"%>

		</div>

		<script src="${js}/jquery.min.js"></script>
		<script src="${js}/bootstrap.min.js"></script>

		<script src="${js}/jquery.dataTables.js"></script>
		<script src="${js}/dataTables.bootstrap4.js"></script>

		<script src="${js}/bootbox.min.js"></script>

		<script src="${js}/script.js"></script>

	</div>
</body>
</html>
