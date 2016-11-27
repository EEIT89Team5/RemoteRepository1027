<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>目錄</title>
<style>
@font-face{
font-family:"ShowWind";
src:url("font/ShowWind.ttc");
}
td{
font-family:"ShowWind";
font-size:30px;
/* font-weight: bold; */
color:white
}
#block {
    	height: 50px; /*高度*/ 
     	width: 800px;  /*寬度*/ 
     	position: absolute; 
      	top:70%; 
      	left:50%;
      	
     	margin:0px auto;
 		margin-top: -25px; 
 		margin-left:-400px 
}
body{
background-image: url("img/outsidebackground.jpg");
background-size: cover;
moz-background-size: cover;
}
</style>
<link rel="Shortcut Icon" type="image/png" href="icon/pagelogo.png" />
</head>

<body>
<div id="block">

<a href="order/addOrder1.jsp" ><button type="button" class="button button-3d" style="font-family: ShowWind;font-size:25px;font-weight: bold;">點餐</button></a>
<a href="order/additional1.jsp" ><button type="button" class="button button-3d" style="font-family: ShowWind;font-size:25px;font-weight: bold;">加點餐</button></a>
<a href="order/listAllOrder.jsp" ><button type="button" class="button button-3d" style="font-family: ShowWind;font-size:25px;font-weight: bold;">查看訂單</button></a>
<a href="member/addMember.jsp" ><button type="button" class="button button-3d" style="font-family: ShowWind;font-size:25px;font-weight: bold;">新增會員</button></a>
<a href="member/listAllMember.jsp" ><button type="button" class="button button-3d" style="font-family: ShowWind;font-size:25px;font-weight: bold;">查詢及修改會員</button></a>

</div>
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/buttons.js"></script>
<link rel="stylesheet" href="css/buttons.css">
</body>
</html>