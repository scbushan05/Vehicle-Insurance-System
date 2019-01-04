<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${contextRoot}/home">Vehicle Insurance System</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">
                    <security:authorize access="hasRole('ADMIN')">
                    	<li id = "home"><a href="${contextRoot}/home">Home</a>
                    	</li>
                    	<li id = "user" class = "dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">User&nbsp;&nbsp;<span class="caret"></span></a>
                    		<ul class="dropdown-menu">
				          		<li><a href="${contextRoot}/userForm">Add User</a></li>
				          		<li><a href="${contextRoot}/user">View Users</a></li>
        					</ul>
                    	</li>
                    	<li id = "vehicle"><a href="${contextRoot}/vehicle">Vehicle</a>
                    	</li>
                    	<li id = "insurance"><a href="${contextRoot}/insurance">Insurance</a>
                    	</li>
                    </security:authorize>
                    
                    <security:authorize access="hasAnyRole('ADMIN', 'USER')">
                    	<li id = "search"><a href="${contextRoot}/search/searchView.html">Search</a>
                    	</li>
                    </security:authorize>
                    
                </ul>
                
              	<ul class="nav navbar-nav navbar-right">
              		<li><a href="#" id = "changePassword">Change Password</a>
            		<li><a href="${contextRoot}/logout">Logout</a>
            	</ul>
            	
            </div>
        </div>
    </nav>