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

					<h4>Cab Management</h4>

				</div>

				<div class="panel-body">
					<sf:form class="form-horizontal" modelAttribute="cab" action="${contextRoot}/manage/cab" method="POST" >
						<div class="form-group">
							<label class="control-label col-md-4">Cab Name</label>
							<div class="col-md-8">
								<sf:select path="cabName" class="form-control">
								<option value="Indica, Swift or similar">Indica, Swift or similar</option>
				                <option value="Dzire, Etios or similar">Dzire, Etios or similar</option>
				                <option value="Innova, Xylo or similar">Innova, Xylo or similar</option>
					
							</sf:select>
					
								<sf:errors path="cabName" cssClass="help-block" element="em"/> 
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4">Cab Type</label>
							<div class="col-md-8">
								<sf:select path="cabType" class="form-control">
								<option value="HATCHBACK">HATCHBACK</option>
				                <option value="SEDAN">SEDAN</option>
				                <option value="SUV">SUV</option>
					
							</sf:select>
								<div class="text-right">
									<br/>			
									<sf:hidden path="id"/>
									<sf:hidden path="active" value="true" />														
								</div>							
							</div>
							
						</div>
					
						<div class="form-group">
							<label class="control-label col-md-4">Aminities</label>
							<div class="col-md-8">
								<sf:input type="text" path="aminities" class="form-control"
									placeholder="Aminities" /> 
								<sf:errors path="aminities" cssClass="help-block" element="em"/>	
							</div>
						</div>
						
							
						<div class="form-group">
							<label class="control-label col-md-4">Cab Service Provider</label>
							<div class="col-md-8">
								<sf:input type="text" path="cabServiceProvider" class="form-control"
									placeholder="Cab Service Provider" /> 
								<sf:errors path="cabServiceProvider" cssClass="help-block" element="em"/>	
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
							<label class="control-label col-md-4">Drop Point</label>
							<div class="col-md-8">
								<sf:input type="text" path="dropPoint" class="form-control"
									placeholder="Drop Point" />
								<sf:errors path="dropPoint" cssClass="help-block" element="em"/> 
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
	<h1>Available Bus</h1>
	<hr/>
	
	<div class="row">
				
		
		<div class='col-xs-12'>
		
		
			<table id="cabTable" class="table table-condensed table-bordered">
							
				<thead>					
					<tr>					
						<th>CabName</th>
						<th>CabType</th>
						<th>Cab Service Provider</th>
						<th>Aminities</th>
						<th>BoardPoint</th>
						<th>DropPoint</th>
						<th>Date</th>						
						<th>Fare</th>
						<th>Activate/Deactivate</th>
						<th>Edit</th>
					</tr>					
				</thead>
				
				<tfoot>
					<tr>					
						<th>CabName</th>
						<th>CabType</th>
						<th>Cab Service Provider</th>
						<th>Aminities</th>
						<th>BoardPoint</th>
						<th>DropPoint</th>
						<th>Date</th>
						<th>Fare</th>
						<th>Activate/Deactivate</th>
						<th>Edit</th>
							</tr>									
				</tfoot>
				
							
			</table>
		
		
		</div>
	
	</div>
</div>