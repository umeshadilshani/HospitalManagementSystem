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
import jakarta.servlet.http.HttpSession;
import model.Employee;
import service.EmployeeServiceImpl;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("txtUsername");
		String password = request.getParameter("txtPassword");
		
		Employee emp = new Employee(username, password);
		
		EmployeeServiceImpl empService = new EmployeeServiceImpl();
		
		Employee newEmp = empService.getUser(emp);
		String count = "0";
	
		if(newEmp == null) {
			request.setAttribute("count", count);
			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
			requestDispatcher.forward(request, response);
		}
		else{
			HttpSession session = request.getSession();
			session.setAttribute("id", newEmp.getId());
			session.setAttribute("designation", newEmp.getDesignation());
			session.setAttribute("name", newEmp.getName());
			session.setAttribute("nic", newEmp.getNic());
			session.setAttribute("phone", newEmp.getPhone());
			session.setAttribute("email", newEmp.getEmail());
			session.setAttribute("address", newEmp.getAddress());
			session.setAttribute("username", newEmp.getUsername());
			session.setAttribute("profilepic", newEmp.getProfilepic());
			String designation = newEmp.getDesignation();
			
			if(designation.equals("System Admin")) {
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("adminHomePage.jsp");
				requestDispatcher.forward(request, response);
			}
			else if(designation.equals("doctor")) {
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("doctorHomePage.jsp");
				requestDispatcher.forward(request, response);
			}
			else if(designation.equals("nurse")) {
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("nurseHomePage.jsp");
				requestDispatcher.forward(request, response);
			}
			else if(designation.equals("labassisstant")) {
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("labAssisstantHomePage.jsp");
				requestDispatcher.forward(request, response);
			}
			else if(designation.equals("receptionist")) {
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("receptionistHomePage.jsp");
				requestDispatcher.forward(request, response);
			}
			else {
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("pharmacistHomePage.jsp");
				requestDispatcher.forward(request, response);
			}
		}
	}
}
