<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <!-- Added this line -->
<%@ page isELIgnored="false" %>
<%@ page import="java.util.Base64" %>

<!DOCTYPE html>
<html>
<head>
    <title>View Employee</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <link rel="icon" type="image/x-icon" href="Gallery/empy.png"> 
    
</head>
<body>
    <%@include file="header.jsp"%>

    <div class="container-fluid mt-4">
        <h2 class="text-center">Employee Details</h2>

        <!-- Alert message -->
        <c:if test="${not empty message}">
            <div class="alert alert-info">${message}</div>
        </c:if>

        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-header">
                        Employee Information
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <tr>
                                <th>Emp ID</th>
                                <td>${employee.empId}</td>
                            </tr>
                            <tr>
                                <th>First Name</th>
                                <td>${employee.firstName}</td>
                            </tr>
                            <tr>
                                <th>Last Name</th>
                                <td>${employee.lastName}</td>
                            </tr>
                            <tr>
                                <th>Email</th>
                                <td>${employee.email}</td>
                            </tr>
                            <tr>
                                <th>Mobile</th>
                                <td>${employee.mobile}</td>
                            </tr>
                            <tr>
                                <th>Department</th>
                                <td>${employee.department}</td>
                            </tr>
                            <tr>
                                <th>Country</th>
                                <td>${employee.country}</td>
                            </tr>
                            <tr>
                                <th>State</th>
                                <td>${employee.state}</td>
                            </tr>
                            <tr>
                                <th>City</th>
                                <td>${employee.city}</td>
                            </tr>
                            <tr>
                                <th>Company</th>
                                <td>${employee.company}</td>
                            </tr>
                            <tr>
                                <th>Date of Birth</th>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty employee.dob}">
                                            <fmt:formatDate value="${employee.dob}" pattern="yyyy-MM-dd" />
                                        </c:when>
                                        <c:otherwise>N/A</c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                            <tr>
                                <th>Date of Joining</th>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty employee.doj}">
                                            <fmt:formatDate value="${employee.doj}" pattern="yyyy-MM-dd" />
                                        </c:when>
                                        <c:otherwise>N/A</c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                            <tr>
                                <th>Address</th>
                                <td>${employee.address}</td>
                            </tr>
                            <tr>
                                <th>Gender</th>
                                <td>${employee.gender}</td>
                            </tr>
                            <tr>
                                <th>Photo</th>
                                <td>
                                    <c:if test="${not empty employee.photo}">
                                        <img src="data:image/jpeg;base64,${fn:escapeXml(Base64.getEncoder().encodeToString(employee.photo))}" alt="Employee Photo" class="img-fluid" style="max-width: 150px; max-height: 150px;">
                                    </c:if>
                                    <c:if test="${empty employee.photo}">
                                        N/A
                                    </c:if>
                                </td>
                            </tr>
                        </table>

                        <!-- Action buttons -->
                        <div class="text-center">
                            <a href="employees" class="btn btn-secondary">Back to Employee List</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@include file="footer.jsp"%>

    <!-- Bootstrap JS for responsiveness -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
