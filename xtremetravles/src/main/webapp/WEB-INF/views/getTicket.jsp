	<br><br><br>
	<div class="container">
	<c:if test="${not empty message}">	
		<div class="row">			
			<div class="col-xs-12 col-md-offset-2 col-md-8">			
				<div class="alert alert-info fade in">${message}</div>				
			</div>
		</div>
	</c:if>
	
		<div class="col-md-offset-2 col-md-8">
	
	 <div class="panel panel-primary">
    <div class="panel-heading"><h4>Enter Your PnrNo</h4></div>
    <div class="panel-body">
    
    <form class="form-horizontal" method="POST" action="${contextRoot}${url}">
	<div class="form-group">
      <label class="control-label col-sm-2" for="email">Pnr No:</label>
      <div class="col-sm-6">
        <div class="form-group">
									<input class="form-control" placeholder="Enter Pnr No" name="pnrno"
										id="pnrno" type="text" " required> 
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
