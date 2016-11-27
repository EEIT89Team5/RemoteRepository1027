package com.reserve.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.emp.model.EmpDAO_interface;

public class ReserveService {

	private ReserveDAO_interface dao;
	
	public ReserveService() {
		ApplicationContext context = new ClassPathXmlApplicationContext("model-config-JndiObjectFactoryBean.xml");
		dao =(ReserveDAO_interface) context.getBean("reserveDAO");
	}

	public void insert(String date,String time,String res_name,String res_gender,String res_phone,Integer res_numP,String res_remark){
		Timestamp res_time = Timestamp.valueOf(date + " " + time + ":00:00");
		ReserveVO reserveVO=new ReserveVO();
		reserveVO.setRes_time(res_time);
		reserveVO.setRes_name(res_name);
		reserveVO.setRes_gender(res_gender);
		reserveVO.setRes_phone(res_phone);
		reserveVO.setRes_numP(res_numP);
		reserveVO.setRes_remark(res_remark);
		dao.insert(reserveVO);
	}
	
	public void delete(Timestamp res_time, String res_phone){
		dao.delete(res_time, res_phone);
	}
	
	public ReserveVO findByPrimaryKey(Timestamp res_time, String res_phone){
		return dao.findByPrimaryKey(res_time, res_phone);
	}
	
	public List<ReserveVO> getToday(){
		Date d = new Date(System.currentTimeMillis());
		return dao.findByDate(d.toString());
	}
	
	public List<ReserveVO> findByMonth(String res_time) {
		return dao.findByMonth(res_time);
	}
	
	public List<ReserveVO> findByDate(String res_time) {
		return dao.findByDate(res_time);
	}
	
}
