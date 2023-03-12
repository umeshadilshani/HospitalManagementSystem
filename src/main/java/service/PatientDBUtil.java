package service;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Patient;
import util.DBConnection;




public class PatientDBUtil {
	
	private static boolean isSuccess;
	private static Connection con= null;
	private static Statement stmt = null;
	private static ResultSet rs= null;
	
	
	public ArrayList<Patient> getAllPatients(){
		DBConnection db = new DBConnection();
		Connection con = db.getConnection();
		
		String query = "SELECT * FROM patient";
		
		ArrayList<Patient> userList = new ArrayList<>();
		
		try {
			Statement statement = con.createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			while(rs.next()) {
				Patient pat = new Patient();
				pat.setId(rs.getInt("id"));
				pat.setName(rs.getString("name"));
				pat.setPhone(rs.getString("phone"));
				pat.setEmail(rs.getString("email"));
				pat.setDate(rs.getString("date"));
				pat.setDoctorName(rs.getString("doctorname"));
				userList.add(pat);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return userList;
	}
  
	  public static boolean insertpatient(String name,String phonenumber,String email,String date,String doctorname) {
		  
		   isSuccess = false;
		   
		   
			try {
				
				DBConnection db = new DBConnection();
				con = db.getConnection();
			    stmt=con.createStatement();
				String sql = "insert into patient values (0,'"+name+"','"+phonenumber+"','"+email+"','"+date+"','"+doctorname+"')";
				int rs = stmt.executeUpdate(sql);
				
				if(rs>0) {
					isSuccess = true;
			
				}else {
					isSuccess = false;
				}
				
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		   
		   
		   return isSuccess;
	  }

	  public int updateAppointment(Patient pat) {
			int check = 0;

			DBConnection db = new DBConnection();
			Connection con = db.getConnection();
			
			try {
				String query = "UPDATE patient SET date = ?, doctorname = ? WHERE id = ?";
					
				PreparedStatement ps = con.prepareStatement(query);
				ps.setString(1, pat.getDate());
				ps.setString(2, pat.getDoctorName());
				ps.setInt(3, pat.getId());
				check = ps.executeUpdate();
				
				ps.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
			return check;
		}
	
  public static List<Patient> getpatientDetails(String Id){
	  
	  int convertedID= Integer.parseInt(Id);
		  
	  
	  
	  ArrayList<Patient> pat=new ArrayList<>();
			  
	  
	  try {
		  DBConnection db = new DBConnection();
		con = db.getConnection();
		  stmt= con.createStatement();  
		   String sql ="select * from patient where id= '"+convertedID+ "'";
		   rs=stmt.executeQuery(sql);
		   
		  
		  while(rs.next()) {
			  
			  int id=rs.getInt(1);
			  String name=rs.getString(2);
			  String phone =rs.getString(3);
			  String email=rs.getString(4);
			  String date =rs.getString(5);
			  String doctorname =rs.getString(6);
			  
			  Patient p= new Patient(id,name,phone,email,date,doctorname);
			  pat.add(p);
			  
		  
	  }
		  
		  
	  }
	  
	  catch (Exception e) {
		  
		  e.printStackTrace();
		  
	  }
	  
	return pat;
  } 
	
	public static boolean DeletePatient(String id) {
		
		int convId= Integer.parseInt(id);
		
		
		isSuccess = false;
		try {
			DBConnection db = new DBConnection();
			con = db.getConnection();
			stmt=con.createStatement();
			String sql= "delete from patient where id="+convId;
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
	
}


	  
	  
  
