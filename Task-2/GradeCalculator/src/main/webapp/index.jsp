<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>

	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
		<link rel="stylesheet" href="index.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
		
	</head>
	
	<body style="background-color : #26183d ; color : white">
		
		<div>
			<h1 class="header">Student Marks</h1>
		</div>
		
		<!-- Student Marks form  -->
		<form action="CalculateGrade.jsp" method="post">
		
			<div class="main col-sm-6 col-md-6 col-lg-3">
			
				<div class="row">
					<div class="subjects col-5"><h3>Student ID</h3></div>
					<div class="marks col-7"><input class="col-12" type="text" name="txtId" value="${param.txtId}" size="10"  required></div>
				</div>
				
				<div class="row">
					<div class="subjects col-7"><h3>Telugu</h3></div>
					<div class="marks col-5"><input class="col-12" type="number" name="telugu" value="${param.telugu}" min="0"  max="100" required></div>
				</div>
				
				<div class="row">
					<div class="subjects col-7"><h3>Hindi</h3></div>
					<div class="marks col-5"><input class="col-12" type="number" name="hindi" value="${param.hindi}" min="0"  max="100" required></div>
				</div>
				
				<div class="row">
					<div class="subjects col-7"><h3>English</h3></div>
					<div class="marks col-5"><input class="col-12" class="col-12" type="number" min="0" name="english" value="${param.english}"  max="100" required></div>
				</div>
				
				<div class="row">
					<div class="subjects col-7"><h3>Maths</h3></div>
					<div class="marks col-5"><input class="col-12" type="number" name="maths" value="${param.maths}" min="0"  max="100" required></div>
				</div>
				
				<div class="row">
					<div class="subjects col-7"><h3>Science</h3></div>
					<div class="marks col-5"><input class="col-12" type="number" name="science" value="${param.science}" min="0"  max="100" required></div>
				</div>
				
				<div class="row">
					<div class="subjects col-7"><h3>Social</h3></div>
					<div class="marks col-5"><input class="col-12" type="number" name="social" value="${param.social}" min="0"  max="100" required></div>
				</div>
				
				
				<div class="submit_div row">
					<div class=" container col-7 btn btn-primary]">
						<input type="submit" class="col-12 btn btn-primary" value="Calculate">
					</div>
				</div>
				
			</div>
			
		</form>
		
	</body>
</html>