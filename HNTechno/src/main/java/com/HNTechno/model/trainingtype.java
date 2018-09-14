package com.HNTechno.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="TrainingType")
public class trainingtype implements Serializable {

	@Id
	@GeneratedValue
	private int trainid;
	private String ttype;
	public int getTrainid() {
		return trainid;
	}
	
	public trainingtype(String ttype) {
		super();
		this.ttype = ttype;
	}

	public void setTrainid(int trainid) {
		this.trainid = trainid;
	}
	public String getTtype() {
		return ttype;
	}
	public void setTtype(String ttype) {
		this.ttype = ttype;
	}
	public trainingtype() {
		super();
	}
	
	
}
