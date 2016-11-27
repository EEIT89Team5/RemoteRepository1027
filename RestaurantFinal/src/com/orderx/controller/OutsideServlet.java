package com.orderx.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.table.model.TableService;
import com.table.model.TableVO;
import com.order.model.OrderVO;
import com.orderx.model.OrderXDAO;
import com.orderx.model.OrderXService;
import com.orderx.model.OrderXVO;
import com.product.model.ProductVO;
import com.table.model.*;

@WebServlet("/Outsideview/Outside.do")
public class OutsideServlet extends HttpServlet {

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
			String url = "/OutsideView/Outside.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交
			successView.forward(req, res);
			return;
		}

	if ("update2".equals(action)) { // 來自update_Inside.jsp的請求
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
			String  order_table = req.getParameter("order_table").trim();
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
			ProductVO product =new ProductVO();
//			orderVO.setOrder_id(1);
//			orderXVO.setOrderVO(orderVO);
//			orderXVO.setOrderX_status("菜色完成");


			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("orderVO", orderVO); // 含有輸入格式錯誤的empVO物件,也存入req
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Outsideview/Outside.jsp");
				failureView.forward(req, res);
				return; //程式中斷
			}
			
			/***************************2.開始修改資料*****************************************/
			
			OrderXService orderXSvc = new OrderXService();
			orderXVO = orderXSvc.update(order_id, product_id, orderX_status, orderX_time,orderX_num);
//			以下為家偉新增=================================================
			TableService tableService=new TableService();System.out.println(order_table);
			int FINISHNUM=orderXSvc.FINISHNUM(orderXVO);System.out.println("FINISHNUM="+FINISHNUM);
			int IDMAX=orderXSvc.IDMAX(orderXVO);System.out.println("IDMAX="+IDMAX);
			
			TableVO tableVO=new TableVO();
			if(IDMAX==FINISHNUM){
				tableVO=tableService.getOneTable(order_table);
				tableVO.setTable_status("菜上齊");
				tableService.update(tableVO);
				System.out.println("tabvo更新成功");
				
				
			}
//			=================================================
			/***************************3.修改完成,準備轉交(Send the Success view)*************/
			req.setAttribute("orderXVO", orderXVO); // 資料庫update成功後,正確的的empVO物件,存入req
			String url = "/Outsideview/Outside.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
			successView.forward(req, res);

			/***************************其他可能的錯誤處理*************************************/
		} catch (Exception e) {
			errorMsgs.add("修改資料失敗:"+e.getMessage());
			System.out.println(e);
			RequestDispatcher failureView = req
					.getRequestDispatcher("/Outsideview/Outside.jsp");
			failureView.forward(req, res);
		}
	}


	
	}
}
