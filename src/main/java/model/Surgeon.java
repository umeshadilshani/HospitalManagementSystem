/**
 * @author Silva T.U.D
 */

package model;

/**
 * Store properties and methods related to the surgeon class 
 */


// Extends from the employee class
public class Surgeon extends Employee{
	//Properties of the surgeon class
	private String speciality;
	private int service;
	
	//Constructors of the surgeon class
	public Surgeon() {
		super();
	}

	//Getters and setters of the surgeon class
	public String getSpeciality() {
		return speciality;
	}

	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}

	public int getService() {
		return service;
	}

	public void setService(int service) {
		this.service = service;
	}
}
