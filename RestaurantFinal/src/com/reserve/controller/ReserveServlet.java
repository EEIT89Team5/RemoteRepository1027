package com.reserve.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.reserve.model.ReserveService;
import com.reserve.model.ReserveVO;

@WebServlet("/reserve/ReserveServlet.do")
public class ReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReserveServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ReserveService rdao = new ReserveService();
		request.setCharacterEncoding("UTF-8");
		String doWhat=request.getParameter("doWhat");
			
//----------------------新增預約---------------------------------------------------------------
		
		if("createOne".equals(doWhat)){
			String date = request.getParameter("date");
			String time = request.getParameter("time");
			String res_name = request.getParameter("res_name");
			String res_gender = request.getParameter("res_gender");
			String res_phone = request.getParameter("res_phone");
			String res_numPs = request.getParameter("res_numP");
			String res_remark = request.getParameter("res_remark");
			Integer res_numP = Integer.valueOf(res_numPs);
			Timestamp test = Timestamp.valueOf(date+" "+time+":00:00");
			ReserveVO vo = rdao.findByPrimaryKey(test, res_phone);
			if(vo!=null){
				request.setAttribute("reback","時間和手機已有訂位!");
				RequestDispatcher rd = request.getRequestDispatcher("reserveC.jsp");
				rd.forward(request, response);
				return;
			}
			rdao.insert(date, time, res_name, res_gender, res_phone, res_numP, res_remark);
//			response.sendRedirect("reserveQ.jsp");
			response.sendRedirect("ReserveServlet.do?doWhat=selects&months="+date.substring(5, 7)+"&days="+date.substring(8, 10));
		}
		
//--------------------修改預約資料(從DB找到資料丟到修改的頁面)----------------------------------
		
		if("update".equals(doWhat)){
			HttpSession session = request.getSession();
			String timex = request.getParameter("res_time");
			String res_phone = request.getParameter("res_phone");
			Timestamp res_time = Timestamp.valueOf(timex);
			ReserveVO reserveVO = rdao.findByPrimaryKey(res_time, res_phone);
			
			String date = timex.substring(0,10);
			String time = timex.substring(11,13);
			session.setAttribute("updateReserveVO", reserveVO);
			session.setAttribute("ReserveVOdate", date);
			session.setAttribute("ReserveVOtime", time);
			response.sendRedirect("reserveU.jsp");
		}
		
//---------------------修改預約資料2(從業面把資料update到資料庫裡)----------------------------------	
		
		if("update2".equals(doWhat)){
			HttpSession session = request.getSession();
			ReserveVO reservevo = (ReserveVO)session.getAttribute("updateReserveVO");
			
			String date = request.getParameter("date");
			String time = request.getParameter("time");
			String res_name = request.getParameter("res_name");
			String res_gender = request.getParameter("res_gender");
			String res_phone = request.getParameter("res_phone");
			String res_numPs = request.getParameter("res_numP");
			String res_remark = request.getParameter("res_remark");
			Integer res_numP = Integer.valueOf(res_numPs);
//			Timestamp test = Timestamp.valueOf(date+" "+time+":00:00");
//			ReserveVO vo = rdao.findByPrimaryKey(test, res_phone);
//			if(vo!=null){
//				request.setAttribute("reback","時間和手機已有訂位!");
//				RequestDispatcher rd = request.getRequestDispatcher("reserveU.jsp");
//				rd.forward(request, response);
//				return;
//			}
			rdao.delete(reservevo.getRes_time(), reservevo.getRes_phone());
			rdao.insert(date, time, res_name, res_gender, res_phone, res_numP, res_remark);
			
			session.removeAttribute("updateReserveVO");
			session.removeAttribute("ReserveVOdate");
			session.removeAttribute("ReserveVOtime");			
//			response.sendRedirect("reserveQ.jsp");
			response.sendRedirect("ReserveServlet.do?doWhat=selects&months="+date.substring(5, 7)+"&days="+date.substring(8, 10));
		}
	//-------------------------------------------------------------------------	
		if("selects".equals(doWhat)){
			String months = request.getParameter("months");
			String days = request.getParameter("days");
			if(months.length()==1){
				months="0"+months;
			}
			if(days.length()==1){
				days="0"+days;
			}
			List<ReserveVO> resVO = null;
			if(days.equals("00")){
				String res_time = "2016-" + months;
				resVO = rdao.findByMonth(res_time);
			}else{
				String res_time = "2016-" + months + "-" + days;
				resVO = rdao.findByDate(res_time);
			}
			request.setAttribute("resVO", resVO);
			request.setAttribute("test", "xxx");
			RequestDispatcher rd = request.getRequestDispatcher("reserveQ.jsp");
			rd.forward(request, response);
		}
		
//---------------------刪除預約----------------------------------------------
		
		if("delete".equals(doWhat)){
			String time = request.getParameter("res_time");
			String res_phone = request.getParameter("res_phone");
			Timestamp res_time = Timestamp.valueOf(time);
			rdao.delete(res_time, res_phone);
//			response.sendRedirect("reserveQ.jsp");
			response.sendRedirect("ReserveServlet.do?doWhat=selects&months="+time.substring(5, 7)+"&days="+time.substring(8, 10));
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
