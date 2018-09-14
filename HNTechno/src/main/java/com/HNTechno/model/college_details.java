package com.HNTechno.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="college_details")
public class college_details extends common implements Serializable {

	@Id
	@GeneratedValue
	private int clgdid;
	private String clgname;
	
	@ManyToOne()
	@JoinColumn(name="clgmid")
	private college_master cm;

	
	public college_details(String clgname, college_master cm) {
		super();
		this.clgname = clgname;
		this.cm = cm;
	}

	public int getClgdid() {
		return clgdid;
	}

	public void setClgdid(int clgdid) {
		this.clgdid = clgdid;
	}

	public String getClgname() {
		return clgname;
	}

	public void setClgname(String clgname) {
		this.clgname = clgname;
	}

	public college_master getCm() {
		return cm;
	}

	public void setCm(college_master cm) {
		this.cm = cm;
	}

	public college_details() {
		super();
	}
	
	
	
}
