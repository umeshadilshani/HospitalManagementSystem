/**
 * @author Silva T.U.D
 */
package model;

/**
 * Store properties and methods related to the ward class
 */

public class Ward {
	//Properties of the ward class
	private int w_id;
	private String w_name;
	private int w_bed;
	
	//Constructors of the ward class
	public Ward() {
		super();
	}
	
	//Getters and setters of the ward class
	public int getW_id() {
		return w_id;
	}
	public void setW_id(int w_id) {
		this.w_id = w_id;
	}
	public String getW_name() {
		return w_name;
	}
	public void setW_name(String w_name) {
		this.w_name = w_name;
	}
	public int getW_bed() {
		return w_bed;
	}
	public void setW_bed(int w_bed) {
		this.w_bed = w_bed;
	}
}
