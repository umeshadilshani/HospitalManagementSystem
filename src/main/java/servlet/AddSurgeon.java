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
import model.Surgeon;
import service.EmployeeServiceImpl;

/**
 * Servlet implementation class AddEmp
 */
public class AddSurgeon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name =request.getParameter("name");
		String designation =request.getParameter("occupation");
		String nic =request.getParameter("nic");
		String email =request.getParameter("email");
		String address =request.getParameter("address");
		String contact =request.getParameter("contact");
		String speciality =request.getParameter("speciality");
		int service = Integer.parseInt(request.getParameter("service"));
		
		Surgeon sur = new Surgeon();
		sur.setName(name);
		sur.setDesignation(designation);
		sur.setNic(nic);
		sur.setEmail(email);
		sur.setAddress(address);
		sur.setPhone(contact);
		sur.setSpeciality(speciality);
		sur.setService(service);
		
		EmployeeServiceImpl empServiceImpl = new EmployeeServiceImpl();

		String count = empServiceImpl.addSurgeon(sur);
		
		request.setAttribute("count", count);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("surgeon.jsp");
		requestDispatcher.forward(request, response);
	}
}
