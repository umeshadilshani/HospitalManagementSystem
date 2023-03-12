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
 * Servlet implementation class CheckMedU
 */
public class CheckMedU extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int s_id = Integer.parseInt(request.getParameter("s_id"));
		
		Stock stock = new Stock();
		stock.setS_id(s_id);
		
		StockServiceImpl stockService = new StockServiceImpl();
		
		Stock newStock = new Stock();
		newStock = stockService.checkMedID(stock);
		
		request.setAttribute("s_idu", newStock.getS_id());
		request.setAttribute("s_nameu", newStock.getS_sname());
		request.setAttribute("s_quantityu", newStock.getS_quantity());
		request.setAttribute("s_priceu", newStock.getS_price());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("updateStock.jsp");
		dispatcher.forward(request, response);
	}

}
