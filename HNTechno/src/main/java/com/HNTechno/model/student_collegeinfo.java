package com.HNTechno.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="student_collegeinfo")
public class student_collegeinfo {

	@Id
	@GeneratedValue
	private int clginfoid;
	@OneToOne
	@JoinColumn(name="clgdid")
	private college_details cd;
	@OneToOne
	@JoinColumn(name="fieldid")
	private field f;
	private int sem;
	
	public int getSem() {
		return sem;
	}

	public void setSem(int sem) {
		this.sem = sem;
	}

	public int getClginfoid() {
		return clginfoid;
	}
	
	public field getF() {
		return f;
	}

	public void setF(field f) {
		this.f = f;
	}

	public void setClginfoid(int clginfoid) {
		this.clginfoid = clginfoid;
	}
	public college_details getCd() {
		return cd;
	}
	public void setCd(college_details cd) {
		this.cd = cd;
	}
	public student_collegeinfo() {
		super();
	}
	
	
}
