package com.member.model;

import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.classic.Session;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.emp.model.EmpVO;


public class MemberDAO implements MemberDAO_interface {

	private HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public MemberVO insert(MemberVO memberVO) {

		Integer newMemberID = null;
		MemberVO newMemberVO = null;
		hibernateTemplate.saveOrUpdate(memberVO);
		List<Integer> rs = hibernateTemplate.find("SELECT MAX(member_id) FROM MemberVO");
		for (Integer memberID : rs) {
			newMemberID = memberID;
		}
		newMemberVO = (MemberVO) hibernateTemplate.get(MemberVO.class, newMemberID);

		return newMemberVO;
	}

	@Override
	public void update(MemberVO memberVO) {
		hibernateTemplate.saveOrUpdate(memberVO);
	}

	@Override
	public void delete(Integer member_id) {
		MemberVO memberVO = (MemberVO) hibernateTemplate.get(MemberVO.class, member_id);
		hibernateTemplate.delete(memberVO);
	}

	@Override
	public MemberVO findByPrimaryKey(Integer member_id) {
		MemberVO memberVO = (MemberVO) hibernateTemplate.get(MemberVO.class, member_id);
		return memberVO;
	}
	

	@Override
	public MemberVO getPhone(String member_phone) {
		List<MemberVO> list = hibernateTemplate.find("FROM MemberVO WHERE member_phone = ? ", member_phone);
		MemberVO memberVO=null;
		if(list.size()!=0)
			memberVO=list.get(0);
		return memberVO;
	}

	@Override
	public String findByPhone(String member_phone) {
		String result = null;
		List<MemberVO> rs = hibernateTemplate.find("FROM MemberVO WHERE member_phone=?", member_phone);

		if (rs.size() != 0) {
			result = "手機號碼已存在";
		} else {
			result = "手機號碼可使用";
		}

		return result;
	}

	@Override
	public List<MemberVO> getAll() {
		List<MemberVO> memberVOs = new LinkedList<MemberVO>();
		memberVOs = hibernateTemplate.find("FROM MemberVO");
		return memberVOs;
	}
	@Override
	public MemberVO getEmail(String mememail) {
		List<MemberVO> list = hibernateTemplate.find("FROM MemberVO WHERE member_email = ? ",mememail);
		MemberVO memVO=null;
		if(list.size()!=0)
			memVO=list.get(0);
		return memVO;
	}

	public static void main(String[] args) {
		MemberDAO memberDAO = new MemberDAO();

		MemberVO memberVO = new MemberVO();
		// memberVO.setMember_id(10016);
		memberVO.setMember_name("李大龍");
		memberVO.setMember_phone("0984982722");
		memberVO.setMember_email("bruceLee@gmail.com");
		memberVO.setMember_password("hahaha");
		memberVO.setMember_gender("女");
		memberVO.setMember_register(Date.valueOf("2016-09-23"));

		// memberVO=memberDAO.insert(memberVO);

		// memberDAO.update(memberVO);

		// memberDAO.delete(10016);

		// MemberVO memberVO1=memberDAO.findByPrimaryKey(10013);
		//
		// System.out.println("----------------");
		// System.out.println("會員編號:"+memberVO1.getMember_id());
		// System.out.println("會員姓名:"+memberVO1.getMember_name());
		// System.out.println("會員電話:"+memberVO1.getMember_phone());
		// System.out.println("會員email:"+memberVO1.getMember_email());
		// System.out.println("會員密碼:"+memberVO1.getMember_password());
		// System.out.println("會員性別:"+memberVO1.getMember_gender());
		// System.out.println("會員註冊日:"+memberVO1.getMember_register());
		//
		// System.out.println(memberDAO.findByPhone("0927349882"));//歐巴馬

		// List<MemberVO> list = memberDAO.getAll();
		//
		// for (MemberVO members : list) {
		// System.out.println("----------------");
		// System.out.println("會員編號:"+members.getMember_id());
		// System.out.println("會員姓名:"+members.getMember_name());
		// System.out.println("會員電話:"+members.getMember_phone());
		// System.out.println("會員email:"+members.getMember_email());
		// System.out.println("會員密碼:"+members.getMember_password());
		// System.out.println("會員性別:"+members.getMember_gender());
		// System.out.println("會員註冊日:"+members.getMember_register());
		// }

	}

}
