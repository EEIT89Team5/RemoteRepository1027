<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="Shortcut Icon" type="image/png" href="../icon/pagelogo.png" />
<style>
body{
background-image:url("../img/memberbackground2.png");
background-size:cover;
}
@font-face{
font-family:"ShowWind";
src:url("../font/ShowWind.ttc");
}
td{
font-family:"ShowWind";
color:white;
font-size:33px;
font-weight:bold;
text-align:center;
height: 60px
}
</style>
</head>
<body>
<div align="center">
<img src="../img/member2.png"><br><br><br><br>
<h3 style="color:white;font-family:ShowWind;font-size:45px;font-weight:bold">修改<font style="color:red;">${memberVO.member_name}</font>資料成功</h3>
<br>
<br>
<table>

<tr><td>會員編號:</td><td style="color:yellow">${memberVO.member_id }</td></tr>
<tr><td>會員姓名:</td><td>${memberVO.member_name }</td></tr>
<tr><td>性別:</td><td>${memberVO.member_gender }</td></tr>
<tr><td>信箱:</td><td>${memberVO.member_email }</td></tr>
<%-- <tr><td>密碼：</td><td>${memberVO.member_password }</td></tr> --%>
<tr><td>手機:</td><td>${memberVO.member_phone }</td></tr>

</table>
</div>
</body>
</html>