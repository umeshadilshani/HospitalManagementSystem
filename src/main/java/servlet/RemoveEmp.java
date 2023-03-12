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
 * Servlet implementation class RemoveStock
 */
public class RemoveEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int s_id = Integer.parseInt(request.getParameter("id"));
		
		EmployeeServiceImpl empService = new EmployeeServiceImpl();
		
		Employee emp = new Employee();
		emp.setId(s_id);
		
		String rmsg = empService.removeEmp(emp);;
		
		request.setAttribute("rmsg", rmsg);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("deleteStaff.jsp");
		dispatcher.forward(request, response);
	}

}
