<div class="container bootstrap snippet">
    <div class="row">
        <div class="col-sm-10">
            <h1>My Account</h1>
            <h4>Welcome to Agent Dashboard</h4>
            </div>
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
                <li class="active"><a href="#home" data-toggle="tab">Bus</a></li>
                <li><a href="#messages" data-toggle="tab">Cab</a></li>
                <li><a href="#settings" data-toggle="tab">Flight</a></li>
                <li><a href="#actions" data-toggle="tab">Actions</a></li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane active" id="home">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Busname</th>
                                    <th>Board Point</th>
                                    <th>Drop Point</th>
                                    <th>Date</th>
                                    <th>Seat Available </th>
                                    <th>Fare </th>
                                </tr>
                            </thead>
                            <tbody id="items">
                            <c:forEach var="lsbus" items="${lsbus}">
			       <tr>
			           
			           <td><c:out value="${lsbus.id}"/></td>
			            <td><c:out value="${lsbus.busName}"/></td>
			           <td><c:out value="${lsbus.boardPoint}"/></td>
    			       <td><c:out value="${lsbus.dropPoint}"/></td>
    			       <td><c:out value="${lsbus.date}"/></td>
    			       <td><c:out value="${lsbus.seatsAvailable}"/></td>
    			       <td><c:out value="${lsbus.price}"/></td>
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
                                    <th>Flight Name</th>
                                    <th>Board Point</th>
                                    <th>Drop Point</th>
                                    <th>Date</th>
                                    <th>Seat Available </th>
                                    <th>Fare</th>
                                </tr>
                            </thead>
                            <tbody id="items">
                           <c:forEach var="lsflight" items="${lsflight}">
			       <tr>
			           
			           <td><c:out value="${lsflight.id}"/></td>
			            <td><c:out value="${lsflight.flightName}"/></td>
			           <td><c:out value="${lsflight.boardPoint}"/></td>
    			       <td><c:out value="${lsflight.dropPoint}"/></td>
    			       <td><c:out value="${lsflight.date}"/></td>
    			       <td><c:out value="${lsflight.seatsAvailable}"/></td>
    			       <td><c:out value="${lsflight.fare}"/></td>
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
                                    <th>Cab Name</th>
                                    <th>Board Point</th>
                                    <th>Drop Point</th>
                                    <th>Date</th>
                                    <th>Aminities</th>
                                    <th>Fare</th>

                                </tr>
                            </thead>
                            <tbody id="items">
                            <c:forEach var="lscab" items="${lscab}">
			       <tr>
			           
			           <td><c:out value="${lscab.id}"/></td>
			            <td><c:out value="${lscab.cabName}"/></td>
			           <td><c:out value="${lscab.boardPoint}"/></td>
    			       <td><c:out value="${lscab.dropPoint}"/></td>
    			       <td><c:out value="${lscab.date}"/></td>
    			       <td><c:out value="${lscab.aminities}"/></td>
    			       <td><c:out value="${lscab.fare}"/></td>
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

           
            
            
            
            
            
            <div class="tab-pane" id="actions">
            <br>
            <a href="${contextRoot}/manage/bus" class="btn btn-primary btn-lg">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add Bus &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
            <a  href="${contextRoot}/manage/flight" class="btn btn-primary btn-lg">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add Flight &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
            <a href="${contextRoot}/manage/cab" class="btn btn-primary btn-lg">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add Cab&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
            <br><br>
            <a href="${contextRoot}/manage/bus" class="btn btn-primary btn-lg">Edit / Delete Bus </a>
            <a href="${contextRoot}/manage/flight" class="btn btn-primary btn-lg">Edit / Delete Flight</a>
            <a href="${contextRoot}/manage/cab" class="btn btn-primary btn-lg">Edit / Delete Cab</a>
            
            

            </div>
            
            
            </div>
            <!--/tab-pane-->
        </div>
        <!--/tab-content-->

    </div>
    <!--/col-9-->
</div>
<!--/row-->
<br><br>