<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<div class="container">

	<c:if test="${not empty message}">	
		<div class="row">			
			<div class="col-xs-12 col-md-offset-2 col-md-8">			
				<div class="alert alert-info fade in">${message}</div>				
			</div>
		</div>
	</c:if>

	<div class="row">

		<div class="col-md-offset-2 col-md-8">

			<div class="panel panel-primary">

				<div class="panel-heading">

					<h4>Flight Management</h4>

				</div>

				<div class="panel-body">
					<sf:form class="form-horizontal" modelAttribute="flight" action="${contextRoot}/manage/flight" method="POST" >
						<div class="form-group">
							<label class="control-label col-md-4">Flight Name</label>
							<div class="col-md-8">
							
							<sf:select path="flightName" class="form-control">
								<option value="Indigo">Indigo</option>
				                <option value="Jet AirWays">Jet AirWays</option>
				                <option value="Air India">Air India</option>
					            <option value="SpiceJet">SpiceJet</option>
							</sf:select>
					        <sf:errors path="flightName" cssClass="help-block" element="em"/> 
							</div>
						</div>
						
						
						<div class="form-group">
							<label class="control-label col-md-4">Flight Type</label>
							<div class="col-md-8">
							<sf:input type="text" path="flightType" class="form-control"
									placeholder="Flight Type" /> 
								<sf:errors path="flightType" cssClass="help-block" element="em"/>
								
											<div class="text-right">
									<br/>			
									<sf:hidden path="id"/>
									<sf:hidden path="enabled" value="true" />														
								</div>							
							</div>
							
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4">Flight No</label>
							<div class="col-md-8">
								<sf:input type="text" path="flightNo" class="form-control"
									placeholder="Flight No" /> 
								<sf:errors path="flightNo" cssClass="help-block" element="em"/>	
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4">Board Point</label>
							<div class="col-md-8">
								<sf:input type="text" path="boardPoint" class="form-control"
									placeholder="Board Point" /> 
								<sf:errors path="boardPoint" cssClass="help-block" element="em"/>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4">Board Time</label>
							<div class="col-md-8">
								<sf:input type="text" path="boardTime" class="form-control"
									placeholder="Board Time" />
								<sf:errors path="boardTime" cssClass="help-block" element="em"/>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4">Drop Point</label>
							<div class="col-md-8">
								<sf:input type="text" path="dropPoint" class="form-control"
									placeholder="Drop Point" />
								<sf:errors path="dropPoint" cssClass="help-block" element="em"/> 
							</div>
						</div>

                        <div class="form-group">
							<label class="control-label col-md-4">Drop Time</label>
							<div class="col-md-8">
								<sf:input type="text" path="dropTime" class="form-control"
									placeholder="Drop Time" />
								<sf:errors path="dropTime" cssClass="help-block" element="em"/> 
							</div>
						</div>

                       <div class="form-group">
							<label class="control-label col-md-4">Maximum Seats</label>
							<div class="col-md-8">
								<sf:input type="number" path="maxSeats" class="form-control"
									placeholder="Maximum Seats" />
								<sf:errors path="maxSeats" cssClass="help-block" element="em"/> 
							</div>
						</div>
 
                       <div class="form-group">
							<label class="control-label col-md-4">Seats Available</label>
							<div class="col-md-8">
								<sf:input type="number" path="seatsAvailable" class="form-control"
									placeholder="Maximum Seats" />
								<sf:errors path="seatsAvailable" cssClass="help-block" element="em"/> 
							</div>
						</div>
 
                       <div class="form-group">
							<label class="control-label col-md-4">Fare</label>
							<div class="col-md-8">
								<sf:input type="number" path="fare" class="form-control"
									placeholder="Fare" />
								<sf:errors path="fare" cssClass="help-block" element="em"/> 
							<div class="text-right">
									<br/>			
																						
								</div>
							</div>
						</div>

						<div class="form-group">
							
							<div class="col-md-offset-4 col-md-4">
							
								<input type="submit" name="submit" value="Save" class="btn btn-primary"/>
								
							</div>
						</div>						
										
					</sf:form>

				</div>

			</div>

		</div>

	</div>

	
	<hr/>	
	<h1>Available Flight</h1>
	<hr/>
	
	<div class="row">
				
		
		<div class='col-xs-12'>
		
		
			<table id="flightTable" class="table table-condensed table-bordered">
							
				<thead>					
					<tr>					
						<th>FlightName</th>
						<th>FlightType</th>
						<th>FlightNo</th>
						<th>BoardPoint</th>
						<th>BoardTime</th>
						<th>DropPoint</th>
						<th>DropTime</th>
						<th>SeatsAvailable</th>
						<th>Fare</th>
						<th>Activate/Deactivate</th>
						<th>Edit</th>
					</tr>					
				</thead>
				
				<tfoot>
					<tr>					
						<th>FlightName</th>
						<th>FlightType</th>
						<th>FlightNo</th>
						<th>BoardPoint</th>
						<th>BoardTime</th>
						<th>DropPoint</th>
						<th>DropTime</th>
						<th>SeatsAvailable</th>
						<th>Fare</th>
						<th>Activate/Deactivate</th>
						<th>Edit</th>
							</tr>									
				</tfoot>
				
							
			</table>
		
		
		</div>
	
	</div>
</div>