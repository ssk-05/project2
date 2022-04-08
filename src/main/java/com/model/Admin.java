package com.model;

//Model for Admin
public class Admin {
	private String email_id, password;
	
	public Admin() {
		
	}

	public Admin(String email_id, String password) {
		super();
		this.email_id = email_id;
		this.password = password;
	}
	

	public String getEmail_id() {
		return email_id;
	}

	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Admin [email_id=" + email_id + ", password=" + password + "]";
	}

	
}
