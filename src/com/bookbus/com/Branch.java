package com.bookbus.com;

public class Branch {

	private int branch_id;
	public int getBranch_id() {
		return branch_id;
	}
	public void setBranch_id(int branch_id) {
		this.branch_id = branch_id;
	}
	public int getVendori_id() {
		return vendori_id;
	}
	public void setVendori_id(int vendori_id) {
		this.vendori_id = vendori_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getBranch_type() {
		return branch_type;
	}
	public void setBranch_type(String branch_type) {
		this.branch_type = branch_type;
	}
	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}
	public String getErrorMsg() {
		return errorMsg;
	}
	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	private int vendori_id;
	private String name;
	private String location;
	private String description;
	private String branch_type;
	private String capacity;
	private String errorMsg;
	private int status=0;
	private String Phno;
	public void setPhno(String string) {
		// TODO Auto-generated method stub
		this.Phno=string;
	}
	public String getPhno()
	{
		return Phno;
	}
	
}
