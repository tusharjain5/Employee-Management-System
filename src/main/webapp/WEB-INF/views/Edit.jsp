<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.Base64"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Employee</title>
<link rel="icon" type="image/x-icon" href="Gallery/empy.png">
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- SweetAlert CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

<style>
body {
	background-color: #f7f7f7;
}

.form-container {
	background-color: white;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-top: 50px;
}

.form-title {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 20px;
}

.custom-file-label::after {
	content: "Browse";
}

.tick {
	color: green;
	font-size: 1.5em;
	display: none;
}

.input-tick {
	color: green;
	font-size: 1.2em;
	margin-left: 5px;
	display: none;
}
</style>
</head>
<body>

	<%@include file="header.jsp"%>



	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-8 form-container">
				<h2 class="form-title text-center">Edit Employee</h2>

				<form id="editEmployeeForm" action="updateemp" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="empId" value="${employee.empId}">
					<!-- Assuming empId is available -->

					<!-- Existing Fields -->
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="firstName">First Name</label> <input type="text"
								class="form-control" id="firstName" name="firstName"
								value="${employee.firstName}" required>
						</div>
						<div class="form-group col-md-6">
							<label for="lastName">Last Name</label> <input type="text"
								class="form-control" id="lastName" name="lastName"
								value="${employee.lastName}" required>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="department">Department</label> <select
								class="form-control" id="department" name="department" required>
								<option value="${employee.department}" selected>${employee.department}</option>

								<option value="Administration">Administration</option>
								<option value="Executive Management">Executive
									Management</option>


								<option value="Operations">Operations</option>
								<option value="Production">Production</option>
								<option value="Quality Control">Quality Control</option>
								<option value="Logistics">Logistics</option>
								<option value="Supply Chain">Supply Chain</option>
								<option value="Procurement">Procurement</option>

								<!-- Finance & Legal -->
								<option value="Finance">Finance</option>
								<option value="Accounting">Accounting</option>
								<option value="Legal">Legal</option>
								<option value="Compliance">Compliance</option>

								<!-- Human Resources -->
								<option value="Human Resources">Human Resources</option>
								<option value="Talent Acquisition">Talent Acquisition</option>
								<option value="Training & Development">Training &
									Development</option>
								<option value="Payroll">Payroll</option>

								<!-- Marketing & Sales -->
								<option value="Marketing">Marketing</option>
								<option value="Sales">Sales</option>
								<option value="Customer Service">Customer Service</option>
								<option value="Public Relations">Public Relations</option>
								<option value="Advertising">Advertising</option>

								<!-- Information Technology -->
								<option value="IT">IT</option>
								<option value="Software Development">Software
									Development</option>
								<option value="Data Science">Data Science</option>
								<option value="Cybersecurity">Cybersecurity</option>
								<option value="Technical Support">Technical Support</option>

								<!-- Research & Development -->
								<option value="Research & Development">Research &
									Development</option>
								<option value="Product Development">Product Development</option>
								<option value="Engineering">Engineering</option>
								<option value="Innovation">Innovation</option>

								<!-- Customer Success -->
								<option value="Customer Success">Customer Success</option>
								<option value="Account Management">Account Management</option>

								<!-- Other Specialized Departments -->
								<option value="Facilities Management">Facilities
									Management</option>
								<option value="Environmental Health & Safety">Environmental
									Health & Safety</option>
								<option value="Community Engagement">Community
									Engagement</option>
								<option value="Corporate Social Responsibility">Corporate
									Social Responsibility</option>






								<!-- Add other departments -->
							</select>
						</div>
						<div class="form-group col-md-6">
							<label for="email">Email ID</label> <input type="email"
								class="form-control" id="email" name="email"
								value="${employee.email}" required>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="mobile">Mobile No</label> <input type="tel"
								class="form-control" id="mobile" name="mobile"
								value="${employee.mobile}" required>
						</div>
						<div class="form-group col-md-6">
							<label for="designation">Designation</label> <input type="text"
								class="form-control" id="designation" name="designation"
								value="${employee.designation}" required>
						</div>
					</div>

					<!-- New Fields -->
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="country">Country</label> <input type="text"
								class="form-control" id="country" name="country"
								value="${employee.country}" required>
						</div>
						<div class="form-group col-md-6">
							<label for="state">State</label> <input type="text"
								class="form-control" id="state" name="state"
								value="${employee.state}" required>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="city">City</label> <input type="text"
								class="form-control" id="city" name="city"
								value="${employee.city}" required>
						</div>
						<div class="form-group col-md-6">
							<label for="dob">Date of Birth</label> <input type="date"
								class="form-control" id="dob" name="dob" value="${employee.dob}"
								required>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="doj">Date of Joining</label> <input type="date"
								class="form-control" id="doj" name="doj" value="${employee.doj}"
								required>
						</div>
						<div class="form-group col-md-6">
							<label for="gender">Gender</label> <select class="form-control"
								id="gender" name="gender" required>
								<option value="${employee.gender}" selected>${employee.gender}</option>
								<option value="Male">Male</option>
								<option value="Female">Female</option>
								<option value="Other">Other</option>
							</select>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="address">Address</label>
							<textarea class="form-control" id="address" name="address"
								rows="3" required>${employee.address}</textarea>
						</div>
						<div class="form-group col-md-6">
							<label for="password">Password</label> <input type="password"
								class="form-control" id="password" name="password"
								value="${employee.password}"
								placeholder="Leave blank to keep unchanged">
							<div class="input-group">
								<div class="input-group-append">
									<span class="input-group-text"
										onclick="togglePasswordVisibility('password')"> <i
										class="fa fa-eye"></i>
									</span>
								</div>
							</div>

						</div>

					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="photo">Photo</label> <input type="file"
								class="form-control-file" id="photo" name="photo"
								value="${employee.photo}">
							<div>
								<c:if test="${not empty employee.photo}">
									<img
										src="data:image/jpeg;base64,${fn:escapeXml(Base64.getEncoder().encodeToString(employee.photo))}"
										alt="Employee Photo" class="img-fluid"
										style="max-width: 150px; max-height: 150px;">
								</c:if>
								<c:if test="${empty employee.photo}">
                                        N/A
                                    </c:if>
							</div>
						</div>
						<div class="form-group col-md-6">
							<label for="email">Company</label> <input type="company"
								class="form-control" id="company" name="company"
								placeholder="Enter Company Name" value="${employee.company}"
								required>
						</div>
					</div>

					<button type="submit" class="btn btn-primary btn-block">Update
						Employee</button>
				</form>
			</div>
		</div>
	</div>
	<br />
	<br />
	<div class="text-center">
		<a href="employees" class="btn btn-secondary">Back to Employee
			List</a>
	</div>
<br />
<br />
	<%@include file="footer.jsp"%>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>

	<script>
    document.getElementById('editEmployeeForm').addEventListener('submit', function(event) {
        event.preventDefault(); // Prevent actual form submission

        // Show confirmation alert
        Swal.fire({
            title: 'Success!',
            text: 'Employee details updated successfully.',
            icon: 'success',
            confirmButtonText: 'OK'
        }).then(() => {
            this.submit(); // Uncomment this line to actually submit the form
        });
    });
    
    function togglePasswordVisibility(fieldId) {
        const field = document.getElementById(fieldId);
        const icon = field.nextElementSibling.querySelector('i');

        if (field.type === "password") {
            field.type = "text";
            icon.classList.remove("fa-eye");
            icon.classList.add("fa-eye-slash");
        } else {
            field.type = "password";
            icon.classList.remove("fa-eye-slash");
            icon.classList.add("fa-eye");
        }
    }

    
</script>

</body>
</html>
