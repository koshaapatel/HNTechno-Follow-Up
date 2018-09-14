package com.HNTechno.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="student_coursedetails_details")
public class student_coursedetails_details extends common implements Serializable {

	@Id
	@GeneratedValue
	private int coursedid;
	
	@ManyToOne
	@JoinColumn(name="coursemid")
	private student_coursedetails sc;

	@OneToOne
	@JoinColumn(name="sdid")
	private sublanguage_details sd;

	public int getCoursedid() {
		return coursedid;
	}

	public void setCoursedid(int coursedid) {
		this.coursedid = coursedid;
	}

	public student_coursedetails getSc() {
		return sc;
	}

	public void setSc(student_coursedetails sc) {
		this.sc = sc;
	}

	public sublanguage_details getSd() {
		return sd;
	}

	public void setSd(sublanguage_details sd) {
		this.sd = sd;
	}
	
	
	
}
