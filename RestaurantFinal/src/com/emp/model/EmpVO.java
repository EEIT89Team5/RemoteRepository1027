package com.emp.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

import com.order.model.OrderVO;

@XmlRootElement
public class EmpVO implements Serializable {
	
	private Integer emp_id;
	private String emp_name;
	private String emp_gender;
	private String emp_title;
	private String emp_fulltime;
	private Integer emp_salary;
	private Date emp_birthday;
	private String emp_idnumber;
	private String emp_phone;
	private String emp_addr;
	private Date emp_hiredate;
	private String emp_email;
	private String emp_password;
	private String emp_status;
	
	private Set<OrderVO> orders=new HashSet<OrderVO>();

	public Integer getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(Integer emp_id) {
		this.emp_id = emp_id;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getEmp_gender() {
		return emp_gender;
	}

	public void setEmp_gender(String emp_gender) {
		this.emp_gender = emp_gender;
	}

	public String getEmp_title() {
		return emp_title;
	}

	public void setEmp_title(String emp_title) {
		this.emp_title = emp_title;
	}

	public String getEmp_fulltime() {
		return emp_fulltime;
	}

	public void setEmp_fulltime(String emp_fulltime) {
		this.emp_fulltime = emp_fulltime;
	}

	public Integer getEmp_salary() {
		return emp_salary;
	}

	public void setEmp_salary(Integer emp_salary) {
		this.emp_salary = emp_salary;
	}

	public Date getEmp_birthday() {
		return emp_birthday;
	}

	public void setEmp_birthday(Date emp_birthday) {
		this.emp_birthday = emp_birthday;
	}

	public String getEmp_idnumber() {
		return emp_idnumber;
	}

	public void setEmp_idnumber(String emp_idnumber) {
		this.emp_idnumber = emp_idnumber;
	}

	public String getEmp_phone() {
		return emp_phone;
	}

	public void setEmp_phone(String emp_phone) {
		this.emp_phone = emp_phone;
	}

	public String getEmp_addr() {
		return emp_addr;
	}

	public void setEmp_addr(String emp_addr) {
		this.emp_addr = emp_addr;
	}

	public Date getEmp_hiredate() {
		return emp_hiredate;
	}

	public void setEmp_hiredate(Date emp_hiredate) {
		this.emp_hiredate = emp_hiredate;
	}

	public String getEmp_email() {
		return emp_email;
	}

	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}

	public String getEmp_password() {
		return emp_password;
	}

	public void setEmp_password(String emp_password) {
		this.emp_password = emp_password;
	}

	public String getEmp_status() {
		return emp_status;
	}

	public void setEmp_status(String emp_status) {
		this.emp_status = emp_status;
	}

	@XmlTransient
	public Set<OrderVO> getOrders() {
		return orders;
	}

	public void setOrders(Set<OrderVO> orders) {
		this.orders = orders;
	}

	
	
}
