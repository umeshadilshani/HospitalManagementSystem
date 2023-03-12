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
import model.InPatient;
import service.InPatientServiceImpl;

/**
 * Servlet implementation class UpdateInPatient
 */
public class UpdateInPatient extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ip_id = Integer.parseInt(request.getParameter("ip_id"));
		int ucount = 0;

		InPatient ip = new InPatient();
		ip.setIp_id(ip_id);
			
		InPatientServiceImpl ips = new InPatientServiceImpl();
		ucount = ips.updateInPatient(ip);
			
		request.setAttribute("ucount", ucount);
			
		RequestDispatcher dispatcher = request.getRequestDispatcher("updateInPatient.jsp");
		dispatcher.forward(request, response);
		
	}
}
