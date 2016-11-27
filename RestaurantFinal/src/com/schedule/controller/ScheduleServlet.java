package com.schedule.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.emp.model.EmpService;
import com.emp.model.EmpVO;
import com.schedule.model.ScheduleService;
import com.schedule.model.ScheduleVO;

@WebServlet("/schedule/schedule.do")
public class ScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		ScheduleService scheduleService = new ScheduleService();
		EmpService empService = new EmpService();
		
		if("insertschedule".equals(action)){
			String date = request.getParameter("scheduledate");
			String timeperiod = request.getParameter("timeperiod");
			String[] emps = request.getParameterValues("emps");
			Date schedule_date = Date.valueOf(date);		
			
			scheduleService.delete(timeperiod, schedule_date);
			if(emps!=null){
				for(String emp:emps){
					Integer emp_id = Integer.valueOf(emp);
					EmpVO schedule_emp = empService.getOneEmp(emp_id);
					scheduleService.addSchedule(schedule_emp, timeperiod, schedule_date);
				}
			}
			HttpSession session = request.getSession();
			session.setAttribute("calendar", schedule_date);
			response.sendRedirect("schedule.jsp");
		}
		
		if("getAllByMonth".equals(action)){
			String date = request.getParameter("monthDate");
			List<ScheduleVO> list = scheduleService.getAll(date);
//			JSONArray arrout = new JSONArray();
			JSONArray scheduleMap = new JSONArray();
//			System.out.println(list.size());
//			arrout.add(scheduleMap);
			for(ScheduleVO vo : list){
				JSONObject arrin = new JSONObject();
				arrin.put("date",vo.getSched_date().toString());
				arrin.put("timeperiod",vo.getSched_class());
				arrin.put("name",vo.getEmpVO().getEmp_name());
				scheduleMap.add(arrin);
			}
//			System.out.println(arrout.size());
			response.setHeader("Access-Control-Allow-Origin", "*");
			response.setContentType("application/json");
//			response.setHeader("content-type", "application/JSON");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(scheduleMap);
			
		}
		
		if("getOneByEmpID".equals(action)){
			String date = request.getParameter("monthDate");
			String empid = request.getParameter("empid");
			Integer emp_id = Integer.valueOf(empid);
			List<ScheduleVO> list = scheduleService.getOnes(date, emp_id);
			
			JSONArray scheduleMap = new JSONArray();
			for(ScheduleVO vo : list){
				JSONObject arrin = new JSONObject();
				arrin.put("date",vo.getSched_date().toString());
				arrin.put("timeperiod",vo.getSched_class());
				arrin.put("name",vo.getEmpVO().getEmp_name());
				scheduleMap.add(arrin);
			}

			response.setHeader("Access-Control-Allow-Origin", "*");
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(scheduleMap);
			
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
