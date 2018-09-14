package com.HNTechno.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="student_projectdetails")
public class student_projectdetails {

	@Id
	@GeneratedValue
	private int projectid;
	private String projectdefinition;
	private String title;
	private String remark;
	
	@OneToOne
	@JoinColumn(name="batchid")
	private batchdetails b;
	
	@OneToOne
	@JoinColumn(name="trainid")
	private trainingtype t;
	
	public trainingtype getT() {
		return t;
	}
	public void setT(trainingtype t) {
		this.t = t;
	}
	public batchdetails getB() {
		return b;
	}
	public void setB(batchdetails b) {
		this.b = b;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getProjectid() {
		return projectid;
	}
	public void setProjectid(int projectid) {
		this.projectid = projectid;
	}
	
	public String getProjectdefinition() {
		return projectdefinition;
	}
	public void setProjectdefinition(String projectdefinition) {
		this.projectdefinition = projectdefinition;
	}
		public student_projectdetails() {
		super();
	}
	
	
}
