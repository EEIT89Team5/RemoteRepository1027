<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="memberSvc" class="com.member.model.MemberService" scope="page"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查詢所有會員</title>
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
font-size:28px;
font-weight:bold;
text-align:center
}
tr th{
font-family:"ShowWind";
color:yellow;
font-size:35px;
font-weight:bold;
text-align: center;
}
</style>
</head>
<body>
<div align="center">
<img src="../img/member2.png"><br><br><br><br>
<table class=tablesorter" id="orderlist" style="width: 1400px">
<thead>
<tr>
	
		<th>編號</th>
		<th>姓名</th>
		<th>性別</th>
		<th>email</th>
<!-- 		<th>密碼</th> -->
		<th>手機</th>
		<th>註冊日</th>
		<th>修改資料</th>
		
</tr>
</thead>
	
<tbody>
<c:forEach var="memberVO" items="${memberSvc.getAllMember()}" >
<tr>
			<td>${memberVO.member_id }</td>
			<td>${memberVO.member_name }</td>
			<td>${memberVO.member_gender }</td>
			<td>${memberVO.member_email }</td>
<%-- 			<td>${memberVO.member_password }</td> --%>

			<td>${memberVO.member_phone }</td>	
			
			<td>${memberVO.member_register }</td>
			<td>
				<form action="member.do" method="post">
					<input type="hidden" name="member_id" value="${memberVO.member_id }"/> 
					<input type="hidden" name="action" value="update_member1"/>
					<input type="submit" value="修改" class="button button-pill" style="font-family:ShowWind;font-size:28px;font-weight: bold">
				</form>
			</td>
		</tr>
</c:forEach>
</tbody>

</table>
<br>
<br>
<div align="center"><a href="../index22.jsp" class="button button-pill button-highlight" style="font-family:ShowWind;font-size:25px;font-weight:bold"> 回首頁 </a></div>
<link rel="stylesheet" href="../css/buttons.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<script src="../js/jquery-3.1.1.min.js"></script>
<script src="../js/jquery.tablesorter.js"></script>
</div>
<script>
$(function(){

	$("#orderlist").tablesorter({widgets: ['zebra']});

})
</script>
</body>
</html>