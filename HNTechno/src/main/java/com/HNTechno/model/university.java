package com.HNTechno.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.HNTechno.model.city_details;
import com.HNTechno.model.common;

@Entity
@Table(name="university")
public class university extends common implements Serializable {

	@Id
	@GeneratedValue
	private int umid;
	private String uname;
	
	
	public university(int umid) {
		super();
		this.umid = umid;
	}

	public university(int umid, String uname) {
		super();
		this.umid = umid;
		this.uname = uname;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}
	public int getUmid() {
		return umid;
	}

	public void setUmid(int umid) {
		this.umid = umid;
	}

	public university() {
		super();
	}
	
}
