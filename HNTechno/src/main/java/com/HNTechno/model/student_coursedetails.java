package com.HNTechno.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="student_coursedetails")
public class student_coursedetails extends common implements Serializable {

	@Id
	@GeneratedValue
	private int coursemid;
	
	private int fees;
	private String duration;
	
	@OneToOne()
	@JoinColumn(name="lid")
	private Language l;
	
	@OneToMany(mappedBy="sc",fetch=FetchType.LAZY)
	private List<student_coursedetails_details> scd = new ArrayList<student_coursedetails_details>();
	
	public List<student_coursedetails_details> getScd() {
		return scd;
	}
	public void setScd(List<student_coursedetails_details> scd) {
		this.scd = scd;
	}
	public Language getL() {
		return l;
	}
	public void setL(Language l) {
		this.l = l;
	}
	
	public int getCoursemid() {
		return coursemid;
	}
	public void setCoursemid(int coursemid) {
		this.coursemid = coursemid;
	}
	public int getFees() {
		return fees;
	}
	public void setFees(int fees) {
		this.fees = fees;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public student_coursedetails() {
		super();
	}
	
	
}
