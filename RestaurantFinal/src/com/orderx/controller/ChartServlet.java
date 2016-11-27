package com.orderx.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;

import com.order.model.OrderService;
import com.orderx.model.OrderXService;
import com.product.model.ProductService;
import com.product.model.ProductVO;

@WebServlet("/chart/chart.do")
public class ChartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		OrderService orderService = new OrderService();
		OrderXService orderXService = new OrderXService();
		ProductService productService = new ProductService();
		
		if("selectmoney".equals(action)){
			String month = request.getParameter("selmonth");
			String year = request.getParameter("selyear");
			String date = request.getParameter("seldate");
//			System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxx");
			Integer[] ans =orderService.getRevenueByMonth(year, month, date);
			PrintWriter out = response.getWriter();
			JSONArray list = new JSONArray();
			for(Integer xx : ans){
				list.add(xx);
			}
			out.print(list);
		}
		
		if("selectPcg".equals(action)){
			String month = request.getParameter("selmonth");
			String year = request.getParameter("selyear");
			String date = request.getParameter("seldate");
			
			List<Object[]> list = orderXService.getPcgAmountByMonth(year, month, date);
			response.setHeader("Access-Control-Allow-Origin", "*");
			response.setHeader("content-type", "text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();

			JSONArray arrname = new JSONArray();
			JSONArray arrvalue = new JSONArray();
			int count=0;
			for(Object[] aa : list){
				arrname.add(aa[0].toString());
				arrvalue.add(aa[1]);
			}
			JSONObject jsonmap = new JSONObject();
			jsonmap.put("name", arrname);
			jsonmap.put("value", arrvalue);

			out.print(jsonmap);
		}
		
		if("selectEachPcg".equals(action)){
			String month = request.getParameter("selmonth");
			String year = request.getParameter("selyear");
			String date = request.getParameter("seldate");
			String pcgName = request.getParameter("pcgName");
			
			List<Object> plist = productService.getProductByPackage(pcgName);
			List<Object[]> list = orderXService.getEachPcgByMonth(year, month, date, pcgName);
			response.setHeader("Access-Control-Allow-Origin", "*");
			response.setHeader("content-type", "text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			
			JSONArray pcgname = new JSONArray();
			JSONArray pcgcount = new JSONArray();
			for(int i=0;i<plist.size();i++){
				pcgcount.add(0);
				pcgname.add(plist.get(i));
			}
			for(Object[] pcgnum :list){
				int index = plist.indexOf(pcgnum[0]);
				long total=(Integer)pcgcount.get(index)+(Long)pcgnum[1];
				pcgcount.set(index, total);
			}
			JSONObject jsonmap = new JSONObject();
			jsonmap.put("pcgname", pcgname);
			jsonmap.put("pcgvalue", pcgcount);

			out.print(jsonmap);
		}
		
		if("selectDish".equals(action)){
			String beginDate = request.getParameter("beginDate");
			String endDate = request.getParameter("endDate");
			String dishClass = request.getParameter("dishClass");
			Integer class_id = Integer.valueOf(dishClass);

			response.setHeader("Access-Control-Allow-Origin", "*");
			response.setHeader("content-type", "text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			
			List<ProductVO> plist = productService.getProductByClass(class_id);
			List<Object[]> orderlist = orderXService.getDishesAmount(beginDate, endDate, class_id);
			
			JSONArray arrname = new JSONArray();
			JSONArray arrvalue = new JSONArray();
			if(orderlist.size()!=0){
				for(int i=0;i<plist.size();i++){
					arrname.add(plist.get(i).getProduct_name());
					arrvalue.add(0);
				}
			}
			for(Object[] dish : orderlist){
				int index = arrname.indexOf(dish[0]);
				long total=(Integer)arrvalue.get(index)+(Long)dish[1];
				arrvalue.set(index, total);
			}
			JSONObject jsonmap = new JSONObject();
			jsonmap.put("dishesname", arrname);
			jsonmap.put("dishescount", arrvalue);

			out.print(jsonmap);
		}
		
		if("selectEachDish".equals(action)){
			String beginDate = request.getParameter("beginDate");
			String endDate = request.getParameter("endDate");
			String dishesName = request.getParameter("dishesName");

			response.setHeader("Access-Control-Allow-Origin", "*");
			response.setHeader("content-type", "text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			
			List<Object[]> orderlist = orderXService.getEachDishes(beginDate, endDate, dishesName);
			JSONArray pcgname = new JSONArray();
			JSONArray dishcount = new JSONArray();
			if(orderlist.size()!=0){
			for(Object[] order : orderlist){
				if(order[1]==null)
					pcgname.add("單點");
				else 
					pcgname.add(order[1]);
				dishcount.add(order[2]);
			}
			}
			JSONObject jsonmap = new JSONObject();
			jsonmap.put("pcgname", pcgname);
			jsonmap.put("dishcount", dishcount);

			out.print(jsonmap);
		}


	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
