package com.HNTechno.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="city_details")
public class city_details extends common implements Serializable{

	@Id
	@GeneratedValue
	private int citydid;
	private String cityname;
	
	@ManyToOne
	@JoinColumn(name="citymid")
	private city_master cm;

	
	public city_details(String cityname, city_master cm) {
		super();
		this.cityname = cityname;
		this.cm = cm;
	}

	public city_details() {
		super();
	}

	public int getCitydid() {
		return citydid;
	}

	public void setCitydid(int citydid) {
		this.citydid = citydid;
	}

	public String getCityname() {
		return cityname;
	}

	public void setCityname(String cityname) {
		this.cityname = cityname;
	}

	public city_master getCm() {
		return cm;
	}

	public void setCm(city_master cm) {
		this.cm = cm;
	}

}
