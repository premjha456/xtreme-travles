	<!-- banner bus -->
	<div class="banner bus-banner">
		<!-- container -->
		<div class="container">
			<div class="col-md-4 banner-left">
				<section class="slider2">
					<div class="flexslider">
						<ul class="slides">
							<li>
								<div class="slider-info">
									<img src="${images}/5.jpg" alt="">
								</div>
							</li>
							<li>
								<div class="slider-info">
									<img src="${images}/6.jpg" alt="">
								</div>
							</li>
							<li>	
								<div class="slider-info">
									<img src="${images}/7.jpg" alt="">
								</div>
							</li>
							<li>	
								<div class="slider-info">
									<img src="${images}/8.jpg" alt="">
								</div>
							</li>
							<li>	
								<div class="slider-info">
									<img src="${images}/6.jpg" alt="">
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
						<h2>Book Bus Tickets Online</h2>
					</div>
					<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">	
						  <!---->		  	 
									<div class="facts about-facts">
										<div class="booking-form">
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
											<form action="${contextRoot}/bus/listBus">
												<div class="b_room">
															<div class="booking_room">
																<div class="reservation">
																	<ul>		
																		<li class="span1_of_1 desti">
																			 <h5>From</h5>
																			 <div class="book_date">
																				  
																					<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
																					<input type="text" name="boardPoint" placeholder="Type Departure City" class="typeahead1 input-md form-control tt-input" required="">
																				 </form>
																			 </div>					
																		 </li>
																		 <li class="span1_of_1 left desti">
																			 <h5>To</h5>
																			 <div class="book_date">
																			  
																				<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
																				<input type="text" name="dropPoint" placeholder="Type Destination City" class="typeahead1 input-md form-control tt-input" required="">
																			 </div>		
																		 </li>
																		 <div class="clearfix"></div>
																	</ul>
																</div>
																<div class="reservation">
																	<ul>	
																		 <li  class="span1_of_1">
																			 <h5>Departing</h5>
																			 <div class="book_date">
																			  
																				<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
																				<input type="date" name="departDate" value="Select date" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Select date';}">
																			 </div>		
																		 </li>
																		 <li class="span1_of_1 left">
																			 <h5>Adults (18+)</h5>
																			 <!----------start section_room----------->
																			 <div class="section_room">
																				  <select id="country" onchange="change_country(this.value)" class="frm-field required">
																						<option value="1">1</option>
																						<option value="2">2</option>         
																						<option value="3">3</option>
																						<option value="4">4</option>
																						<option value="5">5</option>
																						<option value="6">6</option>
																				  </select>
																			 </div>	
																		</li>
																		<li class="span1_of_1 left">
																			 <h5>Children (0-17)</h5>
																			 <!----------start section_room----------->
																			 <div class="section_room">
																				  <select id="country" onchange="change_country(this.value)" class="frm-field required">
																						<option value="0">0</option>
																						<option value="1">1</option>
																						<option value="2">2</option>         
																						<option value="3">3</option>
																						<option value="4">4</option>
																						<option value="5">5</option>
																						<option value="6">6</option>
																				  </select>
																			 </div>	
																		</li>
																		 <div class="clearfix"></div>
																	</ul>
																</div>
																<div class="reservation">
																	<ul>	
																		 <li class="span1_of_3">
																				<div class="date_btn">
																					 
																						<input type="submit" value="Search">
																				</div>
																		 </li>
																		 <div class="clearfix"></div>
																	</ul>
																</div>
															</div>
															<div class="clearfix"></div>
															</form>
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
		<div class="marquee">Register your hotel with us free of cost.<a href="${contextRoot}/signup">Here</a></div>
		<script type="text/javascript" src="${js}/jquery.marquee.min.js"></script>
        <script>
		  $('.marquee').marquee({ pauseOnHover: true });
		  //@ sourceURL=pen.js
		</script>
	</div>
	<!-- banner-bottom -->
