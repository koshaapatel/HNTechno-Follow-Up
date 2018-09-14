package com.HNTechno.model;

import java.sql.Time;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="batchdetails")
public class batchdetails {

	@Id
	@GeneratedValue
	private int batchid;
	private String batchname;
	@Column(columnDefinition="DATE")
	private Date sdate;
	@Column(columnDefinition="DATE")
	private Date edate;
	
	private String stime;
	
	private String etime;
	@OneToOne
	@JoinColumn(name="facultyid")
	private faculty f;
	@OneToOne
	@JoinColumn(name="sdid")
	private sublanguage_details sd;
	
	
	public Date getSdate() {
		return sdate;
	}
	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
	public Date getEdate() {
		return edate;
	}
	public void setEdate(Date edate) {
		this.edate = edate;
	}

	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getEtime() {
		return etime;
	}
	public void setEtime(String etime) {
		this.etime = etime;
	}
	public faculty getF() {
		return f;
	}
	public void setF(faculty f) {
		this.f = f;
	}
	public int getBatchid() {
		return batchid;
	}
	public void setBatchid(int batchid) {
		this.batchid = batchid;
	}
	public String getBatchname() {
		return batchname;
	}
	public void setBatchname(String batchname) {
		this.batchname = batchname;
	}
	public sublanguage_details getSd() {
		return sd;
	}
	public void setSd(sublanguage_details sd) {
		this.sd = sd;
	}
	public batchdetails() {
		super();
	}
	public batchdetails(Date sdate, Date edate) {
		super();
		this.sdate = sdate;
		this.edate = edate;
	}
	
}
