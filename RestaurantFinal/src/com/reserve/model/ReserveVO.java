package com.reserve.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class ReserveVO implements Serializable {
	private Timestamp res_time;
	private String res_phone;
	private String res_name;
	private String res_gender;
	private Integer res_numP;
	private String res_remark;
	
	public Timestamp getRes_time() {
		return res_time;
	}
	public void setRes_time(Timestamp res_time) {
		this.res_time = res_time;
	}
	public String getRes_phone() {
		return res_phone;
	}
	public void setRes_phone(String res_phone) {
		this.res_phone = res_phone;
	}
	public String getRes_name() {
		return res_name;
	}
	public void setRes_name(String res_name) {
		this.res_name = res_name;
	}
	public String getRes_gender() {
		return res_gender;
	}
	public void setRes_gender(String res_gender) {
		this.res_gender = res_gender;
	}
	public Integer getRes_numP() {
		return res_numP;
	}
	public void setRes_numP(Integer res_numP) {
		this.res_numP = res_numP;
	}
	public String getRes_remark() {
		return res_remark;
	}
	public void setRes_remark(String res_remark) {
		this.res_remark = res_remark;
	}
	
	
}
