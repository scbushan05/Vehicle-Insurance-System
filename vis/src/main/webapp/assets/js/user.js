$(function(){
	
	$('#userTable').DataTable( {
        dom: 'Bfrtip',
        buttons: [
        	{
                extend: 'print',
                exportOptions: {
                    columns: ':visible'
                }
            },
            {
                extend: 'print',
                text: 'Print selected',
                exportOptions: {
                    columns: ':visible'
                }
            },
            {
            	extend: 'excelHtml5',
                exportOptions: {
                    columns: ':visible'
                }
            },
            {
            	extend: 'csvHtml5',
                exportOptions: {
                    columns: ':visible'
                }
            },
            {
            	extend: 'pdfHtml5',
                exportOptions: {
                    columns: ':visible'
                }
            },
            'colvis'
        ],
        select: true
    } );
	
	$('[data-toggle="tooltip"]').tooltip();
})