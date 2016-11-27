package com.emp.model;

import org.hibernate.*;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.dishclass.model.DishClassDAO_interface;

import java.sql.Date;
import java.util.*;

public class EmpDAO implements EmpDAO_interface {

	private static final String GET_ALL_STMT = "from EmpVO order by emp_id";

	private HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public void insert(EmpVO empVO) {
		hibernateTemplate.saveOrUpdate(empVO);
	}

	@Override
	public void update(EmpVO empVO) {
		hibernateTemplate.saveOrUpdate(empVO);
	}

	@Override
	public void delete(Integer emp_id) {
		EmpVO empVO = (EmpVO) hibernateTemplate.get(EmpVO.class, emp_id);
		hibernateTemplate.delete(empVO);
	}

	@Override
	public EmpVO findByPrimaryKey(Integer emp_id) {
		EmpVO empVO = (EmpVO) hibernateTemplate.get(EmpVO.class, emp_id);
		return empVO;
	}
	
	@Override
	public EmpVO getEmail(String emp_email) {
		List<EmpVO> list = hibernateTemplate.find("FROM EmpVO WHERE emp_email = ? ",emp_email);
		EmpVO empVO=null;
		if(list.size()!=0)
			 empVO=list.get(0);
		return empVO;
	}

	
	@Override
	public void Updatepassword(EmpVO empVO) {
		hibernateTemplate.saveOrUpdate(empVO);
	}

	@Override
	public List<EmpVO> getAll() {
		List<EmpVO> list = null;
		list = hibernateTemplate.find(GET_ALL_STMT);
		return list;
	}
	
	public List<EmpVO> getAll2() {
		List<EmpVO> list = null;
		list = hibernateTemplate.find("from EmpVO Where emp_status='在職中'");
		return list;
	}

	public static void main(String[] args) {

		ApplicationContext context = new ClassPathXmlApplicationContext("model-config-DriverManagerDataSource.xml");

		EmpDAO_interface dao = (EmpDAO_interface) context.getBean("empDAO");

		// EmpDAO dao = new EmpDAO();

		// ● 新增
		// com.dept.model.DeptVO deptVO = new com.dept.model.DeptVO(); // 部門POJO
		// deptVO.setDeptno(10);

		// EmpVO empVO1 = new EmpVO();
		// empVO1.setEname("吳永志1");
		// empVO1.setJob("MANAGER");
		// empVO1.setHiredate(java.sql.Date.valueOf("2005-01-01"));
		// empVO1.setSal(new Double(50000));
		// empVO1.setComm(new Double(500));
		// empVO1.setDeptVO(deptVO);
		// dao.insert(empVO1);

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
		// EmpVO empVO3 = dao.findByPrimaryKey(7001);
		// System.out.print(empVO3.getEmpno() + ",");
		// System.out.print(empVO3.getEname() + ",");
		// System.out.print(empVO3.getJob() + ",");
		// System.out.print(empVO3.getHiredate() + ",");
		// System.out.print(empVO3.getSal() + ",");
		// System.out.print(empVO3.getComm() + ",");
		// // 注意以下三行的寫法 (優!)
		// System.out.print(empVO3.getDeptVO().getDeptno() + ",");
		// System.out.print(empVO3.getDeptVO().getDname() + ",");
		// System.out.print(empVO3.getDeptVO().getLoc());
		// System.out.println("\n---------------------");

		// ● 查詢-getAll (多方emp2.hbm.xml必須設為lazy="false")(優!)
		List<EmpVO> list = dao.getAll();
		for (EmpVO aEmp : list) {
			System.out.print(aEmp.getEmp_id() + ",");
			System.out.print(aEmp.getEmp_name() + ",");
			System.out.print(aEmp.getEmp_gender() + ",");
			System.out.print(aEmp.getEmp_title() + ",");
			System.out.print(aEmp.getEmp_fulltime() + ",");
			System.out.print(aEmp.getEmp_salary() + ",");
			System.out.print(aEmp.getEmp_birthday() + ",");
			System.out.print(aEmp.getEmp_idnumber() + ",");
			System.out.print(aEmp.getEmp_phone() + ",");
			System.out.print(aEmp.getEmp_addr() + ",");
			System.out.print(aEmp.getEmp_hiredate() + ",");
			System.out.print(aEmp.getEmp_email() + ",");
			System.out.print(aEmp.getEmp_password() + ",");
			System.out.println(aEmp.getEmp_status() + ",");

		}
		

	}

}
