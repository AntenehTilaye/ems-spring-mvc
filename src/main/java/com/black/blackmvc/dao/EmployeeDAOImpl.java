package com.black.blackmvc.dao;

import com.black.blackmvc.model.Employee;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ABlackY
 */
@Repository
public class EmployeeDAOImpl implements EmployeeDAO {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    @Override
    @Transactional
    public int addEmployee(Employee e) {
        Session session = sessionFactory.getCurrentSession();
        int res = (Integer) session.save(e);
        return res;
    }

    @Override
    @Transactional
    public Employee getEmployeeById(int id) {
        Session session = sessionFactory.getCurrentSession();
        Employee employee = session.get(Employee.class, id);

        return employee;
    }

    @Override
    @Transactional
    public List<Employee> listEmployees() {
        Session session = sessionFactory.getCurrentSession();
        List<Employee> employees = session.createQuery("from Employee").list();
        return employees;
    }

    @Override
    @Transactional
    public void updateEmployee(Employee e) {
        Session session = sessionFactory.getCurrentSession();
        System.out.println(e.toString());
        session.update(e);
    }

    @Override
    @Transactional
    public void removeEmployee(int id) {
        Session session = sessionFactory.getCurrentSession();

        Employee employee = session.get(Employee.class, id);
        if (employee != null) {
            session.delete(employee);
        }

    }

    @Override
    @Transactional
    public List<Employee> getEmployeePage(int offset, int limit) {

        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Employee");
        query.setFirstResult(offset);
        query.setMaxResults(limit);
        List<Employee> employees = query.list();
        return employees;
    }

}
