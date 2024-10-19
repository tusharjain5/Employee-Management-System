<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Management System</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    
    <!-- Custom CSS -->
    <style>
        /* Styling for the Header */
        .header {
            position: fixed;
            top: 0;
            width: 100%;
            background-color: #333;
            color: white;
            z-index: 1000;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding: 20px 0;
            transition: background-color 0.3s ease;
        }

        .header .logo a {
            font-size: 24px;
            font-weight: bold;
            color: #fff;
            text-decoration: none;
            transition: color 0.3s;
        }

        .header .logo a:hover {
            color: #f0c14b;
        }

        .date-time {
            font-size: 16px;
            color: #fff;
            font-family: Arial, sans-serif;
        }

        body {
            padding-top: 80px; /* To avoid content being hidden under fixed header */
        }
    </style>
</head>
<body>

    <!-- Header Section -->
    <header class="header">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <div class="logo">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">Employee Management System</a>
                </div>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="home">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="employees">Employees</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Addemployee">Add Employee</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Contact">Contact</a>
                        </li>
                    </ul>
                    <div class="date-time ml-3">
                        <span id="dateTime"></span>
                    </div>
                </div>
            </div>
        </nav>
    </header>

    <!-- JavaScript -->
    <!-- jQuery and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <!-- Custom JS for Date-Time -->
    <script>
        // Function to Display Current Date and Time
        function updateDateTime() {
            const now = new Date();
            const dateTimeString = now.toLocaleString(); // Fetch current date and time as a string
            document.getElementById('dateTime').innerHTML = dateTimeString;
        }

        // Update the date and time every second
        setInterval(updateDateTime, 1000);
        updateDateTime(); // Initial call to display date and time immediately
    </script>
</body>
</html>
