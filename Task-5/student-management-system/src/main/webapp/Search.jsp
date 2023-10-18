<!-- Search Results Page -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.ResultSet" errorPage="Error.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Search Results</title>
    
    <!-- CSS Styling for this page -->
    
    <style>
        .container {
            margin: auto 0;
        }
        .heading {
            background-color: #309c7a;
            color: white;
        }
        .styled-table {
            border-collapse: collapse;
            font-family: sans-serif;
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
        form {
            display: inline;
        }
        button {
            background-color: #309c7a !important;
            color: white !important;
        }
        button:hover {
            background-color: white !important;
            color: #309c7a !important;
            border: thin solid #309c7a !important;
        }
    </style>
    
</head>
<body>

    <!-- Including the whole index page (navigation Bar) -->
    <jsp:include page="index.jsp"></jsp:include>
    
    <div class="container">
    	
    	<!-- Declaring variables -->
        <%
        	// status whether Students records present or not .
            boolean hasRecords = false;
        
        	//Variable for holding the Student Records 
            ResultSet rs;
        			
        	// variable for holding the result (how many students removed)
            int removedStudents;
        %>
        
		<!-- Displays the Student Records in a tabular form -->
        <table class="styled-table">
            <!-- Table Header Part -->
            <thead>
                <tr>
                    <th>ROLL NO</th>
                    <th>STUDENT NAME</th>
                    <th>BRANCH</th>
                    <th>Grade</th>
                    <th>STUDENT MOB NO</th>
                    <th>PARENT MOB NO</th>
                    <th>Delete</th>
                    <th>Edit</th>
                </tr>
            </thead>
        
            <!-- Table Body Part -->
            <tbody>
	            <%			
		            try {
		                // Get the Student Records
		                rs = (ResultSet) request.getAttribute("searchName");
		                // Check if Student Records found
		                while (rs.next()) {
		                    hasRecords = true;
		        %>
                <tr class="content">
                    <!-- Display the student attributes -->
                    <td><%= rs.getLong(1) %></td>
                    <td><%= rs.getString(2) %></td>
                    <td><%= rs.getString(3) %></td>
                    <td><%= rs.getString(4) %></td>
                    <td><%= rs.getLong(5) %></td>
                    <td><%= rs.getLong(6) %></td>
                    <td>
                        <!-- Form for Removing the Student -->
                        <form action="/student-management-system/RemoveStudent" method="post">
                            <input type="hidden" name="rollNo" value="<%= rs.getLong(1) %>">
                            <input type="hidden" name="requestPage" value="search">
                            <input type="hidden" name="name" value="${request.getAttribute('name')}">
                            <button class="btn">Remove</button>
                        </form>
                    </td>
                    <!-- Form for Editing the Student -->
                    <td>
                        <form action="/student-management-system/GetStudent" method="post">
                            <input type="hidden" name="rollNo" value="<%= rs.getLong(1) %>">
                            <button class="btn">Edit</button>
                        </form>
                    </td>
                </tr>
                <%
		            }
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		        %>
            </tbody>
        </table>
        <!-- If no records found, display a message -->
        <%
			if (!hasRecords) {
		%>
			
			<h1>No Student records Found</h1>
        <%
			}
            try {
                removedStudents = (Integer) request.getAttribute("updatedRows");
                
                // Based on the removedStudents value displays the message
                if (removedStudents > 0) {
        %>
        <h2 class="success"><%= removedStudents %> student removed Successfully</h2>
        <%
            } else {
        %>
        <h2 class="fail">Unable to remove Student, please try again</h2>
        <%
            }
        } catch (Exception e) {
        }
        %>
    </div>
</body>
</html>
