<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="index.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>

	<%@ taglib prefix ="c"  uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
	<!-- Exception variable catches the Exception if any exception arises  --> 
	<c:catch var="Exception">
		
		<!-- calculating total marks & average -->
		<c:set var="total" value="${param.telugu + param.hindi + param.english + param.maths + param.science + param.social}" />
		<c:set var="average" value="${total/6}" />
		<c:set var="grade" value="" />
		<c:set var="status" value="Pass" />
		
		<!-- Assigning the grade based on the average marks  -->
		<c:choose>
		
			<c:when test = "${average > 89}">
				<c:set var="grade" value="A+" />
			</c:when>
			
			<c:when test = "${average > 79}">
				<c:set var="grade" value="A" />
			</c:when>
			
			<c:when test = "${average > 69}">
				<c:set var="grade" value="B+" />
			</c:when>
			
			<c:when test = "${average > 59}">
				<c:set var="grade" value="B" />
			</c:when>
			
			<c:when test = "${average > 49}">
				<c:set var="grade" value="C+" />
			</c:when>
			
			<c:when test = "${average > 39}">
				<c:set var="grade" value="C" />
			</c:when>
			
			<c:when test = "${average > 29}">
				<c:set var="grade" value="D" />
			</c:when>
			
			<c:otherwise>
				<c:set var="grade" value="F" />
				<c:set var="status" value="Fail" />
			</c:otherwise>
			
		</c:choose>
		
		
		<!-- including the total content of index.jsp page  -->
		<jsp:include page="index.jsp" />
		
		<div class="main col-sm-6 col-md-6 col-lg-3">
			
			<!-- displays the total marks-->
			<div class="row">
			
	    		<div class="subjects col-7">
	    			<h3>Total</h3>
	    		</div>
	    		
	    		<div class="marks col-5">
    				<h1><c:out value="${total}"></c:out></h1>
    			</div>
    			
			</div>
		
			<!-- Displays the Percentage -->
			<div class="row">
			
			    <div class="subjects col-7">
				    <h3>Percentage</h3>
				</div>
				
			    <div class="marks col-5">
				    <h1><fmt:formatNumber value="${average}" pattern="0.00"></fmt:formatNumber>%</h1>
			    </div>
			    
			</div>
			
			<!-- Displays the Grade with respect to total marks -->
			<div class="row">
			
			    <div class="subjects col-7">
			    	<h3>Grade</h3>
			    </div>
			    
			    <div class="marks col-5">
			    	<h1><c:out value="${grade}"></c:out></h1>
	    		</div>
	    		
			</div>
			
			<!-- Displays the status either pass or fail -->
			<div class="row">
			
			    <div class="subjects col-7">
			    	<h3>Status</h3>
			    </div>
			    
			    <div class="marks col-5">
			    	<h1><c:out value="${status}"></c:out></h1>
	    		</div>
	    		
			</div>
			
		</div>
	</c:catch>
	
	<!-- IF any Exception arises it displays the Exception information -->
	<c:if test = "${Exception != null}">
		<h2 align="center">Exception Occured :  ${Exception}</h2>
	</c:if>
	
</body>
</html>