/**
 * @author Silva T.U.D
 */

package servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Employee;
import service.EmployeeServiceImpl;

/**
 * Servlet implementation class AddEmp
 */
public class AddEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name =request.getParameter("name");
		String designation =request.getParameter("occupation");
		String nic =request.getParameter("nic");
		String email =request.getParameter("email");
		String address =request.getParameter("address");
		String contact =request.getParameter("contact");
		
		Employee emp = new Employee();
		emp.setName(name);
		emp.setDesignation(designation);
		emp.setNic(nic);
		emp.setEmail(email);
		emp.setAddress(address);
		emp.setPhone(contact);
		
		EmployeeServiceImpl empServiceImpl = new EmployeeServiceImpl();
		
		String count = empServiceImpl.addEmp(emp);
		
		request.setAttribute("count", count);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("addStaff.jsp");
		requestDispatcher.forward(request, response);
	}
}
