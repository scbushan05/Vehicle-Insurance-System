$(function(){
	switch(title){
		case 'Home':
			$('#home').addClass('active');
			$('#homeSidebar').addClass('active');
			break;
			
		case 'User':
			$('#user').addClass('active');
			$('#userSidebar').addClass('active');
			break;
			
		case 'Insurance':
			$('#insurance').addClass('active');
			$('#insuranceSidebar').addClass('active');
			break;
			
		case 'Vehicle':
			$('#vehicle').addClass('active');
			$('#vehicleSidebar').addClass('active');
			break;
			
		case 'Search':
			$('#search').addClass('active');
			$('#searchSidebar').addClass('active');
			break;
			
		default:
			$('#home').addClass('active');
			break;
	}
	
	$("div.sucessDialog").fadeOut(3000);
	$("div.updateDialog").fadeOut(3000);
	$("div.deleteDialog").fadeOut(3000);
	
})

	
