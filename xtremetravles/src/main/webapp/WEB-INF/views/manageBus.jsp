<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<script type="text/javascript">
					window.id='${userModel.id}';
					console.log(id);
 					</script>
	
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

					<h4>Bus Management</h4>

				</div>

				<div class="panel-body">
					<sf:form class="form-horizontal" modelAttribute="bus" action="${contextRoot}/manage/bus" method="POST" >
						<div class="form-group">
							<label class="control-label col-md-4">Bus Name</label>
							<div class="col-md-8">
								<sf:input type="text" path="busName" class="form-control"
									placeholder="Bus Name" />
								<sf:errors path="busName" cssClass="help-block" element="em"/> 
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4">Aminities</label>
							<div class="col-md-8">
								<sf:input type="text" path="aminities" class="form-control"
									placeholder="Bus Reg No" /> 
								<sf:errors path="aminities" cssClass="help-block" element="em"/>	
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4">Bus Type</label>
							<div class="col-md-8">
								<sf:select path="busType" class="form-control">
								<option value="Sleeper">Sleeper</option>
				                <option value="Seater">Seater</option>
				                <option value="SleeperAc">SleeperAc</option>
					
							</sf:select>
								<div class="text-right">
									<br/>			
									<sf:hidden path="id"/>
									<sf:hidden path="active" value="true" />														
								</div>							
							</div>
							
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4">Bus Reg No</label>
							<div class="col-md-8">
								<sf:input type="text" path="busRegNo" class="form-control"
									placeholder="Bus Reg No" /> 
								<sf:errors path="busRegNo" cssClass="help-block" element="em"/>	
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
							<label class="control-label col-md-4">Depature Date</label>
							<div class="col-md-8">
								<sf:input type="date" id='datetimepicker1' path="date" class="form-control"
									placeholder="Depature Date" />
								<sf:errors path="date" cssClass="help-block" element="em"/> 
							</div>
						</div>
 <script type="text/javascript">
						        	$('#datetimepicker').data("DateTimePicker").(function () {
                $('#datetimepicker1').datetimepicker();
            });
            
        </script>
 
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
								<sf:input type="number" path="price" class="form-control"
									placeholder="Fare" />
								<sf:errors path="price" cssClass="help-block" element="em"/> 
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
	<h1>Available Bus</h1>
	<hr/>
	
	<div class="row">
				
		
		<div class='col-xs-12'>
		
		
			<table id="busTable" class="table table-condensed table-bordered">
							
				<thead>					
					<tr>					
						<th>BusName</th>
						<th>BusType</th>
						<th>Aminities</th>
						<th>BusRegNo</th>
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
						<th>BusName</th>
						<th>BusType</th>
						<th>Aminities</th>
						<th>BusRegNo</th>
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