package com.orderx.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

import javax.xml.bind.annotation.XmlRootElement;

import com.order.model.OrderVO;
import com.product.model.ProductVO;

@XmlRootElement
public class OrderXVO implements Serializable {

	// private Integer order_id;
	private OrderVO orderVO;
	// private Integer product_id;
	private ProductVO productVO;
	private Timestamp orderX_time;
	private Integer orderX_num;
	private String orderX_status;

	public OrderVO getOrderVO() {
		return orderVO;
	}

	public void setOrderVO(OrderVO orderVO) {
		this.orderVO = orderVO;
	}

	public ProductVO getProductVO() {
		return productVO;
	}

	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}

	public Timestamp getOrderX_time() {
		return orderX_time;
	}

	public void setOrderX_time(Timestamp orderX_time) {
		this.orderX_time = orderX_time;
	}

	public Integer getOrderX_num() {
		return orderX_num;
	}

	public void setOrderX_num(Integer orderX_num) {
		this.orderX_num = orderX_num;
	}

	public String getOrderX_status() {
		return orderX_status;
	}

	public void setOrderX_status(String orderX_status) {
		this.orderX_status = orderX_status;
	}

}
