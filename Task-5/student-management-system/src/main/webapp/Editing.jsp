<!-- Student Editing form page  -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.ResultSet , com.students.Student"  errorPage="Error.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Student Editing Form</title>
	
	<!-- Including BootStrap , CSS from CDN for styling -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
	
	<!-- CSS Styling for this page -->
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

	<div>
		<!-- including whole content of index.jsp(navigation bar) -->
		<jsp:include page="index.jsp"></jsp:include>
	</div>
	
	<%!
		Student st;
		String branch;
		String grade;
	%>
	<%

		st = (Student)request.getAttribute("Stu");
	%>
	
	<div class="main">
		<div class="container header">
			<h1>Student Form</h1>
		</div>
		
		<div class=" container col-xl-7 col-lg-7 col-md-10 col-sm-12 col-xs-12">
			
			<!-- Form for student details -->
			<form class="col-12" action="/student-management-system/UpdateStudent" method="post"> 
				
				<!-- Roll no (could not change just for display purpose -->
				<div class="frmelements col-12">
					<div class="col-5">Roll No</div>
					<div class="col-7" ><%= st.getRollno() %><input type="hidden" class="input_div" name="rollno" value="<%= st.getRollno() %>"  title="Roll No could not change."></div>
				</div>
				
				<!-- Name -->
				<div class="frmelements col-12 ">
						<div class="col-5">Name</div>
						<div class="col-7"><input type="text" class="input_div" name="name" value="<%= st.getName()%>" id="name"  required></div>
				</div>
				
				<!-- Branch  -->
				<div class="frmelements col-12">
				    <div class="col-5">Branch</div>
				    <div class="col-7">
				        <select name="branch" class="input_div" required>
				            <option value="" disabled>Choose Engg branch</option>
				            <option value="aeronautical" <%= st.getBranch().equals("aeronautical") ? "selected" : "" %>>Aeronautical</option>
				            <option value="civil" <%= st.getBranch().equals("civil") ? "selected" : "" %>>Civil</option>
				            <option value="cse" <%= st.getBranch().equals("cse") ? "selected" : "" %>>Computer Science</option>
				            <option value="ece" <%= st.getBranch().equals("ece") ? "selected" : "" %>>Electronics & Communication</option>
				            <option value="eee" <%= st.getBranch().equals("eee") ? "selected" : "" %>>Electrical & Electronic</option>
				            <option value="mech" <%= st.getBranch().equals("mech") ? "selected" : "" %>>Mechanical</option>
				        </select>
				    </div>
				</div>

				<!-- Grade -->
				<div class="frmelements col-12">
				    <% 
				        grade = st.getGrade();
				    %>
				    <div class="col-5">Grade</div>
				    <div class="col-7">
				        <select name="grade" class="input_div">
				            <option value="" disabled>select the Grade</option>
				            <option value="A+" <%= grade.equals("A+") ? "selected" : "" %>>A+</option>
				            <option value="A" <%= grade.equals("A") ? "selected" : "" %>>A</option>
				            <option value="B+" <%= grade.equals("B+") ? "selected" : "" %>>B+</option>
				            <option value="B" <%= grade.equals("B") ? "selected" : "" %>>B</option>
				            <option value="C" <%= grade.equals("C+") ? "selected" : "" %>>C</option>
				            <option value="C+" <%= grade.equals("C") ? "selected" : "" %>>C+</option>
				            <option value="D" <%= grade.equals("D") ? "selected" : "" %>>D</option>
				            <option value="F(Fail)" <%= grade.equals("F(Fail)") ? "selected" : "" %>>F(Fail)</option>
				        </select>
				    </div>
				</div>

				<!-- Mobile Number -->
				<div class="frmelements col-12 ">
					<div class="col-5">Mobile Number</div>
					<div class="col-7"><input type="text" class="input_div"  name="stuMobNum" value="<%= st.getStudentMobileNumber() %>"  required validate ></div>
				</div>
				
				<!-- Parent's Mobile Number -->
				<div class="frmelements col-12 ">
					<div class="col-5">Parents Mobile Number</div>
					<div class="col-7"><input type="text" class="input_div"  name="parMobNum" value="<%= st.getParentMobileNumber() %>"  required validate ></div>
				</div>
				
				<!-- Script for checking mobile number -->
				<script>
				
					//function for validating mobile number
				    function validateMobileNumber(inputField) {
				        const inputValue = inputField.value;
						
				        //pattern for mobile number
				        if (!/^[0-9]{10}$/.test(inputValue)) {
				        	
				        	//pop up window 
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

				<!-- Button for updating Student  -->
				<div class="button col-4">
					<button class="btn btn-primary btn-lg">Update Student</button>
				</div>
				
			</form>
			
			
			<!-- Displays status whether updated Successfully or not -->
			<div class="col-12">
			    <%
			    	try{
			    		int result = 0;
					    Object resultAttribute = request.getAttribute("result");
					    if (resultAttribute != null) {
					        result = Integer.parseInt(String.valueOf(resultAttribute));
					    }
					    if (result > 0) {
			    %>
			        <h2 class="success">Student Updated Successfully.</h2>
			    <%
			    	} else if(result < 0) {
			    %>
			        <h2 class="error">Something went wrong while updating Student!! please try again </h2>
			    <%
			    	}
			    	else{
			    		
			    %>
			    	<h2></h2>
			    <%
			    	  }
			    	}
					catch(Exception e){
						
					}
			    %>
			    
			</div>

    	</div>
	</div>
</body>
</html>