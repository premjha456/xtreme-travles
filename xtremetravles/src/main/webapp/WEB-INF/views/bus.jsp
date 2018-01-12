<div class="container">
		<div class="col-sm-10">

			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4>Book Bus Tickets Across India</h4>
				</div>
				<div class="panel-body">


					<form class="form-inline" action="${contextRoot}/bus/listBus">

						<div class="form-group">
							<label class="control-label">Flying From :</label>
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-map-marker"></i></span> <input
									class="form-control" type="text" name="boardPoint" required>
							</div>
						</div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="form-group">
							<label class="control-label">Flying To :</label>
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-map-marker"></i></span> <input
									class="form-control" type="text" name="dropPoint" required>
							</div>
						</div>

						<br> <br>

						<div class="form-group">
							<label class="control-label">Depature :</label>
							<div class='input-group date' id='datetimepicker1'>
								<input type="date" class="form-control" name="date"/ required> <span
									class="input-group-addon"> <span
									class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
						</div>
						<script type="text/javascript">
						        	$('#datetimepicker').data("DateTimePicker").(function () {
                $('#datetimepicker1').datetimepicker();
            });
            
        </script>

						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="form-group">
							<label for="select" class="control-label">No. Of Seats</label>
							<div class="input-group">
								<select class="form-control" id="select" name="seats" required>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									
								</select>
							</div>
						</div>
												&nbsp;&nbsp;&nbsp;&nbsp; <br> <br>
						<input type="submit" value="Submit" class="btn btn-default"/>
					</form>
				</div>


			</div>

			<br> <br>

			<div class="row">
				<div class="col-sm-10">
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
						</ol>

						<!-- Wrapper for slides -->
						<div class="carousel-inner">

							<div class="item active">
								<img src="${images}/xyz.png" alt="Los Angeles" style="width: 100%;">
								<div class="carousel-caption">
									<h3>Los Angeles</h3>
									<p>LA is always so much fun!</p>
								</div>
							</div>

							<div class="item">
								<img src="${images}/pqr.jpg" alt="Chicago" style="width: 100%;">
								<div class="carousel-caption">
									<h3>Chicago</h3>
									<p>Thank you, Chicago!</p>
								</div>
							</div>

							<div class="item">
								<img src="${images}/abc.jpeg" alt="New York" style="width: 100%">
								<div class="carousel-caption">
									<h3>New York</h3>
									<p>We love the Big Apple!</p>
								</div>
							</div>

						</div>

						<!-- Left and right controls -->
						<a class="left carousel-control" href="#myCarousel"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#myCarousel"
							data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span> <span
							class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
<br>