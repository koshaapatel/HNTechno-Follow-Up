package com.HNTechno.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="State_details")
public class state_details extends common implements Serializable {

	@Id
	@GeneratedValue
	private int statedid;
	private String statename;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="statemid")
	private state_master sm;

	public state_details(String statename, state_master sm) {
		super();
		this.statename = statename;
		this.sm = sm;
	}

	public int getStatedid() {
		return statedid;
	}

	public void setStatedid(int statedid) {
		this.statedid = statedid;
	}

	public String getStatename() {
		return statename;
	}

	public void setStatename(String statename) {
		this.statename = statename;
	}

	public state_master getSm() {
		return sm;
	}

	public void setSm(state_master sm) {
		this.sm = sm;
	}

	public state_details() {
		super();
	}
	
	
	
}
