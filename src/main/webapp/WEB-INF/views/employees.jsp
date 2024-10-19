<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Employee List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="icon" type="image/x-icon" href="Gallery/empy.png">
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    
    <style>
        .search-btn {
            height: 38px; /* Ensure the button height matches the input field */
            margin-left: 5px; /* Add a little space between the input and button */
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>

    <div class="container-fluid mt-4">
        <h2 class="text-center">Employee List</h2>
        <br/>

        <!-- Wrap search input and button in a form -->
        <form action="searchEmployee" method="GET" class="form-group d-flex">
            <input type="text" name="query" class="form-control" id="searchEmployee" placeholder="Search by name or email">
            <button type="submit" class="btn btn-primary search-btn">
                <i class="fas fa-search"></i> <!-- Font Awesome search icon -->
            </button>
        </form>

        <!-- Alert message -->
        <c:if test="${not empty message}">
            <div class="alert alert-info">${message}</div>
        </c:if>

        <!-- Responsive table wrapper -->
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>Emp ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Mobile</th>
                        <th>Department</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="employeeTableBody">
                    <!-- Loop through the list of employees -->
                    <c:forEach var="em" items="${empList}">
                        <tr>
                            <td>${em.empId}</td>
                            <td>${em.firstName}</td>
                            <td>${em.lastName}</td>
                            <td>${em.email}</td>
                            <td>${em.mobile}</td>
                            <td>${em.department}</td>
                            <td>
                                <a href="View?empId=${em.empId}" class="btn btn-info btn-sm">View</a>
                                <a href="Edit?empId=${em.empId}" class="btn btn-primary btn-sm">Edit</a>
                                <form action="deleteEmployee" method="post" class="d-inline" id="deleteForm${em.empId}">
                                    <input type="hidden" name="empId" value="${em.empId}">
                                    <button type="button" class="btn btn-danger btn-sm" onclick="confirmDelete(${em.empId})">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <%@ include file="footer.jsp" %>

    <!-- Bootstrap JS for responsiveness -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
    
    <script>
        function confirmDelete(empId) {
            Swal.fire({
                title: 'Are you sure?',
                text: "Once deleted, you will not be able to recover this employee!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    document.getElementById('deleteForm' + empId).submit(); // Submit the form if confirmed
                } else {
                    Swal.fire('Your employee record is safe!'); // Confirmation cancellation message
                }
            });
        }
    </script>
</body>
</html>
