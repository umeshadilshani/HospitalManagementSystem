/**
 * @author Silva T.U.D
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// Load the jdbc drivers and get the connection
public class DBConnection {
	private String jdbcURL = "jdbc:mysql://localhost:3306/hospitalmanagementsystem";
	private String jdbcUsername = "root";
	private String jdbcPassword = "";
	
	public Connection getConnection() {
		Connection connection = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return connection;
	}
}
