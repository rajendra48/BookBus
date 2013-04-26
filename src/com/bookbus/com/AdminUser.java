package com.bookbus.com;

public class AdminUser {
	private int id;
	private int status=-11;
	private boolean lockedStatus=false;
	public boolean isLockedStatus() {
		return lockedStatus;
	}
	public void setLockedStatus(boolean lockedStatus) {
		this.lockedStatus = lockedStatus;
	}
	public int getStatus() {
		return status;
	}
	private String password="";
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setStatus(int status) {
		this.status = status;
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
	public String getUser_Type() {
		return user_Type;
	}
	public void setUser_Type(String user_Type) {
		this.user_Type = user_Type;
	}
	private String name;
	private String user_Type;
	private String user_Image;
	public String getUser_Image() {
		return user_Image;
	}
	public void setUser_Image(String user_Image) {
		this.user_Image = user_Image;
	}
	
	
	
}
