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
<link rel="stylesheet" href="${css}/bootstrap.css">
<link rel="stylesheet" href="${css}/bootstrap-theme.css">
<link rel="stylesheet" href="${css}/style.css">

<link href="${css}/font-awesome.css" rel="stylesheet" />

   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

<link rel="stylesheet" href="${css}/dataTables.bootstrap4.css">
<style type="text/css">
.social {
	margin: 1em 0 0 0;
}

.social ul {
	padding: 0;
	margin: 0;
}

.social ul li {
	display: inline-block;
	margin: 0;
}

.social ul li a.facebook {
	background: url(${images}/social.png) no-repeat 0px 0px;
	width: 30px;
	height: 30px;
	display: block;
	transition: none;
}

.social ul li a.twitter {
	background: url(${images}/social.png) no-repeat -30px 0px;
}

.social ul li a.chrome {
	background: url(${images}/social.png) no-repeat -60px 0px;
}

.social ul li a.dribbble {
	background: url(${images}/social.png) no-repeat -90px 0px;
}

.social ul li a.facebook:hover {
	background: url(${images}/social.png) no-repeat 0px -32px;
}

.social ul li a.twitter:hover {
	background: url(${images}/social.png) no-repeat -30px -32px;
}

.social ul li a.chrome:hover {
	background: url(${images}/social.png) no-repeat -60px -32px;
}

.social ul li a.dribbble:hover {
	background: url(${images}/social.png) no-repeat -90px -32px;
}

</style>
<script type="text/javascript">
window.contextRoot='${contextRoot}'
window.menu='${title}'
console.log(menu)
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


			
			<c:if test="${clickedManageBus == true }">
				<%@include file="manageBus.jsp"%>
			</c:if>


			<c:if test="${clickedManageFlight == true }">
				<%@include file="manageFlight.jsp"%>
			</c:if>

			<c:if test="${clickedManageCab == true }">
				<%@include file="manageCab.jsp"%>
			</c:if>

			
             
			<c:if test="${clickedRegisterUser == true }">
				<%@include file="registerUser.jsp"%>
			</c:if>

			<c:if test="${checkOtp == true }">
				<%@include file="checkUserOtp.jsp"%>
			</c:if>
			
			
			<c:if test="${clickFeedLogin == true }">
				<%@include file="login.jsp"%>
			</c:if>
			
			<c:if test="${clickedFeedback == true }">
				<%@include file="feedback.jsp"%>
			</c:if>
			
			<c:if test="${clickedPrivacy == true }">
				<%@include file="privacy.jsp"%>
			</c:if>
			
			<c:if test="${clickedAbout == true }">
				<%@include file="about.jsp"%>
			</c:if>
			<c:if test="${clickedTerms == true }">
				<%@include file="terms.jsp"%>
			</c:if>
			
			<c:if test="${clickedViewUserProfile == true }">
				<%@include file="userprofile.jsp"%>
			</c:if>
			
			<c:if test="${clickedViewAgentProfile == true }">
				<%@include file="agentprofile.jsp"%>
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
