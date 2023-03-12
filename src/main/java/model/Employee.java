/**
 * @author Silva T.U.D
 */

package model;

/**
 * Store properties and methods related to the employee class
 */

public class Employee {
	//Properties of the employee class
	private int id;
	private String name;
	private String designation;
	private String nic;
	private String phone;
	private String email;
	private String address;
	private String username;
	private String password;
	private String profilepic;
	
	
	//Constructors of the employee class
	public Employee() {
		super();
	}

	public Employee(int id, String name, String designation, String nic, String phone, String email, String address,
			String username, String password, String profilepic) {
		super();
		this.id = id;
		this.name = name;
		this.designation = designation;
		this.nic = nic;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.username = username;
		this.password = password;
		this.profilepic = profilepic;
	}

	public Employee(int id, String username, String password) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
	}
	
	public Employee(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	//Getters and setters of the employee class
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getNic() {
		return nic;
	}

	public void setNic(String nic) {
		this.nic = nic;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getProfilepic() {
		return profilepic;
	}

	public void setProfilepic(String profilepic) {
		this.profilepic = profilepic;
	}
}
