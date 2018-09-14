package com.HNTechno.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="Inquiry")
public class inquiry extends common implements Serializable {

	@Id
	@GeneratedValue
	private int imid;
	private String fname;
	private String mname;
	private String lname;
	private String email;
	private long mob;
	private String gender;
	@Column(columnDefinition="tinyint(1) default 0")
	private int status;
	
	@OneToMany(mappedBy="i",fetch=FetchType.LAZY)
	private List<inquiry_details> id = new ArrayList<inquiry_details>();
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public student_coursedetails_details getScd() {
		return scd;
	}

	public void setScd(student_coursedetails_details scd) {
		this.scd = scd;
	}

	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="coursedid")
	private student_coursedetails_details scd;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="authenticationid")
	private student_authentication sa;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="clginfoid")
	private student_collegeinfo sc;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="coursemid")
	private student_coursedetails scm;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="projectid")
	private student_projectdetails sp;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="studentid")
	private student_information si;
	
	
	public List<inquiry_details> getId() {
		return id;
	}

	public void setId(List<inquiry_details> id) {
		this.id = id;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public student_authentication getSa() {
		return sa;
	}

	public void setSa(student_authentication sa) {
		this.sa = sa;
	}

	public student_collegeinfo getSc() {
		return sc;
	}

	public void setSc(student_collegeinfo sc) {
		this.sc = sc;
	}

	public student_coursedetails getScm() {
		return scm;
	}

	public void setScm(student_coursedetails scm) {
		this.scm = scm;
	}

	public student_projectdetails getSp() {
		return sp;
	}

	public void setSp(student_projectdetails sp) {
		this.sp = sp;
	}

	public student_information getSi() {
		return si;
	}

	public void setSi(student_information si) {
		this.si = si;
	}

	public int getImid() {
		return imid;
	}

	public void setImid(int imid) {
		this.imid = imid;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getMob() {
		return mob;
	}

	public void setMob(long mob) {
		this.mob = mob;
	}

	public inquiry() {
		super();
	}
	
}
