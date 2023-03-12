package servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteCard
 */
public class DeleteCard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		boolean isTrue;
		
		isTrue= service.CardDBUtil.DeleteCard(id);
		
		if(isTrue==true) {
			String msg = "Success";
			request.setAttribute("msg", msg);
			RequestDispatcher dis = request.getRequestDispatcher("deleteCard.jsp");
			dis.forward(request, response);
		}
		else {
			String msg = "Unsuccess";
			request.setAttribute("msg", msg);
			RequestDispatcher dis = request.getRequestDispatcher("deleteCard.jsp");
			dis.forward(request, response);
		}
	
	}

}
