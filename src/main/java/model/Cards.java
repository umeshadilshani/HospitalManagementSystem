package model;

public class Cards {
	 private int id;
	 private String name;
	 private int age;
	 private String diagnosis;
	 
	 
	public Cards() {
		super();
	}

	public Cards(int id, String name, int age, String diagnosis) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.diagnosis = diagnosis;
	}
	
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
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getDiagnosis() {
		return diagnosis;
	}
	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}
}
