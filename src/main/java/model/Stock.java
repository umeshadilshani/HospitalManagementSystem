package model;

public class Stock {
	private int s_id;
	private String s_sname;
	private int s_quantity;
	private double s_price;
	
	
	public Stock() {
		super();
	}
	
	public Stock(String s_sname, int s_quantity, double s_price) {
		super();
		this.s_sname = s_sname;
		this.s_quantity = s_quantity;
		this.s_price = s_price;
	}
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public String getS_sname() {
		return s_sname;
	}
	public void setS_sname(String s_sname) {
		this.s_sname = s_sname;
	}
	
	public int getS_quantity() {
		return s_quantity;
	}
	public void setS_quantity(int s_quantity) {
		this.s_quantity = s_quantity;
	}
	public double getS_price() {
		return s_price;
	}
	public void setS_price(double s_price) {
		this.s_price = s_price;
	}
}
