<div class="container">
		<div class="col-sm-10">

			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4>Book Domestic Flights Tickets</h4>
				</div>
				<div class="panel-body">


					<form class="form-inline" action="${contextRoot}/flight/listFlight">

						<div class="form-group">
							<label class="control-label">Flying From :</label>
							<div class="input-group">
								<span class="input-group-addon">
								<i class="glyphicon glyphicon-map-marker"></i></span> 
									<input class="form-control" type="text" name="boardPoint" required/>
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
								<input type="date" name="date" class="form-control" required/> <span
									class="input-group-addon"> <span
									class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
						</div>
						
						&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="form-group">
							<label for="select" class="control-label">Adults</label>
							<div class="input-group">
								<select class="form-control" id="select" name="adults" required>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
							</div>
						</div>
						&nbsp;&nbsp;&nbsp;&nbsp;



						<div class="form-group">
							<label for="select" class="control-label">Children</label>
							<div class="input-group">
								<select class="form-control" id="select" name="childs" required>
									<option value="0">0</option>									
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
							</div>
						</div>

						&nbsp;&nbsp;&nbsp;&nbsp;

						<div class="form-group">
							<label for="select" class="control-label">Economy</label>
							<div class="input-group">
								<select class="form-control" id="select" name="class" required>
									<option>Economy</option>
									<option>Business</option>
								</select>
							</div>
						</div>
						&nbsp;&nbsp;&nbsp;&nbsp; <br> <br>
						<input type="submit" class="btn btn-default" value="Submit" />
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