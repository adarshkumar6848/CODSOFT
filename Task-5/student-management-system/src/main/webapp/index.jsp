<!--  Home page -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  errorPage="Error.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-2" />
		<title>Student Management System</title>
		
		<!-- Including BootStrap , CSS from a CDN for Styling -->
		<link rel="stylesheet" href="index.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
		
		<!-- Styling for this page  -->
		<style>
			*{
				margin : 0px;
				padding : 0px;
				box-sizing : border-box;
			}
			.container{
				height : 100px;
			}
			
			.navbar-nav li.nav-item {
				margin-right : 30px;
			}
			input[type="text"]{
				margin-top : 5px;
				height : 40px;
				border-radius : 20px;
			}
			
		</style>
		
	</head>
	
	<!-- Body of the page -->
	<body>
	
	    <div class="container">
	    
	    	<!--  Navigation bar  -->
	    	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
	    	
	    		<!-- Brand Link -->
		        <a class="navbar-brand" href="index.jsp">Home</a>
		        
		        <!-- Toggle button for smaller screens -->
		        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
		            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		            <span class="navbar-toggler-icon"></span>
		        </button>
		        
		        <div class="collapse navbar-collapse" id="navbarNav">
		        
		            <ul class="navbar-nav ml-auto">
		            
		            	<!-- Link to Add Student -->
		                <li class="nav-item">
		                    <a class="nav-link" href="AddStudent.jsp">Add Student</a>
		                </li>
		                
		                <!-- Link to Search the Student  -->
		                <li class="nav-item">
		                    <form action="/student-management-system/search" method="post">
		                    	<input type="text" name="txtNameSearch" size="30" placeholder="Enter student name" required>
		                    	<button class="btn btn-primary">Search</button>
		                    </form>
		                </li>
		                
		                <!-- Link to Display all the Students -->
		                <li class="nav-item">
		                    <a class="nav-link" href="/student-management-system/display">Display Student</a>
		                </li>
		                
		            </ul>
		            
		        </div>
		        
		    </nav>
		    
	    </div>
	</body>
</html>