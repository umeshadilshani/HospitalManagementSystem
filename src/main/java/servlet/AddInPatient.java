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
 * Servlet implementation class AddInPatient
 */
public class AddInPatient extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ip_name = request.getParameter("ip_name");
		String ip_ward = request.getParameter("ip_ward");
		int ip_bed = Integer.parseInt(request.getParameter("ip_bed"));
		String ip_status = request.getParameter("ip_status");
		
		InPatient inPatient = new InPatient();
		inPatient.setIp_name(ip_name);
		inPatient.setIp_ward(ip_ward);
		inPatient.setIp_bed(ip_bed);
		inPatient.setIp_status(ip_status);
		
		InPatientServiceImpl inpatientService = new InPatientServiceImpl();
		String addMsg = inpatientService.addInPatient(inPatient);
		
		request.setAttribute("addMsg", addMsg);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("nurseHomePage.jsp");
		dispatcher.forward(request, response);
	}

}
