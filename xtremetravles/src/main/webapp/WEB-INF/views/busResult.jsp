<script type="text/javascript">
					window.boardPoint='${boardPoint}';
						window.dropPoint='${dropPoint}';
					</script>
					
					
	<%
	Class.forName("org.h2.Driver");
    Connection con = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/xtremetravels","prem","prem");
    PreparedStatement  st=con.prepareStatement("Select * from SeatLayout where busId=?;");
    %>
    
    			
<div class="container">
			
				
					
				<div class="col-sm-10">
<div class="table-responsive">
<table class="table table-hover">
    <thead>
    <tr>
								<th>Travels</th>
							    <th>BoardTime</th>
								<th>DropTime</th>
							    <th>Fare</th>
							    <th>No of Seats</th>
								<th></th>
								
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${buslist}" var="bus">
        <tr>
            <td><c:out value="${bus.busName}"/><br><c:out value="${bus.busType}"/><br><br><c:out value="${bus.aminities}"/><br></td>
            <td><c:out value="${bus.boardTime}"/></td> 
             <td><c:out value="${bus.dropTime}"/></td>  
             <td><c:out value="${bus.price}"/></td>
             <td><c:out value="${bus.seatsAvailable}"/></td>
             <td><button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Select Seats</button></td>
        </tr>
       
    </c:forEach>
        </tbody>
  </table>
  </div>
		</div>
				
<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Seat Selection</h4>
        </div>
        <div class="modal-body">
         
      <h2 style="font-size:1.2em;"> Choose seats by clicking the corresponding seat in the layout below:</h2>
       <div id="holder"> 
    <ul  id="place">
        </ul>    
  </div>
   <div style="width:600px;text-align:center;overflow:auto"> 
  <ul id="seatDescription">
<li style="background:url('${images}/available_seat_img.png') no-repeat scroll 0 0 transparent;">Available Seat</li>
<li style="background:url('${images}/booked_seat_img.png') no-repeat scroll 0 0 transparent;">Booked Seat</li>
<li style="background:url('${images}/selected_seat_img.png') no-repeat scroll 0 0 transparent;">Selected Seat</li>
  </ul>        </div>


    </form>
    <script type="text/javascript">
        $(function () {
            var settings = {
                rows: 4,
                cols: 9,
                rowCssPrefix: 'row-',
                colCssPrefix: 'col-',
                seatWidth: 50,
                seatHeight: 50,
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
            var bookedSeats = [5, 10, 25,35,45,55];
            init(bookedSeats);


            $('.' + settings.seatCss).click(function () {
      if ($(this).hasClass(settings.selectedSeatCss)){
        alert('This seat is already reserved');
      }
      else{
                $(this).toggleClass(settings.selectingSeatCss);
        }
            });

            
        });
    
    </script>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
		</div>
		