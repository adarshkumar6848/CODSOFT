<!-- Transaction Status -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Transaction Status</title>

    <!-- CSS Styling for this page -->
    <style>
        h1 {
            text-align: center;
        }

        .success {
            color: green;
        }

        .fail {
            color: red;
        }
    </style>

</head>

<!-- Page Body -->
<body>

    <!-- core Tag Library for using core library tags -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!-- Include the whole content of index.jsp page -->
    <c:import url="index.jsp" />

    <div class="container">

        <!-- use catch tag for catching exceptions if any arises -->
        <c:catch var="Exception">

            
            <c:set var="action" value="${requestScope.action}" />
            <c:set var="status" value="${requestScope.status}" />


            <c:choose>
                <c:when test="${action.equals('withdraw')}">
                    <c:choose>
                        <c:when test="${status == 'success'}">
                            <h1 class="success">Withdraw Successful</h1>
                        </c:when>
                        <c:otherwise>
                            <h1 class="fail">Withdraw fail, due to the insufficient funds.</h1>
                            <h1 class="fail">please check balance and try again !!.</h1>
                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:when test="${action.equals('deposit')}">
                    <c:choose>
                        <c:when test="${status.equals('success')}">
                            <h1 class="success">Deposit Successful</h1>
                        </c:when>
                        <c:otherwise>
                            <h1 class="fail">Deposit fail</h1>
                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:when test="${action.equals('balance')}">
                    <h2>Available Balance :<c:out value="${requestScope.balance}" /></h2>
                </c:when>
            </c:choose>

        </c:catch>

        <!-- Display the Exception if any arise -->
        <c:if test="${Exception != null}">
            <c:out value="${Exception}" />
        </c:if>
    </div>

</body>
</html>
