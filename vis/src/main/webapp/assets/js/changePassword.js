$(function(){
	
	var dialogDiv = $('#changePasswordDialog');
	
	function clearInputFields() {
        $('#changePasswordForm input[type="password"]').val('');
    }
	
	dialogDiv.dialog({
        autoOpen: false,
        modal: true,
        title: 'Change Password',
        buttons: {
            'Save': changePassword,
            'Cancel': function () {
                dialogDiv.dialog('close');
                clearInputFields();
            }
        },
        close : function() {
			$(this).dialog('close');
		},
		open: function () {
            $('.ui-dialog').css("top","25%");
            $('.ui-dialog').css("left","40%");
        }
    });
	
	$('a#changePassword').click(function () {
        dialogDiv.dialog("open");
    });
	
	function changePassword() {
	    var oldPassword = $('#oldPassword').val();
	    var newPassword = $('#newPassword').val();

	    $.ajax({
	        url: contextRoot+'/change/changePassword',
	        method: 'post',
	        data: {
	        	'oldPassword': oldPassword,
	        	'newPassword': newPassword
	        },
	        success: function (response) {
	        	debugger;
	        	dialogDiv.dialog('close');
	        	if(response == "true"){
	        		$.alert({
	        			title: 'Alert!',
	        		    content: 'Password changed successfully!',
	        		});
	        	}else{
	        		$.alert({
	        			title: 'Alert!',
	        		    content: 'Not matching with old password!',
	        		});
	        	}
	        	clearInputFields();
	        },
	        error: function (error) {
	            alert(error);
	        }
	    });
	}
})

