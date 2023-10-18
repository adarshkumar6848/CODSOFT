<!-- Student Form for adding Student -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="Error.jsp"%>
<!DOCTYPE html>
<html>
	
	<head>
	<meta charset="UTF-8">
	<title>Add Student</title>
	
	<!-- Including BootStrap , CSS from a CDN for Styling -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
	
	<!-- Styling for this page  -->
	<style>
		*{
			margin : 0;
			padding : 0;
			box-sizing : border-box;
		}
		body{
			background-color : #2d1745 !important;
			color : white !important;
		}
		.header{
			text-align :center;
			padding-bottom : 10px;
		}
		form{
			display : flex;
			flex-direction : column;
			font-size : 25px;
		}
		.frmelements{
			display : flex;
			margin : 1px auto;
			padding : 20px;
		}
		
		.input_div{
			border-radius : 15px;
			width : 100%;
		}
		.button{
			margin : auto;
		}
		h2{
			text-align : center;
		}
		.success{
			color : green;
		}
		.repeat , .error{
			color : red;
		}
	</style>
	
	</head>
	
	<!-- Body of this page -->
	<body>
	
		<!-- including the whole content of the index.jsp(Home Page) -->
		<div>
			<jsp:include page="index.jsp"></jsp:include>
		</div>
		
		<div class="main">
			<div class="container header">
				<h1>Student Form</h1>
			</div>
			
			<div class=" container col-xl-7 col-lg-7 col-md-10 col-sm-12 col-xs-12">
			
				<!-- Form for student details -->	
				<form class="col-12" action="/student-management-system/AddStudent" method="post"> 
					
					<!-- Roll No input -->
					<div class="frmelements col-12">
						<div class="col-5">Roll No</div>
						<div class="col-7" ><input type="number" class="input_div" name="rollNo" value="${param.rollNo }" required></div>
					</div>
					
					<!-- Name input -->
					<div class="frmelements col-12 ">
							<div class="col-5">Name</div>
							<div class="col-7"><input type="text" class="input_div" name="name" value="${param.name }" required></div>
					</div>
					
					<!-- Branch Selection -->
					<div class="frmelements col-12">
					    <div class="col-5">Branch</div>
					    <div class="col-7">
					        <select name="branch" class="input_div" required>
					            <option value="" selected disabled>Choose Engg branch</option>
					            <option value="aeronautical" ${param.branch == 'aeronautical' ? 'selected' : ''}>Aeronautical</option>
					            <option value="civil" ${param.branch == 'civil' ? 'selected' : ''}>Civil</option>
					            <option value="cse" ${param.branch == 'cse' ? 'selected' : ''}>Computer Science</option>
					            <option value="ece" ${param.branch == 'ece' ? 'selected' : ''}>Electronics & Communication</option>
					            <option value="eee" ${param.branch == 'eee' ? 'selected' : ''}>Electrical & Electronic</option>
					            <option value="mech" ${param.branch == 'mech' ? 'selected' : ''}>Mechanical</option>
					        </select>
					    </div>
					</div>
					
					<!-- Grade Selection (optional) -->
					<div class="frmelements col-12">
					    <div class="col-5">Grade</div>
					    <div class="col-7">
					        <select name="grade" class="input_div">
					            <option value="" selected disabled>select the Grade</option>
					            <option value="A+" ${param.branch == 'A+' ? 'selected' : ''}>A+</option>
					            <option value="A" ${param.branch == 'A' ? 'selected' : ''}>A</option>
					            <option value="B+" ${param.branch == 'B+' ? 'selected' : ''}>B+</option>
					            <option value="B" ${param.branch == 'B' ? 'selected' : ''}>B</option>
					            <option value="C" ${param.branch == 'C+' ? 'selected' : ''}>C</option>
					            <option value="C+" ${param.branch == 'C' ? 'selected' : ''}>C+</option>
					            <option value="D" ${param.branch == 'D' ? 'selected' : ''}>D</option>
					            <option value="F(Fail)" ${param.branch == 'F(Fail)' ? 'selected' : ''}>F(Fail)</option>
					        </select>
					    </div>
					</div>
	
					<!-- Student mobile number input  -->
					<div class="frmelements col-12 ">
						<div class="col-5">Mobile Number</div>
						<div class="col-7"><input type="text" class="input_div"  name="stuMobNum" value="${param.stuMobNum }"  required  /></div>
					</div>
					
					<!-- Parent Mobile Number -->
					<div class="frmelements col-12 ">
						<div class="col-5">Parents Mobile Number</div>
						<div class="col-7"><input type="text" class="input_div"  name="parMobNum" value="${param.parMobNum }"  required /></div>
					</div>
					
					<!-- Button for Adding Student -->
					<div class="button col-4">
						<button class="btn btn-primary btn-lg">Add Student</button>
					</div>
					
					<!-- Scripting for mobile number checking -->
					<script>
						<!-- Funtion for validating Mobile numbers -->
					    function validateMobileNumber(inputField) {
					        const inputValue = inputField.value;
					
					        if (!/^[0-9]{10}$/.test(inputValue)) {
					            alert('Mobile number must be exactly 10 digits.');
					            inputField.value = ''; // Clear the input
					        }
					    }
					
					    // Attach the event listeners for input validation
					    document.querySelector('input[name="stuMobNum"]').addEventListener('blur', function() {
					        validateMobileNumber(this);
					    });
					
					    document.querySelector('input[name="parMobNum"]').addEventListener('blur', function() {
					        validateMobileNumber(this);
					    });
					</script>
	
					
				</form>
				
				<!-- Displays submission status either Student added successfully or not -->
				<div class="col-12">
				
					<!--  Gets the result after submitting the above form to AddStudent.java -->
				    <%
					    int result = 0;
					    Object resultAttribute = request.getAttribute("result");
					    if (resultAttribute != null) {
					        result = Integer.parseInt(String.valueOf(resultAttribute));
					    }
					    if (result > 0) {
				    %>
				    
				        <h2 class="success">Student added Successfully.</h2>
				    <%
				    	} 
					    else if (result == -100) {
					        int rollNo = 0;
					        Object rollNoAttribute = request.getAttribute("rollNo");
					        if (rollNoAttribute != null) {
					            rollNo = Integer.parseInt(String.valueOf(rollNoAttribute));
					        }
				    %>
				        <h2 class="repeat">Student with ROLL NO = ${rollNo} is already exist. </h2>
				    <%
				    		} else if (result == -200) {
				    %>
				        <h2 class="error">Something went wrong! please refresh the page and try again.</h2>
				    <%
				    		} else {
				    %>
				        <h2></h2>
				    <%
				    		}
				    %>
				</div>
	
	    	</div>
		</div>
	</body>
</html>