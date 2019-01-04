<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />

<c:set var = "contextRoot" value = "${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Vehicle Insurance System - ${title}</title>
	
	<!-- Bootstrap core CSS -->
    <link href="${css}/datatables.min.css" rel="stylesheet">
    
   	<!-- Datatable buttons CSS -->
    <link href="${css}/buttons.dataTables.min.css" rel="stylesheet">
	
    <!-- Bootstrap core CSS -->
    <link href="${css}/bootstrap.css" rel="stylesheet">
    
    <!-- jquery UI CSS -->
	<link href="${css}/jquery-ui.css" rel="stylesheet">
	
	<!-- jquery confirm dialog CSS -->
	<link href="${css}/jquery-confirm.min.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="${css}/custom.css" rel="stylesheet">
    
    <!-- Add custom CSS here -->
    <link href="${css}/search.css" rel="stylesheet">
    
    <script>
		window.title = '${title}';
		window.contextRoot = '${pageContext.request.contextPath}';
	</script>

</head>

<body>

    <!-- Linking the Navbar -->
	<%@include file="./layouts/navbar.jsp"%>

    <div class="container">
		
		<!-- Linking the change password option -->
		<div id="changePasswordDialog" style="display: none;">
			<%@ include file="changePassword.jsp"%>
		</div>
		
        <!-- Linking the home page -->
        <c:if test="${userClicksHome == true}">
        	<%@include file="home.jsp"%>
        </c:if>
        
        <!-- Linking the user page -->
        <c:if test="${userClicksUser == true}">
        	<%@include file="user.jsp"%>
        </c:if>
        
        <!-- Linking the insurance page -->
        <c:if test="${userClicksInsurance == true}">
        	<%@include file="insurance.jsp"%>
        </c:if>
        
        <!-- Linking the vehicle page -->
        <c:if test="${userClicksVehicle == true}">
        	<%@include file="vehicle.jsp"%>
        </c:if>
        
		<!-- Linking the User form page -->
        <c:if test="${userClicksUserForm == true}">
        	<%@include file="userForm.jsp"%>
        </c:if>
        
        <!-- Linking the Insurance form page -->
        <c:if test="${userClickInsuranceForm == true}">
        	<%@include file="insuranceForm.jsp"%>
        </c:if>
        
        <!-- Linking the Vehicle form page -->
        <c:if test="${userClickVehicleForm == true}">
        	<%@include file="vehicleForm.jsp"%>
        </c:if>
        
        <!-- Linking the search page -->
        <c:if test="${userClicksSearch == true}">
        	<%@include file="search.jsp"%>
        </c:if>
    </div>
    

    <!-- Linking the footer -->
    <%@include file="./layouts/footer.jsp"%>
    

    <!-- Linking jquery core library -->
    <script src="${js}/jquery.js"></script>
    
    <!-- jquery confirm dialog js -->
    <script src="${js}/jquery-confirm.min.js"></script>
    
    <!-- datatable core library -->
    <script src="${js}/datatables.min.js"></script>
    
    <!-- Following are the plugins for datatable exports -->
    <script src="${js}/dataTables.buttons.min.js"></script>
    <script src="${js}/jszip.min.js"></script>
    <script src="${js}/pdfmake.min.js"></script>
    <script src="${js}/vfs_fonts.js"></script>
    <script src="${js}/buttons.html5.min.js"></script>
    <script src="${js}/buttons.print.min.js"></script>
    <script src="${js}/buttons.colVis.min.js"></script>
    <script src="${js}/dataTables.select.min.js"></script>
    
    <!-- Bootstrap JS core library -->
    <script src="${js}/bootstrap.js"></script>
    
    <!-- jquery ui core library -->
    <script src="${js}/jquery-ui.js"></script>
    
    <!-- Custom js files -->
    <script src="${js}/custom.js"></script>
    <script src="${js}/user.js"></script>
    <script src="${js}/insurance.js"></script>
    <script src="${js}/vehicle.js"></script>
    <script src="${js}/changePassword.js"></script>

</body>
</html>
