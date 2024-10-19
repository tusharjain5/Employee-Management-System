<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page isELIgnored="false" %>
<%@ page isErrorPage="true" %>
<link rel="icon" type="image/x-icon" href="Gallery/error3.png">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8d7da; /* Light red background */
            color: #721c24; /* Dark red text */
            text-align: center;
            padding: 0px;
            margin: 0;
        }
        h2 {
            font-size: 2.5em;
        }
        p {
            font-size: 1.2em;
        }
        .button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 1.1em;
            color: #fff;
            background-color: #dc3545; /* Bootstrap danger color */
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .button:hover {
            background-color: #c82333; /* Darker red on hover */
        }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>
    <img src="Gallery/error5.jpg" alt="Error Icon" style="width: 100%; margin-bottom: 20px;">
    <h2 class="animate__animated animate__bounce" style="text-align:center;">Oops! Something went wrong.</h2>
     <div style="text-align:center;">
    <h3>Error Details:</h3>
   
    <p>
        <% if (exception != null) { %>
            <%= exception.getMessage() %>
        <% } else { %>
            An unknown error occurred.
        <% } %>
    </p>
 </div>
 
    <div style="text-align:center;">
        <a href="home" class="button">Go Back to Home</a>
        <h3>Need Assistance?</h3>
    </div>

<%@ include file="footer.jsp" %>
</body>
</html>
