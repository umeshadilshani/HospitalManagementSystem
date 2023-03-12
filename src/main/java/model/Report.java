package model;

public class Report {
	private int Report_id;
	private String Report_date;
	private String Name;
	private String Email;
	private String Gender;
	private int Age;
	private int Specimen_No;
	private String Specimen_Type;
	private String Specimen_Collect_Date;
	private String Test_Conductor;
	private String Hemoglobin;
	private String WBC;
	private String RBC;
	private String MCV;
	private String Blood_Sugar;
	private String Cholesterol;
	private String Notes;
	
	public Report() {
		
	}
	public Report(int report_id, String report_date, String name, String email, String gender, int age,
			int specimen_No, String specimen_Type, String specimen_Collect_Date, String test_Conductor,
			String hemoglobin, String wBC, String rBC, String mCV, String blood_Sugar, String cholesterol,
			String notes) {
		
		Report_id = report_id;
		Report_date = report_date;
		Name = name;
		Email = email;
		Gender = gender;
		Age = age;
		Specimen_No = specimen_No;
		Specimen_Type = specimen_Type;
		Specimen_Collect_Date = specimen_Collect_Date;
		Test_Conductor = test_Conductor;
		Hemoglobin = hemoglobin;
		WBC = wBC;
		RBC = rBC;
		MCV = mCV;
		Blood_Sugar = blood_Sugar;
		Cholesterol = cholesterol;
		Notes = notes;
	}
	
	public Report(int report_id, String name, String email, String gender, int age,
			int specimen_No, String specimen_Type, String test_Conductor,
			String hemoglobin, String wBC, String rBC, String mCV, String blood_Sugar, String cholesterol,
			String notes) {
		
		Report_id = report_id;
		Name = name;
		Email = email;
		Gender = gender;
		Age = age;
		Specimen_No = specimen_No;
		Specimen_Type = specimen_Type;
		Test_Conductor = test_Conductor;
		Hemoglobin = hemoglobin;
		WBC = wBC;
		RBC = rBC;
		MCV = mCV;
		Blood_Sugar = blood_Sugar;
		Cholesterol = cholesterol;
		Notes = notes;
	}
	
	public int getReport_id() {
		return Report_id;
	}
	public void setReport_id(int report_id) {
		Report_id = report_id;
	}
	public String getReport_date() {
		return Report_date;
	}
	public void setReport_date(String report_date) {
		Report_date = report_date;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getGender() {
		return Gender;
	}
	public void setGender(String gender) {
		Gender = gender;
	}
	public int getAge() {
		return Age;
	}
	public void setAge(int age) {
		Age = age;
	}
	public int getSpecimen_No() {
		return Specimen_No;
	}
	public void setSpecimen_No(int specimen_No) {
		Specimen_No = specimen_No;
	}
	public String getSpecimen_Type() {
		return Specimen_Type;
	}
	public void setSpecimen_Type(String specimen_Type) {
		Specimen_Type = specimen_Type;
	}
	public String getSpecimen_Collect_Date() {
		return Specimen_Collect_Date;
	}
	public void setSpecimen_Collect_Date(String specimen_Collect_Date) {
		Specimen_Collect_Date = specimen_Collect_Date;
	}
	public String getTest_Conductor() {
		return Test_Conductor;
	}
	public void setTest_Conductor(String test_Conductor) {
		Test_Conductor = test_Conductor;
	}
	public String getHemoglobin() {
		return Hemoglobin;
	}
	public void setHemoglobin(String hemoglobin) {
		Hemoglobin = hemoglobin;
	}
	public String getWBC() {
		return WBC;
	}
	public void setWBC(String wBC) {
		WBC = wBC;
	}
	public String getRBC() {
		return RBC;
	}
	public void setRBC(String rBC) {
		RBC = rBC;
	}
	public String getMCV() {
		return MCV;
	}
	public void setMCV(String mCV) {
		MCV = mCV;
	}
	public String getBlood_Sugar() {
		return Blood_Sugar;
	}
	public void setBlood_Sugar(String blood_Sugar) {
		Blood_Sugar = blood_Sugar;
	}
	public String getCholesterol() {
		return Cholesterol;
	}
	public void setCholesterol(String cholesterol) {
		Cholesterol = cholesterol;
	}
	public String getNotes() {
		return Notes;
	}
	public void setNotes(String notes) {
		Notes = notes;
	}
	
	
	
	
	

}
