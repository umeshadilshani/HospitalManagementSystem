/**
 * @author Silva T.U.D
 */

package model;

/**
 * Store properties and methods related to the inpatient class
 */

public class InPatient {
	//Properties of the inpatient class
	private int ip_id;
	private String ip_name;
	private String ip_ward;
	private int ip_bed;
	private String ip_status;
	
	//Constructors of the inpatient class
	public InPatient() {
		super();
	}

	//Getters and setters of the inpatient class
	public int getIp_id() {
		return ip_id;
	}

	public void setIp_id(int ip_id) {
		this.ip_id = ip_id;
	}

	public String getIp_name() {
		return ip_name;
	}

	public void setIp_name(String ip_name) {
		this.ip_name = ip_name;
	}

	public String getIp_ward() {
		return ip_ward;
	}

	public void setIp_ward(String ip_ward) {
		this.ip_ward = ip_ward;
	}
	
	public int getIp_bed() {
		return ip_bed;
	}

	public void setIp_bed(int ip_bed) {
		this.ip_bed = ip_bed;
	}

	public String getIp_status() {
		return ip_status;
	}

	public void setIp_status(String ip_status) {
		this.ip_status = ip_status;
	}
}
