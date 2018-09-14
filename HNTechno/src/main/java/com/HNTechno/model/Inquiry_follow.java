package com.HNTechno.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="Inquiry_follow")
public class Inquiry_follow extends common implements Serializable{

	@Id
	@GeneratedValue
	private int followid;
	private String followdetails;
	@OneToOne
	@JoinColumn(name="imid")
	private inquiry im;
	
	public inquiry getIm() {
		return im;
	}
	public void setIm(inquiry im) {
		this.im = im;
	}
	public int getFollowid() {
		return followid;
	}
	public void setFollowid(int followid) {
		this.followid = followid;
	}
	public String getFollowdetails() {
		return followdetails;
	}
	public void setFollowdetails(String followdetails) {
		this.followdetails = followdetails;
	}
	public Inquiry_follow() {
		super();
	}
	
	
}
