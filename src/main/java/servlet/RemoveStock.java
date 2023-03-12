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
import model.Stock;
import service.StockServiceImpl;

/**
 * Servlet implementation class RemoveStock
 */
public class RemoveStock extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int s_id = Integer.parseInt(request.getParameter("s_id"));
		
		StockServiceImpl stockService = new StockServiceImpl();
		
		Stock stock = new Stock();
		stock.setS_id(s_id);
		
		String rmsg = stockService.removeStock(stock);
		
		request.setAttribute("rmsg", rmsg);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("pharmacistHomePage.jsp");
		dispatcher.forward(request, response);
	}

}
