<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vehicle Insurance System</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
  <div class = "container">
    	<div class = "col-md-4 col-md-offset-4">
        	<div class = "panel panel-primary">
            	<div class = "panel-heading">
                	Login
                </div>
                <div class = "panel-body">
                	<form action='<spring:url value="/loginAction"/>' method="post">
                    	<input type = "text" class = "form-control" name = "username" placeholder = "Username"/>
                        <br/>
                        <input type = "password" class = "form-control" name = "password" placeholder = "Password" id = "password"/>
                        <br/>
                        <button type = "submit" class = "btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>