
package com.black.blackmvc.service;

import com.black.blackmvc.model.Employee;
import java.util.List;

/**
 *
 * @author ABlackY
 */
public interface EmployeeService {
    
    public void addEmployee(Employee e);
    public void updateEmployee(Employee e);
    public List<Employee> listEmployees();
    public List<Employee> getEmployeePage(int offset, int limit);
    public Employee getEmployeeById(int id);
    public void removeEmployee(int id);
}
