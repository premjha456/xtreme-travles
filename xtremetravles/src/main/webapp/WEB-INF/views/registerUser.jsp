<div class="container">


	<div class="row">

		<div class="col-md-offset-2 col-md-8">

			<div class="panel panel-primary">

				<div class="panel-heading">

					<h4>Bus Management</h4>

				</div>

				<div class="panel-body">
					<form class="form-horizontal" action="${contextRoot}/register/user/normal" method="POST" >
						<div class="form-group">
							<label class="control-label col-md-4">First Name:</label>
							<div class="col-md-8">
								<input type="text" name="firstName" class="form-control"
									placeholder="First Name" />
							</div>
						</div>
						
							<div class="form-group">
							<label class="control-label col-md-4">Last Name:</label>
							<div class="col-md-8">
								<input type="text" name="lastName" class="form-control"
									placeholder="Last Name" />
							</div>
						</div>
					
						<div class="form-group">
							<label class="control-label col-md-4">Email:</label>
							<div class="col-md-8">
								<input type="email" name="email" class="form-control"
									placeholder="Email" />
							</div>
						</div>
					
						<div class="form-group">
							<label class="control-label col-md-4">Contact:</label>
							<div class="col-md-8">
								<input type="text" name="contactNumber" class="form-control"
									placeholder="Contact" />
							</div>
						</div>
					
						<div class="form-group">
							<label class="control-label col-md-4">New Password:</label>
							<div class="col-md-8">
								<input type="password" name="password" class="form-control"
									placeholder="New Password" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4">Confirm Password:</label>
							<div class="col-md-8">
								<input type="password" name="confirmPassword" class="form-control"
									placeholder="Confirm Password" />
							</div>
						</div>
					
					    <input type="hidden" id="role" name="role" value="USER"/>
					    <input type="hidden" id="active" name="active" value="true"/>
					                   <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
					   
						<div class="form-group">
							
							<div class="col-md-offset-4 col-md-4">
							
								<input type="submit" name="submit" value="Save" class="btn btn-primary"/>
								
							</div>
						</div>						
										
					</form>

          <div style="float: right;"><h4><a href="${contextRoot}/register/user/agent">Looking of Travel Agent Account ? Register Here</a></h4></div>

				</div>

			</div>

		</div>

	</div>
</div>