package com.HNTechno.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table(name="sublanguage_details")
public class sublanguage_details extends common implements Serializable{

	@Id
	@GeneratedValue
	private int sdid;
	private String sublang;
	private String title;
	private int fees;
	private String course;
	@ManyToOne()
	@JoinColumn(name="smid")
	private sublanguage_master sm;
	
	public sublanguage_details(int sdid, String sublang) {
		super();
		this.sdid = sdid;
		this.sublang = sublang;
	}
	public sublanguage_details(int sdid) {
		super();
		this.sdid = sdid;
	}
	public int getSdid() {
		return sdid;
	}
	public void setSdid(int sdid) {
		this.sdid = sdid;
	}
	public String getSublang() {
		return sublang;
	}
	public void setSublang(String sublang) {
		this.sublang = sublang;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getFees() {
		return fees;
	}
	public void setFees(int fees) {
		this.fees = fees;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public sublanguage_master getSm() {
		return sm;
	}
	public void setSm(sublanguage_master sm) {
		this.sm = sm;
	}
	public sublanguage_details() {
		super();
	}
	public sublanguage_details(String sublang, String title, int fees,
			String course, sublanguage_master sm) {
		super();
		this.sublang = sublang;
		this.title = title;
		this.fees = fees;
		this.course = course;
		this.sm = sm;
	}
	
	
	
}
