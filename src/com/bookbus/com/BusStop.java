package com.bookbus.com;

public class BusStop {

	private int busStop_id;

	private String location;
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getBusStop_id() {
		return busStop_id;
	}

	public void setBusStop_id(int busStop_id) {
		this.busStop_id = busStop_id;
	}

	public String getStop_type() {
		return stop_type;
	}

	public void setStop_type(String stop_type) {
		this.stop_type = stop_type;
	}

	public String getContact_no() {
		return contact_no;
	}

	public void setContact_no(String contact_no) {
		this.contact_no = contact_no;
	}

	public String getOther_details() {
		return Other_details;
	}

	public void setOther_details(String other_details) {
		Other_details = other_details;
	}

	private String stop_type;
	private String contact_no;
	private String Other_details;

}
