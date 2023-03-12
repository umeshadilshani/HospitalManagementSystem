/**
 * @author Silva T.U.D
 */

package service;

import model.Employee;
import model.Surgeon;

// Method definitions related to the employee services class
public interface EmployeeService {
	public String check(Employee emp);
	
	public Employee getUser(Employee emp);
	
	public int updateProfile(Employee emp);
	
	public String addEmp(Employee emp);
	
	public Employee checkEmp(Employee emp);
	
	public int updateEmp(Employee emp);
	
	public String removeEmp(Employee emp);
	
	public String addSurgeon(Surgeon sur);
}
