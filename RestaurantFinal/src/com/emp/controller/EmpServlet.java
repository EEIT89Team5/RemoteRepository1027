package com.emp.controller;

import java.io.*;
import java.security.Security;
import java.util.*;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.emp.model.*;

@WebServlet("/emp/emp.do")
public class EmpServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
	
		if ("getOne_For_Display".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				
				Integer emp_id = new Integer(req.getParameter("emp_id"));
				
				
				EmpService empSvc = new EmpService();
				EmpVO empVO = empSvc.getOneEmp(emp_id);
								
				
				req.setAttribute("empVO", empVO); 
				String url = "/emp/emp_detail.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/emp/all_emp.jsp");
				failureView.forward(req, res);
			}
		}
		

		if ("getOne_For_Update".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
			
				Integer emp_id = new Integer(req.getParameter("emp_id"));
				
				
				EmpService empSvc = new EmpService();
				EmpVO empVO = empSvc.getOneEmp(emp_id);
								
				
				req.setAttribute("empVO", empVO);         
				String url = "/emp/emp_U_I.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/emp/all_emp.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("update".equals(action)) { 
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				
				Integer emp_id = new Integer(req.getParameter("emp_id").trim());
				String emp_name = req.getParameter("emp_name").trim();
				String emp_gender = req.getParameter("emp_gender").trim();		
				String emp_title = req.getParameter("emp_title").trim();
				String emp_fulltime = req.getParameter("emp_fulltime").trim();
				
				Integer emp_salary = null;
				try {
					emp_salary = new Integer(req.getParameter("emp_salary").trim());
				} catch (NumberFormatException e) {
					errorMsgs.add("薪水請填數字.");
				}

				java.sql.Date emp_birthday = null;
				try {
					emp_birthday = java.sql.Date.valueOf(req.getParameter("emp_birthday").trim());
				} catch (IllegalArgumentException e) {
					emp_birthday=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				String emp_idnumber = req.getParameter("emp_idnumber").trim();
				String emp_phone = req.getParameter("emp_phone").trim();
				String emp_addr = req.getParameter("emp_addr").trim();
				
				java.sql.Date emp_hiredate = null;
				try {
					emp_hiredate = java.sql.Date.valueOf(req.getParameter("emp_hiredate").trim());
				} catch (IllegalArgumentException e) {
					emp_hiredate=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				String emp_email = req.getParameter("emp_email").trim();
				String emp_password = req.getParameter("emp_password").trim();
				String emp_status = req.getParameter("emp_status").trim();

				EmpVO empVO = new EmpVO();
				empVO.setEmp_id(emp_id);
				empVO.setEmp_name(emp_name);
				empVO.setEmp_gender(emp_gender);
				empVO.setEmp_title(emp_title);
				empVO.setEmp_fulltime(emp_fulltime);
				empVO.setEmp_salary(emp_salary);
				empVO.setEmp_birthday(emp_birthday);
				empVO.setEmp_idnumber(emp_idnumber);
				empVO.setEmp_phone(emp_phone);
				empVO.setEmp_addr(emp_addr);
				empVO.setEmp_hiredate(emp_hiredate);
				empVO.setEmp_email(emp_email);
				empVO.setEmp_password(emp_password);
				empVO.setEmp_status(emp_status);

				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("empVO", empVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/emp/emp_U_I.jsp");
					failureView.forward(req, res);
					return; 
				}
				
				
				EmpService empSvc = new EmpService();
				empVO = empSvc.updateEmp(empVO);
			
				req.setAttribute("empVO", empVO); 
				String url = "/emp/emp_detail.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/emp/emp_U_I.jsp");
				failureView.forward(req, res);
			}
		}
		

        if ("insert".equals(action)) {   
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				String emp_name = req.getParameter("emp_name");
				String emp_gender = req.getParameter("emp_gender");
				String emp_title = req.getParameter("emp_title");
				String emp_fulltime = req.getParameter("emp_fulltime");
				Integer emp_salary = new Integer(req.getParameter("emp_salary"));
				java.sql.Date emp_birthday = java.sql.Date.valueOf(req.getParameter("emp_birthday"));
				String emp_idnumber = req.getParameter("emp_idnumber");
				String emp_phone = req.getParameter("emp_phone1")+"-"+req.getParameter("emp_phone2")+"-"+req.getParameter("emp_phone3");
				String [] array=req.getParameterValues("addr");
				String emp_addr=null;
				for(String addr:array){
					if(!addr.equals("請選擇區域")){
					emp_addr = req.getParameter("district")+addr+req.getParameter("address");
					}
				}
				java.sql.Date emp_hiredate = java.sql.Date.valueOf(req.getParameter("emp_hiredate"));
				String emp_email = req.getParameter("emp_email");
				
				//產生6位亂數密碼
				String[] rand= {"0","1","2","3","4","5","6","7","8","9",
				        "A","B","C","D","E","F","G","H","I","J",
				        "K","L","M","N","O","P","Q","R","S","T",
				        "U","V","W","X","Y","Z","a","b","c","d",
				        "e","f","g","h","i","j","k","l","m","n","o",
				        "p","q","r","s","t","u","v","w","x","y","z"};
				
				String newpassword="";
				for(int i=1;i<=6;i++){
				int randNumber = (int)(Math.random()*(62)); 
					newpassword+=rand[randNumber];
					}
				 Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
				  final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";

				  Properties props = System.getProperties();
				  props.setProperty("mail.smtp.host", "smtp.gmail.com");
				  props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
				  props.setProperty("mail.smtp.socketFactory.fallback", "false");
				  props.setProperty("mail.smtp.port", "465");
				  props.setProperty("mail.smtp.socketFactory.port", "465");
				  props.put("mail.smtp.auth", "true");
		    
				  final String username = "8and9Seventeen"; //信箱帳號
				  final String password = "eightandnine";	//信箱密碼
				  String body="<h2>歡迎註冊8+9餐廳管理系統</h2><br><br>"+"您的帳號是:"+emp_email+"<br>"+"您的密碼是:"+newpassword+"<br><br><font color='red'>請盡速更換密碼來提高安全性</font>";
				  
				  Session session = Session.getDefaultInstance(props, new Authenticator(){
				      protected PasswordAuthentication getPasswordAuthentication() {
				          return new PasswordAuthentication(username, password);
				      }}); 
				    
				  try{

				  Message msg = new MimeMessage(session);
				  
				  msg.setFrom(new InternetAddress(username + "@gmail.com","8+9餐廳管理系統"));
				  msg.setHeader("Content-Type", "text/plain; charset=UTF-8");
				  msg.setRecipients(Message.RecipientType.TO,  
				  InternetAddress.parse(emp_email,false));
				  
				  msg.setSubject("帳號驗證信");

				  msg.setText(body);
				  msg.setContent(body, "text/html;charset = UTF-8");
				  msg.setSentDate(new Date());
				  Transport.send(msg);
				  
				  System.out.println("信件已寄出");
				}
				catch (UnsupportedEncodingException | MessagingException e){
					e.printStackTrace();
				};	
				
				System.out.println(emp_name);
				System.out.println(emp_gender);
				System.out.println(emp_title);
				System.out.println(emp_fulltime);
				System.out.println(emp_salary);
				System.out.println(emp_birthday);
				System.out.println(emp_idnumber);
				System.out.println(emp_phone);
				System.out.println(emp_addr);
				System.out.println(emp_hiredate);
				System.out.println(emp_email);
				System.out.println(newpassword);
				System.out.println("在職中");
			
				EmpVO empVO = new EmpVO();
				empVO.setEmp_name(emp_name);
				empVO.setEmp_gender(emp_gender);
				empVO.setEmp_title(emp_title);
				empVO.setEmp_fulltime(emp_fulltime);
				empVO.setEmp_salary(emp_salary);
				empVO.setEmp_birthday(emp_birthday);
				empVO.setEmp_idnumber(emp_idnumber);
				empVO.setEmp_phone(emp_phone);
				empVO.setEmp_addr(emp_addr);
				empVO.setEmp_hiredate(emp_hiredate);
				empVO.setEmp_email(emp_email);
				empVO.setEmp_password(newpassword);
				empVO.setEmp_status("在職中");
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("empVO", empVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/emp/addEmp.jsp");
					failureView.forward(req, res);
					return;
				}

				EmpService empSvc = new EmpService();
				empVO = empSvc.addEmp(empVO);

				String url = "../emp/all_emp.jsp";
				res.sendRedirect(url);		
		
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/emp/EmpRegister.jsp");
				failureView.forward(req, res);
			}
		}
//		
//		
//		if ("delete".equals(action)) {
//
//			List<String> errorMsgs = new LinkedList<String>();
//			req.setAttribute("errorMsgs", errorMsgs);
//	
//			try {
//				/***************************1.接收請求參數***************************************/
//				Integer emp_id = new Integer(req.getParameter("emp_id"));
//				
//				/***************************2.開始刪除資料***************************************/
//				EmpService empSvc = new EmpService();
//				empSvc.deleteEmp(emp_id);
//				
//				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
//				String url = "/emp/all_emp.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
//				successView.forward(req, res);
//				
//				/***************************其他可能的錯誤處理**********************************/
//			} catch (Exception e) {
//				errorMsgs.add("刪除資料失敗:"+e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/emp/all_emp.jsp");
//				failureView.forward(req, res);
//			}
//		}
        
        
	}
}
