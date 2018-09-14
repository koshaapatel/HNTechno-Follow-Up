package com.HNTechno.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="faculty")
public class faculty extends common implements Serializable {

	@Id
	@GeneratedValue
	private int facultyid;
	private String facultyname;
	private String role;
	private String username;
	private String password;
	@Column(columnDefinition="DATE")
	private Date joindate;
	private long mob;
	private String emailid;
	private int salaryamout;
	private String facultyimage;
	private String facultyfile;
	@OneToOne()
	@JoinColumn(name="sdid")
	private sublanguage_details sd;
	public int getFacultyid() {
		return facultyid;
	}
	public void setFacultyid(int facultyid) {
		this.facultyid = facultyid;
	}
	
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	public String getFacultyname() {
		return facultyname;
	}
	public void setFacultyname(String facultyname) {
		this.facultyname = facultyname;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
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
	
	public long getMob() {
		return mob;
	}
	public void setMob(long mob) {
		this.mob = mob;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public int getSalaryamout() {
		return salaryamout;
	}
	public void setSalaryamout(int salaryamout) {
		this.salaryamout = salaryamout;
	}
	public String getFacultyimage() {
		return facultyimage;
	}
	public void setFacultyimage(String facultyimage) {
		this.facultyimage = facultyimage;
	}
	public String getFacultyfile() {
		return facultyfile;
	}
	public void setFacultyfile(String facultyfile) {
		this.facultyfile = facultyfile;
	}
	public sublanguage_details getSd() {
		return sd;
	}
	public void setSd(sublanguage_details sd) {
		this.sd = sd;
	}
	public faculty() {
		super();
	}
	
	
}
