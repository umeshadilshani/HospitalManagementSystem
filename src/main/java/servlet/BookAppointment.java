package servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BookAppointment
 */
public class BookAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookAppointment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String Name=request.getParameter("name");
		String Phone=request.getParameter("phone");
		String Email=request.getParameter("email");
		String Date=request.getParameter("date");
		String DoctorName=request.getParameter("doctorname");
		
		
		boolean isTrue;
		isTrue=service.PatientDBUtil.insertpatient(Name, Phone, Email, Date, DoctorName);
		
		if(isTrue==true) {
			String msg = "Success";
			request.setAttribute("msg", msg);
			RequestDispatcher dis = request.getRequestDispatcher("appointment.jsp");
			dis.forward(request, response);
		}
		else {
			String msg = "Unsuccess";
			request.setAttribute("msg", msg);
			RequestDispatcher dis = request.getRequestDispatcher("appointment.jsp");
			dis.forward(request, response);
		}
	}

}
