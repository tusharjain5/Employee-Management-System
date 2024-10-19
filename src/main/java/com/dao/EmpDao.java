package com.dao;

import com.entity.Contact;
import com.entity.emp;

import java.util.List;

public interface EmpDao {
    public void addEmployee(emp emp);
    public List<emp> getAllEmployees();
    public emp getEmployeeById(int empId);
    public void updateEmployee(emp e1);
    public void deleteEmployee(int empId);
    public List<emp> searchByNameOrId(String query);
    public emp findById(int empId);
    public void saveContact(Contact contact);
}
