<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

    <title>ATM Application</title>
    
    <!-- Include BootStrap , CSS from CDN for Styling -->
    <link rel="stylesheet" href="index.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous">
    </script>
    
    <!-- CSS Styling  -->
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            text-align: center;
            margin-top: 100px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            margin: 10px;
            cursor: pointer;
        }
        #deposit {
            background-color: #4CAF50;
            color: white;
            border: none;
        }
        #deposit:hover{
            background-color: white;
            color: green;
            border: 1px solid green;
        }
        
        #withdraw {
            background-color: #f44336;
            color: white;
            border: none;
        }
        #withdraw:hover{
            background-color: white;
            color: red;
            border: 1px solid green;
        }
        #balance {
            background-color: #008CBA;
            color: white;
            border: none;
        }
        #balance:hover{
            background-color: white;
            color: blue;
            border: 1px solid green;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>ATM Machine</h1>
        
        <!-- form for deposit and withdraw -->
        <form action="./AtmController" method="post">
            <button class="btn" id="deposit" type="submit" name="action" value="deposit">Deposit</button>
            <button class="btn" id="withdraw" type="submit" name="action" value="withdraw">Withdraw</button>
        </form>
        
        <!-- Form for checking balance -->
        <form action="./status" method="post">
            <input type="hidden" name="action" value="balance">
            <button class="btn" id="balance" type="submit">Check Balance</button>
        </form>
        
    </div>
    
</body>
</html>
