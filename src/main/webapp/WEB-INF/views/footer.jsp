<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Footer</title>

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome for social media icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    
    <style>
        /* Footer Styling */
        .footer {
            background-color: #333;
            color: #fff;
            padding: 40px 0;
            position: relative;
            width: 100%;
        }

        .footer .footer-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .footer p, .footer a {
            font-size: 14px;
            color: #ccc;
            line-height: 1.8;
        }

        .footer a {
            text-decoration: none;
            transition: color 0.3s;
        }

        .footer a:hover {
            color: #f0c14b;
        }

        .footer .social-icons a {
            color: #fff;
            margin-right: 15px;
            font-size: 20px;
            transition: color 0.3s;
        }

        .footer .social-icons a:hover {
            color: #f0c14b;
        }

        .footer-bottom {
            border-top: 1px solid #444;
            padding-top: 20px;
            text-align: center;
            margin-top: 30px;
            font-size: 12px;
            color: #ccc;
        }
    </style>
</head>
<body>

    <!-- Footer Section -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <!-- Company Info -->
                <div class="col-lg-4 col-md-6 mb-4">
                    <h5 class="footer-title">Employee Management System</h5>
                    <p>Manage your employees efficiently and effectively.</p>
                </div>
                <!-- Quick Links -->
                <div class="col-lg-2 col-md-6 mb-4">
                    <h5 class="footer-title">Quick Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="home">Home</a></li>
                        <li><a href="employees">Employees</a></li>
                        <li><a href="Addemployee">Add Employee</a></li>
                        <li><a href="Contact">Contact</a></li>
                    </ul>
                </div>
                <!-- Contact Info -->
                <div class="col-lg-3 col-md-6 mb-4">
                    <h5 class="footer-title">Contact Us</h5>
                    <p><i class="fas fa-map-marker-alt"></i> Delhi, India</p>
                    <p><i class="fas fa-phone"></i> +91 9311229815</p>
                    <p><i class="fas fa-envelope"></i> jaint8648@gmail.com </p>
                </div>
                <!-- Social Media -->
                <div class="col-lg-3 col-md-6 mb-4">
                    <h5 class="footer-title">Follow Us</h5>
                    <div class="social-icons">
                        <a href="https://www.facebook.com/profile.php?id=100092271067882"><i class="fab fa-facebook"></i></a>
                        <a href="https://x.com/tusharjain55"><i class="fab fa-twitter"></i></a>
                        <a href="https://www.linkedin.com/in/tushar-jain-ba89b41b1"><i class="fab fa-linkedin"></i></a>
                        <a href="https://github.com/tusharjain5"><i class="fab fa-github"></i></a>
                    </div>
                </div>
            </div>
            <!-- Footer Bottom Text -->
            <div class="footer-bottom">
                <p>&copy; 2024 Employee Management System. All Rights Reserved.</p>
            </div>
        </div>
    </footer>

    <!-- Optional JavaScript and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
