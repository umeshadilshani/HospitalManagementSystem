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
 * Servlet implementation class UpdateProfile
 */
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int id = (int)session.getAttribute("id");
		String designation = (String) session.getAttribute("designation");
		
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String address = request.getParameter("address");
		
		Employee emp = new Employee();
		emp.setId(id);
		emp.setPhone(phone);
		emp.setEmail(email);
		emp.setUsername(username);
		emp.setAddress(address);
		
		EmployeeServiceImpl empService = new EmployeeServiceImpl();
		int update = empService.updateProfile(emp);
		
		if(update == 1) {
			session.setAttribute("phone", phone);
			session.setAttribute("email", email);
			session.setAttribute("address", address);
			session.setAttribute("username", username);
			
			if(designation.equals("admin")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("adminHomePage.jsp");
				dispatcher.forward(request, response);
			}
			else if(designation.equals("pharmacist")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("pharmacistHomePage.jsp");
				dispatcher.forward(request, response);
			}
			else if(designation.equals("doctor")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("doctorHomePage.jsp");
				dispatcher.forward(request, response);
			}
			else if(designation.equals("labassisstant")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("labAssisstantHomePage.jsp");
				dispatcher.forward(request, response);
			}
			else if(designation.equals("receptionist")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("receptionistHomePage.jsp");
				dispatcher.forward(request, response);
			}
		}
	}
}
