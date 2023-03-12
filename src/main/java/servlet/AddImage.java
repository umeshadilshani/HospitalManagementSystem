/**
 * Silva T.U.D
 */
package servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import util.DBConnection;

/**
 * Servlet implementation class AddImage
 */
@MultipartConfig(maxFileSize = 2000000) 
public class AddImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int id = (int)session.getAttribute("id");
		String designation = (String) session.getAttribute("designation");
		

		/* System.out.println("In do post method of Add Image servlet."); */
		Part file=request.getPart("image");
		
		String imageFileName=file.getSubmittedFileName();  // get selected image file name
		/* System.out.println("Selected Image File Name : "+imageFileName); */
		
		String uploadPath="C:/Users/umesha_dilshani/eclipse-workspace/HospitalManagementSystem/src/main/webapp/images/"+imageFileName;  // upload path where we have to upload our actual image
		/* System.out.println("Upload Path : "+uploadPath); */
		
		// Uploading our selected image into the images folder
		
		try
		{
		
		FileOutputStream fos=new FileOutputStream(uploadPath);
		InputStream is=file.getInputStream();
		
		byte[] data=new byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();
		
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		//**********************
		
		//getting database connection (jdbc code)
		try 
		{
			DBConnection db = new DBConnection();
			Connection connection = db.getConnection();
			PreparedStatement stmt;
			String query="update employee set profilepic = (?) where id = (?)";
			stmt=connection.prepareStatement(query);
			stmt.setString(1,imageFileName);
			stmt.setInt(2,id);
			stmt.executeUpdate(); // it returns no of rows affected.
			
			session.setAttribute("profilepic", imageFileName);
			
			if(designation.equals("System Admin")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("adminHomePage.jsp");
				dispatcher.forward(request, response);
			}
			else if(designation.equals("pharmacist")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("pharmacistHomePage.jsp");
				dispatcher.forward(request, response);
			}
			else if(designation.equals("nurse")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("nurseHomePage.jsp");
				dispatcher.forward(request, response);
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
	}
}


