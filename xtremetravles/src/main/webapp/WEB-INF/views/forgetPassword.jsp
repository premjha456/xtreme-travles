	
	<div class="container" style="padding-top: 150px;">
	
		<div class="col-md-offset-2 col-md-8">
	
	 <div class="panel panel-primary">
    <div class="panel-heading"><h4>Enter Your Email to Verify</h4></div>
    <div class="panel-body">
    <form class="form-horizontal" method="POST" action="${contextRoot}/forgetpassword/otp">
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">Email:</label>
      <div class="col-sm-6">
        <div class="form-group">
									<input class="form-control" placeholder="Enter Email" name="email"
										id="email" type="text" onfocusout="check();" required> <span id='message'></span>
								</div>
       </div>
    </div>
    
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-4">
	<input type="submit" class="btn  btn-lg btn-success btn-block" Value="Verify">
      </div>
    </div>
  </form>
    </div>
    </div>
  </div>
	
	
	</div>
