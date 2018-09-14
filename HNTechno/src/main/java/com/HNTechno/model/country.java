package com.HNTechno.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="country")
public class country extends common implements Serializable{

	@Id
	@GeneratedValue
	private int countryid;
	private String countryname;
	
	
	
	public country(String countryname) {
		super();
		this.countryname = countryname;
	}
	public int getCountryid() {
		return countryid;
	}
	public void setCountryid(int countryid) {
		this.countryid = countryid;
	}
	public String getCountryname() {
		return countryname;
	}
	public void setCountryname(String countryname) {
		this.countryname = countryname;
	}
	public country() {
		super();
	}
	public country(int countryid, String countryname) {
		super();
		this.countryid = countryid;
		this.countryname = countryname;
	}
	public country(int countryid) {
		super();
		this.countryid = countryid;
	}
	
	
}
