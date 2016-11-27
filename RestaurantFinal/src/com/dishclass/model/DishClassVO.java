package com.dishclass.model;

import java.io.Serializable;
import java.util.Set;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

import com.packageformat.model.PackageFormatVO;
import com.product.model.ProductVO;

@XmlRootElement
public class DishClassVO implements Serializable{
	
	private Integer class_id;
	private String class_name;
	private Set<ProductVO> products;
	private Set<PackageFormatVO> pcgFormats;
	
	public Integer getClass_id() {
		return class_id;
	}
	public void setClass_id(Integer class_id) {
		this.class_id = class_id;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	@XmlTransient
	public Set<ProductVO> getProducts() {
		return products;
	}
	public void setProducts(Set<ProductVO> products) {
		this.products = products;
	}
	@XmlTransient
	public Set<PackageFormatVO> getPcgFormats() {
		return pcgFormats;
	}
	public void setPcgFormats(Set<PackageFormatVO> pcgFormats) {
		this.pcgFormats = pcgFormats;
	}
	
}
