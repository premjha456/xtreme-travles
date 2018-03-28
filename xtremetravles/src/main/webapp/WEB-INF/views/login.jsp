<div class="container">

	<c:if test="${not empty message}">
		<div class="row">
			<div class="col-xs-12 col-md-offset-2 col-md-8">
				<div class="alert alert-danger fade in">${message}</div>
			</div>
		</div>
	</c:if>
   
   <c:if test="${not empty logout}">
		<div class="row">
			<div class="col-xs-12 col-md-offset-2 col-md-8">
				<div class="alert alert-success">${logout}</div>
			</div>
		</div>
	</c:if>

			<div class="col-md-offset-2 col-md-8">
	
	 <div class="panel panel-primary">
    <div class="panel-heading"><h4>Login Form</h4></div>
    <div class="panel-body">
    <form class="form-horizontal" method="POST" action="${contextRoot}/login">
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">Username:</label>
      <div class="col-sm-6">
        <input type="email" class="form-control" id="email" placeholder="Enter Username" name="username">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Password:</label>
      <div class="col-sm-6">          
        <input type="password" class="form-control" id="pwd" placeholder="Enter Password" name="password">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default">Login</button>
      </div>
    </div>
    <div class="checkbox">
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           &nbsp;&nbsp;&nbsp;
                       
                       
                                    <label>
                                        <h5><a href="${contextRoot}/forgetpassword">Forget Password ?</a></h5>
                                    </label>
                                </div>
  </form>
          <div style="float: right;"><h4><a href="${contextRoot}/registerUser">Need a Account?Register Here</a></h4></div>
    </div>
    </div>
  </div>
</div>	
