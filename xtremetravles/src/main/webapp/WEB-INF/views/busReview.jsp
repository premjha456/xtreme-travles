<div class="container">

	<div class="well well-lg">${bus}</div>
	<div class="col-sm-11">
		<div class="well well-sm">
			<h4>
				<span class="label label-default">&nbsp;&nbsp;1&nbsp;&nbsp;</span>&nbsp;&nbsp;Review
				Your Trip Details
			</h4>

		</div>
	</div>
	<div class="col-sm-7">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3>Bus Details</h3>
			</div>
			<div class="panel-body">
				<h5>
					<span class="label label-default">DEPART</span>
				</h5>
				<br>
				<div class="container">
					<div class="col-sm-2" align="center">
						<p>${bus.boardPoint}</p>

						<h2>
							<b><p>${bus.boardTime}</p></b>
						</h2>
						<p>
							<b>${bus.boardPoint}</b>
						</p>
					</div>

					<div class="col-sm-2">
						<img src="${images}/buslogo.JPG" class="img-rounded"
							alt="" width="170" height="20">
					</div>

					<div class="col-sm-2">
						<p>${bus.dropPoint}</p>

						<h2>
							<b><p>${bus.dropTime}</p></b>
						</h2>
						<p>
							<b>${bus.dropPoint}</b>
						</p>
					</div>
				</div>

			</div>
			<!-- panel body finish -->
			<div class="panel-footer">

				<div class="container">
					<div class="col-sm-2">
						<p>Opreator:</p>

						<b><p>${bus.busName}</p></b>
						<p>
							<b>${bus.busType}</b>
						</p>
					</div>

					<div class="col-sm-2">
						<p>Boarding Point & Time</p>

						<b><p>${bus.busType}</p></b>
						<p>
							<b>${bus.boardTime}</b>
						</p>
					</div>

					<div class="col-sm-2">
						<p>Seat No(s):</p>

						<b><p>${(bus.maxSeats-bus.seatsAvailable)+1}</p></b>
					</div>
				</div>


			</div>
			<!-- panel body  2 finish -->



		</div>

	</div>


	<div class="col-sm-4">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3>Fare Details</h3>
			</div>
			<div class="panel-body">
				<div class="col-sm-3">
					<h4>
						<p>GrandTotal:&nbsp;&nbsp;&nbsp;&#8377;&nbsp;${bus.price }</p>
					</h4>
				</div>

			</div>
			<div class="panel-footer">

				<h4>
					<p align="right">You
						Pay:&nbsp;&nbsp;&nbsp;&#8377;&nbsp;${bus.price }</p>
				</h4>

			</div>

		</div>
	</div>

	<div class="col-sm-11">
		<div class="well well-sm">
			<h4>
				<span class="label label-default">&nbsp;&nbsp;2&nbsp;&nbsp;</span>&nbsp;&nbsp;Traveller
				Details
			</h4>

		</div>
	</div>



	<div class="col-sm-10">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3>Traveller's Info</h3>
			</div>
			<div class="panel-body">

				<form class="form-inline" action="${contextRoot}/bus/confirmBooking">
					<div class="form-group">
						<label for="sel1">Traveller 1 Name</label> <select
							class="form-control" id="sel1" name="sel1">
							<option>Title</option>
							<option value="Mr">Mr</option>
							<option value="Mrs">Mrs</option>
							<option value="Ms">Ms</option>
							<option value="Master">Master</option>

						</select>
						 
						<input type="text" class="form-control" id="name" placeholder="Enter Name" name="name"> 
							
							<select class="form-control" id="sel1" name="gender">
							<option>Gender</option>
							<option value="Male">Male</option>
							<option value="Female">Female</option>
							<option value="Others">Others</option>
						</select> <input type="text" class="form-control" id="age"
							placeholder="Age" name="age">
						<div class="form-group">

							<h4>
								Seat No: <span class="badge">${(bus.maxSeats-bus.seatsAvailable)+1}</span>
							</h4>
						</div>
						<br>
						<br>

						<div class="form-group">
							<label for="email">Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
							<input type="email" class="form-control" id="email" placeholder="" name="email">

						</div>
						<br>
						<br>
						<div class="form-group">
							<label for="email">Mobile Number:&nbsp;&nbsp;</label> <input
								type="text" class="form-control" id="phone" placeholder=""
								name="phone"> <br>
							<br> <input type="hidden" name="id" value="${bus.id }" /> <input
								type="hidden" name="seatNo"
								value="${(bus.maxSeats-bus.seatsAvailable)+1}" /> <input
								class="btn btn-primary btn-lg" type="submit"
								class="form-control" value="Confirm Booking">

						</div>
				</form>
			</div>
		</div>
	</div>

</div>
</div>