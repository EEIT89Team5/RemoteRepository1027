package com.product.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import org.json.JSONArray;

import com.dishclass.model.DishClassVO;
import com.packageformat.model.PackageFormatVO;
import com.product.model.ProductService;
import com.product.model.ProductVO;
import com.productkind.model.ProductKindVO;

@MultipartConfig()
public class ProductServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
//=========================listAllPro.jsp=========================================		
		
	//listAllPro.jsp的修改鈕 轉交到update_pro_input.jsp
	if ("getOne_For_Update".equals(action)) { 
			//存放錯誤資訊
		List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

		try {

				Integer proid = new Integer(req.getParameter("product_id"));

				ProductService proSvc = new ProductService();

				ProductVO proVO = proSvc.getOnePro(proid);

				req.setAttribute("proVO", proVO); 
					String url = "/product/update_pro_input.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res);
			}catch (Exception e)
				{	
					errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
					RequestDispatcher failureView = req
					.getRequestDispatcher("/product/listAllPro.jsp");
					failureView.forward(req, res);
				}
			}


	//update_pro_input.jsp的修改鈕
	if ("update".equals(action)) { 
			//存放錯誤資訊
		List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			Collection<Part> part=req.getParts();
	    	InputStream is=null;
			
			Integer proid = new Integer(req.getParameter("product_id").trim());
			
			String pname = req.getParameter("product_name");
			String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,15}$";
			
			Integer pprice=null;
			
			Integer pkind = new Integer(req.getParameter("product_kind").trim());
			
			Integer pclass = new Integer(req.getParameter("product_class").trim());
			
			Integer pinMenu = new Integer(req.getParameter("inMenu").trim());
			
			String pinIntro=new String(req.getParameter("product_intro"));
			

			for(Part mypart: part){
				 
				if (mypart.getContentType()!=null){
		  		String picName =  mypart.getName();
		  		if(picName.equals("FileUp")){
		  			is=mypart.getInputStream();	   
   	   }  	   
   	}
  }	
				ByteArrayOutputStream baos=new ByteArrayOutputStream();
				int length=0;
				byte[] buffer=new byte[1024];
				byte[] img=null;
				while((length=is.read(buffer))!=-1){
					baos.write(buffer, 0, length);
					img=baos.toByteArray();
   }
			
	//驗證商品姓名與價格這兩樣自填項目規格是否正確			
				if (pname == null || pname.trim().length() == 0) {
					errorMsgs.add("產品名稱: 請勿空白");
				}
				
				
				if(!pname.trim().matches(enameReg) ) { 
					errorMsgs.add("產品名稱:只能是中、英文字母、數字和_ , 且長度必需在2到15之間");
	            }
					
				
				try {
				pprice = new Integer(req.getParameter("product_price").trim());
				} catch (NumberFormatException e) {
					pprice = 0;
					errorMsgs.add("商品價格請填數字.");
				}
			//建立一個VO來存放使用者輸入的資訊
		try {

				
				ProductVO proVO = new ProductVO();

						proVO.setProduct_id(proid);
						proVO.setProduct_name(pname);
						proVO.setProduct_price(pprice);
						ProductKindVO Pdko=new ProductKindVO();
						Pdko.setKind_id(pkind);
						proVO.setProductKindVO(Pdko);
						DishClassVO Dvo=new DishClassVO();
						proVO.setProduct_pcg(null);
						Dvo.setClass_id(pclass);
						if(pclass!=0){
						proVO.setDishClassVO(Dvo);
						}
						proVO.setInMenu(pinMenu);
						if(pinIntro.length()!=0){
						proVO.setProduct_intro(pinIntro);
						}else{
						proVO.setProduct_intro(null);
						}
						
			//將proVO給一個外部呼叫代號proVO					
			ProductService productdao= new ProductService();
			ProductVO primitive=productdao.findByPrimaryKey(proid);
			byte [] nowimg=primitive.getProduct_img();	
			if(img!=null){
			proVO.setProduct_img(img);
			}else{
			proVO.setProduct_img(nowimg);
			}
		
			//將資料送到Service的updatePro再交到DAO進行資料庫的寫入
	          productdao.updatePro(proVO);	
	            req.setAttribute("proVO", proVO);
	        //如果使用者輸入的格式不正確將網頁停留在原頁面
			if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/product/update_pro_input.jsp");
					failureView.forward(req, res);
					return;
				}
			//使用者輸入資訊正確就進行網頁的轉交
				String url = "/product/listOnePro.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);	
				
			} catch (Exception e) {
				errorMsgs.add("資料庫處理時發生錯誤");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/product/update_pro_input.jsp");
				failureView.forward(req, res);
			}
		}
    
    //listAllPro.jsp的刪除鈕
	if ("delete".equals(action)) {

		List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

		try {

			Integer proid = new Integer(req.getParameter("product_id"));
			ProductService proSvc = new ProductService();
			proSvc.deletePro(proid);
			
			String url = "/product/listAllPro.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);
			
			}catch(Exception e) {
			errorMsgs.add("刪除資料失敗:"+e.getMessage());
			RequestDispatcher failureView = req
					.getRequestDispatcher("/product/listAllPro.jsp");
			failureView.forward(req, res);
			}
		}
	
//=================================================================================	

//===============================one_select_page.jsp===============================	
	
	//查詢鈕 將指定的菜色資訊查詢出來將結果直接顯示在網頁上
			
	if ("getOne_For_Display".equals(action)) { 

		List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

		try {
				Integer proid =new Integer(req.getParameter("product_id"));
						
					
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
					.getRequestDispatcher("/product/one_select_page.jsp");
				failureView.forward(req, res);
				return;
				}			

					ProductService proSvc = new ProductService();
					ProductVO proVO = proSvc.getOnePro(proid);
					req.setAttribute("proVO", proVO); 
			if (proVO == null) {
				errorMsgs.add("查無資料");
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
					.getRequestDispatcher("/product/one_select_page.jsp");
				failureView.forward(req, res);
				return;
				}
					
			String url = "/product/one_select_page.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
					
				successView.forward(req, res);


			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
					.getRequestDispatcher("/product/one_select_page.jsp");
				failureView.forward(req, res);
				}
			}
//=================================================================================

//================================addSinglePro.jsp=================================	
	
	//新增單點餐點
	
	if("insertSinglePro".equals(action)){
		
		List<String> errorMsgs=new LinkedList<String>();
			req.setAttribute("errorMsgs",errorMsgs);

			String pname=req.getParameter("product_name");
			String enameReg="^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,20}$";
			Integer pprice=null;
			Integer pkind=new Integer(req.getParameter("product_kind").trim());
			Integer pclass=new Integer(req.getParameter("product_class").trim());
			Integer pinMenu=new Integer(req.getParameter("inMenu").trim());
			String pinIntro=new String(req.getParameter("product_intro"));

		if (pname == null || pname.trim().length() == 0) {
			errorMsgs.add("產品名稱: 請勿空白");
		}
					
		if(!pname.trim().matches(enameReg) ) { 
			errorMsgs.add("產品名稱:只能是中、英文字母、數字和_ , 且長度必需在2到20之間");
		}
						
		try {
			pprice = new Integer(req.getParameter("product_price").trim());
		} catch (NumberFormatException e) {
			pprice = 0;
			errorMsgs.add("商品價格請填數字.");
		}
		//Servlet3.0功能 可將表單(FORM)的POST格式來的資料文字跟檔案分開處理
		Collection<Part>part=req.getParts();
		ProductVO proVO=new ProductVO();
		InputStream is=null;

			for(Part mypart:part){

				if(mypart.getContentType()==null){
					proVO.setProduct_name(pname);
					proVO.setProduct_price(pprice);
					ProductKindVO Pdko=new ProductKindVO();
					Pdko.setKind_id(pkind);
					proVO.setProductKindVO(Pdko);
					DishClassVO dd=new DishClassVO();
					dd.setClass_id(pclass);
					proVO.setDishClassVO(dd);
					proVO.setInMenu(pinMenu);
					proVO.setProduct_intro(pinIntro);
				
				}else if(mypart.getContentType()!=null){
					String picName=mypart.getName();
					
					if(picName.equals("NewFileUp")){
						is=mypart.getInputStream();
					}
					
				}
			}
			//創建一個大小與此輸出流的當前大小的一個新分配緩衝區
			ByteArrayOutputStream baos=new ByteArrayOutputStream();
			int length=0;
			byte[] buffer=new byte[1024];
			byte[] img =null;
			while((length=is.read(buffer))!=-1){
				baos.write(buffer,0,length);
				img=baos.toByteArray();
			}
				proVO.setProduct_img(img);
					req.setAttribute("proVO",proVO);

			try {
				ProductService productdao= new ProductService(); 
	            productdao.addSinglePro(proVO);	

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/product/addSinglePro.jsp");
					failureView.forward(req, res);
					return;
				}
	//寫入完成後進行網頁的轉交
				String url = "/product/listAllPro.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);	
				is.close();
				baos.close();
				} catch (Exception e) {
				errorMsgs.add("資料庫處理時發生錯誤");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/product/addSinglePro.jsp");
				failureView.forward(req, res);		
			}
		}
		
//=================================================================================		
		
//===================================AddPack.jsp===================================
	
	//傳送鈕 並將網頁轉交到AddPackPro.jsp
		
        if ("insertPackage".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);

			String pname = req.getParameter("product_name");
			String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,20}$";
			
			Integer pprice =new Integer(req.getParameter("product_price"));
			String pinIntro=new String(req.getParameter("product_intro"));
			Integer pkind = new Integer(req.getParameter("product_kind").trim());
			Integer pinMenu = new Integer(req.getParameter("inMenu").trim());
			
				if (pname == null || pname.trim().length() == 0) {
					errorMsgs.add("產品名稱: 請勿空白");
				}
				
				if(!pname.trim().matches(enameReg) ) { 
					errorMsgs.add("產品名稱:只能是中、英文字母、數字和_ , 且長度必需在2到20之間");
	            }
			//Servlet3.0功能 可將表單(FORM)的POST格式來的資料文字跟檔案分開處理		
			Collection<Part> part=req.getParts();
			ProductVO proVO = new ProductVO();
			InputStream is=null;
			//用迴圈來判斷Part內每項輸入的資料格式 代號mypart 
				for(Part mypart: part){
			
			//如果表單傳送來的資料屬於文字就把資料裝進ProVO
					if(mypart.getContentType()==null){
						
						proVO.setProduct_name(pname);
						proVO.setProduct_price(pprice);
						ProductKindVO Pdko=new ProductKindVO();
						Pdko.setKind_id(pkind);
						proVO.setProductKindVO(Pdko);
						proVO.setInMenu(pinMenu);
						proVO.setProduct_intro(pinIntro);
					
	//如果表單傳送來的資料屬於檔案 從指定的id取出InputStream型態 取名is
					}else if (mypart.getContentType()!=null){
						String picName = mypart.getName();
		            	   if(picName.equals("NewFileUp")){
		            	   is=mypart.getInputStream();	  	   	
		            	   	}
					}		
				}

				ByteArrayOutputStream baos=new ByteArrayOutputStream();
				int length=0;
				byte[] buffer=new byte[1024];
				byte[] img=null;
				while((length=is.read(buffer))!=-1){
					baos.write(buffer, 0, length);
					img=baos.toByteArray();
				}
				proVO.setProduct_img(img);
				
//				req.setAttribute("proVO", proVO);

		try {
				ProductService productdao= new ProductService(); 
	            productdao.addPack(proVO);	

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Package/AddPack.jsp");
					failureView.forward(req, res);
					return;
				}
	//寫入完成後進行網頁的轉交
				String url = "/Package/AddPackPro.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);	
				
				} catch (Exception e) {
				errorMsgs.add("資料庫處理時發生錯誤");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Package/AddPack.jsp");
				failureView.forward(req, res);
				}
			}
       
	//頁面AddPackPro.jsp 新增套餐內的菜色
    if ("insertPackagePro".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
				
			String pname = req.getParameter("product_name");
			Integer pinpcg=new Integer(req.getParameter("product_pcg"));
			Integer pclass=new Integer(req.getParameter("product_class"));

			ProductVO proVO = new ProductVO();
						
				proVO.setProduct_name(pname);
				proVO.setProduct_price(0);
				ProductKindVO Pdko=new ProductKindVO();
				Pdko.setKind_id(3);
				proVO.setProductKindVO(Pdko);
				
				DishClassVO dvo=new DishClassVO();
				dvo.setClass_id(pclass);
				proVO.setDishClassVO(dvo);
				
				proVO.setInMenu(1);	
				
				ProductVO pcg=new ProductVO();
				pcg.setProduct_id(pinpcg);
				proVO.setPcgVO(pcg);
					
				req.setAttribute("proVO", proVO);
				ProductVO PVO=new ProductVO();
				req.setAttribute("PVO", PVO);
		try {
				ProductService productdao= new ProductService(); 
	            productdao.addPackPro(proVO);	

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Package/AddPackPro.jsp");
					failureView.forward(req, res);
					return;
				}

				String url = "/Package/AddPackPro.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);	
				
			} catch (Exception e) {
				errorMsgs.add("資料庫處理時發生錯誤");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Package/AddPackPro.jsp");
				failureView.forward(req, res);
			}
		}
        
    //新增套餐與菜色時的刪除按鈕(屬於獨立分頁 顯示時在AddPackPro.jsp頁面內include)
    if ("deletePackPro".equals(action)) {

		List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			ProductVO PVO=new ProductVO();
			req.setAttribute("PVO", PVO);
		try {
			
			Integer proid = new Integer(req.getParameter("product_id"));
			
			ProductService proSvc = new ProductService();
			proSvc.deletePro(proid);
			
			String url = "/Package/AddPackPro.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
			
			
			} catch (Exception e) {
			errorMsgs.add("刪除資料失敗:"+e.getMessage());
			RequestDispatcher failureView = req
					.getRequestDispatcher("/Package/AddPackPro.jsp");
			failureView.forward(req, res);
			}
		}
    
//=================================================================================	

//===================================UpdatePro.jsp================================== 
    //UpdatePro.jsp搜尋鈕 選指定套餐將網頁轉交到UpdatePackPro.jsp
    if ("SelectPackage".equals(action)) {
   		
   		List<String> errorMsgs = new LinkedList<String>();
   			req.setAttribute("errorMsgs", errorMsgs);

   		Integer proid=new Integer(req.getParameter("product_id"));
   			


   		try {
   			ProductService productdao= new ProductService();
   			List<PackageFormatVO> proVO1=productdao.packageformat(proid);
   			ProductVO proVO=productdao.findByPrimaryKey(proid);
               req.setAttribute("proVO", proVO);
               req.setAttribute("proVO1", proVO1);
               req.setAttribute("pid", proid);

   			String url = "/Package/UpdatePackPro2.jsp";
   			RequestDispatcher successView = req.getRequestDispatcher(url); 
   			successView.forward(req, res);	
   			
   			} catch (Exception e) {
   			errorMsgs.add("資料庫處理時發生錯誤");
   			RequestDispatcher failureView = req
   					.getRequestDispatcher("/Package/UpdatePro.jsp");
   			failureView.forward(req, res);
   			}
   		
   		}
 if ("UpPackage".equals(action)) {
		
		List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

		Integer proid=new Integer(req.getParameter("product_id"));
			
			//輸入搜尋條件符合類別3(也就是套餐菜色) 價格0(因為總價設定在套餐) pcg用戶輸入的套餐種類
			ProductVO proVO1 = new ProductVO();
	
			ProductKindVO Pdko=new ProductKindVO();
			Pdko.setKind_id(3);
			proVO1.setProductKindVO(Pdko);
			proVO1.setProduct_price(0);
			proVO1.setProduct_pcg(proid);

		try {
			ProductService productdao= new ProductService(); 
			List<ProductVO> proVO=productdao.selectPackPro(proVO1);
            req.setAttribute("proVO", proVO);
            req.setAttribute("pid", proid);

			String url = "/Package/UpdatePackPro.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); 
			successView.forward(req, res);	
			
			} catch (Exception e) {
			errorMsgs.add("資料庫處理時發生錯誤");
			RequestDispatcher failureView = req
					.getRequestDispatcher("/Package/UpdatePro.jsp");
			failureView.forward(req, res);
			}
		
		}

//從UpdatePro.jsp轉來 新增指定套餐菜色

    if ("insertClassNum".equals(action)) {
			
		List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			Integer pcgid=new Integer(req.getParameter("pcg_id"));

			Integer num10=new Integer(req.getParameter("Class_number10"));
			Integer num20=new Integer(req.getParameter("Class_number20"));
			Integer num30=new Integer(req.getParameter("Class_number30"));
			Integer num40=new Integer(req.getParameter("Class_number40"));
			Integer num50=new Integer(req.getParameter("Class_number50"));
			Integer num60=new Integer(req.getParameter("Class_number60"));
	
			try {
				ProductVO PVO=new ProductVO();
				PackageFormatVO pkfVO10 = new PackageFormatVO();
				DishClassVO dcVO=new DishClassVO();

				dcVO.setClass_id(10);
				pkfVO10.setDishClassVO(dcVO);
				pkfVO10.setClass_number(num10);	
				PVO.setProduct_id(pcgid);
				pkfVO10.setProductVO(PVO);
				ProductService productdao= new ProductService(); 
				productdao.AddClassNum(pkfVO10);
				
				
				ProductVO PVO2=new ProductVO();
				PackageFormatVO pkfVO20 = new PackageFormatVO();
				DishClassVO dcVO2=new DishClassVO();
				
				dcVO2.setClass_id(20);
				pkfVO20.setDishClassVO(dcVO2);
				pkfVO20.setClass_number(num20);	
				PVO2.setProduct_id(pcgid);
				pkfVO20.setProductVO(PVO2);
				ProductService productdao2= new ProductService(); 
				productdao2.AddClassNum(pkfVO20);
				
				ProductVO PVO3=new ProductVO();
				PackageFormatVO pkfVO30 = new PackageFormatVO();
				DishClassVO dcVO3=new DishClassVO();
				
				dcVO3.setClass_id(30);
				pkfVO30.setDishClassVO(dcVO3);
				pkfVO30.setClass_number(num30);	
				PVO3.setProduct_id(pcgid);
				pkfVO30.setProductVO(PVO3);
				ProductService productdao3= new ProductService(); 
				productdao3.AddClassNum(pkfVO30);
				
				ProductVO PVO4=new ProductVO();
				PackageFormatVO pkfVO40 = new PackageFormatVO();
				DishClassVO dcVO4=new DishClassVO();
				
				dcVO4.setClass_id(40);
				pkfVO40.setDishClassVO(dcVO4);
				pkfVO40.setClass_number(num40);	
				PVO4.setProduct_id(pcgid);
				pkfVO40.setProductVO(PVO4);
				ProductService productdao4= new ProductService(); 
				productdao4.AddClassNum(pkfVO40);
				
				ProductVO PVO5=new ProductVO();
				PackageFormatVO pkfVO50 = new PackageFormatVO();
				DishClassVO dcVO5=new DishClassVO();
				
				dcVO5.setClass_id(50);
				pkfVO50.setDishClassVO(dcVO5);
				pkfVO50.setClass_number(num50);	
				PVO5.setProduct_id(pcgid);
				pkfVO50.setProductVO(PVO5);
				ProductService productdao5= new ProductService(); 
				productdao5.AddClassNum(pkfVO50);
				
				ProductVO PVO6=new ProductVO();
				PackageFormatVO pkfVO60 = new PackageFormatVO();
				DishClassVO dcVO6=new DishClassVO();
				
				dcVO6.setClass_id(60);
				pkfVO60.setDishClassVO(dcVO6);
				pkfVO60.setClass_number(num60);	
				PVO6.setProduct_id(pcgid);
				pkfVO60.setProductVO(PVO6);
				ProductService productdao6= new ProductService(); 
				productdao6.AddClassNum(pkfVO60);

				req.setAttribute("PVO", PVO);
				
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
					.getRequestDispatcher("/Package/AddPackPro.jsp");
				failureView.forward(req, res);
				return;
				}
	//寫入完成後進行網頁的轉交
				String url = "/Package/AddPackPro.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);	
				
				}catch (Exception e) {
				errorMsgs.add("資料庫處理時發生錯誤");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Package/AddPackPro.jsp");
				failureView.forward(req, res);
			}
		}
 
    if ("UpPackage".equals(action)) {
		
		List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

		Integer proid=new Integer(req.getParameter("product_id"));
			
			//輸入搜尋條件符合類別3(也就是套餐菜色) 價格0(因為總價設定在套餐) pcg用戶輸入的套餐種類
			ProductVO proVO1 = new ProductVO();
	
			ProductKindVO Pdko=new ProductKindVO();
			Pdko.setKind_id(3);
			proVO1.setProductKindVO(Pdko);
			proVO1.setProduct_price(0);
			proVO1.setProduct_pcg(proid);

		try {
			ProductService productdao= new ProductService(); 
			List<ProductVO> proVO=productdao.selectPackPro(proVO1);
            req.setAttribute("proVO", proVO);
            req.setAttribute("pid", proid);

			String url = "/Package/UpdatePackPro.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); 
			successView.forward(req, res);	
			
			} catch (Exception e) {
			errorMsgs.add("資料庫處理時發生錯誤");
			RequestDispatcher failureView = req
					.getRequestDispatcher("/Package/UpdatePro.jsp");
			failureView.forward(req, res);
			}
		
		}

//從UpdatePro.jsp轉來 新增指定套餐菜色

    if ("UpdatePackage".equals(action)) {
			
		List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			Collection<Part> part=req.getParts();
	    	InputStream is=null;
			Integer proid=new Integer(req.getParameter("product_id"));
			String pname = req.getParameter("product_name");
			Integer pprice=new Integer(req.getParameter("product_price"));
			Integer iiMenu=new Integer(req.getParameter("inMenu"));
			ProductService pnowImg=new ProductService();
			ProductVO iimg=pnowImg.findByPrimaryKey(proid);
			byte [] nowimg=iimg.getProduct_img();
			try {
				ProductVO proVO1 = new ProductVO();
				ProductKindVO Pdko=new ProductKindVO();
				Pdko.setKind_id(2);
				proVO1.setProductKindVO(Pdko);
				proVO1.setProduct_price(pprice);
				proVO1.setProduct_id(proid);
				proVO1.setProduct_name(pname);
				proVO1.setInMenu(iiMenu);
				proVO1.setProduct_img(nowimg);
				
				
				ProductService productdao= new ProductService(); 
				productdao.UpdatePackPro(proVO1);
				DishClassVO DCVO=new DishClassVO();		

				
				if(req.getParameter("Class_number10")!=null){
				Integer num10=new Integer(req.getParameter("Class_number10"));
				PackageFormatVO PKVO10=new PackageFormatVO();
				PKVO10.setProductVO(proVO1);
				PKVO10.setClass_number(num10);
				DCVO.setClass_id(10);
				PKVO10.setDishClassVO(DCVO);
				productdao.UPclassNumber(PKVO10);
				}
				if(req.getParameter("Class_number20")!=null){
				Integer num20=new Integer(req.getParameter("Class_number20"));
				PackageFormatVO PKVO20=new PackageFormatVO();
				PKVO20.setProductVO(proVO1);
				PKVO20.setClass_number(num20);
				DCVO.setClass_id(20);
				PKVO20.setDishClassVO(DCVO);
				productdao.UPclassNumber(PKVO20);
				}
				if(req.getParameter("Class_number30")!=null){
				Integer num30=new Integer(req.getParameter("Class_number30"));
				PackageFormatVO PKVO30=new PackageFormatVO();
				PKVO30.setProductVO(proVO1);
				PKVO30.setClass_number(num30);
				DCVO.setClass_id(30);
				PKVO30.setDishClassVO(DCVO);
				productdao.UPclassNumber(PKVO30);
				}
				if(req.getParameter("Class_number40")!=null){
				Integer num40=new Integer(req.getParameter("Class_number40"));
				PackageFormatVO PKVO40=new PackageFormatVO();
				PKVO40.setProductVO(proVO1);
				PKVO40.setClass_number(num40);
				DCVO.setClass_id(40);
				PKVO40.setDishClassVO(DCVO);
				productdao.UPclassNumber(PKVO40);
				}
				if(req.getParameter("Class_number50")!=null){
				Integer num50=new Integer(req.getParameter("Class_number50"));
				PackageFormatVO PKVO50=new PackageFormatVO();
				PKVO50.setProductVO(proVO1);
				PKVO50.setClass_number(num50);
				DCVO.setClass_id(50);
				PKVO50.setDishClassVO(DCVO);
				productdao.UPclassNumber(PKVO50);
				}
				if(req.getParameter("Class_number60")!=null){
				Integer num60=new Integer(req.getParameter("Class_number60"));
				PackageFormatVO PKVO60=new PackageFormatVO();
				PKVO60.setProductVO(proVO1);
				PKVO60.setClass_number(num60);
				DCVO.setClass_id(60);
				PKVO60.setDishClassVO(DCVO);
				productdao.UPclassNumber(PKVO60);
			}		
				
				ProductVO proVO2 = new ProductVO();
				Pdko.setKind_id(3);
				proVO2.setProductKindVO(Pdko);
				proVO2.setProduct_price(0);
				proVO2.setProduct_pcg(proid);
				
				List<ProductVO> proVO=productdao.selectPackPro(proVO2);	
				req.setAttribute("proVO", proVO);
				req.setAttribute("pid", proid);
					
				for(Part mypart: part){
 
				if (mypart.getContentType()!=null){
		  		String picName =  mypart.getName();
		  		if(picName.equals("FileUp")){
		  			is=mypart.getInputStream();	   
   	   }  	   
   	}
  }	
				ByteArrayOutputStream baos=new ByteArrayOutputStream();
				int length=0;
				byte[] buffer=new byte[1024];
				byte[] img=null;
				while((length=is.read(buffer))!=-1){
					baos.write(buffer, 0, length);
					img=baos.toByteArray();
   }
   		//建立一個VO來存放資料
   ProductVO proVO5=new ProductVO();
   ProductService productdao2= new ProductService();
   proVO5.setProduct_id(proid);
  if(img.length>50){
   proVO5.setProduct_img(img); 
  }else{
	  proVO5.setProduct_img(nowimg);     
  }
  productdao2.updateProimg(proVO5);
    
				
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
					.getRequestDispatcher("/Package/UpdatePackPro.jsp");
				failureView.forward(req, res);
				return;
				}
	//寫入完成後進行網頁的轉交
				String url = "/Package/UpdatePackPro.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);	
				
				}catch (Exception e) {
				errorMsgs.add("資料庫處理時發生錯誤");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Package/UpdatePackPro.jsp");
				failureView.forward(req, res);
			}
		}

    
    if ("UpdatePackagePro".equals(action)) {
		
		List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			String pname = req.getParameter("product_name");
			Integer pinpcg=new Integer(req.getParameter("product_pcg"));
			Integer pclass=new Integer(req.getParameter("product_class"));

				ProductVO proVO1 = new ProductVO();
					proVO1.setProduct_name(pname);
					proVO1.setProduct_price(0);
				ProductKindVO Pdko=new ProductKindVO();
					Pdko.setKind_id(3);
					proVO1.setProductKindVO(Pdko);
				DishClassVO dcv=new DishClassVO();
					dcv.setClass_id(pclass);
					proVO1.setDishClassVO(dcv);
					proVO1.setInMenu(1);
				ProductVO ppp=new ProductVO();
				ppp.setProduct_id(pinpcg);
				proVO1.setPcgVO(ppp);
//					proVO1.setProduct_pcg(pinpcg);
				
				ProductVO proVO2 = new ProductVO();
				Pdko.setKind_id(3);
				proVO2.setProductKindVO(Pdko);
				proVO2.setProduct_price(0);
				proVO2.setProduct_pcg(pinpcg);

	try {
			ProductService productdao= new ProductService(); 
            productdao.addPackPro(proVO1);		        	
	            
	  List<ProductVO> proVO=productdao.selectPackPro(proVO2);
	 
	  
	  Integer cc=null;
	  for(ProductVO DD:proVO){
		  if(DD.getProduct_name().equals(pname)&&DD.getProduct_pcg().equals(pinpcg)){
			  cc=DD.getProduct_id();
		  }
			  
	  }
	      req.setAttribute("proVO", proVO);
	      req.setAttribute("pid", pinpcg);
	      
//	    res.setHeader("content-type", "text/html;charset=UTF-8");
//		res.setCharacterEncoding("UTF-8");
//		PrintWriter out=res.getWriter();
//	    JSONArray json=new JSONArray();
//	    
//	    json.put(pname);
//	    json.put(proVO.get(0).getDishClassVO().getClass_name());
//	    json.put(pinpcg);
//	    json.put(cc);
//		out.print(json);
	      
	      
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
					.getRequestDispatcher("/Package/UpdatePackPro.jsp");
				failureView.forward(req, res);
				return;
				}
	//寫入完成後進行網頁的轉交
				String url = "/Package/UpdatePackPro.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);	
				
				}catch (Exception e) {
				errorMsgs.add("資料庫處理時發生錯誤");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Package/UpdatePackPro.jsp");
				failureView.forward(req, res);
			}
		}
    
//UpdatePackPro.jsp的刪除鈕 刪除指定套餐菜色    
 
 if ("UpdatePackDelete".equals(action)) {
		
	 List<String> errorMsgs = new LinkedList<String>();
	 	req.setAttribute("errorMsgs", errorMsgs);

		try {
			Integer proid = new Integer(req.getParameter("product_id"));
			Integer pinpcg = new Integer(req.getParameter("product_pcg"));
			ProductVO proVO2 = new ProductVO();
			ProductKindVO Pdko=new ProductKindVO();
			Pdko.setKind_id(3);
			proVO2.setProductKindVO(Pdko);
				proVO2.setProduct_price(0);
				proVO2.setProduct_pcg(pinpcg);
			
			ProductService proSvc = new ProductService();
			proSvc.deletePro(proid);
			
			List<ProductVO> proVO=proSvc.selectPackPro(proVO2);
	           req.setAttribute("proVO", proVO);	
	           req.setAttribute("pid", pinpcg);
								
			String url = "/Package/UpdatePackPro.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
			
			}catch(Exception e) {
			errorMsgs.add("刪除資料失敗:"+e.getMessage());
			RequestDispatcher failureView = req
					.getRequestDispatcher("/Package/UpdatePackPro.jsp");
			failureView.forward(req, res);
			}
		}

	}
}
