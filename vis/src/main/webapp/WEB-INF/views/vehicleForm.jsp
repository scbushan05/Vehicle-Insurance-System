<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class = "row">

	<!-- Linking the sidebar -->	
	<%@include file="./layouts/sidebar.jsp"%>
			
	<div class = "col-md-9">
		
		<ul class="breadcrumb">
        	<li><a href="${contextRoot}/home">Home</a></li>
        	<li><a href="${contextRoot}/user">Vehicle List</a></li>
        	<li class="active">Add Vehicle</li>
    	</ul>
		
		<div class = "row">
			
			<div class = "col-md-8 col-md-offset-2">
			
				<div class="panel panel-primary">
				  	<div class="panel-heading">Vehicle Details</div>
			  		<div class="panel-body">
	  					
	  					<form:form class="form-horizontal" action="${contextRoot}/saveVehicleData.html" modelAttribute="vehicle">
	  						<c:if test="${readOnly}">
	  							<div class = "form-group">
		  							<label class="control-label col-md-4" for="username">Username:</label>
		  							<div class="col-md-6">
	      								<input type="text" class="form-control" id="username" readonly="${readOnly}" value = "${vehicle.user.name}"/>
	    							</div>
	  							</div>
	  						</c:if>
	  						
	  						<div class = "form-group">
	  							<label class="control-label col-md-4" for="source">Source:</label>
	  							<div class="col-md-6">
      								<form:input type="text" path = "source" class="form-control" id="source" />
    							</div>
	  						</div>
	  						
	  						<div class = "form-group">
	  							<label class="control-label col-md-4" for="category">Category:</label>
	  							<div class="col-md-6">
      								<form:input type="text" path = "category" class="form-control" id="category" />
    							</div>
	  						</div>
	  						
	  						<div class = "form-group">
	  							<label class="control-label col-md-4" for="plateno">Plate No:</label>
	  							<div class="col-md-6">
      								<form:input type="text" path = "plateNumber" class="form-control" id="plateno" />
    							</div>
	  						</div>
	  						
	  						<div class = "form-group">
	  							<label class="control-label col-md-4" for="manufacture">Manufacture:</label>
	  							<div class="col-md-6">
      								<form:input type="text" path = "manufacture" class="form-control" id="manufacture" />
    							</div>
	  						</div>
	  						
	  						<div class = "form-group">
	  							<label class="control-label col-md-4" for="type">Type:</label>
	  							<div class="col-md-6">
      								<form:select path = "type" class = "form-control" id = "type">
                            			<form:option value="Hatchback">Hatchback</form:option>
							            <form:option value="Sedans">Sedans</form:option>
							            <form:option value="Muv">MUV</form:option>
							            <form:option value="Suv">SUV</form:option>
							            <form:option value="Luxury">Luxury</form:option>
							            <form:option value="Hybrids">Hybrids</form:option>
							            <form:option value="Minivans">Minivans</form:option>
							            <form:option value="Convertibles">Convertibles</form:option>
							            <form:option value="Coupe">Coupe</form:option>
                        			</form:select>
    							</div>
	  						</div>
	  						
	  						<div class = "form-group">
	  							<label class="control-label col-md-4" for="color">Color:</label>
	  							<div class="col-md-6">
      								<form:input type="text" path = "color" class="form-control" id="color" />
    							</div>
	  						</div>
	  						
	  						<div class = "form-group">
	  							<label class="control-label col-md-4" for="regdate">Registration Date:</label>
	  							<div class="col-md-6">
      								<form:input type="date" path = "registrationDate" class="form-control" id="regdate" />
    							</div>
	  						</div>
	  						
	  						<div class = "form-group">
	  							<label class="control-label col-md-4" for="pending">Pending Fines:</label>
	  							<div class="col-md-6">
      								<form:input type="text" path = "pendingFines" class="form-control" id="pending" />
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
		<br/><br/><br/>
	</div>

</div>