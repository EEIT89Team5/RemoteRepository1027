package com.schedule.model;
import java.io.Serializable;
import java.sql.Date;

import com.emp.model.EmpVO;

public class ScheduleVO implements Serializable{
	private EmpVO empVO;
	private String sched_class;
	private Date sched_date;
	
	
	public EmpVO getEmpVO() {
		return empVO;
	}
	public void setEmpVO(EmpVO empVO) {
		this.empVO = empVO;
	}
	public String getSched_class() {
		return sched_class;
	}
	public void setSched_class(String sched_class) {
		this.sched_class = sched_class;
	}
	public Date getSched_date() {
		return sched_date;
	}
	public void setSched_date(Date sched_date) {
		this.sched_date = sched_date;
	}
	

}
