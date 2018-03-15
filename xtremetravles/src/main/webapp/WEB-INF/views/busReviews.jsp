
<script type="text/javascript">
window.id='${id}'
window.seatNo='${seatNo}'
</script>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<div class="container">
<c:set var="id" value="${bus.id}" />


<div class="well well-lg">${bus}</div>
	<div class="col-sm-11">
		<div class="well well-sm">
			<h4>
				<span class="label label-default">&nbsp;&nbsp;1&nbsp;&nbsp;</span>&nbsp;&nbsp;Review
				Your Trip Details
			</h4>

		</div>
	</div>
	
	
	<script type="text/javascript">
	console.log('Hello')
	</script>
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
						<img src="${images}/buslogo.JPG" class="img-rounded" alt=""
							width="170" height="20">
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

                   <c:forEach items="${busSeatList}" var="se">
         			<b><p>${se}</p></b>
                     
                 </c:forEach>
                  					</div>
				</div>


			</div>
			<!-- panel body  2 finish -->



		</div>

	</div>

<div class="col-sm-5">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3>Select Seats</h3>
			</div>
			<div class="panel-body">

				<h4>Choose seats by clicking the corresponding seat in the
					layout below:</h4>
					
				<div id="holder">
					<ul id="place">
							
					</ul>
				</div>
				</div>
				
				
   	<div class="panel-footer">

			<h5>
		<div style="width: 600px; text-align: center; overflow: auto">
					<ul id="seatDescription">
						<li
							style="background:url('${images}/available_seat_img.png') no-repeat scroll 0 0 transparent;">Available
							Seat</li>
						<li
							style="background:url('${images}/booked_seat_img.png') no-repeat scroll 0 0 transparent;">Booked
							Seat</li>
						<li
							style="background:url('${images}/selected_seat_img.png') no-repeat scroll 0 0 transparent;">Selected
							Seat</li>
					</ul>
				</div>
		</h5>
		</div>

	</div>
</div>

	<script type="text/javascript">
	console.log('Hello')

	</script>
	
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

			<form class="form-inline" action="${contextRoot}/book/bus/confirmBooking">
				<div class="form-group">
					<label for="sel1">Traveller Name</label> <select
						class="form-control" id="sel1" name="sel1">
						<option>Title</option>
						<option value="Mr">Mr</option>
						<option value="Mrs">Mrs</option>
						<option value="Ms">Ms</option>
						<option value="Master">Master</option>

					</select> <input type="text" class="form-control" id="name"
						placeholder="Enter Name" name="name"> <select
						class="form-control" id="sel1" name="gender">
						<option>Gender</option>
						<option value="Male">Male</option>
						<option value="Female">Female</option>
						<option value="Others">Others</option>
					</select> <input type="text" class="form-control" id="age" placeholder="Age"
						name="age">
					<div class="form-group">

						<h4>
							Seat No:
							<c:forEach items="${busSeatList}" var="se">

   							 <span class="badge">${se}</span>
                    
                 </c:forEach>
                  
						</h4>
					</div>
					<br> <br>

					<div class="form-group">
						<label for="email">Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
						<input type="email" class="form-control" id="email" placeholder=""	name="email">

					</div>
					<br> <br>
					<div class="form-group">
						<label for="email">Mobile Number:&nbsp;&nbsp;</label> <input
							type="text" class="form-control" id="phone" placeholder=""
							name="phone"> <br> <br> <input type="hidden"
							name="id" value="${bus.id }" />
						<input class="btn btn-primary btn-lg" type="submit"
							class="form-control" value="Confirm Booking">

					</div>
			</form>
		</div>
	</div>
</div>

</div>
	
</div>
					 <script type="text/javascript">
					 
						console.log('Hello1')

   
$( document ).ready(function (){
    	
    	console.log('Hello2')

    	      var settings = {
                rows: 4,
                cols: 9,
                rowCssPrefix: 'row-',
                colCssPrefix: 'col-',
                seatWidth: 35,
                seatHeight: 35,
                seatCss: 'seat',
                selectedSeatCss: 'selectedSeat',
        selectingSeatCss: 'selectingSeat'
            };
           
            var init = function (reservedSeat) {
                var str = [], seatNo, className;
                for (i = 0; i < settings.rows; i++) {
                    for (j = 0; j < settings.cols; j++) {
                        seatNo = (i + j * settings.rows + 1);
                        className = settings.seatCss + ' ' + settings.rowCssPrefix + i.toString() + ' ' + settings.colCssPrefix + j.toString();
                        if ($.isArray(reservedSeat) && $.inArray(seatNo, reservedSeat) != -1) {
                            className += ' ' + settings.selectedSeatCss;
                        }
                        str.push('<li class="' + className + '"' +
                                  'style="top:' + (i * settings.seatHeight).toString() + 'px;left:' + (j * settings.seatWidth).toString() + 'px">' +
                                  '<a title="' + seatNo + '">' + seatNo + '</a>' +
                                  '</li>');
                    }
                }
                $('#place').html(str.join(''));
            };

            //case I: Show from starting
            //init();

            //Case II: If already booked
            console.log(window.seatNo);
            var reservedSeat = [8,9];
            init(reservedSeat);
            

            $('.' + settings.seatCss).click(function () {
      if ($(this).hasClass(settings.selectedSeatCss)){
        alert('This seat is already reserved');
      }
      else{
                $(this).toggleClass(settings.selectingSeatCss);
        }
            });

            
        });
						console.log('Hello')

    </script>