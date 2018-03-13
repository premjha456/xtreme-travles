<div class="container">
		<div class="col-sm-10">

			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4>Book affordable Outstation Cabs for cities in India</h4>
				</div>
				<div class="panel-body">


					<form class="form-inline" action="${contextRoot}/cab/listCab">

						<div class="form-group">
							<label class="control-label">From :</label>
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-map-marker"></i></span> <input
									class="form-control" type="text" name="boardPoint">
							</div>
						</div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="form-group">
							<label class="control-label">To :</label>
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-map-marker"></i></span> <input
									class="form-control" type="text" name="dropPoint">
							</div>
						</div>

						<br> <br>

						<div class="form-group">
							<label class="control-label">Depature :</label>
							<div class='input-group date' id='datetimepicker1'>
								<input type="date" class="form-control" name="date" /> <span
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
               &nbsp;&nbsp;&nbsp;&nbsp;
						<div class="form-group">
							<label for="select" class="control-label">PickUp Time</label>
							<div class="input-group">
								<select class="form-control" id="select" name="putime" required>
									<option value="7:30">7:30</option>
									<option value="8:00">8:00</option>
									<option value="8:30">8:30</option>
									<option value="9:00">9:00</option>
									<option value="9:30">9:30</option>
								</select>
							</div>
						</div>
						&nbsp;&nbsp;&nbsp;&nbsp;

						&nbsp;&nbsp;&nbsp;&nbsp; <br> <br>
						<button type="submit" class="btn btn-default">Submit</button>
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