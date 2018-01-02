<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>${contextRoot}</title>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Govihar Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Custom Theme files -->
<link href="${css}/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="${css}/dataTables.bootstrap.css" type="text/css" rel="stylesheet" media="all">

<link href="${css}/style.css" type="text/css" rel="stylesheet" media="all">
<link rel="stylesheet" href="${css}/flexslider.css" type="text/css" media="screen" />
<link type="text/css" rel="stylesheet" href="${css}/JFFormStyle-1.css" />
<!-- js -->
<script src="${js}/jquery.min.js"></script>
<script src="${js}/modernizr.custom.js"></script>
<script src="${js}/jquery.dataTables.js"></script>
<script src="${js}/dataTables.bootstrap.js"></script>

	<script type="text/javascript" src="${js}/script.js"></script>

<!-- //js -->
<!-- fonts -->
<link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,700,500italic,700italic,900,900italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<!-- //fonts -->	
<script type="text/javascript">

window.contextRoot='${contextRoot}'
		$(document).ready(function () {
			$('#horizontalTab').easyResponsiveTabs({
				type: 'default', //Types: default, vertical, accordion           
				width: 'auto', //auto or any width like 600px
				fit: true   // 100% fit in a container
				
			});
		});
		
	</script>
<!--pop-up-->
<script src="${js}/menu_jquery.js"></script>
<!--//pop-up-->	
</head>
<body>
	<!--header-->
	<div class="header">
		<div class="container">
			<div class="header-grids">
				<div class="logo">
					<h1><a  href="index.html"><span>Go</span>vihar</a></h1>
				</div>
				<!--navbar-header-->
				<div class="header-dropdown">
					<div class="emergency-grid">
						<ul>
							<li>Toll Free : </li>
							<li class="call">+1 234 567 8901</li>
						</ul>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="nav-top">
				<div class="top-nav">
					<span class="menu"><img src="${images}/menu.png" alt="" /></span>
					<ul class="nav1">
						<li class="active"><a href="index.html">Flights</a></li>
						<li><a href="${contextRoot}/hotels">Hotels</a></li>
						<li><a href="${contextRoot}/bus">Bus</a></li>
						<li><a href="${contextRoot}/cab">Cabs</a></li>
						<li><a href="${contextRoot}/deals">Deals</a></li>
					</ul>
					<div class="clearfix"> </div>
					<!-- script-for-menu -->
							 <script> 
							   $( "span.menu" ).click(function() {
								 $( "ul.nav1" ).slideToggle( 300, function() {
								 // Animation complete.
								  });
								 });
							
							</script>
						<!-- /script-for-menu -->
				</div>
				<div class="dropdown-grids">
						<div id="loginContainer"><a href="#" id="loginButton"><span>Login</span></a>
							<div id="loginBox">                
								<form id="loginForm">
									<div class="login-grids">
										<div class="login-grid-left">
											<fieldset id="body">
												<fieldset>
													<label for="email">Email Address</label>
													<input type="text" name="email" id="email">
												</fieldset>
												<fieldset>
													<label for="password">Password</label>
													<input type="password" name="password" id="password">
												</fieldset>
												<input type="submit" id="login" value="Sign in">
												<label for="checkbox"><input type="checkbox" id="checkbox"> <i>Remember me</i></label>
											</fieldset>
											<span><a href="#">Forgot your password?</a></span>
											<div class="or-grid">
												<p>OR</p>
											</div>
											<div class="social-sits">
												<div class="facebook-button">
													<a href="#">Connect with Facebook</a>
												</div>
												<div class="chrome-button">
													<a href="#">Connect with Google</a>
												</div>
												<div class="button-bottom">
													<p>New account? <a href="${contextRoot}/signup">Signup</a></p>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--//header-->
	
	
	
	<c:if test="${clickedFlight == true }">
				<%@include file="flight.jsp"%>
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
	
	<c:if test="${clickedHotels == true }">
				<%@include file="hotels.jsp"%>
</c:if>
	
	<%@include file="footer.jsp"%>
	<%@include file="footer-bottom.jsp"%>
	
	<script defer src="${js}/jquery.flexslider.js"></script>
	<script src="${js}/easyResponsiveTabs.js" type="text/javascript"></script>
	<script src="${js}/jquery-ui.js"></script>
	<script type="text/javascript">
		$(function(){
			SyntaxHighlighter.all();
			});
			$(window).load(function(){
			$('.flexslider').flexslider({
			animation: "slide",
			start: function(slider){
			$('body').removeClass('loading');
			}
			});
		});
	</script>		
</body>
</html>