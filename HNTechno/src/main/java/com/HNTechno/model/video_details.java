package com.HNTechno.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="video_details")
public class video_details {

	@Id
	@GeneratedValue
	private int vdid;
	private String vid_name;
	private String vid_title;
	private String file;
	
	@ManyToOne()
	@JoinColumn(name="vmid")
	private video_master vm;
	
	public video_details(String vid_name, String vid_title, String file,
			video_master vm) {
		super();
		this.vid_name = vid_name;
		this.vid_title = vid_title;
		this.file = file;
		this.vm = vm;
	}

	public int getVdid() {
		return vdid;
	}

	public void setVdid(int vdid) {
		this.vdid = vdid;
	}

	public String getVid_name() {
		return vid_name;
	}

	public void setVid_name(String vid_name) {
		this.vid_name = vid_name;
	}

	public String getVid_title() {
		return vid_title;
	}

	public void setVid_title(String vid_title) {
		this.vid_title = vid_title;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public video_master getVm() {
		return vm;
	}

	public void setVm(video_master vm) {
		this.vm = vm;
	}

	public video_details() {
		super();
	}
	
}
