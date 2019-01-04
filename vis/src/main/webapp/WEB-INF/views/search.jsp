<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class = "row">

	<!-- Linking the sidebar -->	
	<%@include file="./layouts/sidebar.jsp"%>
	
	<div class = "col-md-9">
	
		<ul class="breadcrumb">
        	<li><a href="${contextRoot}/home">Home</a></li>
        	<li class="active">Search</li>
    	</ul>
		
		<div class = "row">
		
			<div class = "col-md-12">
			
				<div class="panel panel-primary">
		
					<div class="panel-heading">Search</div>
					<div class="panel-body">
					
						<form:form class="form-horizontal" action="${contextRoot}/search/searchProcess.html" modelAttribute="search">
						
							<div class = "form-group">
								<label class="control-label col-md-4" for="username">Username:</label>
								<div class="col-md-4">
		  							<form:input type="text" path = "username" class="form-control" id="username" />
								</div>
							</div>
			  						
							<div class = "form-group">
								<label class="control-label col-md-4" for="licenceno">Licence No:</label>
								<div class="col-md-4">
		  							<form:input type="text" path = "licenceNo" class="form-control" id="licenceno" />
								</div>
							</div>
							
							<div class = "form-group">
								<label class="control-label col-md-4" for="plateno">Plate No:</label>
								<div class="col-md-4">
		  							<form:input type="text" path = "plateNo" class="form-control" id="plateno" />
								</div>
							</div>
						
							<div class = "form-group">
								<label class="control-label col-md-4"></label>
								<div class="col-md-4">
		 							<button type = "submit" class = "btn btn-primary">Search</button>&nbsp;
		 							<button type = "reset" class = "btn btn-danger">Reset</button>
								</div>
			  				</div>
						</form:form>
					
					</div>	
		
				</div>
			
			</div>
		
		</div>
		
		<c:if test="${not empty searchResult}">
		
			<div class = "row">
			
			
			<div class = "col-md-6">
			
				<div class = "row">
				
				
					<div class = "col-md-12">
						
						
						<table class = "table table-bordered">
						
							<tr class = "headerColor"><td colspan="2"><b>Owner Details</b></td></tr>
							<tr><th>Name </th><td>${searchResult.name}</td></tr>
							<tr><th>Gender </th><td>${searchResult.gender}</td></tr>
							<tr><th>Nationality </th><td>${searchResult.nationality}</td></tr>
							<tr><th>Licence No. </th><td>${searchResult.licence}</td></tr>
						
						</table>
						
						
					</div>
					<div class = "col-md-12">
						<table class = "table table-bordered">
						
							<tr class = "headerColor"><td colspan="2"><b>Insurance Details</b></td></tr>
							<tr><th>Insurance Provider </th><td>${searchResult.insuranceModel.provider}</td></tr>
							<tr><th>Insurance Number </th><td>${searchResult.insuranceModel.insuranceNumber}</td></tr>
							<tr><th>Valid Date </th><td>${searchResult.insuranceModel.insuranceValidDate}</td></tr>
						
						</table>
					</div>
					
				
				</div>
			
			</div>
			<div class = "col-md-6">
			
				<table class = "table table-bordered">
						
							<tr class = "headerColor"><td colspan="2"><b>Vehicle Details</b></td></tr>
							<tr><th>Source </th><td>${searchResult.vehicleModel.source}</td></tr>
							<tr><th>Category </th><td>${searchResult.vehicleModel.category}</td></tr>
							<tr><th>Plate Number </th><td>${searchResult.vehicleModel.plateNumber}</td></tr>
							<tr><th>Manufacture </th><td>${searchResult.vehicleModel.manufacture}</td></tr>
							<tr><th>Type </th><td>${searchResult.vehicleModel.type}</td></tr>
							<tr><th>Color </th><td>${searchResult.vehicleModel.type}</td></tr>
							<tr><th>Registration Date </th><td>${searchResult.vehicleModel.registrationDate}</td></tr>
							<tr><th>Pending Fees </th><td>${searchResult.vehicleModel.pendingFines}</td></tr>
						
						</table>
			
			</div>
			
		</div>
		
		</c:if>
		
		
		
		
		
	</div>

</div>