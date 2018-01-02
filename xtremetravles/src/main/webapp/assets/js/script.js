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
	
	
		var $table =$('#productListTable');
	
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
});

