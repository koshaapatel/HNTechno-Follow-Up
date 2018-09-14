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
@Table(name="video_master")
public class video_master implements Serializable {

	@Id
	@GeneratedValue
	@Column(name="vmid")
	private int vmid;
	
	
	@OneToOne
	@JoinColumn(name="sdid")
	private sublanguage_details sd;
	
	@OneToMany(mappedBy="vm",fetch=FetchType.LAZY)
	private List<video_details> vd = new ArrayList<video_details>();
	
	
	public int getVmid() {
		return vmid;
	}


	public void setVmid(int vmid) {
		this.vmid = vmid;
	}


	public sublanguage_details getSd() {
		return sd;
	}


	public void setSd(sublanguage_details sd) {
		this.sd = sd;
	}


	public List<video_details> getVd() {
		return vd;
	}


	public void setVd(List<video_details> vd) {
		this.vd = vd;
	}


	
	public video_master() {
		super();
	}
	
	
	
}
