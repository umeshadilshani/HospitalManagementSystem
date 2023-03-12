/**
 * Silva T.U.D
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
 * Servlet implementation class CheckEmp
 */
public class CheckEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		Employee emp = new Employee();
		emp.setId(id);
		
		EmployeeServiceImpl empService = new EmployeeServiceImpl();
		
		Employee getEmp = new Employee();
		getEmp = empService.checkEmp(emp);
		
		request.setAttribute("id", getEmp.getId());
		request.setAttribute("designation", getEmp.getDesignation());
		request.setAttribute("name", getEmp.getName());
		request.setAttribute("nic", getEmp.getNic());
		request.setAttribute("email", getEmp.getEmail());
		request.setAttribute("contact", getEmp.getPhone());
		request.setAttribute("address", getEmp.getAddress());
				
		RequestDispatcher dispatcher =  request.getRequestDispatcher("updateStaff.jsp");
		dispatcher.forward(request, response);
	}
}
