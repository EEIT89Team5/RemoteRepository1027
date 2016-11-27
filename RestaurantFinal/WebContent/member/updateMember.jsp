<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改會員資料</title>
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
<h1 style="color:white;font-family:ShowWind;font-size:45px;font-weight:bold">修改會員<font style="color:yellow;">${memberVO.member_id}</font> <font style="color:red;">${memberVO.member_name}</font>資料</h1>
<br><br>
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>
<form method="post" action="member.do">
<table>
<tr><td>會員編號:</td><td style="color:yellow;">${memberVO.member_id} </td></tr>
<tr><td>會員姓名:</td><td>${memberVO.member_name}</td></tr>
<tr><td>性別:</td><td><input type="radio" name="m_gender" value="男" <c:if test="${memberVO.member_gender=='男'}">checked</c:if> />男
			<input type="radio" name="m_gender" value="女"  <c:if test="${memberVO.member_gender=='女'}">checked</c:if>/>女
			<input type="radio" name="m_gender" value="不填"/>不填</td></tr>
<tr><td>信箱:</td><td style="color:black"><input type="text" name="m_email" value="${memberVO.member_email}"></td></tr>
<tr><td>密碼:</td><td style="color:black"><input type="password" name="m_password" value="${memberVO.member_password}"></td></tr>
<tr><td>再次輸入密碼:</td><td style="color:black"><input type="password" ></td></tr>
<tr><td>手機:</td><td style="color:black"><input type="text" name="m_phone" value="${memberVO.member_phone}"></td></tr>
</table>
<input type="hidden" name="action" value="update_member2"/>
<br>
<br>
<br>
<input type="submit" value="修改" class="button button-3d-primary button-rounded" style="font-family:ShowWind;font-size:30px;font-weight: bold;"/>
</form>
</div>
<link rel="stylesheet" href="../css/buttons.css">
<link rel="stylesheet" href="../css/bootstrap.css">
</body>
</html>