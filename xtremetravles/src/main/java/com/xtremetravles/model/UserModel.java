package com.xtremetravles.model;

public class UserModel {

	private int id;
	private String fullName;
	private String role;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "UserModel [id=" + id + ", fullName=" + fullName + ", role=" + role + "]";
	}
	
	
	 
}
