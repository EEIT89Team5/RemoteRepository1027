package com.order.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

import com.discount.model.DiscountVO;
import com.emp.model.EmpVO;
import com.member.model.MemberVO;
import com.orderx.model.OrderXVO;

@XmlRootElement
public class OrderVO implements Serializable {
	
	private Integer order_id;
	private String order_table;
	private Date order_date;
	private Integer order_price;
	private Integer order_numP;
	//private Integer order_mem;
	private MemberVO memberVO;
	//private Integer order_emp;
	private EmpVO empVO;
	//private Integer order_disc;
	private DiscountVO discountVO;
	private Timestamp order_paytime;
	
	private Set<OrderXVO> orderXs=new HashSet<OrderXVO>();

	public Integer getOrder_id() {
		return order_id;
	}

	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}

	public String getOrder_table() {
		return order_table;
	}

	public void setOrder_table(String order_table) {
		this.order_table = order_table;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public Integer getOrder_price() {
		return order_price;
	}

	public void setOrder_price(Integer order_price) {
		this.order_price = order_price;
	}

	public Integer getOrder_numP() {
		return order_numP;
	}

	public void setOrder_numP(Integer order_numP) {
		this.order_numP = order_numP;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public EmpVO getEmpVO() {
		return empVO;
	}

	public void setEmpVO(EmpVO empVO) {
		this.empVO = empVO;
	}

	public DiscountVO getDiscountVO() {
		return discountVO;
	}

	public void setDiscountVO(DiscountVO discountVO) {
		this.discountVO = discountVO;
	}

	public Timestamp getOrder_paytime() {
		return order_paytime;
	}

	public void setOrder_paytime(Timestamp order_paytime) {
		this.order_paytime = order_paytime;
	}

	@XmlTransient
	public Set<OrderXVO> getOrderXs() {
		return orderXs;
	}

	public void setOrderXs(Set<OrderXVO> orderXs) {
		this.orderXs = orderXs;
	}
	
	
	
}
