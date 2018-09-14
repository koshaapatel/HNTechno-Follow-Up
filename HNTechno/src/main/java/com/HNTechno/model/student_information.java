package com.HNTechno.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="student_information")
public class student_information extends common implements Serializable {

	@Id
	@GeneratedValue
	private int studentid;
	@OneToOne
	@JoinColumn(name="citydid")
	private city_details cityd;
	private String address;
		
	public city_details getCityd() {
		return cityd;
	}
	public void setCityd(city_details cityd) {
		this.cityd = cityd;
	}
	public int getStudentid() {
		return studentid;
	}
	public void setStudentid(int studentid) {
		this.studentid = studentid;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public student_information() {
		super();
	}
	
	
}
