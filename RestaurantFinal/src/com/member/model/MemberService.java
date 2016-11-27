package com.member.model;

import java.sql.Date;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.emp.model.EmpDAO_interface;
import com.emp.model.EmpVO;

public class MemberService {
	
	private MemberDAO_interface dao;
	
	public MemberService(){
		ApplicationContext context = new ClassPathXmlApplicationContext("model-config-JndiObjectFactoryBean.xml");
		dao =(MemberDAO_interface) context.getBean("memberDAO");
	}
	
	public MemberVO addMember(String member_name,String member_phone, String member_email,String member_password,String member_gender,Date member_register){
		MemberVO memberVO=new MemberVO();
		
		memberVO.setMember_name(member_name);
		memberVO.setMember_phone(member_phone);
		memberVO.setMember_email(member_email);
		memberVO.setMember_password(member_password);
		memberVO.setMember_gender(member_gender);
		memberVO.setMember_register(member_register);
		
		return dao.insert(memberVO);	
		
	}
	
	public MemberVO addMember(MemberVO memberVO){
		return dao.insert(memberVO);
	}
	
	public MemberVO updateMember(Integer member_id,String member_name,String member_phone,String member_email,String member_password,String member_gender,Date member_register){
		
		MemberVO memberVO =new MemberVO();
		
		memberVO.setMember_id(member_id);
		memberVO.setMember_name(member_name);
		memberVO.setMember_phone(member_phone);
		memberVO.setMember_email(member_email);
		memberVO.setMember_password(member_password);
		memberVO.setMember_gender(member_gender);
		memberVO.setMember_register(member_register);
		
		dao.update(memberVO);
		
		return dao.findByPrimaryKey(memberVO.getMember_id());
	}
	
	public void updateMember(MemberVO memberVO){
		dao.update(memberVO);
	}
	
	public MemberVO findByPrimaryKey(Integer member_id){
		return dao.findByPrimaryKey(member_id);
	}
	
	public String findByPhone(String member_phone){
		return dao.findByPhone(member_phone);
	}
	
	public List<MemberVO> getAllMember(){
		return dao.getAll();
	}
	
	public MemberVO checkPhonePassword(String member_phone) {
		
		return dao.getPhone(member_phone);
	}
	
	public MemberVO checkIDPassword(String mememail) {
		
		return dao.getEmail(mememail);
	}
	
	public static void main(String[] args) {

	}

}
