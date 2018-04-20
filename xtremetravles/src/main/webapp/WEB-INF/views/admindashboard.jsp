<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Xtreme Travels- Admin Dashboard</title>
    <link href="${css}/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="${css}/bootstrap-theme.css">
    <link href="${css}/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="${css}/dataTables.bootstrap4.css">
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

   <style type="text/css">
   	

 #wrapper {
    width: 100%;
    margin-top:50px;
}

#page-wrapper {
    padding: 15px 15px;
    min-height: 600px;
    background:#F3F3F3;
   
}
#page-inner {
    width:100%;
    margin:10px 20px 10px 0px;
    background-color:#fff!important;
    padding:10px;
    min-height:1200px;
}

.user-image-back {
    background-color:#8B7BFF;
}

.arrow {
    float: right;
}

.fa.arrow:before {
    content: "\f104";
}

.active > a > .fa.arrow:before {
    content: "\f107";
}


.nav-second-level li,
.nav-third-level li {
    border-bottom: none !important;
}

.nav-second-level li a {
    padding-left: 37px;
}

.nav-third-level li a {
    padding-left: 55px;
}
.sidebar-collapse , .sidebar-collapse .nav{
	background:none;
}
.sidebar-collapse .nav {
	padding:0;
}
.sidebar-collapse .nav > li > a {
background: #FFFFFF;
text-shadow: none;
color:#0000FF;
}
.sidebar-collapse > .nav > li > a {
	padding:15px 10px;
}
.sidebar-collapse > .nav > li {
	border-bottom: 1px solid rgba(240, 240, 240, 1) !important;
}
.sidebar-collapse .nav > li > a:hover,
.sidebar-collapse .nav > li > a:focus {
	
	background:#F3F3F3;
	outline:0;
}
.nav-second-level  > li:last-child > a:after,
.nav-third-level  > li:last-child > a:after {
	height:50%;
}
.nav-third-level > li > a:after,
.nav-third-level > li > a:before  {
	left:40px;
}
.navbar-side {
	border:none;
	background-color: #202020;
	
}
.navbar-default {
border:0px solid #DDDDDD;
     
}
.navbar-default .navbar-toggle:hover, .navbar-default .navbar-toggle:focus {
background-color: #B40101;
}
.navbar-default .navbar-toggle {
border-color: #fff;
}

.navbar-default .navbar-toggle .icon-bar {
background-color: #FFF;
}
.nav > li > a > i {
    margin-right:10px;
}
.adjust-nav {
    padding-left:20px;padding-right:20px;
}
.bg-color-blue {
background-color: #9A86EB;
color: #fff;
}

.no-boder {
border: 1px solid #f3f3f3;
}
.back-footer-blue {
background-color: #7479E6;
border-top: 0px solid #fff;
}

.nav-tabs > li > a {
     -webkit-border-radius: 0px 0px 0px 0px;
-moz-border-radius: 0px 0px 0px 0px;
border-radius: 0px 0px 0px 0px;
}
 @media(min-width:768px) {
     #page-wrapper{
               margin: 0 0 0 260px;
        padding: 15px 30px;
        min-height: 1200px;
		
    }
	
	
    .navbar-side {
        z-index: 1;
        position: absolute;
        width: 260px;
    }

   .navbar {
 border-radius: 0px; 
}
   
}
   </style>
</head>
<body>
     
           
          
    <div id="wrapper">
         <div class="navbar navbar-default navbar-fixed-top">
            <div class="adjust-nav">
                <div class="navbar-header">
                    <a class="navbar-brand" href="${contextRoot}">Xtreme Travels</a>
                </div>
                           </div>
        </div>
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li class="text-center user-image-back">
                        <img src="${images}/admin.jpg" style="padding:40px;border-radius: 50px 20px;" class="img-responsive" />
                     
                    </li>


                    <li>
                        <a href="${contextRoot }/admin/dashboard"><i class="fa fa-desktop "></i>Dashboard</a>
                    </li>
                                       <li>
                        <a href="${contextRoot }/admin/register/user/agent"><i class="fa fa-edit "></i>Add New Agent </a>
                    </li>
                    <li>
                        <a href="${contextRoot }/admin/feedback"><i class="fa fa-qrcode "></i>View Feedbacks</a>
                    </li>

                                       <li>
                        <a href="${contextRoot}/logout"><span class="glyphicon glyphicon-log-out"></span>&nbsp;&nbsp;Logout</a>
                    </li>
                </ul>

            </div>

        </nav>
        <div id="page-wrapper" >
            <div id="page-inner">
            
             <c:if test="${clickedAdminDash == true }">
                <div class="row">
                    <div class="col-md-12">
                    
                                      <h2>Welcomw to Admin Panel</h2>   
                    
                     <h2>Admin Dashboard</h2>   
                     
                     <h4>Graphical View of Bus,Flight and Cabs Booked 
                     It Will help to analyze which servie is used most
                     </h4>
                     
                    </div>
                </div>  
                            
                  <hr />
                  
                   <table>
                        <tr>
                        <td><div id="piechart"></div></td>
                        <td><div id="barchart"></div></td>
                        
                        </tr>
                        
                     </table>         
              
    </div>
            </div>
        </div>
        			     </c:if>
        
         <div class="row">
                 
                  <c:if test="${clickedRegister == true }">
				<%@include file="register.jsp"%>
			     </c:if>
</div>
      
              <div class="row">
      
      <c:if test="${clickedAdminFeedback == true }">
				<%@include file="feedbackList.jsp"%>
			</c:if>
			</div>
    <script src="${js}/jquery.min.js"></script>
    <script src="${js}/bootstrap.min.js"></script>
    <script src="${js}/jquery.dataTables.js"></script>
		<script src="${js}/dataTables.bootstrap4.js"></script>
    
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
      <script src="${js}/script.js"></script>
      
      
 <script type="text/javascript">
// Load google charts
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

// Draw the chart and set the chart values
function drawChart() {
  var data = google.visualization.arrayToDataTable([
  ['Name', 'Quantity'],
  ['Bus', 48],
  ['Cab', 10],
  ['Flight', 3]
  ]);

  // Optional; add a title and set the width and height of the chart
  var options = {'title':'Which Service is used Most(PieChart View)', 'width':550, 'height':400};

  var options1 = {'title':'Which Service is used Most(BarChart View)', 'width':550, 'height':400};

  // Display the chart inside the <div> element with id="piechart"
  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
  chart.draw(data, options);
  
  var barchart = new google.visualization.BarChart(document.getElementById('barchart'));
  barchart.draw(data, options1);

  
  
  
}
</script>
</body>
</html>
