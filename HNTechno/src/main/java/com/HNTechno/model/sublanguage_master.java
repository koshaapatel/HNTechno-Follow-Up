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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Cascade;


@Entity
@Table(name="sublanguage_master")
public class sublanguage_master extends common implements Serializable{
	
	@Id
	@GeneratedValue
	private int smid;
	@OneToOne
	@JoinColumn(name="lid")
	private Language l;
	
	@OneToMany(mappedBy="sm",fetch=FetchType.LAZY)
	private List<sublanguage_details> s = new ArrayList<sublanguage_details>(0);
	
	public sublanguage_master(int smid) {
		super();
		this.smid = smid;
	}
	public List<sublanguage_details> getS() {
		return s;
	}
	public void setS(List<sublanguage_details> s) {
		this.s = s;
	}
	public int getSmid() {
		return smid;
	}
	public void setSmid(int smid) {
		this.smid = smid;
	}
	public Language getL() {
		return l;
	}
	public void setL(Language l) {
		this.l = l;
	}
	public sublanguage_master() {
		super();
	}

}
