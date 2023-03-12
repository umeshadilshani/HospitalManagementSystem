/**
 * @author Silva T.U.D
 */

package service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.Ward;
import util.DBConnection;

public class WardServiceImpl implements WardService {
	/**
	 * Get the bed count of a specific ward
	 */
	public int bedCount(Ward ward) {
		int bedCount = 0;
		DBConnection db = new DBConnection();
		Connection con = db.getConnection();
		
		String query = "SELECT * FROM ward WHERE w_name = '" + ward.getW_name() + "'";
		
		try {
			Statement statement = con.createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			while(rs.next()) {
				bedCount = rs.getInt("w_bed");
			}
		}catch (Exception e) {
			e.getMessage();
		}
		return bedCount;
	}
	
	
	/**
	 * Retreive all the details of wards
	 */
	public ArrayList<Ward> getAllWards(){
		DBConnection db = new DBConnection();
		Connection con = db.getConnection();
		
		String query = "SELECT * FROM ward";
		
		ArrayList<Ward> wardList = new ArrayList<>();
		
		try {
			Statement statement = con.createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			while(rs.next()) {
				Ward ward = new Ward();
				ward.setW_id(rs.getInt("w_id"));
				ward.setW_name(rs.getString("w_name"));
				ward.setW_bed(rs.getInt("w_bed"));
				wardList.add(ward);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return wardList;
	}
}
