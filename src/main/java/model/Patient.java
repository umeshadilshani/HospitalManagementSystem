package model;

public class Patient {

	 private int id;
	 private String name;
	 private String phone;
	 private String email;
	 private String date;
	 private String doctorName;
	 
	 public Patient() {
		 
	 }
	public Patient(int id, String name, String phone, String email, String date, String doctor) {
		
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.date = date;
		this.doctorName = doctor;
	}
	public int getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getPhone() {
		return phone;
	}
	public String getEmail() {
		return email;
	}
	public String getDate() {
		return date;
	}
	public String getDoctorName() {
		return doctorName;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	
	 
}
