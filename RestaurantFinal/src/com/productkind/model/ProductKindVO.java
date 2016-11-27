package com.productkind.model;

import java.io.Serializable;
import java.util.Set;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

import com.product.model.ProductVO;

@XmlRootElement
public class ProductKindVO implements Serializable{

	private Integer kind_id;
	private String kind_name;
	private Set<ProductVO> products;
	
	public Integer getKind_id() {
		return kind_id;
	}
	public void setKind_id(Integer kind_id) {
		this.kind_id = kind_id;
	}
	public String getKind_name() {
		return kind_name;
	}
	public void setKind_name(String kind_name) {
		this.kind_name = kind_name;
	}
	@XmlTransient
	public Set<ProductVO> getProducts() {
		return products;
	}
	public void setProducts(Set<ProductVO> products) {
		this.products = products;
	}
	
}
