package com.packageformat.model;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;

import com.dishclass.model.DishClassVO;
import com.product.model.ProductVO;

@XmlRootElement
public class PackageFormatVO implements Serializable{

	private ProductVO productVO;
	private DishClassVO dishClassVO;
	private Integer class_number;
	
	public ProductVO getProductVO() {
		return productVO;
	}
	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}
	public DishClassVO getDishClassVO() {
		return dishClassVO;
	}
	public void setDishClassVO(DishClassVO dishClassVO) {
		this.dishClassVO = dishClassVO;
	}
	public Integer getClass_number() {
		return class_number;
	}
	public void setClass_number(Integer class_number) {
		this.class_number = class_number;
	}


}
