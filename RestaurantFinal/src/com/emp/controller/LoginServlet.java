package com.emp.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import com.emp.model.EmpService;
import com.emp.model.EmpVO;

@MultipartConfig()
public class LoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		String name=req.getParameter("userName");
		String gender=req.getParameter("gender");
		String title=req.getParameter("title");
		String job=req.getParameter("job");
		Integer salary=new Integer(req.getParameter("salary"));
		Integer phone=new Integer(req.getParameter("phone1")+req.getParameter("phone2")+req.getParameter("phone3"));

	}
}
