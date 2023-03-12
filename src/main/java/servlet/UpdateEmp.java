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
 * Servlet implementation class UpdateEmp
 */
public class UpdateEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String contact = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		
		Employee emp = new Employee();
		emp.setId(id);
		emp.setPhone(contact);
		emp.setEmail(email);
		emp.setAddress(address);
		
		EmployeeServiceImpl empService = new EmployeeServiceImpl();
		int update = empService.updateEmp(emp);
		
		request.setAttribute("update", update);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("updateStaff.jsp");
		dispatcher.forward(request, response);
		}
}


