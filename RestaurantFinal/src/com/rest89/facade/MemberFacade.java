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

import com.member.model.MemberService;
import com.product.model.ProductService;
import com.product.model.ProductVO;

@Path("/members")
@Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
public class MemberFacade {

	MemberService memberSvc=null;

	public void setMemberService(MemberService memberSvc) {
		this.memberSvc = memberSvc;
	}

	public MemberFacade() {
		memberSvc = new MemberService();
		this.setMemberService(memberSvc);
	}

	
}
