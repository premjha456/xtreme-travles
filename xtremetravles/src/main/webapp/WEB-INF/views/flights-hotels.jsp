	<!-- banner -->
	<div class="banner holidays-banner fh-banner">
		<!-- container -->
		<div class="container">
			<div class="col-md-4 banner-left">
				<section class="slider2">
					<div class="flexslider">
						<ul class="slides">
							<li>
								<div class="slider-info">
									<img src="${images}/1.jpg" alt="">
								</div>
							</li>
							<li>
								<div class="slider-info">
									<img src="${images}/2.jpg" alt="">
								</div>
							</li>
							<li>	
								<div class="slider-info">
									<img src="${images}/3.jpg" alt="">
								</div>
							</li>
							<li>	
								<div class="slider-info">
									<img src="${images}/4.jpg" alt="">
								</div>
							</li>
							<li>	
								<div class="slider-info">
									<img src="${images}/2.jpg" alt="">
								</div>
							</li>
						</ul>
					</div>
				</section>
				<!--FlexSlider-->
			</div>
			<div class="col-md-8 banner-right">
				<div class="sap_tabs">	
					<div class="booking-info about-booking-info">
						<h2>Book your trip with your choice of travel & stay</h2>
					</div>
					<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">	
						  <!---->		  	 
									<div class="facts about-facts train-facts">
										<div class="booking-form train-form">
										<link rel="stylesheet" href="${css}/jquery-ui.css" />
											<!---strat-date-piker---->
											<script>
												$(function() {
													$( "#datepicker,#datepicker1" ).datepicker();
												});
											</script>
											<!---/End-date-piker---->
											<!-- Set here the key for your domain in order to hide the watermark on the web server -->
											
											<div class="online_reservation">
														<div class="b_room">
															<h3>Flight</h3>
															<div class="booking_room">
																<div class="reservation">
																	<ul>		
																		<li class="span1_of_1 desti">
																			 <h5>Flying from</h5>
																			 <div class="book_date">
																				 <form>
																					<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
																					<input type="text" placeholder="Type Departure City" class="typeahead1 input-md form-control tt-input" required="">
																				 </form>
																			 </div>					
																		 </li>
																		 <li class="span1_of_1 left desti">
																			 <h5>Flying to</h5>
																			 <div class="book_date">
																			 <form>
																				<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
																				<input type="text" placeholder="Type Destination City" class="typeahead1 input-md form-control tt-input" required="">
																			 </form>
																			 </div>		
																		 </li>
																		 <div class="clearfix"></div>
																	</ul>
																</div>
																<div class="reservation">
																	<ul>	
																		 <li  class="span1_of_1">
																			 <h5>Check in</h5>
																			 <div class="book_date">
																			 <form>
																				<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
																				<input type="date" value="Select date" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Select date';}">
																			</form>
																			 </div>		
																		 </li>
																		 <li  class="span1_of_1 left">
																			 <h5>Check out</h5>
																			 <div class="book_date">
																				 <form>
																					<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
																					<input type="date" value="Select date" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Select date';}">
																				</form>
																			 </div>					
																		 </li>
																		 <li class="span1_of_1 left f-adult">
																			 <h5>Adults (18+)</h5>
																			 <!----------start section_room----------->
																			 <div class="section_room">
																				  <select id="country" onchange="change_country(this.value)" class="frm-field required">
																						<option value="null">1</option>
																						<option value="null">2</option>         
																						<option value="AX">3</option>
																						<option value="AX">4</option>
																						<option value="AX">5</option>
																						<option value="AX">6</option>
																				  </select>
																			 </div>	
																		</li>
																		<li class="span1_of_1 left f-child">
																			 <h5>Children (0-17)</h5>
																			 <!----------start section_room----------->
																			 <div class="section_room">
																				  <select id="country" onchange="change_country(this.value)" class="frm-field required">
																						<option value="null">1</option>
																						<option value="null">2</option>         
																						<option value="AX">3</option>
																						<option value="AX">4</option>
																						<option value="AX">5</option>
																						<option value="AX">6</option>
																				  </select>
																			 </div>	
																		</li>
																		 <div class="clearfix"></div>
																	</ul>
																</div>
															</div>
															<div class="clearfix"></div>
														</div>
														<div class="b_room">
															<h3>Hotel</h3>
															<div class="booking_room">
																<div class="reservation">
																	<ul>		
																		<li  class="span1_of_1 desti about-desti">
																			 <h5>Going to</h5>
																			 <div class="book_date">
																				 <form>
																					<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
																					<input type="text" placeholder="City, Area or Hotel Name" class="typeahead1 input-md form-control tt-input" required="">
																				 </form>
																			 </div>					
																		 </li>
																	</ul>
																</div>
																<div class="reservation">
																	<ul>	
																		 <li  class="span1_of_1">
																			 <h5>Check in</h5>
																			 <div class="book_date">
																			 <form>
																				<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
																				<input type="date" value="Select date" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Select date';}">
																			</form>
																			 </div>		
																		 </li>
																		 <li  class="span1_of_1 left">
																			 <h5>Check out</h5>
																			 <div class="book_date">
																				 <form>
																					<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
																					<input type="date" value="Select date" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Select date';}">
																				</form>
																			 </div>					
																		 </li>
																		 <div class="clearfix"></div>
																	</ul>
																</div>
																<div class="reservation">
																	<ul>	
																		 <li class="span1_of_3">
																				<div class="date_btn">
																					<form>
																						<input type="submit" value="Search" />
																					</form>
																				</div>
																		 </li>
																		 <div class="clearfix"></div>
																	</ul>
																</div>
															</div>
															<div class="clearfix"></div>
														</div>
											</div>
											<!---->
										</div>	
									</div>
					</div>	
				</div>
			</div>
			<div class="clearfix"> </div>
		</div>
		<!-- //container -->
	</div>
	<!-- //banner -->
	<div class="move-text">
		<div class="marquee">Register your hotel with us free of cost.<a href="signup.html">Here</a></div>
		<script type="text/javascript" src="${js}/jquery.marquee.min.js"></script>
        <script>
		  $('.marquee').marquee({ pauseOnHover: true });
		  //@ sourceURL=pen.js
		</script>
	</div>
