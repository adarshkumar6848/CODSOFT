<!-- Action page  -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Action page</title>
</head>
<body>

	<!-- core Tag Library for using core library tags -->
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<!-- Include the whole content of index.jsp page -->
	<c:import url="index.jsp" />
	
	
	<!-- use catch tag for catching exceptions if any arises -->
	<c:catch var="Exception">
	
    	<c:set var="action" value="${param.action}" />
    	
    	<c:choose>
    	
    		<c:when test="${action == 'withdraw'}">
    		
    			<div class="container">
    					
			        <h2>Enter Amount to Withdraw</h2>
			        
			        <form action="./status" method="post">
			            <input type="number" name="amount" placeholder="Enter Amount" required>
			            <br><br>
			            <button class="btn btn-primary" id="confirm" type="submit" name="action" value="withdraw">Confirm</button>
			        </form>
			        
			    </div>
			    
    		</c:when>
    		
    		<c:when test="${action == 'deposit'}">
    		
    			<div class="container">
    					
			        <h2>Enter Amount to Deposit</h2>
			        
			        <form action="./status" method="post">
			            <input type="number" name="amount" placeholder="Enter Amount" required>
			            <br><br>
			            <button class="btn btn-primary" id="confirm" type="submit" name="action" value="deposit">Confirm</button>
			        </form>
			        
			    </div>
    			
    		</c:when>
    		
    	</c:choose>
	</c:catch>
	
	<!-- Display the Exception if any arise -->
	<c:if test="${Exception != null}">
		<c:out value="${Exception}" />
	</c:if>
	
</body>
</html>