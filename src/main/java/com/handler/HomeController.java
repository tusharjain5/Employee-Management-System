package com.handler;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dao.EmpDao;
import com.entity.Contact;
import com.entity.emp;

@ControllerAdvice
@Controller
public class HomeController {

    @Autowired
    private EmpDao empDao;
	
	@RequestMapping(path= "/home")
	public String home(Model model) {
		
		System.out.println(" Home Page is Loading Sucessfully ");
		
	    
		return "home";
	}
	
	@RequestMapping(path= "/Addemployee")
	public String addemployee(Model model) {
		
		System.out.println(" Add Page is Loading Sucessfully ");
		
	    
		return "Addemployee";
	}
	
	@GetMapping("/View")
	public String viewEmployee(@RequestParam("empId") int empId, Model model) {
	    emp employee = empDao.findById(empId); // Use empDao to find the employee
	    if (employee != null) {
	        model.addAttribute("employee", employee);
	    } else {
	        model.addAttribute("message", "Employee not found.");
	    }
	    return "View"; // Ensure this matches your view file name
	}

	
	
	
	@RequestMapping(path = "/createemp", method = RequestMethod.POST)
	public String addEmployee(@RequestParam Map<String, String> params, 
	                          @RequestParam("photo") MultipartFile photoFile) {
	    emp e1 = new emp(); // Initialize the employee object

	    // Check if the uploaded file is empty
	    if (!photoFile.isEmpty()) {
	        try {
	            // Check file size
	            if (photoFile.getSize() > 2097152) { // 2 MB limit
	                System.out.println("Error: File size exceeds the limit of 2 MB.");
	                return "error"; // Return error if file size is too large
	            }

	            // Validate dimensions
	            BufferedImage img = ImageIO.read(photoFile.getInputStream());
	            if (img.getWidth() > 1920 || img.getHeight() > 1080) { // Example max dimensions
	                System.out.println("Error: Image dimensions exceed the allowed limit of 1920x1080.");
	                return "error"; // Return error if dimensions are too large
	            }

	            // Set the photo field
	            e1.setPhoto(photoFile.getBytes());
	        } catch (IOException e) {
	            System.out.println("Error saving photo: " + e.getMessage());
	            return "error";
	        }
	    }

	    // Setting fields from form parameters
	    e1.setFirstName(params.get("firstName"));
	    e1.setLastName(params.get("lastName"));
	    e1.setDepartment(params.get("department"));
	    e1.setEmail(params.get("email"));
	    e1.setMobile(params.get("mobile"));
	    e1.setCountry(params.get("country"));
	    e1.setState(params.get("state"));
	    e1.setCity(params.get("city"));
	    e1.setDesignation(params.get("designation"));
	    e1.setCompany(params.get("company"));

	    // Date conversion
	    try {
	        e1.setDob(Date.valueOf(params.get("dob")));
	        e1.setDoj(Date.valueOf(params.get("doj")));
	    } catch (IllegalArgumentException e) {
	        System.out.println("Error parsing date: " + e.getMessage());
	        return "error"; // Return error page or handle accordingly
	    }

	    e1.setAddress(params.get("address"));
	    e1.setPassword(params.get("password"));
	    e1.setGender(params.get("gender"));

	    // Save employee to the database
	    empDao.addEmployee(e1); 

	    return "redirect:/Addemployee"; // Redirect to the employee listing page after adding
	}
	
	@RequestMapping(path= "/employees")
	public String employee(Model m) {
		
	
		List<emp> list=empDao.getAllEmployees();
		m.addAttribute("empList",list);
		System.out.println("Retrieved Employees: " + list.size());

		return "employees";
	}
	
	
	
	@RequestMapping(path= "/Contact")
	public String contact(Model m) {
		
		System.out.println("Contact Us");
		    
		return "Contact";
	}
	
	
	
	@PostMapping(path= "/deleteEmployee") // Change to @PostMapping
	public String deleteEmployee(@RequestParam("empId") int empId) {
	    empDao.deleteEmployee(empId); // Call the delete method from empDao
	    System.out.println("Employee with ID " + empId + " deleted successfully.");
	    return "redirect:/employees"; // Redirect back to the employee list
	}

	@GetMapping(path= "/Edit")
	public String editEmployee(@RequestParam("empId") int empId, Model model) {
	    emp employee = empDao.findById(empId);
	    if (employee != null) {
	        model.addAttribute("employee", employee);
	    } else {
	        model.addAttribute("message", "Employee not found.");
	    }
	    return "Edit"; // Ensure this matches the name of your edit JSP
	}

	
	
	
	
	
	
	@PostMapping("/updateemp")
	public String updateEmployee(
	    @RequestParam("photo") MultipartFile file,
	    @RequestParam("empId") int empId,
	    @RequestParam Map<String, String> params
	) {
	    try {
	        // Retrieve existing employee
	        emp existingEmp = empDao.findById(empId);
	        if (existingEmp == null) {
	            return "error"; // Handle missing employee scenario
	        }

	        // Set all required fields (firstName, lastName, etc.)
	        String firstName = params.get("firstName");
	        if (firstName == null || firstName.isEmpty()) {
	            return "error"; // Handle null or empty firstName
	        }
	        existingEmp.setFirstName(firstName);

	        // Populate other fields
	        existingEmp.setLastName(params.get("lastName"));
	        existingEmp.setDepartment(params.get("department"));
	        existingEmp.setEmail(params.get("email"));
	        existingEmp.setMobile(params.get("mobile"));
	        existingEmp.setCountry(params.get("country"));
	        existingEmp.setState(params.get("state"));
	        existingEmp.setCity(params.get("city"));
	        existingEmp.setDesignation(params.get("designation"));
	        existingEmp.setCompany(params.get("company"));

	        // Handle date fields safely
	        try {
	            existingEmp.setDob(Date.valueOf(params.get("dob")));
	            existingEmp.setDoj(Date.valueOf(params.get("doj")));
	        } catch (IllegalArgumentException e) {
	            System.out.println("Error parsing date: " + e.getMessage());
	            return "error"; // Handle incorrect date format
	        }

	        // Set other fields
	        existingEmp.setAddress(params.get("address"));
	        existingEmp.setPassword(params.get("password"));
	        existingEmp.setGender(params.get("gender"));

	        // Set photo if file is provided
	        if (!file.isEmpty()) {
	            existingEmp.setPhoto(file.getBytes());
	        }

	        // Update employee record in database
	        empDao.updateEmployee(existingEmp);
	    } catch (IOException e) {
	        e.printStackTrace();
	        return "error";
	    }
	    return "redirect:/employees";
	}

	
	
	
	@GetMapping("/searchEmployee")
	public String searchEmployee(@RequestParam("query") String query, Model model) {
	    List<emp> empList = empDao.searchByNameOrId(query);
	    model.addAttribute("empList", empList);
	    return "employees"; // Return to the same JSP
	}


	 @ExceptionHandler(Exception.class)
	    public String handleException(Exception ex, Model model) {
	        model.addAttribute("errorMessage", ex.getMessage());
	        return "error"; // Returns the error page
	    }
	
	
	 @PostMapping(path="/submitContact")
	 public String submitContact(@ModelAttribute("contact") Contact contact, Model model) {
	     try {
	         empDao.saveContact(contact);
	         // Setting success attribute to true
	         model.addAttribute("success", "true");
	     } catch (Exception e) {
	         e.printStackTrace();
	         // Setting error attribute to true in case of failure
	         model.addAttribute("error", "true");
	     }
	     return "Contact"; // Return to the same form with success or error message
	 }

	
	 @RequestMapping(path= "/error")
		public String errorwho(Model model) {
			
			System.out.println(" Error Page is Working ");
			
		    
			return "error";
		}
		
	
	
}
