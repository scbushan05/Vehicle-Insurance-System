<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class = "row">

	<!-- Linking the sidebar -->	
	<%@include file="./layouts/sidebar.jsp"%>
			
	<div class = "col-md-9">
	
		<ul class="breadcrumb">
        	<li><a href="${contextRoot}/home">Home</a></li>
        	<li class = "active">Users List</li>
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
			
			<table id="userTable" class = "table table-striped table-bordered">
				<thead>
					<tr>
						<th>Sl. No.</th>
						<th>Username</th>
						<th>Gender</th>
						<th>Nationality</th>
						<th>Licence</th>
						<th>Details</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="count" value="0" scope="page" />
					<c:forEach items="${list}" var="user">
						<c:set var="count" value="${count + 1}" scope="page"/>
						<tr>
							<td>${count}</td>
							<td><a href = "${contextRoot}/editUser.html?id=${user.id}">${user.name}</a></td>
							<td>${user.gender}</td>
							<td>${user.nationality}</td>
							<td>${user.licence}</td>
							<td><a href = "${contextRoot}/vehicleForm.html?userId=${user.id}" data-toggle="tooltip" title="Vehicle details"><img src="${images}/car.png" class = "customIcons"/></a> | <a href = "${contextRoot}/insuranceForm.html?userId=${user.id}" data-toggle="tooltip" title="Insurance details"><img src="${images}/document.png" class = "customIcons"/></a></td>
							<td><a href = "${contextRoot}/deleteUser.html?id=${user.id}" data-toggle="tooltip" title="Delete"><span class="glyphicon glyphicon-trash" style = "font-size: 20px; color: black;"></span></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>	
	</div>
	
</div>