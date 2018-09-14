package com.HNTechno.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.MappedSuperclass;
@MappedSuperclass
public class common implements Serializable{

	@Column(columnDefinition="tinyint(1) default 0")
	private int active_flag;
	
	public int getActive_flag() {
		return active_flag;
	}

	public void setActive_flag(int active_flag) {
		this.active_flag = active_flag;
	}

		public common() {
		super();
	}
	
	
}
