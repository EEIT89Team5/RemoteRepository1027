package com.emp.model;

import java.util.List;

public interface EmpDAO_interface {
		 public void insert(EmpVO empVO);
	     public void update(EmpVO empVO);
	     public void delete(Integer empno);
	     public EmpVO findByPrimaryKey(Integer empno);
	     public List<EmpVO> getAll();
		 public EmpVO getEmail(String emp_email);
		 public void Updatepassword(EmpVO empVO);
		 public List<EmpVO> getAll2();
}
