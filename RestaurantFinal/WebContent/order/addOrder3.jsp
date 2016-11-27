<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>點餐  - addOrder2.jsp</title>
<style>
body{
/* background-image: url("../img/0003.jpg"); */
background-size: cover;
}
@font-face{
font-family:"ShowWind";
src: url("../font/ShowWind.ttc");  
}
#Information td{
font-family:ShowWind;
color:white;
font-size:40px;
width: 250px; 
height: 50px;
text-align: center;
font-weight: bold
}
#Details td{
font-family:ShowWind;
color:white;
font-size:40px; 
height: 50px;
text-align: center;
font-weight: bold
}
td h3{
font-family:ShowWind;
font-size:60px;
font-weight: bold
}

</style>
<link rel="Shortcut Icon" type="image/png" href="../icon/pagelogo.png" />
</head>
<body style="background-color: black";>
<div align="center">
<!-- <h2>訂單已成功送出</h2><br/> -->
<img src="../img/thanksorder.png">
<table id="Information">
	<tbody>
		<tr><td colspan="3" style="text-align: center;color:pink;"><h3>訂單資訊</h3></h3></td></tr>
		<tr><td>編號:</td><td>${orderVO.order_id}</td><td></td></tr>		
		<tr><td>桌號:</td><td style="color:red">${orderVO.order_table}</td><td></td></tr>
		<tr><td>日期:</td><td>${orderVO.order_date}</td><td></td></tr>
		<tr><td>總價:</td><td>${orderVO.order_price}</td><td></td></tr>
		<tr><td>人數:</td><td>${orderVO.order_numP}人</td><td></td></tr>
		<tr><td>會員:</td><td><c:if test="${! empty MemberLoginOK }">${MemberLoginOK.member_name}</c:if></td></tr>
		<tr><td>員工:</td><td>${orderVO.empVO.emp_name}</td><td></td></tr>
<!-- 		<tr><td>折扣(結帳再說)</td></tr> -->
<!-- 		<tr><td>結帳時間(結帳再說)</td></tr> -->
			</tbody>
</table>
<br>
<br>
<table id="Details" style="width: 900px">				
		<tr>
			<td colspan="3" style="color:pink;"><h3>訂單明細</h3></td>
		</tr>
		<tr>
			<td>商品編號</td>
			<td>商品名稱</td>
			<td>數量</td>
		</tr>
			<c:forEach var="orderXVO" items="${orderList}">
				<tr>
					<td>${orderXVO.productVO.product_id}</td>
					<td>${orderXVO.productVO.product_name}</td>
					<td>${orderXVO.orderX_num}</td>
				</tr>
			</c:forEach>
</table>
<br/>
</div>

<div align="center"><a href="../index22.jsp" class="button button-pill button-highlight" style="font-family:ShowWind;font-size:25px;font-weight:bold"> 回首頁 </a></div>
<link rel="stylesheet" href="../css/buttons.css">
<link rel="stylesheet" href="../css/bootstrap.css">
</body>
</html>