<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>


<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
			
				<a class="navbar-brand" href="${contextRoot}/home">Xtreme Travles</a>
			</div>
    <div class="navbar-collapse collapse" id="bs-example-navbar-collapse-1" aria-expanded="false" style="height: 1px;">
			<ul class="nav navbar-nav">
				<li class="active"><a href="${contextRoot}/flight">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Flights&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li><a href="${contextRoot}/hotels">&nbsp;&nbsp;&nbsp;Hotels&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li><a href="${contextRoot}/bus">&nbsp;&nbsp;&nbsp;Bus&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li><a href="${contextRoot}/cabs">&nbsp;&nbsp;&nbsp;Cabs&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				
				<security:authorize access="hasAuthority('AGENT')">
				<li><a href="${contextRoot}/manage/bus">&nbsp;&nbsp;&nbsp;Manage Buses&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li><a href="${contextRoot}/manage/flight">&nbsp;&nbsp;&nbsp;Manage Flights&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li><a href="${contextRoot}/manage/cab">&nbsp;&nbsp;&nbsp;Manage Cabs&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li><a href="${contextRoot}/manage/hotel">&nbsp;&nbsp;&nbsp;Manage Hotels&nbsp;&nbsp;&nbsp;&nbsp;</a></li>			
				</security:authorize>
			</ul>
			
			<security:authorize access="isAnonymous()">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="${contextRoot}/registerUser"  style="width:auto;"><span class="glyphicon glyphicon-user"></span>
						Sign Up</a></li>
				<li><a href="${contextRoot}/login"><span class="glyphicon glyphicon-log-in"></span>
						Login</a></li>
			</security:authorize>
			
			<security:authorize access="isAuthenticated()">
						<ul class="nav navbar-nav navbar-right">
			
				 <li class="dropdown">
  <a class="dropdown-toggle" type="button" data-toggle="dropdown"><b>${userModel.fullName}</b>
  <span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
  <ul class="dropdown-menu">
    <li><a href="#">View Profile</a></li>
    	<security:authorize access="hasAuthority('USER')">
    	    <li role="separator" class="divider"></li>
    <li><a href="#">My Bookings</a></li>
        <li role="separator" class="divider"></li>
    
    </security:authorize>
    <li><a href="${contextRoot}/logout">Logout</a></li>
  </ul>
</li> 
</ul>
			</security:authorize>
					</ul>
			
			</div>
		</div>
	</nav><br><br><br><br>