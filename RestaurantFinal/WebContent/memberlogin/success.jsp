<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登錄</title>
<link rel="Shortcut Icon" type="image/png" href="../icon/pagelogo.png" />
<style>
body{
	background-image: url("../img/Loginbackground.jpg");
	background-size: cover;
}
@font-face{
font-family:"ShowWind";
src:url("../font/ShowWind.ttc");
}
td{
color:white;
font-family:"ShowWind";
font-size:35px;
height: 50px;
}
#block {
    	height: 300px; /*高度*/ 
     	width: 800px;  /*寬度*/ 
     	position: absolute; 
      	top:50%; 
      	left:50%;
      	
     	margin:0px auto;
		margin-top: -150px;
		margin-left:-350px
}

</style>
</head>
<body>
	<div align="center"><a href="memberlogin.jsp" style="text-decoration:none;"><font style="color:white;font-family:ShowWind;font-size:50px;font-weight: bold;">回首頁</font></a></div>
<div align="center">
	<div id="block">
<img src="../img/MEMBERUPDATESUCCESS.png"><br>
	<div align="center"><font style="color:#ff9800;font-family:ShowWind;font-size:60px;font-weight: bold;">新密碼已經寄到您的信箱囉！</font></div>
	</div>
</div>
</body>

</html>
