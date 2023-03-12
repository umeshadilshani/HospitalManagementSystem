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

import model.Stock;
import util.DBConnection;

public class StockServiceImpl implements StockService{
	/**
	 * Add stock details
	 */
	public String addStock(Stock stock) {
		String msg = "Try Again";
		
		String s_name = stock.getS_sname();
		int s_quantity = stock.getS_quantity();
		double s_price = stock.getS_price();
		String query = "INSERT INTO stock(s_name, s_quantity, s_price) VALUE (?, ?, ?)";
		String query1 = "SELECT * FROM stock WHERE s_name = '" + stock.getS_sname() + "'";
	
		DBConnection db = new DBConnection();
		Connection con = db.getConnection();
		
		try {
			Statement statement = con.createStatement();
			ResultSet rs = statement.executeQuery(query1);
			
			if(rs.next()) {
				msg = "Try Again";
			}
			else {
				PreparedStatement ps = con.prepareStatement(query);
				ps.setString(1, s_name);
				ps.setInt(2, s_quantity);
				ps.setDouble(3, s_price);
			
				ps.executeUpdate();
			
				msg = "Successful";
			
				ps.close();
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return msg;
	}

	
	/**
	 * Retreive all stock details
	 */
	public ArrayList<Stock> getAllStock(){
		DBConnection db = new DBConnection();
		Connection con = db.getConnection();
		
		String query = "SELECT * FROM stock";
		
		ArrayList<Stock> stockList = new ArrayList<>();
		
		try {
			Statement statement = con.createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			while(rs.next()) {
				Stock stock = new Stock();
				stock.setS_id(rs.getInt(1));
				stock.setS_sname(rs.getString(2));
				stock.setS_quantity(rs.getInt(3));
				stock.setS_price(rs.getDouble(4));
				stockList.add(stock);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stockList;
	}
	
	
	/**
	 * Get stock details of a specific product
	 */
	public Stock checkMedID(Stock stock){
		Stock chkStock = new Stock();
		DBConnection db = new DBConnection();
		Connection con = db.getConnection();
		
		String query = "SELECT * FROM stock WHERE s_id = " + stock.getS_id() + "";
		
		try {
			Statement statement = con.createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			while(rs.next()) {
				chkStock.setS_id(rs.getInt(1));
				chkStock.setS_sname(rs.getString(2));
				chkStock.setS_quantity(rs.getInt(3));
				chkStock.setS_price(rs.getDouble(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return chkStock;
	}

	
	/**
	 * Remove stock details
	 */
	public String removeStock(Stock stock) {
		String rmsg = "Try Again";
		DBConnection db = new DBConnection();
		Connection con = db.getConnection();
		
		String query = "SELECT * FROM stock WHERE s_id = " + stock.getS_id() + "";
		String rquery = "DELETE FROM stock WHERE s_id = " + stock.getS_id() + "";
		
		try {
			Statement statement = con.createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			while(rs.next()) {
				PreparedStatement preparedStatement = con.prepareStatement(rquery);
				int count = preparedStatement.executeUpdate();
				
				if(count == 1) {
					rmsg = "Successful";
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rmsg;
	}
	
	
	/**
	 * Update stock details
	 */
	public int updateMed(Stock stock) {
		int check = 0;

		DBConnection db = new DBConnection();
		Connection con = db.getConnection();
		
		try {
			String query = "UPDATE stock SET s_quantity = ?, s_price = ? WHERE s_id = ?";
				
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, stock.getS_quantity());
			ps.setDouble(2, stock.getS_price());
			ps.setInt(3, stock.getS_id());
			check = ps.executeUpdate();
			
			ps.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return check;
	}
}
