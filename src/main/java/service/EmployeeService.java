package service;

import model.Employee;

public interface EmployeeService {
	public String check(Employee emp);
	
	public Employee getUser(Employee emp);
	
	public int updateProfile(Employee emp);
	
	public String addEmp(Employee emp);
	
	public Employee checkEmp(Employee emp);
	
	public int updateEmp(Employee emp);
}
