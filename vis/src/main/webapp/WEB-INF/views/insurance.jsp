<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class = "row">

	<!-- Linking the sidebar -->	
	<%@include file="./layouts/sidebar.jsp"%>
			
	<div class = "col-md-9">
	
		<ul class="breadcrumb">
        	<li><a href="${contextRoot}/home">Home</a></li>
        	<li class = "active">Insurance List</li>
    	</ul>
    	
		<div>
		
			<c:choose>
				
				<c:when test="${successDialog}">
					<div class="alert alert-success alert-dismissible successDialog">
  						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  						<strong>${msg}</strong>
					</div>
				</c:when>
				
				<c:when test="${updateDialog}">
					<div class="alert alert-info alert-dismissible updateDialog">
  						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  						<strong>${msg}</strong>
					</div>
				</c:when>
					
				<c:when test="${deleteDialog}">
					<div class="alert alert-danger alert-dismissible deleteDialog">
  						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  						<strong>${msg}</strong>
					</div>
				</c:when>
				
			</c:choose>
			
			<table id="insuranceTable" class = "table table-striped table-bordered">
				<thead>
					<tr>
						<th>Sl. No.</th>
						<th>Ins. Provider</th>
						<th>Ins. No.</th>
						<th>Ins. Valid Date</th>
						<th>Ins. Holder</th>
						<th>Actions</th>
					</tr>
				</thead>
				<c:set var="count" value="0" scope="page" />
				<c:forEach items="${list}" var="insurance">
					<c:set var="count" value="${count + 1}" scope="page"/>
					<tbody>
						<tr>
							<td>${count}</td>
							<td>${insurance.provider}</td>
							<td>${insurance.insuranceNumber}</td>
							<td>${insurance.insuranceValidDate}</td>
							<td><a href = "${contextRoot}/editUser.html?id=${insurance.user.id}">${insurance.user.name}</a></td>
							<td> 
								<a href = "${contextRoot}/editInsurance.html?id=${insurance.id}" data-toggle="tooltip" title="Edit"><img src="${images}/edit.png" class = "customIcons"/></a> 
								| 
								<a href = "${contextRoot}/deleteInsurance.html?id=${insurance.id}" data-toggle="tooltip" title="Delete"><span class="glyphicon glyphicon-trash" style = "font-size: 16px; color: black;"></span></a>
							</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>	
	
	</div>

</div>