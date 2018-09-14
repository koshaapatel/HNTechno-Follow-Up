package com.HNTechno.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="college_master")
public class college_master extends common implements Serializable {

	@Id
	@GeneratedValue
	private int clgmid;
	@OneToOne
	@JoinColumn(name="umid")
	private university u;
	
	@OneToMany(mappedBy="cm",fetch=FetchType.LAZY)
	private List<college_details> clgd = new ArrayList<college_details>(0);

	
	public university getU() {
		return u;
	}

	public void setU(university u) {
		this.u = u;
	}

	public int getClgmid() {
		return clgmid;
	}

	public void setClgmid(int clgmid) {
		this.clgmid = clgmid;
	}

	public List<college_details> getClgd() {
		return clgd;
	}

	public void setClgd(List<college_details> clgd) {
		this.clgd = clgd;
	}

	public college_master() {
		super();
	}

}
