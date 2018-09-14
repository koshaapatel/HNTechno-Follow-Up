package com.HNTechno.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="appointment")
public class appointment extends common implements Serializable{

	@Id
	@GeneratedValue
	private int appid;
	@Column(columnDefinition="DATE")
	private Date date;
	private String remark;
	@ManyToOne
	@JoinColumn(name="imid")
	private inquiry im;
	
	@OneToOne
	@JoinColumn(name="lid")
	private Language l;
	
	@OneToOne
	@JoinColumn(name="facultyid")
	private faculty f;

	
	public appointment(Date date, String remark, inquiry im, Language l,
			faculty f) {
		super();
		this.date = date;
		this.remark = remark;
		this.im = im;
		this.l = l;
		this.f = f;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getAppid() {
		return appid;
	}
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	public void setAppid(int appid) {
		this.appid = appid;
	}

	public inquiry getIm() {
		return im;
	}

	public void setIm(inquiry im) {
		this.im = im;
	}

	public Language getL() {
		return l;
	}

	public void setL(Language l) {
		this.l = l;
	}

	public faculty getF() {
		return f;
	}

	public void setF(faculty f) {
		this.f = f;
	}

	public appointment() {
		super();
	}

}
