package com.emp.model;

import java.sql.Date;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class EmpService {

	private EmpDAO_interface dao;

	public EmpService() {
		ApplicationContext context = new ClassPathXmlApplicationContext("model-config-JndiObjectFactoryBean.xml");
		dao =(EmpDAO_interface) context.getBean("empDAO");
	}

	public EmpVO addEmp(EmpVO empVO) {
		dao.insert(empVO);
		return empVO;
	}

	public EmpVO updateEmp(EmpVO empVO) {
		dao.update(empVO);

		return empVO;
	}

	public void deleteEmp(Integer emp_id) {
		dao.delete(emp_id);
	}

	public EmpVO getOneEmp(Integer emp_id) {
		return dao.findByPrimaryKey(emp_id);
	}

	public List<EmpVO> getAll() {
		return dao.getAll();
	}
	
	public EmpVO checkIDPassword(String emp_email) {
		
		return dao.getEmail(emp_email);
	}
	
	public List<EmpVO> getAll2() {
		return dao.getAll2();
	}
	
	public void Updatepassword(EmpVO empVO) {
		dao.Updatepassword(empVO);
	}
}
