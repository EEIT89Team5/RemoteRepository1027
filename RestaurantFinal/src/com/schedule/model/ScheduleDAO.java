package com.schedule.model;

import java.sql.Date;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.emp.model.EmpVO;


public class ScheduleDAO implements ScheduleDAO_interface{

	private HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	@Override
	public void insert(ScheduleVO scheduleVO) {
		hibernateTemplate.saveOrUpdate(scheduleVO);
		
	}

	@Override
	public void update(ScheduleVO scheduleVO) {
		hibernateTemplate.saveOrUpdate(scheduleVO);
		
	} 

	@Override
	public void delete(String sched_class,Date date) {
		List<ScheduleVO> list = null;
		list = hibernateTemplate.find("FROM ScheduleVO where sched_date=? and sched_class=?",new Object[]{date,sched_class});
		hibernateTemplate.deleteAll(list);
	}

	@Override
	public List<ScheduleVO> getAll(String date) {
		List<ScheduleVO> list = null;
//		String date="2016-11";
		list = hibernateTemplate.find("FROM ScheduleVO where sched_date like'"+date+"%'");
		return list;
	}
	
	@Override
	public List<ScheduleVO> getOnes(String date,Integer emp_id){
		List<ScheduleVO> list = null;
		list = hibernateTemplate.find("FROM ScheduleVO where empVO.emp_id=? AND sched_date like'"+date+"%'",emp_id);
		return list;
	}

	public static void main(String[] args) {

		ApplicationContext context = new ClassPathXmlApplicationContext("model-config-DriverManagerDataSource.xml");

		ScheduleDAO_interface dao = (ScheduleDAO_interface) context.getBean("scheduleDAO");

//		ScheduleDAO dao = new ScheduleDAO();

		// ● 新增
		// com.dept.model.DeptVO deptVO = new com.dept.model.DeptVO(); // 部門POJO
		// deptVO.setDeptno(10);

//		ScheduleVO scheduleVO = new ScheduleVO();
//		EmpVO empvo = new EmpVO();
//		empvo.setEmp_id(1001);
//		scheduleVO.setEmpVO(empvo);
//		scheduleVO.setSched_class("晚班");
//		scheduleVO.setSched_date(java.sql.Date.valueOf("2016-11-15"));
//		 dao.insert(scheduleVO);

		// ● 修改
		// EmpVO empVO2 = new EmpVO();
		// empVO2.setEmpno(7001);
		// empVO2.setEname("吳永志2");
		// empVO2.setJob("MANAGER2");
		// empVO2.setHiredate(java.sql.Date.valueOf("2002-01-01"));
		// empVO2.setSal(new Double(20000));
		// empVO2.setComm(new Double(200));
		// empVO2.setDeptVO(deptVO);
		// dao.update(empVO2);

		// ● 刪除(小心cascade - 多方emp2.hbm.xml如果設為 cascade="all"或
		// cascade="delete"將會刪除所有相關資料-包括所屬部門與同部門的其它員工將會一併被刪除)
		// 所以目前在上面65到67行，採用去除關聯關係後，再刪除的方式，這是比較安全的方式
		// dao.delete(7014);

		// ● 查詢-findByPrimaryKey (多方emp2.hbm.xml必須設為lazy="false")(優!)
//		 EmpVO empVO3 = dao.getEmail("1000@yahoo.com.tw");
//		 System.out.print(empVO3.getEmp_id() + ",");
//		 System.out.print(empVO3.getEmp_name() + ",");
//		 System.out.print(empVO3.getJob() + ",");
//		 System.out.print(empVO3.getHiredate() + ",");
//		 System.out.print(empVO3.getSal() + ",");
//		 System.out.print(empVO3.getComm() + ",");
//		 // 注意以下三行的寫法 (優!)
//		 System.out.print(empVO3.getDeptVO().getDeptno() + ",");
//		 System.out.print(empVO3.getDeptVO().getDname() + ",");
//		 System.out.print(empVO3.getDeptVO().getLoc());
//		 System.out.println("\n---------------------");

		// ● 查詢-getAll (多方emp2.hbm.xml必須設為lazy="false")(優!)
		List<ScheduleVO> list = dao.getAll("2016-11");
		for (ScheduleVO a : list) {
			System.out.println(a.getSched_date());
			System.out.println(a.getEmpVO().getEmp_name());
			System.out.println(a.getSched_class());
			System.out.println("-----------------------------");
		}
		

	}
}
