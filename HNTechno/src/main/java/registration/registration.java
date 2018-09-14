package registration;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.HNTechno.model.city_details;
import com.HNTechno.model.common;
import com.HNTechno.model.field;

@Entity
@Table(name="registration")
public class registration extends common implements Serializable{

	@Id
	@GeneratedValue
	private int regid;
	private String fname;
	private String mname;
	private String lname;
	private String emailid;
	private long mob;
	private String gender;
	private String address;
	private String username;
	private String password;
	@OneToOne
	@JoinColumn(name="fieldid")
	private field f;
	@OneToOne
	@JoinColumn(name="citydid")
	private city_details cd;
	public int getRegid() {
		return regid;
	}
	public void setRegid(int regid) {
		this.regid = regid;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public long getMob() {
		return mob;
	}
	public void setMob(long mob) {
		this.mob = mob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public field getF() {
		return f;
	}
	public void setF(field f) {
		this.f = f;
	}
	public city_details getCd() {
		return cd;
	}
	public void setCd(city_details cd) {
		this.cd = cd;
	}
	public registration() {
		super();
	}
	
	
}
