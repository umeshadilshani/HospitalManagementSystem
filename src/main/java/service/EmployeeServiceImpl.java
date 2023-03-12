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

import model.Employee;
import model.Surgeon;
import model.SysAdmin;
import util.DBConnection;

public class EmployeeServiceImpl implements EmployeeService {
	/**
	 * Check the existency of the user id, if true save the username and password,
	 *otherwise show a message, user id does not exist
	 */
	public String check(Employee emp) {
		String check = null;

		DBConnection db = new DBConnection();
		Connection con = db.getConnection();
		
		try {
			PreparedStatement ps = con.prepareStatement("SELECT id FROM employee WHERE id = ?");
			ps.setInt(1, emp.getId());
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				check = "1";
				
				String username = emp.getUsername();
				String password = emp.getPassword();
				String query = "UPDATE employee SET username = ?, password = ? WHERE id = ?";
				
				try {
					PreparedStatement ps1 = con.prepareStatement(query);
					ps1.setString(1, username);
					ps1.setString(2, password);
					ps1.setInt(3, emp.getId());
					ps1.executeUpdate();
					
					ps1.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			else {
				check = "0";
			}
			
			con.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return check;
	}

	
	/**
	 * Get the details of the user after login 
	 */
	public Employee getUser(Employee emp){
		Employee newEmp = null;
		DBConnection db = new DBConnection();
		Connection con = db.getConnection();
		
		try {
			PreparedStatement ps = con.prepareStatement("SELECT username FROM employee WHERE username = ? AND password = ?");
			ps.setString(1, emp.getUsername());
			ps.setString(2, emp.getPassword());
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				PreparedStatement ps1 = con.prepareStatement("SELECT * FROM employee WHERE username = ?");
				ps1.setString(1, emp.getUsername());
				ResultSet rs1 = ps1.executeQuery();
				
				while(rs1.next()) {
					newEmp = new Employee(rs1.getInt("id"), rs1.getString("name"), rs1.getString("designation"), rs1.getString("nic"), rs1.getString("phone"), rs1.getString("email"), rs1.getString("address"), rs1.getString("username"), rs1.getString("password"), rs1.getString("profilepic"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return newEmp;
	}
	
	
	/**
	 * Update the user profile
	 */
	public int updateProfile(Employee emp) {
		int check = 0;

		DBConnection db = new DBConnection();
		Connection con = db.getConnection();
		
		try {
			String query = "UPDATE employee SET phone = ?, email = ?, address = ?, username = ? WHERE id = ?";
				
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, emp.getPhone());
			ps.setString(2, emp.getEmail());
			ps.setString(3, emp.getAddress());
			ps.setString(4, emp.getUsername());
			ps.setInt(5, emp.getId());
			check = ps.executeUpdate();
			
			ps.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return check;
	}
	
	
	/**
	 * Retrieve all the employee details
	 */
	public ArrayList<Employee> getAllUsers(){
		DBConnection db = new DBConnection();
		Connection con = db.getConnection();
		
		String query = "SELECT * FROM employee";
		
		ArrayList<Employee> userList = new ArrayList<>();
		
		try {
			Statement statement = con.createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			while(rs.next()) {
				Employee emp = new Employee();
				emp.setId(rs.getInt("id"));
				emp.setName(rs.getString("name"));
				emp.setNic(rs.getString("nic"));
				emp.setPhone(rs.getString("phone"));
				emp.setEmail(rs.getString("email"));
				emp.setAddress(rs.getString("address"));
				userList.add(emp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return userList;
	}
	
	
	/**
	 * Add new records to the employee table
	 */
	public String addEmp(Employee emp) {
		String name = emp.getName();
		String occupation = emp.getDesignation();
		String NIC = emp.getNic();
		String email = emp.getEmail();
		String address = emp.getAddress();
		String contact = emp.getPhone();
		String query = "INSERT INTO employee(designation, name, nic, phone, email, address) VALUE (?, ?, ?, ?, ?, ?)";
		String count = null;
		
		DBConnection db = new DBConnection();
		Connection con = db.getConnection();
		
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, occupation);
			ps.setString(2, name);
			ps.setString(3, NIC);
			ps.setString(4, contact);
			ps.setString(5, email);
			ps.setString(6, address);
			
			ps.executeUpdate();
			
			count = "1";
			
			ps.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			count = "0";
		}
		
		return count;		
	}
	
	
	/**
	 * Check and retrieve details of a specific employee
	 */
	public Employee checkEmp(Employee emp){
		Employee emp1 = new Employee();
		DBConnection db = new DBConnection();
		Connection con = db.getConnection();
		
		String query = "SELECT * FROM employee WHERE id = " + emp.getId() + "";
		
		try {
			Statement statement = con.createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			while(rs.next()) {
				emp1.setId(rs.getInt("id"));
				emp1.setDesignation(rs.getString("designation"));
				emp1.setName(rs.getString("name"));
				emp1.setNic(rs.getString("nic"));
				emp1.setPhone(rs.getString("phone"));
				emp1.setEmail(rs.getString("email"));
				emp1.setAddress(rs.getString("address"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return emp1;
	}
	
	
	/**
	 * Update employee details
	 */
	public int updateEmp(Employee emp) {
		int check = 0;

		DBConnection db = new DBConnection();
		Connection con = db.getConnection();
		
		try {
			String query = "UPDATE employee SET phone = ?, email = ?, address = ? WHERE id = ?";
				
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, emp.getPhone());
			ps.setString(2, emp.getEmail());
			ps.setString(3, emp.getAddress());
			ps.setInt(4, emp.getId());
			check = ps.executeUpdate();
			
			ps.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return check;
	}


	/**
	 * Remove details of a specific employee
	 */
	public String removeEmp(Employee emp) {
		String rmsg = "Try Again";
		DBConnection db = new DBConnection();
		Connection con = db.getConnection();
			
		String query = "SELECT * FROM employee WHERE id = " + emp.getId() + "";
		String rquery = "DELETE FROM employee WHERE id = " + emp.getId() + "";
			
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
	 * Add new records of a surgeon 
	 */
	public String addSurgeon(Surgeon sur) {
		String name = sur.getName();
		String occupation = sur.getDesignation();
		String NIC = sur.getNic();
		String email = sur.getEmail();
		String address = sur.getAddress();
		String contact = sur.getPhone();
		String query = "INSERT INTO employee(designation, name, nic, phone, email, address) VALUE (?, ?, ?, ?, ?, ?)";
		String count = null;
		
		DBConnection db = new DBConnection();
		Connection con = db.getConnection();
		
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, occupation);
			ps.setString(2, name);
			ps.setString(3, NIC);
			ps.setString(4, contact);
			ps.setString(5, email);
			ps.setString(6, address);
			
			ps.executeUpdate();
			
			count = "1";
			
			if(count == "1") {
				String query1 = "SELECT id FROM employee WHERE nic = '" + sur.getNic()  + "'";
				
				Statement statement = con.createStatement();
				ResultSet rs = statement.executeQuery(query1);
				
				while(rs.next()) {
					sur.setId(rs.getInt("id"));
				}
				
				int id = sur.getId();
				String speciality = sur.getSpeciality();
				int service = sur.getService();
				
				String query2 = "INSERT INTO surgeon(speciality, service, empId) VALUE (?, ?, ?)";
				
				PreparedStatement ps1 = con.prepareStatement(query2);
				ps1.setString(1, speciality);
				ps1.setInt(2, service);
				ps1.setInt(3, id);
				
				ps1.executeUpdate();

				ps1.close();
			}
			else {
				count = "0";
			}
			ps.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			count = "0";
		}
		
		return count;		
	}
	
	
	/**
	 * Add system admin details
	 */
	public String addSysAdmin(SysAdmin sys) {
		String name = sys.getName();
		String occupation = sys.getDesignation();
		String NIC = sys.getNic();
		String email = sys.getEmail();
		String address = sys.getAddress();
		String contact = sys.getPhone();
		String query = "INSERT INTO employee(designation, name, nic, phone, email, address) VALUE (?, ?, ?, ?, ?, ?)";
		String count = null;
		
		DBConnection db = new DBConnection();
		Connection con = db.getConnection();
		
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, occupation);
			ps.setString(2, name);
			ps.setString(3, NIC);
			ps.setString(4, contact);
			ps.setString(5, email);
			ps.setString(6, address);
			
			ps.executeUpdate();
			
			count = "1";
			
			ps.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			count = "0";
		}
		
		return count;		
	}
}
