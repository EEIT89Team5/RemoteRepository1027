package com.schedule.model;

import java.sql.Date;
import java.util.List;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.emp.model.EmpVO;

public class ScheduleService {
	private ScheduleDAO_interface dao;
	
	public ScheduleService() {
		ApplicationContext context = new ClassPathXmlApplicationContext("model-config-JndiObjectFactoryBean.xml");
		dao =(ScheduleDAO_interface) context.getBean("scheduleDAO");
	}
	
	public void addSchedule(EmpVO sched_emp,String sched_class,Date sched_date ){
		ScheduleVO scheduleVO = new ScheduleVO();
		scheduleVO.setEmpVO(sched_emp);
		scheduleVO.setSched_class(sched_class);
		scheduleVO.setSched_date(sched_date);
		dao.insert(scheduleVO);
	}
	public void update(ScheduleVO scheduleVO){
		dao.update(scheduleVO);
	}
	public void delete(String sched_class,Date date){
		dao.delete(sched_class,date);
	}
	public List<ScheduleVO> getAll(String date){
		return dao.getAll(date);
	}
	public List<ScheduleVO> getOnes(String date,Integer emp_id){
		return dao.getOnes(date, emp_id);
	}
}
