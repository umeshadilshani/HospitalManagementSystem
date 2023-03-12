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
import model.SysAdmin;
import service.EmployeeServiceImpl;

/**
 * Servlet implementation class AddSysAdmin
 */
public class AddSysAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddSysAdmin() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name =request.getParameter("name");
		String designation =request.getParameter("occupation");
		String nic =request.getParameter("nic");
		String email =request.getParameter("email");
		String address =request.getParameter("address");
		String contact =request.getParameter("contact");
		
		SysAdmin sys = SysAdmin.getInstance();
		
		sys.setName(name);
		sys.setDesignation(designation);
		sys.setNic(nic);
		sys.setEmail(email);
		sys.setAddress(address);
		sys.setPhone(contact);
		
		EmployeeServiceImpl empServiceImpl = new EmployeeServiceImpl();
		
		String count = empServiceImpl.addSysAdmin(sys);
		
		request.setAttribute("count", count);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
		requestDispatcher.forward(request, response);	
	}
}
