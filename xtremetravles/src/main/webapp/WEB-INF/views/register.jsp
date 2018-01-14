<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<div class="container">

	<c:if test="${not empty message}">
		<div class="row">
			<div class="col-xs-12 col-md-offset-2 col-md-8">
				<div class="alert alert-info fade in">${message}</div>
			</div>
		</div>
	</c:if>

	<div class="row">

		<div class="col-md-12">

			<div class="panel panel-primary">

				<div class="panel-heading">

					<h4>Travel Agent Registration</h4>

				</div>

				<div class="panel-body">
					<sf:form class="form-inline" modelAttribute="user"
						action="${contextRoot}/register/user/agent" method="POST"
						enctype="multipart/form-data">
						<fieldset>
							<legend>Personal Information:</legend>
							<div class="form-group">
								<label class="control-label">Company Name:&nbsp;&nbsp;</label>
								<div class="input-group">
									<sf:input type="text" path="companyName" class="form-control"
										placeholder="Company Name" />
									<sf:errors path="companyName" cssClass="help-block"
										element="em" />
								</div>
							</div>

							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


							<div class="form-group">
								<label class="control-label">Contact First Name:</label>
								<div class="input-group">
									<sf:input type="text" path="firstName" class="form-control"
										placeholder="Contact First Name" />
									<sf:errors path="firstName" cssClass="help-block" element="em" />
								</div>
							</div>

							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

							<div class="form-group">
								<label class="control-label">Contact Last Name:</label>
								<div class="input-group">
									<sf:input type="text" path="lastName" class="form-control"
										placeholder="Contact Last Name" />
									<sf:errors path="lastName" cssClass="help-block" element="em" />
								</div>
							</div>
							<br>
							<br>
							<div class="form-group">
								<label class="control-label">Email:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="input-group">
									<sf:input type="text" path="email" class="form-control"
										placeholder="Email" />
									<sf:errors path="email" cssClass="help-block" element="em" />
								</div>
							</div>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


							<div class="form-group">
								<label class="control-label">Mobile Number:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="input-group">
									<sf:input type="text" path="contactNumber" class="form-control"
										placeholder="Mobile No." />
									<sf:errors path="contactNumber" cssClass="help-block"
										element="em" />
								</div>
							</div>

							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="form-group">
								<label class="control-label">Address Line1: </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="input-group">
									<sf:input type="text" path="addressLineOne"
										class="form-control" placeholder="Address 1" />
									<sf:errors path="addressLineOne" cssClass="help-block"
										element="em" />
								</div>
							</div>
							<br>
							<br>

							<div class="form-group">
								<label class="control-label">Address Line2:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="input-group">
									<sf:input type="text" path="addressLineTwo"
										class="form-control" placeholder="Address 2" />
									<sf:errors path="addressLineTwo" cssClass="help-block"
										element="em" />
								</div>
							</div>


							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="form-group">
								<label class="control-label">Country:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="input-group">
									<sf:select path="country" class="form-control">
										<option value=>Select Country</option>
										<option value="India">India</option>
									</sf:select>

								</div>

							</div>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

							<div class="form-group">
								<label class="control-label">State:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="input-group">
									<sf:select path="state" class="form-control">
										<option>Select Country</option>
										<option value="Maharashtra">Maharashtra</option>
									</sf:select>

								</div>

							</div>

							<br>
							<br>

							<div class="form-group">
								<label class="control-label">City:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="input-group">
									<sf:select path="city" class="form-control">
										<option>Select City</option>
										<option value="Mumbai">Mumbai</option>
									</sf:select>

								</div>

							</div>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="form-group">
								<label class="control-label">Pin Code:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="input-group">
									<sf:input type="text" path="postalCode" class="form-control"
										placeholder="Pin Code" />
									<sf:errors path="postalCode" cssClass="help-block" element="em" />
								</div>
							</div>

							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="form-group">
								<label class="control-label">Address Proof Type:</label>
								<div class="input-group">
									<sf:select path="addressProofType" class="form-control">
										<option>Select</option>
										<option value="Voter Id">Voter Id</option>
									</sf:select>

								</div>

							</div>

							<br>
							<br>
							<div class="form-group">
								<label class="control-label">Address Proof Scan Copy</label>
								<div class="input-group">
									<sf:input type="file" path="addressProof" />
									<sf:errors path="addressProof" cssClass="help-block"
										element="em" />
								</div>
							</div>

						</fieldset>
						<br>
						<br>
						<fieldset>
							<legend>Pan Card Details</legend>
							<div class="form-group">
								<label class="control-label">Pan Number:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="input-group">
									<sf:input type="text" path="panNumber" class="form-control"
										placeholder="Pan Number" />
									<sf:errors path="panNumber" cssClass="help-block" element="em" />
								</div>
							</div>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="form-group">
								<label class="control-label">Monthly Sales Volume:</label>
								<div class="input-group">
									<sf:input type="text" path="monthlySalesVolume"
										class="form-control" placeholder="Monthly Sales Volume" />
									<sf:errors path="monthlySalesVolume" cssClass="help-block"
										element="em" />
								</div>
							</div>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="form-group">
								<label class="control-label">Pan Card Holder Name</label>
								<div class="input-group">
									<sf:input type="text" path="panHolderName" class="form-control"
										placeholder="Pan Card Holder Name" />
									<sf:errors path="panHolderName" cssClass="help-block"
										element="em" />
								</div>
							</div>
							<br>
							<br>
							<div class="form-group">
								<label class="control-label">Pan Card Scan Copy</label>
								<div class="input-group">
									<sf:input type="file" path="panCardProof" />
									<sf:errors path="panCardProof" cssClass="help-block"
										element="em" />
								</div>
							</div>
						</fieldset>
						<br>
						<br>
						<fieldset>
							<legend>Deposit Information</legend>
							<div class="form-group">
								<label class="control-label">Deposit Type:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="input-group">
									<sf:select path="depositType" class="form-control">
										<option>Select</option>
										<option value="Cheque">Cheque</option>
										<option value="Cash">Cash</option>
									</sf:select>

								</div>

							</div>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="form-group">
								<label class="control-label">Deposit Amount:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="input-group">
									<sf:input type="text" path="depositAmount" class="form-control"
										placeholder="Deposit Amount" />
									<sf:errors path="depositAmount" cssClass="help-block"
										element="em" />
								</div>
							</div>
							<br>
                            <br>
                            <fieldset>
                            <legend>Password Details</legend>
							<div class="form-group">
								<label class="control-label">Password:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="input-group">
									<sf:input type="text" path="password" class="form-control"
										placeholder="Password" />
									<sf:errors path="password" cssClass="help-block"
										element="em" />
								</div>
							</div>
							</fieldset>
							<br>
							<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

							<div class="form-group">

								<div class="col-md-offset-4 col-md-4">
									<sf:input type="hidden" id="role" path="role" value="AGENT" />
									<sf:input type="hidden" id="active" path="active" value="TRUE" />
									<sf:input type="hidden" id="addCode" path="addCode" value="" />
									<sf:input type="hidden" id="panCode" path="panCode" value="" />

									<input type="submit" name="submit"
										value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Save&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
										class="btn btn-primary" />

								</div>
							</div>
					</sf:form>

				</div>

			</div>

		</div>

	</div>

</div>