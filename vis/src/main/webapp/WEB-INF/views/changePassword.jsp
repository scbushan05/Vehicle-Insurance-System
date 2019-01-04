<div style = "padding: 5px;">
	<form id="changePasswordForm" action="${contextRoot}/change/changePassword.html" method="post">
		<div class = "row">
			<div class="form-group">
				<label for="username">Old Password</label>
				<input name="oldPassword" placeholder="Old Password" class="form-control" type = "password" id = "oldPassword"/>
			</div>
	
			<div class="form-group">
				<label for="nationality">New Password</label>
				<input name="newPassword" placeholder="New Password" class="form-control" type = "password" id = "newPassword"/>
			</div>
		</div>
	</form>
</div>