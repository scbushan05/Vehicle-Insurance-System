<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div class = "row">

	<!-- Linking the sidebar -->	
	<%@include file="./layouts/sidebar.jsp"%>
			
	<div class = "col-md-9">
		
		<ul class="breadcrumb">
        	<li><a href="${contextRoot}/home">Home</a></li>
        	<li><a href="${contextRoot}/user">Users List</a></li>
        	<li class="active">Add User</li>
    	</ul>
		
		<div class = "row">
			
			<div class = "col-md-8 col-md-offset-2">
			
				<div class="panel panel-primary">
				  	<div class="panel-heading">User Details</div>
			  		<div class="panel-body">
	  					
	  					<form:form class="form-horizontal" action="${contextRoot}/saveUserData.html" modelAttribute="user">
	  						<div class = "form-group">
	  							<label class="control-label col-md-4" for="username"><spring:message code="username"/>:</label>
	  							<div class="col-md-6">
      								<form:input type="text" path = "name" class="form-control" id="username" />
    							</div>
	  						</div>
	  						
	  						<div class = "form-group">
	  							<label class="control-label col-md-4" for="password"><spring:message code="password"/>:</label>
	  							<div class="col-md-6">
      								<form:input type="password" path = "password" class="form-control" id="password" />
    							</div>
	  						</div>
	  						
	  						<div class = "form-group">
	  							<label class="control-label col-md-4" for="gender"><spring:message code="gender"/>Gender:</label>
	  							<div class="col-md-6">
      								<form:select path = "gender" class = "form-control" id = "gender">
                            			<form:option value = "Male">Male</form:option>
                            			<form:option value = "Female">Female</form:option>
                        			</form:select>
    							</div>
	  						</div>
	  						
	  						<div class = "form-group">
	  							<label class="control-label col-md-4" for="nationality"><spring:message code="nationality"/>:</label>
	  							<div class="col-md-6">
      								<form:input type="text" path = "nationality" class="form-control" id="nationality" />
    							</div>
	  						</div>
	  						
	  						<div class = "form-group">
	  							<label class="control-label col-md-4" for="licence"><spring:message code="licenceno"/>:</label>
	  							<div class="col-md-6">
      								<form:input type="text" path = "licence" class="form-control" id="licence" />
    							</div>
	  						</div>
	  						
	  						<div class = "form-group">
	  							<label class="control-label col-md-4" for="licence"><spring:message code="role"/>:</label>
	  							<div class="col-md-6">
      								<form:select path="authority.id" items="${role}" itemValue="id" itemLabel="authority" class="form-control"/>
    							</div>
	  						</div>
	  							
	  						<div class = "form-group">
	  							<label class="control-label col-md-4"></label>
	  							<div class="col-md-6">
      								<button type = "submit" class = "btn btn-primary"><spring:message code="save"/></button>&nbsp;
      								<button type = "button" class = "btn btn-danger"><spring:message code="reset"/></button>
    							</div>
	  						</div>
	  						
	  						<!-- hidden elements -->
	  						<form:hidden path="id" />
	  					</form:form>
	  					
	  				</div>
				</div>	
			
			</div>
			
		</div>
	
	</div>

</div>