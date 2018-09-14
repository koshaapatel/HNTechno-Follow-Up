package com.HNTechno.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="student_authentication")
public class student_authentication {

	@Id
	@GeneratedValue
	private int authenticationid;
	private String username;
	private String password;
	
	public int getAuthenticationid() {
		return authenticationid;
	}
	public void setAuthenticationid(int authenticationid) {
		this.authenticationid = authenticationid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public student_authentication() {
		super();
	}
	
}
