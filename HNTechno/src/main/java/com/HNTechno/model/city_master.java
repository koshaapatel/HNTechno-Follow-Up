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
@Table(name="city_master")
public class city_master extends common implements Serializable {

	@Id
	@GeneratedValue
	private int citymid;
	
	@OneToOne
	@JoinColumn(name="statedid")
	private state_details sd;
	
	@OneToMany(mappedBy="cm",fetch=FetchType.LAZY)
	private List<city_details> cd = new ArrayList<city_details>(0);

	public List<city_details> getCd() {
		return cd;
	}

	public void setCd(List<city_details> cd) {
		this.cd = cd;
	}

	public city_master() {
		super();
	}

	public int getCitymid() {
		return citymid;
	}

	public void setCitymid(int citymid) {
		this.citymid = citymid;
	}

	public state_details getSd() {
		return sd;
	}

	public void setSd(state_details sd) {
		this.sd = sd;
	}

}
