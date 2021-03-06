$(document).ready(function(){
	
	    $('#feed').DataTable();

	/* This code is executed after the DOM has been completely loaded */

	/* Changing thedefault easing effect - will affect the slideUp/slideDown methods: */
	$.easing.def = "easeOutBounce";

	/* Binding a click event handler to the links: */
	$('li.button a').click(function(e){
	
		/* Finding the drop down list that corresponds to the current section: */
		var dropDown = $(this).parent().next();
		
		/* Closing all other drop down sections, except the current one */
		$('.dropdown').not(dropDown).slideUp('slow');
		dropDown.slideToggle('slow');
		
		/* Preventing the default event (which would be to navigate the browser to the link's address) */
		e.preventDefault();
	})
	
	switch (menu) {

	case 'Flight':
		$('#flight').addClass('active');		console.log(menu)

		break;
	case 'Bus':
		$('#bus').addClass('active');		console.log(menu)

		break;
	case 'Cab':
		$('#cab').addClass('active');		console.log(menu)

		break;
	case 'Manage Bus':
		$('#manbus').addClass('active');
		break;
	case 'Manage Flight':
		$('#manflight').addClass('active');
		break;	
	case 'Manage Cab':
		$('#mancab').addClass('active');
		break;
	
	default:
		if (menu == "Home")
			break;
		$('#listProducts').addClass('active');
		$('#a_' + menu).addClass('active');
		break;
	}

	
		  

	  var $url=window.contextRoot + '/json/data/'+ window.boardPoint +'/'
							+ window.dropPoint +'/'+ window.date+'/cabs';

						
						$.ajax({
	                        
		                       url:$url,
		                       dataType:"json",
		                       success:function(res){
		                          var data="";
		                          for(i=0;i<res.length;i++){
		                              var p=res[i];
		                              data+='<tr><td>'+'<img src="' + window.contextRoot
		 									+ '/resources/images/' + p.cabType
		 									+ '.png" class="cabImg"/></td><td>'+'<b><font size="5">'+p.cabType+'</font></b><br>'+p.aminities+'<br>'+ p.cabName+'</td><td><font size="5">'+p.boardPoint+'</font></td><td><font size="5">'+p.dropPoint+'</font></td><td> <font size="5"> &#8377;'+p.fare+'</font><br><b>(Excluding GST)</b></br></td><td><a href="'+window.contextRoot+'/book/cab/'+p.id+'/cabReview" class="btn btn-primary">Select Cab</a></td></tr>';
		                          }
		                          $('#content').html(data);
		                       },
		                       error:function() {
		                           $alert("error occured");
		                       }
		                   });

						
						
						
						
						
	
	
var $table =$('#listbus');
	
	if($table.length){
				
		var jsonUrl = '';
		if (window.boardPoint == ''&& window.dropPoint == '' ) {
			jsonUrl = window.contextRoot + '/json/data/all/bus';
		} else {
			jsonUrl = window.contextRoot + '/json/data/'+ window.boardPoint +'/'
					+ window.dropPoint +'/'+ window.date+'/'+window.seat+'/bus';
}
		console.log(jsonUrl);
		$table.DataTable({

			lengthMenu:[[3,5,10],['3 Records','5 Records','10 Records']],
			pageLength:5,
			ajax:{
				
				url:jsonUrl,
				dataSrc:''
			},
			
			columns:[
				
				{
					data:'busName'
				},
				{
					data:'boardTime'
				},
				{
					data:'dropTime'
				},
				
				{
					data:'seatsAvailable'
				},
				{
					data:'price',
					mRender:function(data,type,row){
						
						return '&#8377 '+data
					}
				},
				
				{
					data : 'id',
					bSortable : false,
					mRender : function(data, type, row) {

						var str = '';
						str += '<a href="'
								+ window.contextRoot
								+ '/book/bus/'
								+ data+'/'+window.seat
								+ '/busReview" class="btn btn-primary">Select Bus</a> &#160;';


						return str;
				}
				}
				]
		});
	}	
		
		

	
	
	
	
	var $table =$('#listflight');

	if($table.length){
				
		var jsonUrl = '';
		if (window.boardPoint == ''&& window.dropPoint == '' ) {
			jsonUrl = window.contextRoot + '/json/data/all/flight';
		} else {
			jsonUrl = window.contextRoot + '/json/data/'+ window.boardPoint +'/'
					+ window.dropPoint +'/'+window.date+'/'+window.requiredSeats+'/'+ window.travelClass+'/flight';
	}
		console.log(jsonUrl);
		$table.DataTable({

			lengthMenu:[[3,5,10],['3 Records','5 Records','10 Records']],
			pageLength:5,
			ajax:{
				
				url:jsonUrl,
				dataSrc:''
			},
			
			columns:[
				
				{
					data:'flightName',
					bSortable : false,
					mRender : function(data, type, row) {

						return '<img src="' + window.contextRoot
								+ '/resources/images/' + data
								+ '.jpg" class="dataTableImg"/>';
					}
			
				},
				{data:'boardTime'
				},
				{
					data:'dropTime'
				},
				{
					data:'flightName'
				},
				{
					data:'seatsAvailable'
				},
				{
					data:'fare',
					mRender:function(data,type,row){
						
						return '&#8377 '+data
					}
				},
				
				{
					data : 'id',
					bSortable : false,
					mRender : function(data, type, row) {

						var str = '';
						str += '<a href="'
								+ window.contextRoot
								+ '/book/flight/'
								+ data
								+'/'+ window.travelClass+'/'+ window.requiredSeats
								+ '/flightReview" class="btn btn-primary">&nbsp;&nbsp;&nbsp;Book&nbsp;&nbsp;&nbsp;</a> &#160;';


						return str;
				}
				}
				]
		});
	}	
	
	
var $table =$('#feedback');
	
	if($table.length){
				
		var jsonUrl = window.contextRoot + '/json/data/viewfeedback';
		
		console.log(jsonUrl);
		$table.DataTable({

			lengthMenu:[[3,5,10],['3 Records','5 Records','10 Records']],
			pageLength:5,
			ajax:{
				
				url:jsonUrl,
				dataSrc:''
			},
			
			columns:[
				
				{
					data:'name'
				},
				{
					data:'email'
				},
				{
					data:'comment'
				}
		]
		});
	}	
		




	var $tabel = $('#busTable');
		
		
		if($tabel.length) {
			
			var jsonUrl = window.contextRoot + '/json/data/agent/'+window.id+'/all/bus';
			console.log(jsonUrl);
			
			$tabel.DataTable({
						lengthMenu : [ [ 10, 30, 50, -1 ], [ '10 Records', '30 Records', '50 Records', 'ALL' ] ],
						pageLength : 10,
						ajax : {
							url : jsonUrl,
							dataSrc : ''
						},
						columns : [		


						           	{data   :  'busName'
						           	},
						           	{
										data : 'busType'
									},
									{
										data : 'aminities'
									},
									{
										data : 'busRegNo'
									},
									{
										data : 'boardPoint'
									},
									{
										data : 'boardTime'
									},
									{
										data : 'dropPoint'
									},
									{
										data : 'dropTime'
									},
									
									{
										data : 'seatsAvailable',
										mRender : function(data, type, row) {

											if (data < 1) {
												return '<span style="color:red">Seats Not Available!</span>';
											}

											return data;

										}
									},
									{
										data : 'price',
										mRender : function(data, type, row) {
											return '&#8377; ' + data
										}
									},
									{
										data : 'active',
										bSortable : false,
										mRender : function(data, type, row) {
											var str = '';
											if(data) {											
												str += '<label class="switch"> <input type="checkbox" value="'+row.id+'" checked="checked">  <div class="slider round"> </div></label>';
												
											}else {
												str += '<label class="switch"> <input type="checkbox" value="'+row.id+'">  <div class="slider round"> </div></label>';
											}
											
											return str;
										}
									},
									{
										data : 'id',
										bSortable : false,
										mRender : function(data, type, row) {

											var str = '';
											str += '<a href="'
													+ window.contextRoot
													+ '/manage/'
													+ data
													+ '/bus" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span></a> &#160;';

											return str;
										}
									}					           	
						],
						
						initComplete: function () {
							var api = this.api();
	                        api.$('.switch input[type="checkbox"]').on('change',function(){
	                       	 
	                        	var dText = (this.checked)? 'You want to activate the Bus?': 'You want to de-activate the Bus?';
	                			var checked = this.checked;
	                            var checkbox = $(this);
	                            var value=checkbox.prop('value')
	                            debugger;
	                            bootbox.confirm({
	                						    	size: 'medium',
	                						    	title: 'Product Activation/Deactivation',
	                						    	message: dText,
	                						    	callback: function (confirmed) {
	                							        if (confirmed) {
	                							        	console.log(value);
	                							        	
	                							        	var activationUrl=window.contextRoot+'/manage/bus/'+value+'/activation';
	                							        	
	                							        	$.post(activationUrl,function(data){
	                							        		bootbox.alert({
		                							            	size: 'medium',
		                									    	title: 'Information',
		                									    	message: data
		                							            });
	                							        	})
	                							            
	                							            }
	                							       
	                							        else {							        	
	                							        	checkbox.prop('checked', !checked);
	                							        }
	                						    	}
	                         });
	                		
	                         });
						}
			
			});
			
			} 	
		
		
		
		
		
		
		
		
		
		

		var $tabel = $('#flightTable');
			
			
			if($tabel.length) {
				
				var jsonUrl = window.contextRoot + '/json/data/agent/'+window.id+'/all/flight';
				console.log(jsonUrl);
				
				$tabel.DataTable({
							lengthMenu : [ [ 10, 30, 50, -1 ], [ '10 Records', '30 Records', '50 Records', 'ALL' ] ],
							pageLength : 10,
							ajax : {
								url : jsonUrl,
								dataSrc : ''
							},
							columns : [		


							           	{data   :  'flightName'
							           	},
							           	{
											data : 'flightType'
										},
										{
											data : 'flightNo'
										},
										{
											data : 'boardPoint'
										},
										{
											data : 'boardTime'
										},
										{
											data : 'dropPoint'
										},
										{
											data : 'dropTime'
										},
										
										{
											data : 'seatsAvailable',
											mRender : function(data, type, row) {

												if (data < 1) {
													return '<span style="color:red">Seats Not Available!</span>';
												}

												return data;

											}
										},
										{
											data : 'fare',
											mRender : function(data, type, row) {
												return '&#8377; ' + data
											}
										},
										{
											data : 'enabled',
											bSortable : false,
											mRender : function(data, type, row) {
												var str = '';
												if(data) {											
													str += '<label class="switch"> <input type="checkbox" value="'+row.id+'" checked="checked">  <div class="slider round"> </div></label>';
													
												}else {
													str += '<label class="switch"> <input type="checkbox" value="'+row.id+'">  <div class="slider round"> </div></label>';
												}
												
												return str;
											}
										},
										{
											data : 'id',
											bSortable : false,
											mRender : function(data, type, row) {

												var str = '';
												str += '<a href="'
														+ window.contextRoot
														+ '/manage/'
														+ data
														+ '/flight" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span></a> &#160;';

												return str;
											}
										}					           	
							],
							
							initComplete: function () {
								var api = this.api();
		                        api.$('.switch input[type="checkbox"]').on('change',function(){
		                       	 
		                        	var dText = (this.checked)? 'You want to activate the Flight?': 'You want to de-activate the Flight?';
		                			var checked = this.checked;
		                            var checkbox = $(this);
		                            var value=checkbox.prop('value')
		                            debugger;
		                            bootbox.confirm({
		                						    	size: 'medium',
		                						    	title: 'Product Activation/Deactivation',
		                						    	message: dText,
		                						    	callback: function (confirmed) {
		                							        if (confirmed) {
		                							        	console.log(value);
		                							        	
		                							        	var activationUrl=window.contextRoot+'/manage/flight/'+value+'/activation';
		                							        	
		                							        	$.post(activationUrl,function(data){
		                							        		bootbox.alert({
			                							            	size: 'medium',
			                									    	title: 'Information',
			                									    	message: data
			                							            });
		                							        	})
		                							            
		                							            }
		                							       
		                							        else {							        	
		                							        	checkbox.prop('checked', !checked);
		                							        }
		                						    	}
		                         });
		                		
		                         });
							}
				
				});
				
				} 	
			
			
			
var $tabel = $('#cabTable');
			
			
			if($tabel.length) {
				
				var jsonUrl = window.contextRoot + '/json/data/agent/'+window.id+'/all/cab';
				console.log(jsonUrl);
				
				$tabel.DataTable({
							lengthMenu : [ [ 10, 30, 50, -1 ], [ '10 Records', '30 Records', '50 Records', 'ALL' ] ],
							pageLength : 10,
							ajax : {
								url : jsonUrl,
								dataSrc : ''
							},
							columns : [		


							           	{data   :  'cabName'
							           	},
							           	{
											data : 'cabType'
										},
										{
											data : 'cabServiceProvider'
										},
										
										{
											data : 'aminities'
										},
										{
											data : 'boardPoint'
										},
										
										{
											data : 'dropPoint'
										},
										
										{
											data : 'date'
										},
										
								        {
											data : 'fare',
											mRender : function(data, type, row) {
												return '&#8377; ' + data
											}
										},
										{
											data : 'active',
											bSortable : false,
											mRender : function(data, type, row) {
												var str = '';
												if(data) {											
													str += '<label class="switch"> <input type="checkbox" value="'+row.id+'" checked="checked">  <div class="slider round"> </div></label>';
													
												}else {
													str += '<label class="switch"> <input type="checkbox" value="'+row.id+'">  <div class="slider round"> </div></label>';
												}
												
												return str;
											}
										},
										{
											data : 'id',
											bSortable : false,
											mRender : function(data, type, row) {

												var str = '';
												str += '<a href="'
														+ window.contextRoot
														+ '/manage/'
														+ data
														+ '/cab" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span></a> &#160;';

												return str;
											}
										}					           	
							],
							
							initComplete: function () {
								var api = this.api();
		                        api.$('.switch input[type="checkbox"]').on('change',function(){
		                       	 
		                        	var dText = (this.checked)? 'You want to activate the Flight?': 'You want to de-activate the Flight?';
		                			var checked = this.checked;
		                            var checkbox = $(this);
		                            var value=checkbox.prop('value')
		                            debugger;
		                            bootbox.confirm({
		                						    	size: 'medium',
		                						    	title: 'Product Activation/Deactivation',
		                						    	message: dText,
		                						    	callback: function (confirmed) {
		                							        if (confirmed) {
		                							        	console.log(value);
		                							        	
		                							        	var activationUrl=window.contextRoot+'/manage/cab/'+value+'/activation';
		                							        	
		                							        	$.post(activationUrl,function(data){
		                							        		bootbox.alert({
			                							            	size: 'medium',
			                									    	title: 'Information',
			                									    	message: data
			                							            });
		                							        	})
		                							            
		                							            }
		                							       
		                							        else {							        	
		                							        	checkbox.prop('checked', !checked);
		                							        }
		                						    	}
		                         });
		                		
		                         });
							}
				
				});
				
				} 	

			
			
		    
		    $(function () {
		            var settings = {
		            rows: 4,
		                cols: 10,
		                rowCssPrefix: 'row-',
		                colCssPrefix: 'col-',
		                seatWidth: 40,
		                seatHeight: 40,
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
		                        str.push('<li onclick="Function'+seatNo+'()" id="sea'+seatNo +'" class="' + className + '"' +
		                                  'style="top:' + (i * settings.seatHeight).toString() + 'px;left:' + (j * settings.seatWidth).toString() + 'px">' +
		                                  '<a title="' + seatNo + '">' + seatNo + '</a>' +
		                                  '</li>');
		                    }
		                }console.log(str)
		                $('#place').html(str.join(''));
		            };
		            //case I: Show from starting
		            //init();
		            //Case II: If already booked
		            var bookedSeats =window.seat
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

		    
		    
		  
});
