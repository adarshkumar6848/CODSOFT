<!--  Displays all the Students  -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.ResultSet" errorPage="Error.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>All Students</title>
		
		<!-- CSS Styling for this page -->
		
		<style>
			.container{
				margin : auto 0;
			}
			.heading{
				background-color : #309c7a;
				color : white;
			}
			.styled-table{
				border-collapse : collapse;
				font-family : sans-serif;
			}
			.styled-table thead tr {
			    background-color: #009879;
			    color: #ffffff;
			    text-align: left;
			}
			.styled-table th, .styled-table td {
			    padding: 12px 15px;
			}
			
			.styled-table tbody tr {
			    border-bottom: 1px solid #dddddd;
			}
			
			.styled-table tbody tr:nth-of-type(even) {
			    background-color: #f3f3f3;
			}
			
			.styled-table tbody tr:last-of-type {
			    border-bottom: 2px solid #009879;
			}
			
			.styled-table tbody tr.active-row {
			    font-weight: bold;
			    color: #009879;
			}
			form{
				display : inline;
			}
			button{
				background-color : #309c7a !important;
				color : white !important;
			}
			button:hover{
				background-color : white !important;
				color : #309c7a !important;
				border : thin solid #309c7a !important ;
			}
			
		</style>
	
	</head>
	
	<!-- Body of this page -->
	<body>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
		<!-- including the whole index page in this page (nav bar) -->
		<jsp:include page="index.jsp"></jsp:include>
		
		<div class="container">
		
		<!-- Declaring the variable for holding the result sent by request -->
		<%!
			ResultSet rs ;
			boolean hasRecords = false;
			
		%>
			
			<!-- Displays the Student records in table form -->
			<table class="styled-table">
			
				<!-- Table heading part  -->
				<thead>
					<tr>
						<th>ROll NO </th>
						<th>STUDENT NAME</th>
						<th>BRANCH</th>
						<th>Grade</th>
						<th>STUDENT MOB NO</th>
						<th>PARENT MOB NO</th>
						<th>Delete</th>
						<th>Edit</th>
					</tr>
				</thead>
				
				<!-- Table Body part -->
				<tbody>
				
					<%
						try{
							rs = (ResultSet)request.getAttribute("AllStudents");
							
							//if Students Records present displays .
							while(rs.next()){
								hasRecords = true;
					%>
						<tr class="content">
							<td><%=rs.getLong(1) %></td>
							
							<td><%=rs.getString(2) %></td>
							
							<td><%=rs.getString(3) %></td>
							
							<td><%=rs.getString(4) %></td>
							
							<td><%=rs.getLong(5) %></td>
							
							<td><%=rs.getLong(6) %></td>
							
							<td>
								<!-- Form for Removing the Student  -->
								<form action="/student-management-system/RemoveStudent" method="post" >
									<input type="hidden" name="rollNo" value="<%=rs.getLong(1) %>">
									<input type="hidden" name="requestPage" value="display">
									<button class="btn">Remove</button>
								</form>
							</td>
							
							<td>
								<!-- Form for Editing the Student  -->
								<form action="/student-management-system/GetStudent" method="post" >
									<input type="hidden" name="rollNo" value="<%=rs.getLong(1) %>">
									<button class="btn">Edit</button>
								</form>
							</td>
							
						</tr>
						
						<%
							}
						}
						catch(Exception e){
							e.printStackTrace();
						}
						%>	
									
				</tbody>
			</table>
			
		<!-- if the Student records not found -->
		<%
			if(hasRecords == false){
		%>
				<h1>No Student records Found</h1>
				
		<%
			}
			
			//if any students removed it displays status either successfully deleted or not.
			try {
			    Integer updatedRows = (Integer) request.getAttribute("updatedRows");
			    if (updatedRows != null) {
			        if (updatedRows > 0) {
		%>
			            <h2 class="success"><%= updatedRows %> student removed Successfully</h2>
		<%
			        } else if (updatedRows < 0) {
		%>
			            <h2 class="fail">Unable to remove Student(s). Please try again.</h2>
		<%
			        }
			    }
			} catch (Exception e) {
			    e.printStackTrace();
			}
		%>

			
		</div>
	</body>
</html>

