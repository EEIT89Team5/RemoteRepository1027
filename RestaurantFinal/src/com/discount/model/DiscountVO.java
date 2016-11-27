package com.discount.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.xml.bind.annotation.XmlRootElement;

import com.order.model.OrderVO;

@XmlRootElement
public class DiscountVO implements Serializable{
	
	private Integer disc_id;
	private String disc_name;
	private Double disc_value;
	private Set<OrderVO> orders=new HashSet<OrderVO>();

	public Integer getDisc_id() {
		return disc_id;
	}

	public void setDisc_id(Integer disc_id) {
		this.disc_id = disc_id;
	}

	public String getDisc_name() {
		return disc_name;
	}

	public void setDisc_name(String disc_name) {
		this.disc_name = disc_name;
	}

	public Double getDisc_value() {
		return disc_value;
	}

	public void setDisc_value(Double disc_value) {
		this.disc_value = disc_value;
	}

	public Set<OrderVO> getOrders() {
		return orders;
	}

	public void setOrders(Set<OrderVO> orders) {
		this.orders = orders;
	}
	
	
}
