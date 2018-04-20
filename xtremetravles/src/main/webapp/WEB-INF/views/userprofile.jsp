<div class="container bootstrap snippet">
    <div class="row">
        <div class="col-sm-10">
            <h1>My Account </h1></div>
        <div class="col-sm-2">
            <a href="/users" class="pull-right"><img title="profile image" class="img-circle img-responsive" src="https://bootdey.com/img/Content/avatar/avatar1.png"></a>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-3">
            <!--left col-->

            <ul class="list-group">
                <li class="list-group-item text-muted">Profile</li>
                <li class="list-group-item text-right"><span class="pull-left"><strong>Email:</strong></span>${user.email }</li>
                <li class="list-group-item text-right"><span class="pull-left"><strong>Phone:</strong></span>${user.contactNumber }</li>
                <li class="list-group-item text-right"><span class="pull-left"><strong>Name:</strong></span>${user.firstName} ${user.lastName }</li>

            </ul>
        </div>
        <!--/col-3-->
        <div class="col-sm-9">

            <ul class="nav nav-tabs" id="myTab">
                <li class="active"><a href="#home" data-toggle="tab">Bus Booking</a></li>
                <li><a href="#messages" data-toggle="tab">Cab Booking</a></li>
                <li><a href="#settings" data-toggle="tab">Flight Booking</a></li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane active" id="home">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Pnr</th>
                                    <th>Booking Date</th>
                                    <th>Passenger Name</th>
                                    <th>Passenger Phone</th>
                                    <th>TransactionId </th>
                                    <th>Fare </th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="items">
                            <c:forEach var="bookbus" items="${bookbus}">
			       <tr>
			           
			           <td><c:out value="${bookbus.id}"/></td>
			            <td><c:out value="${bookbus.pnr}"/></td>
			           <td><c:out value="${bookbus.date}"/></td>
    			       <td><c:out value="${bookbus.passengerName}"/></td>
    			       <td><c:out value="${bookbus.passengerPhone}"/></td>
    			       <td><c:out value="${bookbus.transactionId}"/></td>
    			       <td><c:out value="${bookbus.fare}"/></td>
      </tr>
</c:forEach>                                
                            </tbody>
                        </table>
                        <hr>
                        <div class="row">
                            <div class="col-md-4 col-md-offset-4 text-center">
                                <ul class="pagination" id="myPager"></ul>
                            </div>
                        </div>
                    </div>
                    <hr>

                </div>
                
                <div class="tab-pane" id="messages">

                       <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Pnr</th>
                                    <th>Booking Date</th>
                                    <th>Passenger Name</th>
                                    <th>Passenger Phone</th>
                                    <th>TransactionId </th>
                                    <th>Fare </th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="items">
                            <c:forEach var="bookcab" items="${bookcab}">
			       <tr>
			           
			           <td><c:out value="${bookcab.id}"/></td>
			            <td><c:out value="${bookcab.pnr}"/></td>
			           <td><c:out value="${bookcab.date}"/></td>
    			       <td><c:out value="${bookcab.passengerName}"/></td>
    			       <td><c:out value="${bookcab.passengerPhone}"/></td>
    			       <td><c:out value="${bookcab.transactionId}"/></td>
    			       <td><c:out value="${bookcab.fare}"/></td>
      </tr>
</c:forEach>                                
                            </tbody>
                        </table>
                        <hr>
                        <div class="row">
                            <div class="col-md-4 col-md-offset-4 text-center">
                                <ul class="pagination" id="myPager"></ul>
                            </div>
                        </div>

                </div>
                </div>
                <!--/tab-pane-->
                <div class="tab-pane" id="settings">

                    <hr>
                    
                      <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Pnr</th>
                                    <th>Booking Date</th>
                                    <th>Passenger Name</th>
                                    <th>Passenger Phone</th>
                                    <th>TransactionId </th>
                                    <th>Fare </th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="items">
                            <c:forEach var="bookflight" items="${bookflight}">
			       <tr>
			           
			           <td><c:out value="${bookflight.id}"/></td>
			            <td><c:out value="${bookflight.pnr}"/></td>
			           <td><c:out value="${bookflight.date}"/></td>
    			       <td><c:out value="${bookflight.passengerName}"/></td>
    			       <td><c:out value="${bookflight.passengerPhone}"/></td>
    			       <td><c:out value="${bookflight.transactionId}"/></td>
    			       <td><c:out value="${bookflight.fare}"/></td>
      </tr>
</c:forEach>                                
                            </tbody>
                        </table>
                        <hr>
                        <div class="row">
                            <div class="col-md-4 col-md-offset-4 text-center">
                                <ul class="pagination" id="myPager"></ul>
                            </div>
                        </div>

                </div>
                                           
                </div>

            </div>
            <!--/tab-pane-->
        </div>
        <!--/tab-content-->

    </div>
    <!--/col-9-->
</div>
<!--/row-->
