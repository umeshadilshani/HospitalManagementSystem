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
 * Servlet implementation class CheckInPatientU
 */
public class CheckInPatientU extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ip_id = Integer.parseInt(request.getParameter("ip_id"));
		
		InPatient ip = new InPatient();
		ip.setIp_id(ip_id);
		
		InPatientServiceImpl ipService = new InPatientServiceImpl();
		
		InPatient newIp = new InPatient();
		newIp = ipService.checkIpID(ip);
		
		request.setAttribute("ip_idu", newIp.getIp_id());
		request.setAttribute("ip_nameu", newIp.getIp_name());
		request.setAttribute("ip_wardu", newIp.getIp_ward());
		request.setAttribute("ip_bedu", newIp.getIp_bed());
		request.setAttribute("ip_statusu", newIp.getIp_status());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("updateInPatient.jsp");
		dispatcher.forward(request, response);
	}

}
