<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>
<title>Xtreme Travels- ${title}</title>
<head>
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="${css}/bootstrap.css">
<link rel="stylesheet" href="${css}/bootstrap-theme.css">
<link rel="stylesheet" href="${css}/style.css">
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">

			
				<a class="navbar-brand" href="${contextRoot}/home">Xtreme Travles</a>
			</div>
    	
			
			
			
			</div>
	</nav>
	
	

<c:if test="${clickedForPass == true}">
				<%@include file="forgetPassword.jsp"%>
			</c:if>

<c:if test="${userClickForPassCheck == true}">
				<%@include file="forgetPasswordCheck.jsp"%>
			</c:if>

<c:if test="${userClickNewPass == true}">
				<%@include file="changePassword.jsp"%>
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

           <c:if test="${clickedGetTicket == true }">
				<%@include file="getTicket.jsp"%>
			</c:if>

<c:if test="${clickedEPrintTicket == true }">
				<%@include file="printTicket.jsp"%>
			</c:if>


<div class="container">

	<div class="footer">
		<hr>
		<footer>
			<div class="row">

				<div class="col-lg-12">
					<b><p>Copyrights © 2018 Xtreme Travles Pvt Ltd. Designed and
							Developed by Prem Jha</p></b>
				</div>
			</div>
		</footer>
	</div>
</div>

	<!-- jQuery -->
	<script src="${js}/jquery.min.js"></script>
<script src="${js}/script.js"></script>
		<script src="${js}/bootstrap.min.js"></script>


	<!-- Bootstrap Core JavaScript -->
	<script src="${js}/bootstrap.min.js"></script>

</body>
</html>