package com.flyaway.entities;

public class Register {
	private String fName;
	private String lName;
	private String email;
	private String password;
	private String cPassword;
	private String phoneNumber;
	private int id;
	
	
	public Register() {
	
	}

	public Register(int id,String fName, String lName, String email, String password, String cPassword, String phoneNumber) {
		this.fName = fName;
		this.lName = lName;
		this.email = email;
		this.password = password;
		this.cPassword = cPassword;
		this.phoneNumber = phoneNumber;
		this.id = id;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getcPassword() {
		return cPassword;
	}

	public void setcPassword(String cPassword) {
		this.cPassword = cPassword;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	
}
