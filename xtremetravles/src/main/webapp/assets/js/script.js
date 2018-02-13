$(document).ready(function(){
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
	
	
	  var $url=window.contextRoot + '/json/data/'+ window.boardPoint +'/'
							+ window.dropPoint + '/cabs';

						
						$.ajax({
	                        
		                       url:$url,
		                       dataType:"json",
		                       success:function(res){
		                          var data="";
		                          for(i=0;i<res.length;i++){
		                              var p=res[i];
		                              data+='<tr><td>'+'<img src="' + window.contextRoot
		 									+ '/resources/images/' + p.cabType
		 									+ '.png" class="cabImg"/></td><td>'+'<b><font size="5">'+p.cabType+'</font></b><br>'+p.aminities+'<br>'+ p.cabName+'</td><td><font size="5">'+p.boardPoint+'</font></td><td><font size="5">'+p.dropPoint+'</font></td><td> <font size="5"> &#8377;'+p.fare+'</font><br><b>(Excluding GST)</b></br></td><td><a href="'+window.contextRoot+'/cab/'+p.id+'/cabReview" class="btn btn-primary">Select Cab</a></td></tr>';
		                          }
		                          $('#content').html(data);
		                       },
		                       error:function() {
		                           $alert("error occured");
		                       }
		                   });

	// for handling CSRF token
	var token = $('meta[name="_csrf"]').attr('content');
	var header = $('meta[name="_csrf_header"]').attr('content');
	
	if((token!=undefined && header !=undefined) && (token.length > 0 && header.length > 0)) {		
		// set the token header for the ajax request
		$(document).ajaxSend(function(e, xhr, options) {			
			xhr.setRequestHeader(header,token);			
		});				
	}
	
	
	
	
		var $table =$('#listbus');
	
	if($table.length){
				
		var jsonUrl = '';
		if (window.boardPoint == ''&& window.dropPoint == '' ) {
			jsonUrl = window.contextRoot + '/json/data/all/bus';
		} else {
			jsonUrl = window.contextRoot + '/json/data/'+ window.boardPoint +'/'
					+ window.dropPoint + '/bus';
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
					data:'boardTime'
				},
				{
					data:'busName'
				},
				{
					data:'dropTime'
				},
				{
					data:'busName'
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
						str += '<a class="btn btn-primary" data-toggle="modal" data-target="#myModal">Select Seats</a> <div class="container"><!-- Modal --><div class="modal fade" id="myModal" role="dialog"><div class="modal-dialog"><!-- Modal content--><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal">&times;</button><h4 class="modal-title">Modal Header</h4></div><div class="modal-body"> <div style="width:600px;text-align:center;overflow:auto"> <ul id="seatDescription"><li style="background:url(\'images/available_seat_img.png\') no-repeat scroll 0 0 transparent;">Available Seat</li><li style="background:url(\'images/booked_seat_img.png\') no-repeat scroll 0 0 transparent;">Booked Seat</li><li style="background:url(\'images/selected_seat_img.png\') no-repeat scroll 0 0 transparent;">Selected Seat</li></ul></div><div style="width:580px;text-align:left;margin:5px">  <input type="button" id="btnShowNew" value="Show Selected Seats" /><input type="button" id="btnShow" value="Show All" /></div></form><script type="text/javascript">$(function () {var settings = {rows: 4,cols: 9,rowCssPrefix: \'row-\',colCssPrefix: \'col-\',seatWidth: 35,seatHeight: 35,seatCss: \'seat\',selectedSeatCss: \'selectedSeat\',selectingSeatCss: \'selectingSeat\'};var init = function (reservedSeat) {var str = [], seatNo, className;for (i = 0; i < settings.rows; i++) {for (j = 0; j < settings.cols; j++) {seatNo = (i + j * settings.rows + 1)assName = settings.seatCss + settings.rowCssPrefix + i.toString() + ' ' + settings.colCssPrefix + j.toString();if ($.isArray(reservedSeat) && $.inArray(seatNo, reservedSeat) != -1) {className += ' ' + settings.selectedSeatCss;}str.push(\'<li class="\' + className + '"' +\'style=\"top:\' + (i * settings.seatHeight).toString() + \'px;left:\' + (j * settings.seatWidth).toString() + \'px">\' +\'<a title="\' + seatNo + '">' + seatNo + '</a>' +'</li>');}}$('#place').html(str.join(''));}; var bookedSeats = [5, 10, 25,35,45,55];init(bookedSeats);$('.' + settings.seatCss).click(function () {if ($(this).hasClass(settings.selectedSeatCss)){alert(\'This seat is already reserved\');}else{$(this).toggleClass(settings.selectingSeatCss);}});});</script></div><div class=\"modal-footer\"><button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Close</button></div></div></div></div></div>';


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
					+ window.dropPoint + '/flight';
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
								+ '/flight/'
								+ data
								+ '/flightReview" class="btn btn-primary">&nbsp;&nbsp;&nbsp;Book&nbsp;&nbsp;&nbsp;</a> &#160;';


						return str;
				}
				}
				]
		});
	}	
	
	




	var $tabel = $('#busTable');
		
		
		if($tabel.length) {
			
			var jsonUrl = window.contextRoot + '/json/data/admin/all/bus';
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
		
		
		
		
		
		
		
		

		var $table =$('#listcab');

		
		 var $cname="";
         var $caminities="";
         var $cprovider="";
         var $url=window.contextRoot + '/json/data/'+ window.boardPoint +'/'
			+ window.dropPoint + '/cabs';
        
		if($table.length){
					
			$.ajax({
                
                url:$url,
                dataType:"json",
                success:function(res){
                		 var p=res[0];
                         console.log(p);
                         $cname=p.cabName;
                         $caminities=p.aminities;
                         $cprovider=p.cabServiceProvider;
                         console.log($cname);console.log($caminities);console.log($cprovider)
                	
                
                }
                
            });
                				var jsonUrl = '';
 			if (window.boardPoint == ''&& window.dropPoint == '' ) {
 				jsonUrl = window.contextRoot + '/json/data/all/cabs';
 			} else {
 				jsonUrl = window.contextRoot + '/json/data/'+ window.boardPoint +'/'
 						+ window.dropPoint + '/cabs';
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
 						data:'cabType',
 						bSortable : false,
 						mRender : function(data, type, row) {

 							return '<img src="' + window.contextRoot
 									+ '/resources/images/' + data
 									+ '.png" class="cabImg"/> <br> '+'<p>'+$caminities+'</p>';
 						}
 				
 					},
 					

 					{data:'cabType',
 						bSortable : false,
 						mRender : function(data, type, row) {

 							return '<h3>'+ data +'</h3>'+'<br> <p>'+$cname+'</p>';
 						}

 					
 					},
 					{
 						data:'boardPoint'
 					},
 					{
 						data:'dropPoint'
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
 									+ '/cab/'
 									+ data
 									+ '/cabReview" class="btn btn-primary">&nbsp;&nbsp;&nbsp;Select Cab&nbsp;&nbsp;&nbsp;</a> &#160;';


 							return str;
 					}
 					}
 					]
 			});
 			
            

 		}
 				

	
		
});
