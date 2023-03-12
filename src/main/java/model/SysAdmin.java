/**
 * @author Silva T.U.D
 */

package model;

/**
 * Store properties and methods related to the sysadmin class
 */

public class SysAdmin {
	//Properties of the sysadmin class
	private static SysAdmin sysAdmin;
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
	
	//Constructors of the sysadmin class
	private SysAdmin() {
	}
	
	/*
	 * Use of Singelton Design pattern to create only one object from 
	 * System Admin class
	 */
	public static SysAdmin getInstance() {
		if(sysAdmin == null){
			synchronized (SysAdmin.class) {
				if(sysAdmin == null){
					sysAdmin = new SysAdmin();
					sysAdmin.id = 1;
				}
			}
		}
		return sysAdmin;
	}

	//Getters and setters of the sysadmin class
	public int getId() {
		return id;
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
