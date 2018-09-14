package com.HNTechno.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="field")
public class field extends common implements Serializable{

	@Id
	@GeneratedValue
	private int fieldid;
	private String fieldname;
	
	
	public field(int fieldid) {
		super();
		this.fieldid = fieldid;
	}
	public field(int fieldid, String fieldname) {
		super();
		this.fieldid = fieldid;
		this.fieldname = fieldname;
	}
	public int getFieldid() {
		return fieldid;
	}
	public void setFieldid(int fieldid) {
		this.fieldid = fieldid;
	}
	public String getFieldname() {
		return fieldname;
	}
	public void setFieldname(String fieldname) {
		this.fieldname = fieldname;
	}
	public field() {
		super();
	}
	
	
}
