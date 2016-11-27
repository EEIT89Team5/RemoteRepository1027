package com.table.controller;

import java.io.IOException;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.discount.model.DiscountService;
import com.discount.model.DiscountVO;
import com.order.model.OrderService;
import com.order.model.OrderVO;
import com.table.model.TableService;
import com.table.model.TableVO;


@WebServlet("/table/formatTable.do")
public class ShowTable extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ShowTable() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		TableService dao = new TableService();
		OrderService dao_ot = new OrderService();
		DiscountService dao_disc = new DiscountService();
//		List<TableVO> list=null;
		request.setCharacterEncoding("UTF-8");
		String table = request.getParameter("table");
		
		//--------取得全部捉號的狀況和訂位的人數
		if("index".equals(table)){
			List<TableVO> list=dao.getAllTable();
			request.setAttribute("AllTable", list);
			request.setAttribute("size", list.size());
			request.setAttribute("time", new Time(System.currentTimeMillis()));
			response.setHeader("Refresh", "20");
			
			RequestDispatcher rd = request.getRequestDispatcher("tableStatus.jsp");
			rd.forward(request, response);
		}
		
		
		if("numP".equals(table)){
//			List<String> errorMsgs = new LinkedList<String>();
			HttpSession session = request.getSession();
			session.removeAttribute("errorMsgs");
			
			String table_name=request.getParameter("table_name");
			String numP=request.getParameter("table_numP");
			int table_numP=0;
			try{
				table_numP = Integer.parseInt(numP);
			}catch(NumberFormatException e){
				session.setAttribute("errorMsgs"," "+table_name+"桌位人數請輸入數字");
				response.sendRedirect("formatTable.do?table=index");
				return;
			} 
//			System.out.println(table_time);
			TableVO tablevo = dao.getOneTable(table_name);		
			if("空桌".equals(tablevo.getTable_status())){
				String table_status="未點餐";
				Time table_time = new Time(System.currentTimeMillis());
				dao.updateTable(table_name, table_numP, table_status, table_time);
			}else{
				String table_status = tablevo.getTable_status();
				Time table_time = tablevo.getTable_time();
				dao.updateTable(table_name, table_numP, table_status, table_time);
			}
			response.sendRedirect("formatTable.do?table=index");
//			RequestDispatcher rd = request.getRequestDispatcher("formatTable.do?table=index");
//			rd.forward(request, response);
		}
		
		//---------要查本桌訂單的查是否有未結帳,未結帳則不能清空!!!
		if("clear".equals(table)){
			HttpSession session = request.getSession();
			session.removeAttribute("errorMsgs");
			String table_name=request.getParameter("table_name");
			OrderVO vo = dao_ot.findsByTableName(table_name);
			TableVO tablevo = dao.getOneTable(table_name);
//			try{
//				if(tablevo.getTable_status().equals("未點餐")||tablevo.getTable_status().equals("空桌")||vo.getOrder_paytime()!=null){
				if(tablevo.getTable_status().equals("未點餐")||tablevo.getTable_status().equals("空桌") 
						||(tablevo.getTable_paid().equals("已結")&&tablevo.getTable_status().equals("菜上齊"))){	
					int table_numP=0;
					Time table_time=Time.valueOf("00:00:00");
					String table_status="空桌";
					String table_paid="未結";
					tablevo.setTable_numP(table_numP);
					tablevo.setTable_time(table_time);
					tablevo.setTable_status(table_status);
					tablevo.setTable_paid(table_paid);
					dao.update(tablevo);
				}else if(!tablevo.getTable_status().equals("菜上齊")){
					session.setAttribute("errorMsgs"," "+table_name+"菜色還未上齊無法清空");
				}else{
						session.setAttribute("errorMsgs"," "+table_name+"還未結帳無法清空!!");
				}
//			}catch(NullPointerException e){
//				session.setAttribute("errorMsgs"," "+table_name+"還未結帳無法清空");
//				response.sendRedirect("formatTable.do?table=index");
//				return;
//			}
			
			response.sendRedirect("formatTable.do?table=index");
		}
		
		if("paymoney".equals(table)){
			HttpSession session = request.getSession();
			session.removeAttribute("errorMsgs");
			String table_name=request.getParameter("table_name");
//			System.out.println("------------------------"+table_name);
			OrderVO ordervo= dao_ot.getOrderDetailsByTableName(table_name);
//			System.out.println("------------------------"+ordervo.getOrder_table());
			if(ordervo==null){
				session.setAttribute("errorMsgs"," "+table_name+"沒有訂單可以結帳");
				response.sendRedirect("formatTable.do?table=index");
				return;
			}

			request.setAttribute("bills", ordervo);
			RequestDispatcher rd = request.getRequestDispatcher("paymoney.jsp");
			rd.forward(request, response);
		}
		
		if("money".equals(table)){
			HttpSession session = request.getSession();
			session.removeAttribute("errorMsgs");
			String id=request.getParameter("order_id");
			String price=request.getParameter("order_price");
			String discount=request.getParameter("order_discount");
			String order_table=request.getParameter("order_table");
			
			int order_id = Integer.parseInt(id);
			int order_price = Integer.parseInt(price);
			Timestamp order_paytime = new Timestamp(System.currentTimeMillis());
			OrderVO ordervo = dao_ot.getOneOrder(order_id);
			try{
				int order_discount = Integer.parseInt(discount);
				DiscountVO discvo = dao_disc.getOneDisc(order_discount);
				ordervo.setDiscountVO(discvo);
			}catch(NumberFormatException e){
				
			}
			ordervo.setOrder_price(order_price);
			ordervo.setOrder_paytime(order_paytime);
			dao_ot.updateOrder(ordervo);
			
			TableVO tablevo = dao.getOneTable(order_table);
			tablevo.setTable_paid("已結");
			dao.update(tablevo);
			
			response.sendRedirect("formatTable.do?table=index");
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
