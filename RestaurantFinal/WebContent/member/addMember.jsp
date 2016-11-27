<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增會員</title>
<link rel="Shortcut Icon" type="image/png" href="../icon/pagelogo.png" />
<style>
body{
background-image:url("../img/memberbackground.jpg");
background-size:cover;
}
@font-face{
font-family:"ShowWind";
src: url("../font/ShowWind.ttc");
}
td{
font-family:"ShowWind";
font-size:45px;
height:80px; 
color:white;
font-weight: bold;
text-align:center;
}
 #Div1{ 
/*   	height: 300px; /*高度*/  */
    width: 810px;  /*寬度*/ 
    background-color: black;
    position: absolute; 
    top:50%; 
    left:50%;
      	
    margin:0px auto;
    background-color: rgba(0,0,0,0.6);
 	margin-top: -450px; 
	margin-left:-405px 
 } 

</style>
</head>
<body>
<div align="center">
<!-- <h3>新增會員，註冊享折扣!!</h3> -->
 <div id="Div1" align="left" style="border: 3px orange solid;">
 <br>
 <br>
<br>
 <br>
  <br>
<img src="../img/member.png">

<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>
<form action="member.do" method="post">
<table>
	<tr><td>姓名:</td><td style="font-size:28px;color:black"><input type="text" name="m_name"></td></tr>
	<tr>
		<td>性別:</td>
		<td>
			<input type="radio" name="m_gender" value="男" checked>男
			<input type="radio" name="m_gender" value="女">女
			<input type="radio" name="m_gender" value="其他">其他
		</td>
	</tr>
	<tr><td>Email:</td><td  style="font-size:28px;color:black"><input type="text" name="m_email"></td></tr>
	<tr><td style="color:YELLOW" colspan="2">(忘記密碼時可靠信箱來收取密碼)</td><td></td></tr>
	<tr><td>密碼:</td><td  style="font-size:28px;color:black"><input type="password" name="m_password" ></td><td></td></tr>
	<tr><td>再次輸入密碼:</td><td style="font-size:28px;color:black"><input type="password" ></td><td></td></tr>
	<tr><td>手機:</td><td style="font-size:28px;color:black"><input type="text" id="m_phone" name="m_phone" maxlength="10" required></td></tr>
	<tr><td style="color:YELLOW" colspan="2">(必填，做為會員登錄帳號)</td><td></td></tr>
	<br>
	<br>
	<br>
	<tr><td align="center" colspan="2">
	<input type="hidden" value="add_member" name="action"> 
	<input type="submit" value="加入會員" class="button button-3d-primary button-rounded" style="font-family:ShowWind;font-size:30px;font-weight: bold;">
	</td></tr>
</table>
</form>
</div>
</div>
<script src="../js/jquery-3.1.1.min.js"></script>
<script src="../js/buttons.js"></script>
<link rel="stylesheet" href="../css/buttons.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<script>
	$(function(){
		$('#m_phone').blur(function(){
			$.get('memberCheck.do',{'phone':$(this).val()},function(data){
				if(data=="手機號碼已存在"){
					alert("手機號碼已存在，請用其他手機註冊");
				}else{
					alert("手機號碼可用");
				}
			})
		})
	})
</script>
</body>
</html>