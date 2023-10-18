<!-- Error page -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error Page</title>
</head>
<body>
	<h1>An Error Occured:</h1>
	<p>
		${exception.message}
	</p>
	<h1>please Try again <a href="index.jsp">Back to Home</a></h1>
</body>
</html>