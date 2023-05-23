/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.black.blackmvc.service;

import com.black.blackmvc.dao.EmployeeDAO;
import com.black.blackmvc.model.Employee;
import java.util.List;
import org.springframework.stereotype.Service;
/**
 *
 * @author ABlackY
 */
@Service
public class EmployeeServiceImpl implements EmployeeService{
    
    private EmployeeDAO employeeDAO;

    public void setEmployeeDAO(EmployeeDAO employeeDAO) {
        this.employeeDAO = employeeDAO;
    }
    

    @Override
    public void addEmployee(Employee e) {
        this.employeeDAO.addEmployee(e);
    }

    @Override
    public void updateEmployee(Employee e) {
        this.employeeDAO.updateEmployee(e);
    }

    @Override
    public List<Employee> listEmployees() {
        return this.employeeDAO.listEmployees();
    }

    @Override
    public Employee getEmployeeById(int id) {
        return this.employeeDAO.getEmployeeById(id);
    }

    @Override
    public void removeEmployee(int id) {
        this.employeeDAO.removeEmployee(id);
    }

    @Override
    public List<Employee> getEmployeePage(int offset, int limit) {
        return this.employeeDAO.getEmployeePage(offset, limit);
    }
    
}
