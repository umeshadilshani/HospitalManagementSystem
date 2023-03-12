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
import model.Ward;
import service.WardServiceImpl;

/**
 * Servlet implementation class CheckWard
 */
public class CheckWard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String w_name = request.getParameter("w_name");
	
		Ward ward = new Ward();
		ward.setW_name(w_name);
		
		WardServiceImpl wardService = new WardServiceImpl();
		
		int bedCount = wardService.bedCount(ward);
		String wardName = w_name;
		
		request.setAttribute("bedCount", bedCount);
		request.setAttribute("wardName", wardName);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("nurseHomePage.jsp");
		dispatcher.forward(request, response);
	}
}
