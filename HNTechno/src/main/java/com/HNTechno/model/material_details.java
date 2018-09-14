package com.HNTechno.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="material_details")
public class material_details {

	@Id
	@GeneratedValue
	private int mdid;
	private String mat_name;
	private String mat_title;
	private String file;
	
	@ManyToOne
	@JoinColumn(name="mmid")
	private material_master mm;
	
	
	public material_details(int mdid) {
		super();
		this.mdid = mdid;
	}

	public material_details(String mat_name, String mat_title, String file,
			material_master mm) {
		super();
		this.mat_name = mat_name;
		this.mat_title = mat_title;
		this.file = file;
		this.mm = mm;
	}
	
	public int getMdid() {
		return mdid;
	}

	public void setMdid(int mdid) {
		this.mdid = mdid;
	}

	public material_master getMm() {
		return mm;
	}

	public void setMm(material_master mm) {
		this.mm = mm;
	}

	public String getMat_name() {
		return mat_name;
	}
	public void setMat_name(String mat_name) {
		this.mat_name = mat_name;
	}
	public String getMat_title() {
		return mat_title;
	}
	public void setMat_title(String mat_title) {
		this.mat_title = mat_title;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public material_details() {
		super();
	}
	
	
	
	
}
