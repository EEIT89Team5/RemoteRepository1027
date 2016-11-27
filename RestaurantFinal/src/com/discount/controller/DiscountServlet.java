package com.discount.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.discount.model.DiscountService;
import com.discount.model.DiscountVO;

@WebServlet("/discount/disc.do")
public class DiscountServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("disc_id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入折扣編號");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/discount/all_discount.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				Integer disc_id = null;
				try {
					disc_id = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("折扣編號格式不正確");
				}
	
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/discount/all_discount.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				DiscountService discSvc = new DiscountService();
				DiscountVO discountVO = discSvc.getOneDisc(disc_id);
				if (discountVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/discount/all_discount.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("discountVO", discountVO); // 資料庫取出的empVO物件,存入req
				String url = "/discount/one_discount.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/discount/all_discount.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { // 來自all_discount.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				Integer disc_id = new Integer(req.getParameter("disc_id"));
				
				/***************************2.開始查詢資料****************************************/
				DiscountService discSvc = new DiscountService();
				DiscountVO discountVO = discSvc.getOneDisc(disc_id);
				String Disv=discountVO.getDisc_value().toString();
				if(Disv.length()==3){
				Integer Disvv=new Integer(Disv.substring(2,3));
				req.setAttribute("Disv", Disvv);
				}else{
				Integer Disvv=new Integer(Disv.substring(2,4));
				req.setAttribute("Disv", Disvv);
				}
				/***************************3.查詢完成,準備轉交(Send the Success view)************/

				req.setAttribute("discountVO", discountVO);         // 資料庫取出的empVO物件,存入req
				String url = "/discount/discount_U_I.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp

				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/discount/all_discount.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("update".equals(action)) { // 來自discount_U_I.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				Integer disc_id = new Integer(req.getParameter("disc_id").trim());
				
				String disc_name = req.getParameter("disc_name");
				if (disc_name == null || disc_name.trim().length() == 0) {
					errorMsgs.add("折扣名稱: 請勿空白");
				}
				//以下練習正則(規)表示式(regular-expression)
				String disc_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,20}$";
				if(!disc_name.trim().matches(disc_nameReg) ) { 
					errorMsgs.add("折扣名稱:只能是中、英文字母、數字和_ , 且長度必需在2到20之間");
	            }
							
				Double dd=null;
				String disc_value = null;
				try {
					disc_value ="0."+ new String(req.getParameter("disc_value").trim());
					dd=new Double(disc_value);
				} catch (NumberFormatException e) {
					errorMsgs.add("折扣請填數字.");
				}
				
				
				DiscountVO discountVO = new DiscountVO();
				discountVO.setDisc_id(disc_id);
				discountVO.setDisc_name(disc_name);
				discountVO.setDisc_value(dd);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("discountVO", discountVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/discount/discount_U_I.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				DiscountService discSvc = new DiscountService();
				discountVO = discSvc.updateDisc(disc_id, disc_name, dd);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("discountVO", discountVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/discount/one_discount.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/discount/discount_U_I.jsp");
				failureView.forward(req, res);
			}
		}

        if ("insert".equals(action)) { // 來自add_discount.jsp的請求  
        	
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String disc_name = req.getParameter("disc_name");
				if (disc_name == null || disc_name.trim().length() == 0) {
					errorMsgs.add("折扣名稱: 請勿空白");
				}
	
				String disc_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,20}$";
				if(!disc_name.trim().matches(disc_nameReg) ) { 
					errorMsgs.add("折扣名稱:只能是中、英文字母、數字和_ , 且長度必需在2到20之間");
	            }
				Double dd=null;
				String disc_value = null;
				try {
					disc_value ="0."+ new String(req.getParameter("disc_value").trim());
					dd=new Double(disc_value);
				} catch (NumberFormatException e) {
					errorMsgs.add("折扣請填數字.");
				}
				
				
				
				
				DiscountVO discountVO = new DiscountVO();
				discountVO.setDisc_name(disc_name);
				discountVO.setDisc_value(dd);
	
				// 錯誤回傳
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("discountVO", discountVO); // 含有輸入格式錯誤的discountVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/discount/add_discount.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				DiscountService discSvc = new DiscountService();
				discountVO = discSvc.addDisc(disc_name,dd);
				
				/***************************3.新增完成,準備轉交********************************/
				String url = "/discount/all_discount.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交all_discount.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/discount/add_discount.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("delete".equals(action)) { // 來自all_discount.jsp

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				Integer disc_id = new Integer(req.getParameter("disc_id"));
				
				/***************************2.開始刪除資料***************************************/
				DiscountService dsicSvc = new DiscountService();
				dsicSvc.deleteDisc(disc_id);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/discount/all_discount.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/discount/all_discount.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
