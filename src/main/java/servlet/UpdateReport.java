package servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.ReportDBUtil;

/**
 * Servlet implementation class UpdateReport
 */
public class UpdateReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReport() {
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
		int id = Integer.parseInt(request.getParameter("R_id"));
		String name = request.getParameter("patient_name");
		String email = request.getParameter("email");
		String Gender = request.getParameter("Gender");
		int Age = Integer.parseInt(request.getParameter("Age"));
		int Specimen_no = Integer.parseInt(request.getParameter("Specimen_no"));
		String Specimen_type = request.getParameter("Specimen_type");
		String Test_conductor = request.getParameter("Test_conductor");
		String Hemoglobin_R = request.getParameter("Hemoglobin_R");
		String WBC_R = request.getParameter("WBC_R");
		String RBC_R = request.getParameter("RBC_R");
		String MCV_R = request.getParameter("MCV_R");
		String BloodSugar_R = request.getParameter("BloodSugar_R");
		String Cholesterol_R = request.getParameter("Cholesterol_R");
		String Notes_R = request.getParameter("notes");
		int istrue;
		
	    istrue = ReportDBUtil.updateReport(id, name, email, Gender, Age, Specimen_no, Specimen_type, Test_conductor, Hemoglobin_R, WBC_R, RBC_R, MCV_R, BloodSugar_R, Cholesterol_R, Notes_R);
		
	    if(istrue == 1) {
	    	String msg = "Success";
			request.setAttribute("msg", msg);
			RequestDispatcher dis = request.getRequestDispatcher("labAssisstantHomePage.jsp");
			dis.forward(request, response);
	    }else {
	    	String msg = "Unsuccess";
			request.setAttribute("msg", msg);
			RequestDispatcher dis = request.getRequestDispatcher("labAssisstantHomePage.jsp");
			dis.forward(request, response);
	    }   
	}
}
