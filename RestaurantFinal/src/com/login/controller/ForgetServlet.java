package com.login.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.emp.model.EmpService;
import com.emp.model.EmpVO;


public class ForgetServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String forget=request.getParameter("forget");
		
		if ("alertpas".equals(forget)) { 
			String empemail=request.getParameter("emp_email");
			String empopass=request.getParameter("emp_oldpassword");
			String empnpass=request.getParameter("emp_newpassword");
			
			
			EmpVO empVO=new EmpVO();
			EmpVO empVO2=new EmpVO();
			
			EmpService forgetmaill=new EmpService();
			empVO=forgetmaill.checkIDPassword(empemail);
			
			if(!empVO.getEmp_password().equals(empopass)){
			response.sendRedirect("error.jsp");
			}
			
			if(empVO.getEmp_password().equals(empopass)){
			empVO2.setEmp_id(empVO.getEmp_id());
			empVO2.setEmp_name(empVO.getEmp_name());
			empVO2.setEmp_gender(empVO.getEmp_gender());
			empVO2.setEmp_title(empVO.getEmp_title());
			empVO2.setEmp_fulltime(empVO.getEmp_fulltime());
			empVO2.setEmp_salary(empVO.getEmp_salary());
			empVO2.setEmp_birthday(empVO.getEmp_birthday());
			empVO2.setEmp_idnumber(empVO.getEmp_idnumber());
			empVO2.setEmp_phone(empVO.getEmp_phone());
			empVO2.setEmp_addr(empVO.getEmp_addr());
			empVO2.setEmp_hiredate(empVO.getEmp_hiredate());
			empVO2.setEmp_email(empemail);
			empVO2.setEmp_password(empnpass);
			empVO2.setEmp_status(empVO.getEmp_status());
			forgetmaill.Updatepassword(empVO2);
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
			 
			  String body="<h2>歡迎使用8+9餐廳管理系統</h2><br><br>"+"您的帳號是:"+empemail+"<br>"+"您的新密碼是:"+empnpass;
			  
			  Session session = Session.getDefaultInstance(props, new Authenticator(){
			      protected PasswordAuthentication getPasswordAuthentication() {
			          return new PasswordAuthentication(username, password);
			      }}); 
			    
			  try{

			  Message msg = new MimeMessage(session);
			  
			  msg.setFrom(new InternetAddress(username + "@gmail.com","8+9餐廳管理系統"));
			  msg.setContent(body, "text/html;charset = UTF-8");
			  msg.setRecipients(Message.RecipientType.TO, 

			  InternetAddress.parse(empemail,false));
			  
			  msg.setSubject("修改密碼");

			  msg.setText(body);
			  msg.setContent(body, "text/html;charset = UTF-8");
			  msg.setSentDate(new Date());
			  Transport.send(msg);
			  
			  System.out.println("信件已寄出");
			}
			catch (UnsupportedEncodingException | MessagingException e){
				e.printStackTrace();
			};	
			response.sendRedirect("success.jsp");
			}
		}
		
		
		
		if ("iforget".equals(forget)) { 
		String email = request.getParameter("emp_email");
		EmpVO empVO=new EmpVO();
		EmpVO empVO2=new EmpVO();
		EmpService forgetmaill=new EmpService();

		empVO=forgetmaill.checkIDPassword(email);

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
		  String body="<h2>歡迎使用8+9餐廳管理系統</h2><br><br>"+"您的帳號是:"+email+"<br>"+"您的新密碼是:"+newpassword+"<br><br><font color='red'><H3>請盡速更換密碼來提高安全性</H3></font>";
		  
		  Session session = Session.getDefaultInstance(props, new Authenticator(){
		      protected PasswordAuthentication getPasswordAuthentication() {
		          return new PasswordAuthentication(username, password);
		      }}); 
		    
		  try{

		  Message msg = new MimeMessage(session);
		  
		  msg.setFrom(new InternetAddress(username + "@gmail.com","8+9餐廳管理系統"));
		  msg.setContent(body, "text/html;charset = UTF-8");
		  msg.setRecipients(Message.RecipientType.TO, 

		  InternetAddress.parse(email,false));
		  
		  msg.setSubject("忘記密碼");

		  msg.setText(body);
		  msg.setContent(body, "text/html;charset = UTF-8");
		  msg.setSentDate(new Date());
		  Transport.send(msg);
		  
		  System.out.println("信件已寄出");
		}
		catch (UnsupportedEncodingException | MessagingException e){
			e.printStackTrace();
		};
		
		empVO2.setEmp_id(empVO.getEmp_id());
		empVO2.setEmp_name(empVO.getEmp_name());
		empVO2.setEmp_gender(empVO.getEmp_gender());
		empVO2.setEmp_title(empVO.getEmp_title());
		empVO2.setEmp_fulltime(empVO.getEmp_fulltime());
		empVO2.setEmp_salary(empVO.getEmp_salary());
		empVO2.setEmp_birthday(empVO.getEmp_birthday());
		empVO2.setEmp_idnumber(empVO.getEmp_idnumber());
		empVO2.setEmp_phone(empVO.getEmp_phone());
		empVO2.setEmp_addr(empVO.getEmp_addr());
		empVO2.setEmp_hiredate(empVO.getEmp_hiredate());
		empVO2.setEmp_email(email);
		empVO2.setEmp_password(newpassword);
		empVO2.setEmp_status(empVO.getEmp_status());
		forgetmaill.Updatepassword(empVO2);
		
		response.sendRedirect("success.jsp");
		}
	}
}
