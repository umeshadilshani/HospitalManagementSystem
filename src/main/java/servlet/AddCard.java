package servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddCard
 */
public class AddCard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Name=request.getParameter("name");
		int age= Integer.parseInt(request.getParameter("age"));
		String Diagnosis=request.getParameter("diagnosis");
		
		
		boolean isTrue;
		isTrue=service.CardDBUtil.insertcard(Name, age, Diagnosis);
		
		if(isTrue==true) {
			String msg = "Success";
			request.setAttribute("msg", msg);
			RequestDispatcher dis = request.getRequestDispatcher("doctorHomePage.jsp");
			dis.forward(request, response);
		}
		else {
			String msg = "Unsuccess";
			request.setAttribute("msg", msg);
			RequestDispatcher dis = request.getRequestDispatcher("doctorHomePage.jsp");
			dis.forward(request, response);
		}
	}

}
