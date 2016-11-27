package com.product.controller;

import java.io.*;
import java.sql.*;
import javax.naming.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.sql.*;

import com.product.model.ProductService;
import com.product.model.ProductVO;

//本類別會依據傳入的書籍編號(BookID)讀取eBook表格內CoverImage欄位內的圖片，
//然後傳回給提出請求的瀏覽器
@WebServlet("/getImage")
public class GetImageFromPro extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		OutputStream os = null;
		InputStream in = null;

		try {

			String id = request.getParameter("id");

			Integer product_id = new Integer(id);
			ProductService productSvc = new ProductService();
			ProductVO productVO = productSvc.findByPrimaryKey(product_id);

			if (productVO != null) {
				byte[] image = productVO.getProduct_img();

				
				if (image == null) {
					in = getServletContext().getResourceAsStream("/img/no_image_available.gif");
				}else{
					in = new ByteArrayInputStream(image);

				}

				os = response.getOutputStream();

				response.setContentType("image/jpeg,image/gif,image/png");

				byte[] b = new byte[1024];
				int len;
				// 將圖讀出來
				while ((len = in.read(b)) > 0) {
					os.write(b, 0, len);
				}

			}

		} finally {
			if (os != null) {
				os.close();
			}
		}
	}
}