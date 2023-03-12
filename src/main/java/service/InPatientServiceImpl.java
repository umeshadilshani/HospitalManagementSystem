/**
 * @author Silva T.U.D
 */

package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.InPatient;
import util.DBConnection;

public class InPatientServiceImpl implements InPatientService {
	/**
	 * Process and get a list of available beds
	 */
	public ArrayList<Integer> getAllBeds(String wardName, String status){
		DBConnection db = new DBConnection();
		Connection con = db.getConnection();
		
		String query = "SELECT * FROM inpatient WHERE ip_ward = '" + wardName + "' AND ip_status = '" + status + "'";
		
		ArrayList<Integer> bedList = new ArrayList<>();
		
		try {
			Statement statement = con.createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			while(rs.next()) {
				bedList.add(rs.getInt("ip_bed"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return bedList;
	}


	/**
	 * Add inpatient records
	 */
	public String addInPatient(InPatient inPatient) {
		String ip_name = inPatient.getIp_name();
		String ip_ward = inPatient.getIp_ward();
		int ip_bed = inPatient.getIp_bed();
		String ip_status = inPatient.getIp_status();
		String query = "INSERT INTO inPatient(ip_name, ip_ward, ip_bed, ip_status) VALUE (?, ?, ?, ?)";
		String msg = "Try Again";
		
		DBConnection db = new DBConnection();
		Connection con = db.getConnection();
		
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, ip_name);
			ps.setString(2, ip_ward);
			ps.setInt(3, ip_bed);
			ps.setString(4, ip_status);
			
			ps.executeUpdate();
			
			msg = "Successful";
			
			ps.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return msg;		
	}
	
	
	/**
	 * Get all inpatient details
	 */
	public ArrayList<InPatient> getAllInPatient(){
		DBConnection db = new DBConnection();
		Connection con = db.getConnection();
		
		String query = "SELECT * FROM inpatient";
		
		ArrayList<InPatient> inPatientList = new ArrayList<>();
		
		try {
			Statement statement = con.createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			while(rs.next()) {
				InPatient inPatient = new InPatient();
				inPatient.setIp_id(rs.getInt("ip_id"));
				inPatient.setIp_name(rs.getString("ip_name"));
				inPatient.setIp_ward(rs.getString("ip_ward"));
				inPatient.setIp_bed(rs.getInt("ip_bed"));
				inPatient.setIp_status(rs.getString("ip_status"));
				inPatientList.add(inPatient);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return inPatientList;
	}
	
	
	/**
	 * Det details of a specific inpatient
	 */
	public InPatient checkIpID(InPatient inPatient){
		InPatient chkIP = new InPatient();
		DBConnection db = new DBConnection();
		Connection con = db.getConnection();
		
		String query = "SELECT * FROM inpatient WHERE ip_id = " + inPatient.getIp_id() + "";
		
		try {
			Statement statement = con.createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			while(rs.next()) {
				chkIP.setIp_id(rs.getInt("ip_id"));
				chkIP.setIp_name(rs.getString("ip_name"));
				chkIP.setIp_ward(rs.getString("ip_ward"));
				chkIP.setIp_bed(rs.getInt("ip_bed"));
				chkIP.setIp_status(rs.getString("ip_status"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return chkIP;
	}
	
	
	/**
	 * Update inpatient details
	 */
	public int updateInPatient(InPatient inPatient) {
		int check = 0;

		DBConnection db = new DBConnection();
		Connection con = db.getConnection();
		
		try {
			String query = "UPDATE inpatient SET ip_bed = ?, ip_status = ? WHERE ip_id = ?";
				
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, 0);
			ps.setString(2, "DisCharge");
			ps.setInt(3, inPatient.getIp_id());
			check = ps.executeUpdate();
			
			ps.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return check;
	}
}
