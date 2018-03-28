<link href="${css}/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript">
	var check = function() {
		if (document.getElementById('password').value != document
				.getElementById('confirmpassword').value) {
			document.getElementById('message').style.color = 'red';
			document.getElementById('message').innerHTML = 'password does not match';
			document.getElementById('password').value = "";
			document.getElementById('confirmpassword').value = "";
			document.getElementById('password').focus();
		}
	}
</script>
<div class="container" style="padding-top: 150px;">
	
		
	<div class="col-md-offset-2 col-md-8">
	
	 <div class="panel panel-primary">
    
					<div class="panel-heading">
						<h3 class="panel-title">New Password</h3>
					</div>
					<div class="panel-body">
						<form role="form" action="${contextRoot}/update/password">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="New-Password"
										id="password" name="password" type="password"
										pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"
										title="Minimum eight characters, at least one letter, one number and one special character"
										required>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Re-Password"
										id="confirmpassword" name="confirmpassword" type="password"
										value="" onfocusout="check();" required> <span
										id='message'></span>
								</div>
								
								<input type="hidden" name="email" value="${email}">
								<!-- Change this to a button or input when using this as a form -->
								<input type="submit" class="btn btn-lg btn-success btn-block"
									Value="Change Password">
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
