package com.HNTechno.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="State_master")
public class state_master extends common implements Serializable{

	@Id
	@GeneratedValue
	private int statemid;
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="countryid")
	private country c;
	
	@OneToMany(mappedBy="sm",fetch=FetchType.LAZY)
	private List<state_details> sd = new ArrayList<state_details>(0);
	
	
	public state_master(country c) {
		super();
		this.c = c;
	}

	public List<state_details> getSd() {
		return sd;
	}

	public void setSd(List<state_details> sd) {
		this.sd = sd;
	}

	public int getStatemid() {
		return statemid;
	}

	public void setStatemid(int statemid) {
		this.statemid = statemid;
	}
	
	public country getC() {
		return c;
	}


	public void setC(country c) {
		this.c = c;
	}


	public state_master() {
		super();
	}

	public state_master(String cont) {
		// TODO Auto-generated constructor stub
	}

	public state_master(state_master cont) {
		// TODO Auto-generated constructor stub
	}
	
	
}
