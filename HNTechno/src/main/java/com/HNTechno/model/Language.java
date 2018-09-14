package com.HNTechno.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="Language")
public class Language extends common implements Serializable {

	@Id
	@GeneratedValue
	@Column(name="Lid")
	private int lid;
	@Column(name="Language",unique=true, nullable=false)
	private String lang;
	@Column(name="Title",unique=true, nullable=false)
	private String title;

	public Language(int lid, String lang, String title) {
		super();
		this.lid = lid;
		this.lang = lang;
		this.title = title;
	}
	
	public Language(String lang, String title) {
		super();
		this.lang = lang;
		this.title = title;
	}

	public Language(int lid) {
		super();
		this.lid = lid;
	}

	public int getLid() {
		return lid;
	}

	public void setLid(int lid) {
		this.lid = lid;
	}

	public String getLang() {
		return lang;
	}

	public void setLang(String lang) {
		this.lang = lang;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Language() {
		super();
	}
	
	
}
