<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>註冊成功</title>
<link rel="Shortcut Icon" type="image/png" href="../icon/pagelogo.png" />
<style>
body{
background-image:url("../img/memberbackground2.png");
background-size:cover;
}

@font-face{
font-family:"ShowWind";
src: url("../font/ShowWind.ttc");
}
td{
font-family:"ShowWind";
font-size:35px;
height:80px; 
color:white;
font-weight: bold;
text-align:center;
}
#block {
    	height: 300px; /*高度*/ 
     	width: 700px;  /*寬度*/ 
     	position: absolute; 
      	top:30%; 
      	left:50%;
      	
     	margin:0px auto;
		margin-top: -150px;
		margin-left:-350px
}
</style>
</head>
<body>
<div id="block">
<!-- <div align="center"> -->
<!-- <h3>成功加入會員</h3> -->
<img src="../img/Congratulations.png"><br>
<br>
<h2 style="font-family:ShowWind;font-weight: bold;font-size:60px;color:red;text-align: center">貴賓您好</h2>
<h2 style="font-family:ShowWind;font-weight: bold;font-size:60px;color:red;text-align: center">恭喜您已經成為會員囉</h2>
<table align="center">
<tr><td>${memberVO.member_id }</td></tr>
<tr><td>${memberVO.member_name }</td></tr>
<tr><td>${memberVO.member_gender }</td></tr>
<tr><td>${memberVO.member_email }</td></tr>
<tr><td>${memberVO.member_password }</td></tr>
<tr><td>${memberVO.member_phone }</td></tr>
<tr><td>${memberVO.member_register }</td></tr>
</table>
</div>
</body>
</html>