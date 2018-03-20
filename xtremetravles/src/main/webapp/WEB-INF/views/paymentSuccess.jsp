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

<style>
table, th, td {
    border: 1px solid black;
}

th, td {
    padding: 5px;
    text-align: left;
}

</style>


<script type="text/javascript">
	window.contextRoot = '${contextRoot}'
</script>
</head>
<body>

	<div class="wrapper">

		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
					</button>

					<a class="navbar-brand" href="${contextRoot}/home">Xtreme Travles</a>
				</div>
				<div class="navbar-collapse collapse" id="bs-example-navbar-collapse-1" aria-expanded="false" style="height: 1px;">
					<ul class="nav navbar-nav">
						<li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Booking Successful || E-Ticket&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
					</ul>

				</div>
			</div>
		</nav>
		<br>
		<br>
		<br>
		<br>

<div class="content">

<div id="printarea">



<table style="width:50%" border="0" style="border:2px solid gray; padding:5px" >
  <tr>
    <th colspan="2" align="Center" style="border-bottom: 2px solid gray; padding-bottom:5px"><img id="img1" alt="logo.jpg" src="${images}/logo.jpg" height="58px" width="105px"></th>
    
    <td align="left" colspan="2" style="color: Blue;border-bottom: 2px solid gray; padding-bottom: 5px">
                                    H.O :- Xtreme Travels,Chembur,Mumbai ||
                                    Ph  :- 9773565937
                                    <br />
                                    B.O :- Xtreme Travels,Santacurz,Mumbai ||
                                    Ph  :- 9773565937
                                </td>
    </th> 
  </tr>
  <tr>
    <td>Ticket Number:</td>
    <td>12345</td>

    <td>Transaction Id:</td>
    <td><%=request.getParameter("txnid") %></td>

  </tr>
  <tr>
    <td>Name:</td>
    <td><p><%=request.getParameter("firstname") %></p></td>
    
    <td>Phone:</td>
    <td><p><%=request.getParameter("phone") %></p></td>
    
  </tr>
  
   <tr>
    <td>Source:</td>
						<td><p>
								<c:if test="${bus != null}"> 
                                              ${bus.boardPoint }</c:if>
								<c:if test="${flight != null}">
                                              ${flight.boardPoint }
                                              </c:if>
								<c:if test="${cab != null}}">
                                              ${cab.boardPoint }
                                              </c:if>
							</p></td>

						<td>Destination:</td>
						<td><p>

								<c:if test="${bus != null}"> 
                                              ${bus.dropPoint }</c:if>
								<c:if test="${flight != null}">
                                              ${flight.dropPoint }
                                              </c:if>
								<c:if test="${cab != null}}">
                                              ${cab.dropPoint }
                                              </c:if>
							</p></td>

					</tr>
					
					<tr>
    <td>Journey Date:</td>
    <td><p>
    <c:if test="${bus != null}"> 
                                              ${bus.date }</c:if>
								<c:if test="${flight != null}">
                                              ${flight.date }
                                              </c:if>
								<c:if test="${cab != null}}">
                                              ${cab.date }
                                              </c:if>
    
    </p></td>
    
    <td>Journey Time:</td>
    <td><p>
<c:if test="${bus != null}"> 
                                              ${bus.boardTime }</c:if> 
                                              <c:if test="${flight != null}">
                                              ${flight.boardTime }
                                              </c:if> 
                                              <c:if test="${cab != null}}">
                                             
                                              </c:if>
</p></td>
    
  </tr>
 
 <tr>
    <td>Seat Nos:</td>
    <td><p>
<c:if test="${bus != null}"> 
                                              ${busSeatList }</c:if> 
                                              <c:if test="${flight != null}">
                                              ${flightSeatList}
                                              </c:if> 
  
</p></td>
    
    <td>No of Passengers:</td>
    <td><p>
4
</p></td>
    
  </tr>
  
  
  <tr>
    <td>Boarding Point:</td>
    <td><p>
<c:if test="${bus != null}"> 
                                              ${bus.boardPoint }</c:if> 
                                              <c:if test="${flight != null}">
                                              ${flight.boardPoint }
                                              </c:if> 
                                              <c:if test="${cab != null}}">
                                              ${cab.boardPoint }
                                              </c:if>
</p></td>
    
    <td>Bus Number:</td>
    <td><p>

<c:if test="${bus != null}"> 
                                              ${bus.busRegNo }</c:if> 
                                              <c:if test="${flight != null}">
                                              ${flight.flightNo }
                                              </c:if> 
                                              <c:if test="${cab != null}}">
                                              ${cab.boardPoint }
                                              </c:if>
</p></td>
    
  </tr>
               
               
                 <tr>
    <td>Boarding Date:</td>
    <td><p>
1/1/2017
</p></td>
    
    <td>Ticket Fare:</td>
    <td><p>

<c:if test="${bus != null}"> 
                                              ${bus.price }</c:if> 
                                              <c:if test="${flight != null}">
                                              ${flight.fare }
                                              </c:if> 
                                              <c:if test="${cab != null}}">
                                              ${cab.fare }
                                              </c:if>
</p></td>
    
   </tr>
   
   <tr>
    <td>Payment Status:</td>
    <td><p>
    Payment Successful
    </p></td>
    
    <td>Ticket Status:</td>
    <td><p>
   Booked 
</p></td>
    
  </tr>
  
</table>
      </div>
    
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
