package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.Report;
import util.DBConnection;

public class ReportDBUtil {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static boolean insertreport(String Report_Date, String name, String email, String Gender, int Age, int Specimen_no, String Specimen_type, String Specimen_collect_D, String Test_conductor, String Hemoglobin_R, String WBC_R, String RBC_R, String MCV_R, String BloodSugar_R, String Cholesterol_R, String Notes_R) {
		boolean isSuccess = false;
		

	    try {
	    	DBConnection db = new DBConnection();
			con = db.getConnection();
	    	stmt = con.createStatement();
	    	String sql = "insert into lab_reports values(0,'"+Report_Date+"', '"+name+"', '"+email+"', '"+Gender+"', "+Age+", "+Specimen_no+", '"+Specimen_type+"', '"+Specimen_collect_D+"', '"+Test_conductor+"', '"+Hemoglobin_R+"', '"+WBC_R+"', '"+RBC_R+"', '"+MCV_R+"', '"+BloodSugar_R+"', '"+Cholesterol_R+"' , '"+ Notes_R +"')";
	    	int rs = stmt.executeUpdate(sql);
	    	
	    	if(rs > 0) {
	    		isSuccess = true;
	    	}else {
	    		isSuccess = false;
	    	}
	    	
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	    
	    
		return isSuccess;
	}
	
	
	 public ArrayList<Report> getAllReports(){ 
		 DBConnection db = new DBConnection();
		 con = db.getConnection();
	  
		 String query = "SELECT * FROM lab_reports";
	  
		 ArrayList<Report> reportL = new ArrayList<>();
	  
		 try { 
			 Statement statement = con.createStatement(); 
			 rs = statement.executeQuery(query);
	  
			 while(rs.next()) { 
				 Report report = new Report();
				 report.setReport_id(rs.getInt("Report_id")); 
				 report.setName(rs.getString("Name"));
				 report.setAge(rs.getInt("Age")); 
				 report.setSpecimen_Type(rs.getString("Specimen_Type"));
				 reportL.add(report); 
			 } 
			 } catch (SQLException e) { 
				 e.printStackTrace(); 
			}
	  
	  return reportL; 
	  }
	 
	 public boolean DeleteReport(int id) {			
			boolean isSuccess = false;
			try {
				DBConnection db = new DBConnection();
				con = db.getConnection();
				stmt=con.createStatement();
				String sql= "delete from lab_reports where Report_id="+ id;
				int r =stmt.executeUpdate(sql);
				
				if(r > 0) {
					
					isSuccess = true;
					
				}
				
				else {
					isSuccess =false;
				}
			}
			catch(Exception e) {
				
				e.printStackTrace();
			}
		
			return isSuccess;
		}
	 
	 public static int updateReport(int id, String name, String email, String Gender,int Age, int Specimen_no, String Specimen_type, String Test_conductor, String Hemoglobin_R, String WBC_R, String RBC_R, String MCV_R, String BloodSugar_R, String Cholesterol_R, String Notes_R) {
			int check = 0;

			DBConnection db = new DBConnection();
			Connection con = db.getConnection();
			
			try {
				String query = "UPDATE lab_reports SET Name = ?, Email = ?, Gender = ?, Age = ?, Specimen_No = ?, Specimen_Type = ?, Test_Coductor = ?, Hemoglobin = ?, WBC = ?, RBC = ?, MCV = ?, Blood_Sugar = ?, Cholestrol = ?, Notes = ? WHERE Report_id = ?";
					
				PreparedStatement ps = con.prepareStatement(query);
				ps.setString(1, name);
				ps.setString(2, email);
				ps.setString(3, Gender);
				ps.setInt(4, Age);
				ps.setInt(5, Specimen_no);
				ps.setString(6, Specimen_type);
				ps.setString(7, Test_conductor);
				ps.setString(8, Hemoglobin_R);
				ps.setString(9, WBC_R);
				ps.setString(10, RBC_R);
				ps.setString(11, MCV_R);
				ps.setString(12, BloodSugar_R);
				ps.setString(13, Cholesterol_R);
				ps.setString(14, Notes_R);
				ps.setInt(15, id);
				check = ps.executeUpdate();
				
				ps.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
			return check;
		}
	 
}