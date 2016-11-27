<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.order.model.*"%>
<%@ page import="com.orderx.model.*"%>
<%@ page import="java.util.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>購物車 - orderList.jsp</title>
<style>
@font-face{
font-family:"ShowWind";
src: url("../font/ShowWind.ttc");  
}
td{
font-family:"ShowWind";
font-size:28px;
color:white
}
th{
font-family:"ShowWind";
color:yellow;
font-size:30px;
text-align:center;
width:250px
}
.total{
font-size:40px;
color:pink
}
</style>
<link rel="Shortcut Icon" type="image/png" href="../icon/pagelogo.png" />
</head>
<body style="background-color: black">
 <div align="center">
 <img src="../img/MOREORDERDETAIL.png"><br><br><br>
<!-- 	<h3 style="font-family:ShowWind;color:white;font-weight: bold;font-size:50px">加點訂單明細</h3> -->
	<table width="1000px">
		<tr>
			<th>商品編號</th>
			<th>商品名稱</th>
			<th>數量</th>
			<th>價格</th>
		</tr>

		<c:forEach var="orderXVO" items="${orderList}" varStatus="index">
			<tr>
				<td>${orderXVO.productVO.product_id}</td>
				<td>${orderXVO.productVO.product_name}</td>
				<td>${orderXVO.orderX_num}</td>
				<td>${orderXVO.productVO.product_price}</td>
				<td>
					<form method="post" ACTION="order.do" style="text-align: center;">
						<input type="hidden" name="alt" value="${index.count}">
						<input type="hidden" name="action" value="add_alter_S_orderX">
						<input type="text" name="altNumber" style="color:black;width: 60px;height: 40px;font-weight: bold;" size="6">
						<input type="submit" value="修改"  class="btn btn-success" style="font-size:23px">			
					</form>
				</td>
				<td>
					<form method="post" ACTION="order.do" >
						<input type="hidden" name="del" value="${index.count}">
						<input type="hidden" name="action" value="add_delete_S_orderX">
						<input type="submit" value="刪除" class="btn btn-danger" style="font-size:23px">
					</form>
				</td>
			</tr>

			
		</c:forEach>
	
<tr></tr>
		<tr><td class="total">菜色數量:</td><td>${orderQ}</td></tr>
		<tr><td class="total">主菜數量:</td><td>${mainQ}</td></tr>
		<tr><td class="total">套餐數量:</td><td>${pcgQ}</td></tr>
		<tr><td class="total">總金額:</td><td>${orderP}</td></tr>
	</table><br>
	<form METHOD="post" ACTION="order.do">
		<input type="hidden" name="action" value="add_final_order">
		<input type="submit" value="確認點餐" class="btn btn-primary" style="font-family:ShowWind;font-size:23px;margin: 10px">
	</form>
		<form METHOD="post" ACTION="order.do">
		<input type="hidden" name="action" value="add_keep_order">
		<input type="submit" value="繼續點餐" class="btn btn-danger" style="font-family:ShowWind;font-size:23px">
	</form>
	
	</div>
	<link rel="stylesheet" href="../css/bootstrap.css">
</body>
</html>