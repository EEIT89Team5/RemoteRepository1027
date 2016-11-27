package com.member.model;

import java.util.List;

import com.emp.model.EmpVO;

public interface MemberDAO_interface {
	public MemberVO insert(MemberVO memberVO);
	public void update(MemberVO memberVO);
	public void delete(Integer member_id);
	public MemberVO findByPrimaryKey(Integer member_id);
	public String findByPhone(String member_phone);
	public List<MemberVO> getAll();
	public MemberVO getPhone(String member_phone);
	public MemberVO getEmail(String mememail);
}
