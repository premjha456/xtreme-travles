<script type="text/javascript">
	var check = function() {
		if (document.getElementById('otp').value != document
				.getElementById('userotp').value) {
			document.getElementById('message').style.color = 'red';
			document.getElementById('message').innerHTML = 'Wrong OTP';
			document.getElementById('userotp').value = "";
			document.getElementById('userotp').focus();
		}
	}
</script>

	
	<div class="container" style="padding-top: 150px;">
	
		
	<div class="col-md-offset-2 col-md-8">
	
	 <div class="panel panel-primary">
    <div class="panel-heading"><h4>Enter Your Email to Verify</h4></div>
					<div class="panel-body">
						<form role="form" action="${contextRoot}/newpassword">
							<fieldset>

								<div class="form-group">
									<input class="form-control" placeholder="E-mail"
										name="email" type="text" value="${email}" autofocus
										disabled>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="OTP" name="userotp"
										id="userotp" type="text" pattern="[0-9]{6}"
										onfocusout="check();" required> <span id='message'></span>
								</div>
								
								<label> <a
									href="${contextRoot}/forgetpassword/resend/forgetpasswordotp?email=${email}">Re-Send OTP</a>
								<input type="hidden" name="email" value="${email}" />

								</label> <input type="hidden" id="otp" name="otp" value="${otp}">
								<br/>
								
								<!-- Change this to a button or input when using this as a form -->
								<input type="submit" class="btn btn-lg btn-success btn-block"
									Value="Check OTP ">
							</fieldset>

						</form>
					</div>
				</div>
			</div>
		</div>

	<!-- jQuery -->
	<script src="${js}/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="${js}/bootstrap.min.js"></script>
