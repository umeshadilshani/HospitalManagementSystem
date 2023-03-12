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
 * Servlet implementation class AddStock
 */
public class AddStock extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String s_name = request.getParameter("s_name");
		int s_quantity = Integer.parseInt(request.getParameter("s_quantity"));
		float s_price = Float.parseFloat(request.getParameter("s_price"));
		
		Stock stock = new Stock(s_name, s_quantity, s_price);
		
		String msg = new StockServiceImpl().addStock(stock);
		
		request.setAttribute("msg", msg);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("pharmacistHomePage.jsp");
		dispatcher.forward(request, response);
	}

}
