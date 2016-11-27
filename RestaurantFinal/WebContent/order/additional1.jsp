<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.order.model.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.*"%>

<% OrderService orderSvc=new OrderService(); 
	Date order_date=new Date(System.currentTimeMillis());
	List<OrderVO> list=orderSvc.getUnpaidOrdersByDate(order_date);
	pageContext.setAttribute("list", list);
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>加點</title>
<style>
@font-face{
font-family:"ShowWind";
src: url("../font/ShowWind.ttc");  
}
#block {
    	height: 300px; /*高度*/ 
     	width: 800px;  /*寬度*/ 
    	 background-color: black;
     	position: absolute; 
      	top:50%; 
      	left:50%;
      	
     	margin:0px auto;
     	background-color: rgba(0,0,0,0);
		margin-top: -150px;
		margin-left:-400px
}
.font1{
font-family:ShowWind;
color:white;
font-size:30px
}
td{
font-family:ShowWind;
color:white;
font-size:30px
}

</style>
<link rel="Shortcut Icon" type="image/png" href="../icon/pagelogo.png" />
</head>
<body background="../img/light2.png" style="background-size: cover;">
<div align="center" id="block">


<h3 class="font1">選擇加訂桌位(當天尚未結帳之桌位)</h3>
<br>
<table width="750px">
<tr>
<td>訂單編號</td>
<td>當日未結帳桌位</td>
<td>總價</td>
<td></td>
</tr>
<c:forEach var="orderVO" items="${list}">
	<tr>
	<td>${orderVO.order_id }</td>
	<td>${orderVO.order_table }</td>
	<td>${orderVO.order_price }</td>
	<td>
		<form method="post" action="order.do" >
			<input type="submit" value="加訂" class="btn btn-default" style="font-family:ShowWind;font-size:18px;font-weight:bold;">
			<input type="hidden" name="action" value="addition1"/>
			<input type="hidden" name="order_id" value="${orderVO.order_id }"/>
		</form>
	</td>
	</tr>
</c:forEach>


</table>
<br>
<br>
<br>
<br>
<div><a href="../index22.jsp" class="button button-pill button-highlight" style="font-family:ShowWind;font-size:25px;font-weight:bold"> 回首頁 </a></div>
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/buttons.css">
</div>
</body>
</html>