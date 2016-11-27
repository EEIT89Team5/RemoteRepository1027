package com.rest89.facade;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.emp.model.EmpService;
import com.emp.model.EmpVO;

@Path("/emps")
@Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
public class EmpFacade {

	EmpService empSvc = null;

	public void setEmpService(EmpService empSvc) {
		this.empSvc = empSvc;
	}

	public EmpFacade() {
		empSvc = new EmpService();
		this.setEmpService(empSvc);
	}

	@GET
	@Path("/loginEmail/{emp_email}")
	@Produces({ MediaType.APPLICATION_JSON })
	public EmpVO loginCheck(@PathParam("emp_email") String emp_email) {
		EmpVO empVO = null;
		empVO = empSvc.checkIDPassword(emp_email);
		return empVO;
	}

}
