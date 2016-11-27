package com.product.controller;

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

import com.product.model.ProductService;
import com.product.model.ProductVO;


@WebServlet("/getProducts")
public class GetProductsForAndroid extends HttpServlet {
	
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String productkind=request.getParameter("productkind").trim();
		
		
		if("1".equals(productkind)){		
			
			Integer class_id=new Integer(request.getParameter("dishclass").trim());
			ProductService productSvc=new ProductService();
			List<ProductVO> list=productSvc.getSingleDishesByClass(class_id);
			System.out.println(list);
			JSONArray jsonArray=new JSONArray();
			JSONObject jsonObj,jsonObjkind,jsonObjclass;
			for(ProductVO products:list){
				jsonObj=new JSONObject();
				jsonObj.put("product_id", products.getProduct_id());
				jsonObj.put("product_name", products.getProduct_name());
				jsonObj.put("product_price",products.getProduct_price());
				
//				jsonObjkind=new JSONObject();
//				jsonObjkind.put("kind_id",products.getProductKindVO().getKind_id());
//				jsonObjkind.put("kind_name",products.getProductKindVO().getKind_name());
//				jsonObj.put("productKindVO",jsonObjkind);
				
//				jsonObjclass=new JSONObject();
//				jsonObjclass.put("class_id", products.getDishClassVO().getClass_id());
//				jsonObjclass.put("class_name", products.getDishClassVO().getClass_name());
//				jsonObj.put("dishClassVO",jsonObjclass);
				
				jsonObj.put("pcgVO",products.getPcgVO());
				jsonObj.put("inMenu",products.getInMenu());
				jsonObj.put("product_intro",products.getProduct_intro());
				jsonArray.add(jsonObj);
			}
			response.setHeader("content-type", "text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.println(jsonArray.toJSONString());
		}
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
