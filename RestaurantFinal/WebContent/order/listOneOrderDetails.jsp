<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="orderSvc" scope="page" class="com.order.model.OrderService" />


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>單筆訂單明細資料 - listOneOrderDetails.jsp</title>
<link rel="Shortcut Icon" type="image/png" href="../icon/pagelogo.png" />
<style>
body{
/* background-image: url("../img/0003.jpg"); */
background-size: cover;
background-color: black
}
@font-face{
font-family:"ShowWind";
src: url("../font/ShowWind.ttc");  
}
th{
font-family:"ShowWind";
color:yellow;
font-size:30px;
text-align:center;
width:150px
}
td{
font-family:"ShowWind";
color:white;
font-size:25px;
text-align:center;
font-weight:bold;
}
</style>
</head>
<body>
<div align="center">
<%-- <h2>訂單${orderno}明細</h2><br/> --%>
<!-- <img src="../img/ORDERLOGO.png"><br><br> -->
<img src="../img/ORDERDETAIL.png"><br><br><br><br><br>
<table class=tablesorter id="orderlist">
	<thead>
		<tr>
			<th>商品編號</th>
			<th>名稱</th>
			<th>單價</th>
			<th>點餐時間</th>
			<th>數量</th>
			<th>狀態</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="orderXVO" items="${orderXVOs}">
			<tr>
				<td>${orderXVO.productVO.product_id}</td>
				<td>${orderXVO.productVO.product_name}</td>
				<td>${orderXVO.productVO.product_price}</td>
				<td name='time'>${orderXVO.orderX_time}</td>
				<td>${orderXVO.orderX_num }</td>
				<td>${orderXVO.orderX_status}</td>
			</tr>	
		</c:forEach>
	
	</tbody>

</table>
<br>
<br>
<br>
<br>
<br>
<a href="../index22.jsp" class="button button-pill button-highlight" style="font-family:ShowWind;font-size:25px;font-weight:bold"> 回首頁 </a>
</div>
<link rel="stylesheet" href="../css/buttons.css">
<script src="../js/jquery-3.1.1.min.js"></script>
<script src="../js/jquery.tablesorter.js"></script>
<script>
$(document).ready(function() {

$("#orderlist").tablesorter({widgets: ['zebra']});

var time=$("td[name='time']")

	$.each(time,function(){
		$(this).html($(this).text().substring(0,16));
	})
	

});

</script>
</body>
</html>