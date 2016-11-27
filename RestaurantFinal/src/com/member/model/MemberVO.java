package com.member.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

import com.order.model.OrderVO;

@XmlRootElement
public class MemberVO implements Serializable {
	
	private Integer member_id;
	private String member_name;
	private String member_phone;
	private String member_email;
	private String member_password;
	private String member_gender;
	private Date member_register;
	
	private Set<OrderVO> orders=new HashSet<OrderVO>();

	public Integer getMember_id() {
		return member_id;
	}

	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_password() {
		return member_password;
	}

	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}

	public String getMember_gender() {
		return member_gender;
	}

	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}

	public Date getMember_register() {
		return member_register;
	}

	public void setMember_register(Date member_register) {
		this.member_register = member_register;
	}

	@XmlTransient
	public Set<OrderVO> getOrders() {
		return orders;
	}

	public void setOrders(Set<OrderVO> orders) {
		this.orders = orders;
	}
	
}
