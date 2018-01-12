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
						str += '<a href="'
								+ window.contextRoot
								+ '/bus/'
								+ data
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
});
