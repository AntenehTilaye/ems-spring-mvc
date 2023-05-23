package com.black.blackmvc;

import com.black.blackmvc.model.Employee;
import com.black.blackmvc.service.EmployeeService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author ABlackY
 */
@RequestMapping("employee")
@Controller
public class EmployeeController {

    private EmployeeService employeeService;

    @Autowired
    public void setEmployeeService(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @RequestMapping("/add")
    public String createForm(Model m) {
        Employee emp = new Employee();
        m.addAttribute("employee", emp);

        return "add_employee";
    }

    @RequestMapping(value = "/employees", method = RequestMethod.GET)
    public String listEmployees(Model m) {
        
        return "redirect:/employee/employees/1"; 
    }
    
    @RequestMapping(value = "/employees/{pageId}", method = RequestMethod.GET)
    public String employeePage(@PathVariable int pageId, Model m) {
        
        List a = this.employeeService.listEmployees();
        int perPage = 5;
        int total = a.size();
        int offset = (pageId - 1) * perPage;
        int numOfPage = (int) Math.ceil((float)total/perPage);
        System.out.println(total);
        System.out.println(numOfPage);
        
        int showing = perPage * pageId;
        if(showing > total) showing = total;
        m.addAttribute("employees", this.employeeService.getEmployeePage(offset, perPage));
        m.addAttribute("numOfPages", numOfPage);
        m.addAttribute("pageId", pageId);
        m.addAttribute("total", total);
        m.addAttribute("showing", showing);
        return "employees";
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String addEmployee(@ModelAttribute("employee") Employee emp) {
        System.out.println(emp.toString());
        if (emp.getId() == 0) {
            // new Employee
            this.employeeService.addEmployee(emp);
        } else {
            // existing Employee
            this.employeeService.updateEmployee(emp);
        }

        return "redirect:/employee/employees/1";
    }
  
    @RequestMapping(value = "/confirm_remove/{id}")
    public String removeEmployee(@PathVariable("id") int id, Model m){
        Employee emp = this.employeeService.getEmployeeById(id);
        m.addAttribute("employee", emp);
        return "del_employee"; 
    }
    
    @RequestMapping(value = "remove")
    public String removeEmployee(@ModelAttribute("employee") Employee emp){
        this.employeeService.removeEmployee(emp.getId());
        
        return "redirect:/employee/employees/1";
    }
    

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String editEmployee(@PathVariable("id") int id, Model m) {
        Employee emp = this.employeeService.getEmployeeById(id);
//        System.out.println(emp.toString());
        m.addAttribute("employee", emp);
        return "edit_employee"; 
    }

}
 