<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to the Employee Management Portal</title>
<link rel="icon" type="image/x-icon" href="Gallery/empy.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%@include file="header.jsp"%>

<!-- Carousel Section -->
<div id="homeCarousel" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#homeCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#homeCarousel" data-slide-to="1"></li>
    <li data-target="#homeCarousel" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="Gallery/slide1.jpg" class="d-block w-100" alt="First slide" style="height: 800px;">
      <div class="carousel-caption d-none d-md-block">
        <h5>Welcome to Employee Management System</h5>
        <p>Manage your employees efficiently.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="Gallery/slide2.jpg" class="d-block w-100" alt="Second slide" style="height: 800px;">
      <div class="carousel-caption d-none d-md-block">
        <h5>Track Employee Performance</h5>
        <p>Stay updated with employee progress and achievements.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="Gallery/slide3.jpg" class="d-block w-100" alt="Third slide" style="height: 800px;">
      <div class="carousel-caption d-none d-md-block">
        <h5>Seamless Integration</h5>
        <p>Integrate easily with your existing systems.</p>
      </div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#homeCarousel" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#homeCarousel" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<%@include file="footer.jsp"%>

<!-- Bootstrap JS and Optional JavaScript -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
