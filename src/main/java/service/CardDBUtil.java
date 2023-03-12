package service;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.Cards;
import util.DBConnection;




public class CardDBUtil {
	
	private static boolean isSuccess;
	private static Connection con= null;
	private static Statement stmt = null;
	
	
	public ArrayList<Cards> getAllCards(){
		DBConnection db = new DBConnection();
		Connection con = db.getConnection();
		
		String query = "SELECT * FROM card";
		
		ArrayList<Cards> userList = new ArrayList<>();
		
		try {
			Statement statement = con.createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			while(rs.next()) {
				Cards card = new Cards();
				card.setId(rs.getInt("cid"));
				card.setName(rs.getString("cname"));
				card.setAge(rs.getInt("cage"));
				card.setDiagnosis(rs.getString("cdiagnosis"));
				userList.add(card);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return userList;
	}
  
	  public static boolean insertcard(String name,int age, String diagnosis) {
		  
		   isSuccess = false;
		   
		   
			try {
				
				DBConnection db = new DBConnection();
				con = db.getConnection();
			    stmt=con.createStatement();
				String sql = "insert into card values (0,'"+name+"',"+age+",'"+diagnosis+"')";
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

	  public int updateCard(Cards card) {
			int check = 0;

			DBConnection db = new DBConnection();
			Connection con = db.getConnection();
			
			try {
				String query = "UPDATE card SET cdiagnosis = ? WHERE cid = ?";
					
				PreparedStatement ps = con.prepareStatement(query);
				ps.setString(1, card.getDiagnosis());
				ps.setInt(2, card.getId());
				check = ps.executeUpdate();
				
				ps.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
			return check;
		}
	

	public static boolean DeleteCard(String id) {
		
		int convId= Integer.parseInt(id);
		
		
		isSuccess = false;
		try {
			DBConnection db = new DBConnection();
			con = db.getConnection();
			stmt=con.createStatement();
			String sql= "delete from card where cid="+convId;
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


	  
	  
  
