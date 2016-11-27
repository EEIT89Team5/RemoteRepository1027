package com.orderx.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.order.model.OrderVO;
import com.orderx.model.OrderXDAO;
import com.orderx.model.OrderXService;
import com.orderx.model.OrderXVO;

@WebServlet("/InsideView/Inside.do")
public class InsideServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getAll".equals(action)) {
			
			/***************************開始查詢資料 ****************************************/
			OrderXDAO dao = new OrderXDAO();
			java.sql.Date d=new java.sql.Date(System.currentTimeMillis());
			java.sql.Date d2=java.sql.Date.valueOf("2016-10-10");
			    
//			  	List<KitchenVO> list = dao.getAll(d2);//指定當日
			    
			    List<OrderXVO> list = dao.getAll(d);

			/***************************查詢完成,準備轉交(Send the Success view)*************/
			HttpSession session = req.getSession();
			session.setAttribute("list", list);    // 資料庫取出的list物件,存入session
			// Send the Success view
			String url = "/InsideView/Inside.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交
			successView.forward(req, res);
			return;
		}
		
//		更新===========================================
	if ("update".equals(action)) { // 來自update_Inside.jsp的請求
			System.out.println(action);
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
		
			try {
				Integer order_id = new Integer(req.getParameter("order_id").trim());
				Integer product_id = new Integer(req.getParameter("product_id").trim());
				String  orderX_status = req.getParameter("orderX_status").trim();
				Integer  orderX_num = new Integer(req.getParameter("orderX_num").trim());
				System.out.println(order_id);
				System.out.println(product_id);
				System.out.println(orderX_status);
				System.out.println(orderX_num);
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				java.sql.Timestamp orderX_time = null;
				try {
					orderX_time = java.sql.Timestamp.valueOf(req.getParameter("orderX_time").trim());
				} catch (IllegalArgumentException e) {
					orderX_time=new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				OrderXVO orderXVO = new OrderXVO();
				OrderVO orderVO = new OrderVO();
			
//				orderVO.setOrder_id(1);
//				orderXVO.setOrderVO(orderVO);
//				orderXVO.setOrderX_status("菜色完成");


				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("orderVO", orderVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/InsideView/Inside.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				OrderXService empSvc = new OrderXService();			
				orderXVO = empSvc.update(order_id, product_id, orderX_status, orderX_time,orderX_num);
				System.out.println(orderX_status+"測試射式");			
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("orderXVO", orderXVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/InsideView/Inside.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/InsideView/Inside.jsp");
				failureView.forward(req, res);
			}
		}
	
	
	}
}
