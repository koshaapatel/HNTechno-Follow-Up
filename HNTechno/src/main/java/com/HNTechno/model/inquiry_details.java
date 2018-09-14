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
@Table(name="inquiry_details")
public class inquiry_details extends common implements Serializable {

	@Id
	@GeneratedValue
	private int idid;
	@OneToOne
	@JoinColumn(name="sdid")
	private sublanguage_details subd;
	@ManyToOne
	@JoinColumn(name="imid")
	private inquiry i;
	public int getIdid() {
		return idid;
	}
	
	public void setIdid(int idid) {
		this.idid = idid;
	}
	
	
	public inquiry_details(sublanguage_details subd, inquiry i) {
		super();
		this.subd = subd;
		this.i = i;
	}

	public sublanguage_details getSubd() {
		return subd;
	}

	public void setSubd(sublanguage_details subd) {
		this.subd = subd;
	}

	public inquiry getI() {
		return i;
	}
	public void setI(inquiry i) {
		this.i = i;
	}
	public inquiry_details() {
		super();
	}
	
	
}
