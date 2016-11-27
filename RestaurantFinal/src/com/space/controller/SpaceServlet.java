package com.space.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.space.model.SpaceService;
import com.space.model.SpaceVO;
import com.spacex.model.SpaceXService;
import com.table.model.TableService;


@WebServlet("/space/spacename.do")
public class SpaceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SpaceServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SpaceService space_dao = new SpaceService();
		SpaceXService spaceX_dao = new SpaceXService();
		TableService table_dao = new TableService();
		
		request.setCharacterEncoding("UTF-8");
		String whatDo=request.getParameter("whatdo");
		
//-------------------------場地的名稱存入DB------------------------------------
		
		if("addspace".equals(whatDo)){
			String space_name=request.getParameter("space_name").trim();
			SpaceVO spacevo = space_dao.findBySpaceName(space_name);
			response.setHeader("Access-Control-Allow-Origin", "*");
			response.setHeader("content-type", "text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			if(spacevo==null){
				space_dao.addSpace(space_name);
//				out.println("true");
				out.write("truex");
			}else{
//				out.println("false");
				out.write("falsex");
			}
		}
		
//-------------------------場地的桌子資料存入DB------------------------------------
		
		if("addspaceX".equals(whatDo)){
			String text = request.getParameter("text");
			String spacename =request.getParameter("spacename");
			SpaceVO vo = space_dao.findBySpaceName(spacename);
			System.out.println(vo.getSpace_id());
			
			String[] array =text.split(",");
			String table_id=array[0].trim();
			Integer table_maxP=Integer.valueOf(array[1].trim());
			Double table_x=Double.valueOf(array[2]);
			Double table_y=Double.valueOf(array[3]);
			String table_shape=array[4];
			spaceX_dao.insert(vo.getSpace_id(), table_id, table_maxP, table_x, table_y, table_shape);
			response.sendRedirect("../index.jsp");	
		}
		
//-------------------------呈現場地的桌位配置圖------------------------------------
	
		if("showSpaceX".equals(whatDo)){
			response.setHeader("Access-Control-Allow-Origin", "*");
			response.setHeader("content-type", "text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			
			List<Map<String,String>> list = spaceX_dao.getAll();
			String jsonString=JSONArray.toJSONString(list);
			out.println(jsonString);
		}

//-------------------------改變外場監控呈現的桌位配置圖------------------------------------
		
		if("changeTable".equals(whatDo)){
			String space_idd=request.getParameter("space_id");
			Integer space_id = Integer.valueOf(space_idd);
			table_dao.addTable(space_id);
		}

//-------------------------刪除某個場地和桌子------------------------------------
				
		if("deleteSpace".equals(whatDo)){
			String space_idd=request.getParameter("space_id");
			Integer space_id = Integer.valueOf(space_idd);
			space_dao.delete(space_id);
		}

//-------------------------刪除某個場地的桌子------------------------------------
			
		if("deleteSpaceX".equals(whatDo)){
			String space_idd=request.getParameter("space_id");
			Integer space_id = Integer.valueOf(space_idd);
			spaceX_dao.delete(space_id);
		}
		
		
//		if("delNullSpace".equals(whatDo)){
//			String space_name=request.getParameter("spacename");
//			SpaceVO vo = space_dao.findBySpaceName(space_name);
//			space_dao.delete(vo.getSpace_id());
//		}
//		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
