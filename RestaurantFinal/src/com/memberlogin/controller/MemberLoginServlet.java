package com.memberlogin.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.member.model.MemberService;
import com.member.model.MemberVO;


public class MemberLoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action=request.getParameter("action");
		String forget=request.getParameter("forget");
		
		if("memberlogin".equals(action)){
		HttpSession session = request.getSession();
		// 準備存放錯誤訊息的 Map<String, String> 物件 : errorMsgMap
		Map<String, String> errorMsgMap = new HashMap<String, String>();
		// 將 errorMsgMap 放入 request 置物櫃內，識別字串為 "ErrorMsgKey"
		request.setAttribute("ErrorMsgKey", errorMsgMap);
		// 1. 讀取使用者輸入資料(<Input>標籤內的name屬性分別為 userId與pswd
		String userId = request.getParameter("userId");
		String password = request.getParameter("pswd");
		// 2. 進行必要的資料轉換
		// 無
		// 3. 檢查使用者輸入資料
		// 如果 userId 欄位為空白，放錯誤訊息"帳號欄必須輸入"到 errorMsgMap 之內
		// 對應的識別字串為 "AccountEmptyError"
		
		String m_phoneReg = "09[0-9]{8}";
		if (!userId.trim().matches(m_phoneReg)) {
			errorMsgMap.put("AccountEmptyError","帳號格式錯誤，請輸入您的手機");
		}
		
		if (userId == null || userId.trim().length() == 0) {
			errorMsgMap.put("AccountEmptyError", "帳號欄必須輸入");
		}
		// 如果 password 欄位為空白，放錯誤訊息"密碼欄必須輸入"到 errorMsgMap 之內
		// 對應的識別字串為 "PasswordEmptyError"
		if (password == null || password.trim().length() == 0) {
			errorMsgMap.put("PasswordEmptyError", "密碼欄必須輸入");
		}
		// 如果 errorMsgMap 不是空的，表示有錯誤，交棒給/ch06_01/login.jsp，
		// 然後 return
		if (!errorMsgMap.isEmpty()) {
			RequestDispatcher rd = request
					.getRequestDispatcher("/memberlogin/memberlogin.jsp");
			rd.forward(request, response);
			return;
		}
		// 4. 進行 Business Logic 運算
		// 將LoginService類別new為物件，存放物件參考的變數為 ls
		MemberService ls = new MemberService();
		// 呼叫 ls物件的 checkIDPassword()，要記得傳入userid與password兩個參數
		// 同時將傳回值放入MemberBean型別的變數mb之內。
		MemberVO mb = ls.checkPhonePassword(userId);
//		EmpVO mc = ls.checkTitle(userId, password);
		// 如果變數mb的值不等於 null,表示資料庫含有userId搭配password的紀錄
		
		if (mb != null && password.equals(mb.getMember_password())) {
			session.setAttribute("MemberLoginOK", mb);

			// OK, 將mb物件放入Session範圍內，識別字串為"LoginOK"，表示;此使用者已經登入
			
		}
		else {
			// NG, userid與密碼的組合錯誤，放錯誤訊息"該帳號不存在或密碼錯誤"到 errorMsgMap 之內
			// 對應的識別字串為 "LoginError"
			errorMsgMap.put("LoginError", "該帳號不存在或密碼錯誤");
		}

		
		
		// 5.依照 Business Logic 運算結果來挑選適當的畫面
		// 如果 errorMsgMap是空的，表示沒有任何錯誤，準備交棒給下一隻程式
		if (errorMsgMap.isEmpty()) {
			// 如果session物件內含有"target"屬性物件，表示使用者先前嘗試執行某個應該
			// 登入，但使用者未登入的網頁，由該網頁放置的"target"屬性物件，因此如果
			// 有"target"屬性物件則導向"target"屬性物件所標示的網頁，否則導向首頁
			String contextPath = getServletContext().getContextPath();
			String target = (String) session.getAttribute("target");
			if (target != null) {
				// 先由session中移除此項屬性，否則下一次User直接執行login功能後，
				// 會再度被導向到 target
				session.removeAttribute("target");
				// 導向 contextPath + target
				response.sendRedirect(contextPath + target);

			} else {
				// 導向 contextPath + "/index.jsp"
				response.sendRedirect(contextPath + "/order/addOrder2.jsp");
			}
			return;
		} else {
			// 如果 errorMsgMap 不是空的，表示有錯誤，交棒給/ch06_01/login.jsp
			RequestDispatcher rd = request
					.getRequestDispatcher("/memberlogin/memberlogin.jsp");
			rd.forward(request, response);
			return;
		}
		}
		
		
		if("forgetlogin".equals(action)){
			String userId=request.getParameter("userId");
			MemberService memberSvc=new MemberService();
			MemberVO memberVO=new MemberVO();
			memberVO=memberSvc.checkPhonePassword(userId);
			System.out.println(memberVO.getMember_email());
			System.out.println(memberVO.getMember_password());
			
			Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
			  final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
//			  PrintWriter out = response.getWriter();
			  Properties props = System.getProperties();
			  props.setProperty("mail.smtp.host", "smtp.gmail.com");
			  props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
			  props.setProperty("mail.smtp.socketFactory.fallback", "false");
			  props.setProperty("mail.smtp.port", "465");
			  props.setProperty("mail.smtp.socketFactory.port", "465");
			  props.put("mail.smtp.auth", "true");
	    
			  final String username = "8and9Seventeen"; //信箱帳號
			  final String password = "eightandnine";	//信箱密碼
			  String body="<h2>歡迎來到8+9美食餐廳註冊系統</h2><br><br>"+"您的密碼是:"+memberVO.getMember_password();
			  
			  Session session = Session.getDefaultInstance(props, new Authenticator(){
			      protected PasswordAuthentication getPasswordAuthentication() {
			          return new PasswordAuthentication(username, password);
			      }}); 
			    
			  try{

			  Message msg = new MimeMessage(session);
			  
			  msg.setFrom(new InternetAddress(username + "@gmail.com","8+9美食餐廳"));
			  msg.setContent(body, "text/html;charset = UTF-8");
			  msg.setRecipients(Message.RecipientType.TO, 

			  InternetAddress.parse(memberVO.getMember_email(),false));
			  
			  msg.setSubject("忘記密碼");

			  msg.setText(body);
			  msg.setContent(body, "text/html;charset = UTF-8");
			  msg.setSentDate(new Date());
			  Transport.send(msg);
			  
			  System.out.println("信件已寄出");
//			  out.print("ok");
			}
			catch (UnsupportedEncodingException | MessagingException e){
				e.printStackTrace();
			};
		}
		
		
		
		if ("alertpas".equals(forget)) { 
			String mememail=request.getParameter("mem_email");
			String memopass=request.getParameter("mem_oldpassword");
			String memnpass=request.getParameter("mem_newpassword");

			MemberVO memVO=new MemberVO();
			MemberVO memVO2=new MemberVO();
			
			MemberService forgetmaill=new MemberService();
			memVO=forgetmaill.checkIDPassword(mememail);
			
			if(!memVO.getMember_password().equals(memopass)){
				response.sendRedirect("error.jsp");
			}
			
			if(memVO.getMember_password().equals(memopass)){
			memVO2.setMember_id(memVO.getMember_id());
			memVO2.setMember_name(memVO.getMember_name());
			memVO2.setMember_phone(memVO.getMember_phone());
			memVO2.setMember_email(memVO.getMember_email());
			memVO2.setMember_password(memnpass);
			memVO2.setMember_gender(memVO.getMember_gender());
			memVO2.setMember_register(memVO.getMember_register());

			forgetmaill.updateMember(memVO2);
			
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
			 
			  String body="<h2>歡迎使用8+9美食餐廳</h2><br><br>"+"您的帳號是:"+memVO.getMember_phone()+"<br>"+"您的新密碼是:"+memnpass;
			  
			  Session session = Session.getDefaultInstance(props, new Authenticator(){
			      protected PasswordAuthentication getPasswordAuthentication() {
			          return new PasswordAuthentication(username, password);
			      }}); 
			    
			  try{

			  Message msg = new MimeMessage(session);
			  
			  msg.setFrom(new InternetAddress(username + "@gmail.com","8+9美食餐廳"));
			  msg.setContent(body, "text/html;charset = UTF-8");
			  msg.setRecipients(Message.RecipientType.TO, 

			  InternetAddress.parse(mememail,false));
			  
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
	}
}
