package com.dao;

import com.entity.Contact;
import com.entity.emp; // Entity class should start with an uppercase 'E'
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Repository
public class EmpDaoImpl implements EmpDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;
    
    @Autowired
    private SessionFactory sessionFactory;

    // Add a new employee to the database
    @Transactional
    public void addEmployee(emp emp) { // Changed 'emp' to 'Emp' to match the class name
        Transaction transaction = null;
        try (Session session = hibernateTemplate.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(emp); // Save the employee object to the DB
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback(); // Rollback in case of an error
            e.printStackTrace();
        }
    }

    
    @Transactional
    public List<emp> getAllEmployees() {
    
    	List<emp>list=hibernateTemplate.loadAll(emp.class);
    	return list;
    	
    }

 
    @Transactional
    public emp getEmployeeById(int empId) {
     
    	emp e1=hibernateTemplate.get(emp.class,empId);
    	return e1;
    	
    	
    }

    // Update an existing employee's details
    @Transactional
    public void updateEmployee(emp e1) {
        hibernateTemplate.update(e1); // Update the employee object
    }

    // Delete an employee by their ID
    @Transactional
    public void deleteEmployee(int empId) {
        emp emp = hibernateTemplate.get(emp.class, empId); // Fetch employee to delete
        if (emp != null) {
            System.out.println("Deleting employee: " + emp.getFirstName());
            hibernateTemplate.delete(emp); // Delete the employee
        } else {
            System.out.println("Employee with ID " + empId + " not found.");
        }
    }
    
    
    @Override
    public emp findById(int empId) {
    	return hibernateTemplate.get(emp.class, empId);
    }
    
    @Transactional
    public List<emp> searchByNameOrId(String query) {
        Session session = hibernateTemplate.getSessionFactory().getCurrentSession();
        String hql = "FROM emp e WHERE e.firstName LIKE :query OR e.lastName LIKE :query OR e.email LIKE :query";
        Query<emp> q = session.createQuery(hql, emp.class);
        String wildcardQuery = "%" + query + "%"; // Prepare the query for LIKE

        q.setParameter("query", wildcardQuery);

        // Check if the query is a number (for employee ID)
        if (query.matches("\\d+")) { 
            hql += " OR e.empId = :id"; 
            q.setParameter("id", Integer.parseInt(query));
        }

        return q.getResultList();
    }


    @Override
    @Transactional
    public void saveContact(Contact contact) {
        hibernateTemplate.save(contact);
    }
    
    
}
