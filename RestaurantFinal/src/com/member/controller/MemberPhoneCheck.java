package com.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberService;
import com.member.model.MemberVO;

/**
 * Servlet implementation class MemberPhoneCheck
 */
@WebServlet("/member/memberCheck.do")
public class MemberPhoneCheck extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
	
		
		PrintWriter out = response.getWriter();
		
		request.setCharacterEncoding("UTF-8");
		String phone=request.getParameter("phone");
		
		MemberService memberSvc=new MemberService();
		String outcome=memberSvc.findByPhone(phone);
		
		out.write(outcome);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
