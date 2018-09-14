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

@Entity
@Table(name="material_master")
public class material_master implements Serializable {

	@Id
	@GeneratedValue
	@Column(name="mmid")
	private int mmid;
	
	@OneToOne
	@JoinColumn(name="sdid")
	private sublanguage_details sd;
	
	@OneToMany(mappedBy="mm",fetch=FetchType.LAZY)
	private List<material_details> ld = new ArrayList<material_details>();
	
	public List<material_details> getLd() {
		return ld;
	}
	public void setLd(List<material_details> ld) {
		this.ld = ld;
	}
	
	public int getMmid() {
		return mmid;
	}
	public void setMmid(int mmid) {
		this.mmid = mmid;
	}
	public sublanguage_details getSd() {
		return sd;
	}
	public void setSd(sublanguage_details sd) {
		this.sd = sd;
	}
	public material_master() {
		super();
	}
	
	
}
