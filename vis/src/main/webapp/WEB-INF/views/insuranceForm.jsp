<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class = "row">

	<!-- Linking the sidebar -->	
	<%@include file="./layouts/sidebar.jsp"%>
			
	<div class = "col-md-9">
		
		<ul class="breadcrumb">
        	<li><a href="${contextRoot}/home">Home</a></li>
        	<li><a href="${contextRoot}/insurance">Insurance List</a></li>
        	<li class="active">Add Insurance</li>
    	</ul>
		
		<div class = "row">
			
			<div class = "col-md-8 col-md-offset-2">
			
				<div class="panel panel-primary">
				  	<div class="panel-heading">Insurance Details</div>
			  		<div class="panel-body">
	  					
	  					<form:form class="form-horizontal" action="${contextRoot}/saveInsuranceData.html" modelAttribute="insurance">
	  						<div class = "form-group">
	  							<label class="control-label col-md-4" for="provider">Insurance Provider:</label>
	  							<div class="col-md-6">
      								<form:input type="text" path = "provider" class="form-control" id="provider" />
    							</div>
	  						</div>
	  						
	  						<div class = "form-group">
	  							<label class="control-label col-md-4" for="number">Insurance Number:</label>
	  							<div class="col-md-6">
      								<form:input type="text" path = "insuranceNumber" class="form-control" id="number" />
    							</div>
	  						</div>
	  						
	  						<div class = "form-group">
	  							<label class="control-label col-md-4" for="date">Insurance Valid Date:</label>
	  							<div class="col-md-6">
      								<form:input type="date" path = "insuranceValidDate" class="form-control" id="date" />
    							</div>
	  						</div>
	  							
	  						<div class = "form-group">
	  							<label class="control-label col-md-4"></label>
	  							<div class="col-md-6">
      								<button type = "submit" class = "btn btn-primary">Save</button>&nbsp;
      								<button type = "button" class = "btn btn-danger">Reset</button>
    							</div>
	  						</div>
	  						
	  						<!-- hidden elements -->
	  						<form:hidden path="user.id" value = "${userId}"/>
	  						<form:hidden path="id" />
	  					</form:form>
	  					
	  				</div>
				</div>	
			
			</div>
			
		</div>
	
	</div>

</div>