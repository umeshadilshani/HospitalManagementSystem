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
 * Servlet implementation class UpdateMed
 */
public class UpdateMed extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int s_id = Integer.parseInt(request.getParameter("s_id"));
		int s_quantity = Integer.parseInt(request.getParameter("s_quantity"));
		double s_price = Double.parseDouble(request.getParameter("s_price"));
		
		Stock stock = new Stock();
		stock.setS_id(s_id);
		stock.setS_quantity(s_quantity);
		stock.setS_price(s_price);
		
		StockServiceImpl stockService = new StockServiceImpl();
		int ucount = stockService.updateMed(stock);
		
		request.setAttribute("ucount", ucount);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("updateStock.jsp");
		dispatcher.forward(request, response);
	}
}
