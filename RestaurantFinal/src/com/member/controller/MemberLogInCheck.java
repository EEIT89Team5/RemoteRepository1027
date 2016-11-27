package com.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.member.model.MemberService;
import com.member.model.MemberVO;

@WebServlet("/memberAccountCheck")
public class MemberLogInCheck extends HttpServlet {

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setHeader("content-type", "text/html;charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		
		String member_phone=req.getParameter("account").trim();
		String member_password=req.getParameter("password").trim();
		System.out.println(member_phone+","+member_password);
		MemberService memberSvc=new MemberService();
		
		MemberVO memberVO=memberSvc.checkPhonePassword(member_phone);
		System.out.println(memberVO);
		if(memberVO==null){
			
		}else{

			JSONObject jsonObj= new JSONObject();
			jsonObj.put("member_id", memberVO.getMember_id());
			jsonObj.put("member_name", memberVO.getMember_name());
			jsonObj.put("member_phone", memberVO.getMember_phone());
			jsonObj.put("member_email", memberVO.getMember_email());
			jsonObj.put("member_password", memberVO.getMember_password());
			jsonObj.put("member_gender", memberVO.getMember_gender());
			jsonObj.put("member_register", memberVO.getMember_register());
			

			out.print(jsonObj.toJSONString());
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
