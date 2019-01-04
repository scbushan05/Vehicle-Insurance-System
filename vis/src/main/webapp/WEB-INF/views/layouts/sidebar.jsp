<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<div class="col-md-3">
	<div class="list-group">
		<security:authorize access="hasRole('ADMIN')">
		    <a href="${contextRoot}/home" class="list-group-item" id="homeSidebar">Home</a>
		    <a href="${contextRoot}/user" class="list-group-item" id="userSidebar">User</a>
		    <a href="${contextRoot}/vehicle" class="list-group-item" id="vehicleSidebar">Vehicle</a>
			<a href="${contextRoot}/insurance" class="list-group-item" id="insuranceSidebar">Insurance</a>
		</security:authorize>
		<security:authorize access="hasAnyRole('ADMIN', 'USER')">
			<a href="${contextRoot}/search/searchView.html" class="list-group-item" id="searchSidebar">Search</a>
		</security:authorize>
	</div>
</div>