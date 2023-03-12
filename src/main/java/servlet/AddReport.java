package servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.ReportDBUtil;

/**
 * Servlet implementation class AddReport
 */
public class AddReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddReport() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Report_Date = request.getParameter("Report_Date");
		String name = request.getParameter("patient_name");
		String email = request.getParameter("email");
		String Gender = request.getParameter("Gender");
		int Age = Integer.parseInt(request.getParameter("Age"));
		int Specimen_no = Integer.parseInt(request.getParameter("Specimen_no"));
		String Specimen_type = request.getParameter("Specimen_type");
		String Specimen_collect_D = request.getParameter("Specimen_collect_D");
		String Test_conductor = request.getParameter("Test_conductor");
		String Hemoglobin_R = request.getParameter("Hemoglobin_R");
		String WBC_R = request.getParameter("WBC_R");
		String RBC_R = request.getParameter("RBC_R");
		String MCV_R = request.getParameter("MCV_R");
		String BloodSugar_R = request.getParameter("BloodSugar_R");
		String Cholesterol_R = request.getParameter("Cholesterol_R");
		String Notes_R = request.getParameter("notes");
		boolean istrue;
		
	    istrue = ReportDBUtil.insertreport(Report_Date, name, email, Gender, Age, Specimen_no, Specimen_type, Specimen_collect_D, Test_conductor, Hemoglobin_R, WBC_R, RBC_R, MCV_R, BloodSugar_R, Cholesterol_R, Notes_R);
		
	    if(istrue == true) {
	    	String msg = "Success";
			request.setAttribute("msg1", msg);
			RequestDispatcher dis = request.getRequestDispatcher("labAssisstantHomePage.jsp");
			dis.forward(request, response);
	    }else {
	    	String msg = "Unsuccess";
			request.setAttribute("msg1", msg);
			RequestDispatcher dis = request.getRequestDispatcher("labAssisstantHomePage.jsp");
			dis.forward(request, response);
	    }   
	}
}

