package com.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.MemberService;
import com.member.model.MemberVO;

@WebServlet("/member/member.do")
public class MemberServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("add_member".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				String m_name = req.getParameter("m_name");

				if (m_name == null || m_name.trim().length() == 0) {
					errorMsgs.add("會員姓名: 請勿空白");
				}
				// 以下練習正則(規)表示式(regular-expression)
				String m_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (!m_name.trim().matches(m_nameReg)) {
					errorMsgs.add("會員姓名:只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
				}

				String m_gender = req.getParameter("m_gender");

				String m_email =req.getParameter("m_email").trim();
				String m_password =req.getParameter("m_password").trim();

				String m_phone = req.getParameter("m_phone");

				if (m_phone == null || m_phone.trim().length() == 0) {
					errorMsgs.add("會員手機: 請勿空白");
				}

				// 以下練習正則(規)表示式(regular-expression)
				String m_phoneReg = "09[0-9]{8}";
				if (!m_phone.trim().matches(m_phoneReg)) {
					errorMsgs.add("會員手機:手機只能是09開頭數字，長度為10");
				}

				
				MemberVO memberVO = new MemberVO();
				memberVO.setMember_name(m_name);
				memberVO.setMember_gender(m_gender);
				memberVO.setMember_phone(m_phone);
				memberVO.setMember_password(m_password);
				memberVO.setMember_email(m_email);
				
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memberVO", memberVO); // 含有輸入格式錯誤的memberVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/member/addMember.jsp");
					failureView.forward(req, resp);
					return;
				}
					
				Date m_register = new Date(System.currentTimeMillis());
				memberVO.setMember_register(m_register);

				MemberService memberSvc = new MemberService();
				try{
					memberVO = memberSvc.addMember(memberVO);
				} catch(Exception e){
					errorMsgs.add("此手機已註冊為會員");
				}
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memberVO", memberVO); // 含有輸入格式錯誤的memberVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/member/addMember.jsp");
					failureView.forward(req, resp);
					return;
				}
				req.setAttribute("memberVO", memberVO);

				String url = "/member/addMemberSuccess.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, resp);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				System.out.println(e);
				RequestDispatcher failureView = req.getRequestDispatcher("/member/addMember.jsp");
				failureView.forward(req, resp);
			}

		}
		
		if ("update_member1".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
			
					System.out.println("sssss");
				Integer member_id = new Integer(req.getParameter("member_id").trim());
				MemberService memberSvc = new MemberService();
				
				MemberVO memberVO=memberSvc.findByPrimaryKey(member_id);
				
				
				HttpSession session = req.getSession();
				session.setAttribute("memberVO", memberVO);

				String url = "/member/updateMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, resp);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				System.out.println(e);
				RequestDispatcher failureView = req.getRequestDispatcher("/member/listAllMember.jsp");
				failureView.forward(req, resp);
			}

		}
		
		if ("update_member2".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				String m_gender = req.getParameter("m_gender");

				String m_phone = req.getParameter("m_phone");

				if (m_phone == null || m_phone.trim().length() == 0) {
					errorMsgs.add("會員手機: 請勿空白");
				}

				// 以下練習正則(規)表示式(regular-expression)
				String m_phoneReg = "09[0-9]{8}";
				if (!m_phone.trim().matches(m_phoneReg)) {
					errorMsgs.add("會員手機:手機只能是09開頭數字，長度為10");
				}
				
				String m_email = req.getParameter("m_email").trim();
				String m_password = req.getParameter("m_password").trim();
				
				HttpSession session = req.getSession();
				
				MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");

				memberVO.setMember_gender(m_gender);
				memberVO.setMember_phone(m_phone);
				memberVO.setMember_email(m_email);
				memberVO.setMember_password(m_password);
				
								
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memberVO", memberVO); // 含有輸入格式錯誤的memberVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/member/updateMember.jsp");
					failureView.forward(req, resp);
					return;
				}

				MemberService memberSvc = new MemberService();
				try{
					memberSvc.updateMember(memberVO);
				} catch(Exception e){
					errorMsgs.add("此手機已註冊為會員");
				}
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memberVO", memberVO); // 含有輸入格式錯誤的memberVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/member/updateMember.jsp");
					failureView.forward(req, resp);
					return;
				}
				session.setAttribute("memberVO", memberVO);

				String url = "/member/updateMemberSuccess.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, resp);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				System.out.println(e);
				RequestDispatcher failureView = req.getRequestDispatcher("/member/updateMember.jsp");
				failureView.forward(req, resp);
			}

		}

	}

}
