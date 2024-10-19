<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Employee</title>
<link rel="icon" type="image/x-icon" href="Gallery/empy.png">
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- SweetAlert CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

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
            <h2 class="form-title text-center">Add Employee</h2>

  <form id="addEmployeeForm" action="createemp" method="post" enctype="multipart/form-data">
   <!-- Ensure this matches the controller mapping -->


    <div class="form-row">
        <!-- EmpID -->
        <div class="form-group col-md-6">
            <label for="empID">Employee ID</label>
            <input type="text" class="form-control" id="empID" name="empID" placeholder="Auto-generated Employee ID" readonly>
        </div>
        <!-- First Name -->
        <div class="form-group col-md-6">
            <label for="firstName">First Name</label>
            <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Enter First Name" required>
        </div>
    </div>

    <div class="form-row">
        <!-- Last Name -->
        <div class="form-group col-md-6">
            <label for="lastName">Last Name</label>
            <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Enter Last Name" required>
        </div>
        <!-- Department -->
       <div class="form-group col-md-6">
    <label for="department">Department</label>
    <select class="form-control" id="department" name="department" required>
        <option value="" disabled selected>Select Department</option>

        <!-- General Management -->
        <option value="Administration">Administration</option>
        <option value="Executive Management">Executive Management</option>
        
        <!-- Core Business Operations -->
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
        <option value="Training & Development">Training & Development</option>
        <option value="Payroll">Payroll</option>
        
        <!-- Marketing & Sales -->
        <option value="Marketing">Marketing</option>
        <option value="Sales">Sales</option>
        <option value="Customer Service">Customer Service</option>
        <option value="Public Relations">Public Relations</option>
        <option value="Advertising">Advertising</option>
        
        <!-- Information Technology -->
        <option value="IT">IT</option>
        <option value="Software Development">Software Development</option>
        <option value="Data Science">Data Science</option>
        <option value="Cybersecurity">Cybersecurity</option>
        <option value="Technical Support">Technical Support</option>
        
        <!-- Research & Development -->
        <option value="Research & Development">Research & Development</option>
        <option value="Product Development">Product Development</option>
        <option value="Engineering">Engineering</option>
        <option value="Innovation">Innovation</option>

        <!-- Customer Success -->
        <option value="Customer Success">Customer Success</option>
        <option value="Account Management">Account Management</option>
        
        <!-- Other Specialized Departments -->
        <option value="Facilities Management">Facilities Management</option>
        <option value="Environmental Health & Safety">Environmental Health & Safety</option>
        <option value="Community Engagement">Community Engagement</option>
        <option value="Corporate Social Responsibility">Corporate Social Responsibility</option>
    </select>
</div>
    </div>

    <div class="form-row">
        <!-- Email -->
        <div class="form-group col-md-6">
            <label for="email">Email ID</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Enter Email ID" required>
        </div>
        <!-- Mobile No -->
        <div class="form-group col-md-6">
            <label for="mobile">Mobile No</label>
            <input type="tel" class="form-control" id="mobile" name="mobile" placeholder="Enter Mobile No" required>
        </div>
    </div>
    
    <div class="form-row">
        <!-- Email -->
        <div class="form-group col-md-6">
            <label for="email">Company</label>
            <input type="company" class="form-control" id="company" name="company" placeholder="Enter Company Name" required>
        </div>
        <!-- Mobile No -->
        <div class="form-group col-md-6">
            <label for="mobile">Designation</label>
            <input type="tel" class="form-control" id="designation" name="designation" placeholder="Enter Designation" required>
        </div>
    </div>

    <div class="form-row">
        <!-- Country -->
        <div class="form-group col-md-4">
            <label for="country">Country</label>
            <input type="text" class="form-control" id="country" name="country" placeholder="Enter Country" required>
        </div>
        <!-- State -->
        <div class="form-group col-md-4">
            <label for="state">State</label>
            <input type="text" class="form-control" id="state" name="state" placeholder="Enter State" required>
        </div>
        <!-- City -->
        <div class="form-group col-md-4">
            <label for="city">City</label>
            <input type="text" class="form-control" id="city" name="city" placeholder="Enter City" required>
        </div>
    </div>

    <div class="form-row">
        <!-- Date of Birth -->
        <div class="form-group col-md-6">
            <label for="dob">Date of Birth</label>
            <input type="date" class="form-control" id="dob" name="dob" required>
        </div>
        <!-- Date of Joining -->
        <div class="form-group col-md-6">
            <label for="doj">Date of Joining</label>
            <input type="date" class="form-control" id="doj" name="doj" required>
        </div>
    </div>

    <!-- Photo Upload -->
    <div class="form-group">
        <label for="photo">Photo</label>
        <div class="custom-file">
            <input type="file" class="custom-file-input" id="photo" name="photo" required>
            <label class="custom-file-label" for="photo">Choose file</label>
            <span class="tick" id="photoTick">&#10004;</span>
        </div>
    </div>

    <!-- Address -->
    <div class="form-group">
        <label for="address">Address</label>
        <textarea class="form-control" id="address" name="address" rows="3" placeholder="Enter Address" required></textarea>
    </div>

    <div class="form-row">
        <!-- Password -->
        <div class="form-group col-md-6">
            <label for="password">Password</label>
            <div class="input-group">
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" required>
                <div class="input-group-append">
                    <span class="input-group-text" onclick="togglePasswordVisibility('password')">
                        <i class="fa fa-eye"></i>
                    </span>
                </div>
            </div>
        </div>
        <!-- Confirm Password -->
        <div class="form-group col-md-6">
            <label for="confirmPassword">Confirm Password</label>
            <div class="input-group">
                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" required>
                <div class="input-group-append">
                    <span class="input-group-text" onclick="togglePasswordVisibility('confirmPassword')">
                        <i class="fa fa-eye"></i>
                    </span>
                </div>
            </div>
        </div>
    </div>

    <!-- Gender -->
    <div class="form-group">
        <label for="gender">Gender</label><br>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="gender" id="male" value="male" required>
            <label class="form-check-label" for="male">Male</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="gender" id="female" value="female" required>
            <label class="form-check-label" for="female">Female</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="gender" id="other" value="other" required>
            <label class="form-check-label" for="other">Other</label>
        </div>
    </div>

    <!-- Submit Button -->
    <button type="submit" class="btn btn-primary btn-block">Add Employee</button>
</form>
      
        </div>
    </div>
</div>



<%@include file="footer.jsp"%>

<!-- Bootstrap JS and Optional JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- SweetAlert JS -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>

<script>
    // Show tick mark when a photo is uploaded
    document.getElementById('photo').addEventListener('change', function() {
        const photoTick = document.getElementById('photoTick');
        if (this.files.length > 0) {
            photoTick.style.display = 'inline';
        } else {
            photoTick.style.display = 'none';
        }
        const fileName = this.files[0].name;
        this.nextElementSibling.innerText = fileName;
    });

    // Toggle password visibility
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


    // Handle form submission
    document.getElementById('addEmployeeForm').addEventListener('submit', function(event) {
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('confirmPassword').value;

        if (password !== confirmPassword) {
            event.preventDefault(); // Prevent actual form submission
            Swal.fire({
                title: 'Error!',
                text: 'Please enter a correct password.',
                icon: 'error',
                confirmButtonText: 'OK'
            });
        } else {
            // Show confirmation alert for successful addition
            Swal.fire({
                title: 'Success!',
                text: 'Employee added successfully.',
                icon: 'success',
                confirmButtonText: 'OK'
            }).then(() => {
                this.submit(); // Uncomment this line to actually submit the form
            });
        }
    });
    


    
    
    
</script>

</body>
</html>
