<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改會員密碼</title>
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
td input{
color:white;
font-family:"ShowWind";
font-size:35px;
height: 40px;
margin: 10px
}
td{
color:white;
font-family:"ShowWind";
font-size:35px;
height: 80px;
}

</style>
</head>
<body>
<br>
<br>
<div align="center">
		<div align="center"><img src="../img/memberMODIFY.png"></div>
<!-- <div align="center"><div align="center"><img src="../img/passwordmidify.png"></div></div> -->
<br>
<br>
	
	<Form Action="memberlogin.do" method="POST" id="alertform">
		<div align="center">
		<table style="width: 900px;">   
		<TR><td width="180px"></td><td align="right"><input type="text" id="mem_email" name="mem_email" placeholder="請輸入信箱" style="color:black;font-size:25px"></td><TD id="ema" style="font-size:23px;font-weight: bold;width:330px"></TD></TR>
		<TR><td width="180px"></td><td align="right"><input type="password" id="mem_oldpassword" name="mem_oldpassword" placeholder="請輸入原密碼" style="color:black;font-size:25px"></td><TD id="ops" style="font-size:23px;font-weight: bold;width:330px"></TD></TR>
		<TR><td width="180px"></td><td align="right"><input type="password" id="mem_newpassword" name="mem_newpassword" placeholder="請輸入想修改的密碼" style="color:black;font-size:25px"></td><TD id="npas" style="font-size:23px;font-weight: bold;width:330px"></TD></TR>	
		<TR><td width="180px"></td><td align="right"><input type="password" id="mem_newpassword2" name="mem_newpassword2" placeholder="請再次輸入想修改的密碼" style="color:black;font-size:25px"></td><TD id="npas2" style="font-size:23px;font-weight: bold;width:330px"></TD></TR>
		<input type="hidden" name="forget" value="alertpas">
		<TR><td colspan="3" align="center"><input type="button" id="allbutton" value="確認" class="button button-3d-primary button-rounded" style="font-family:ShowWind;font-size:30px"></td><td></td></TR>
		</table>
		</div>
		<br>
		<br>
		<br>
		<font style="color:red;font-size:35px;font-family:ShowWind;font-weight: bold;">我們也將會把您更新的密碼寄到您的信箱</font>
	</Form>
		</div>
		<script src="../js/jquery-3.1.1.min.js"></script> 
		<script src="../js/buttons.js"></script>
		<link rel="stylesheet" href="../css/buttons.css">
		<script src="../js/bootstrap.js"> </script>
<script>
var count=null;

$("#mem_email").blur(function(){
	var ee=$("#mem_email").val()
	count=0;
	$.get("AccountCheck",{email:ee},function(data){
		
		if(data=="信箱不存在"||ee.trim()==""||ee==null){
			$("#ema").html("<img src='../icon/xx.png' /><td><font style='color:#e2574c'>無此信箱註冊資訊</font></td>")
			$("#mem_email").focus();
			count++;
		}else{
			$("#ema").html("<img src='../icon/oo.png' /><td><font style='color:#3db39e'>正確！密碼將會寄到此信箱中</font></td>")	
		}
		
	})
})
	$("#mem_oldpassword").blur(function(){
			var oldpas=$("#mem_oldpassword").val();
		if(oldpas.trim()==""){
			$("#ops").html("<img src='../icon/xx.png' /><td><font style='color:#e2574c'>請勿空白</font></td>")
			$("#mem_oldpassword").focus();
		count++;
		}else{
			$("#ops").html("<td></td>")
		}
	})

	$("#mem_newpassword").blur(function(){
		var newpassword=$("#mem_newpassword").val();
		var newpassword2=$("#mem_newpassword2").val();

		if(newpassword.trim()==""){
			$("#npas").html("<img src='../icon/xx.png' /><td><font style='color:#e2574c'>請勿空白</font></td>")
		count++;
		}else{
			$("#npas").html("<td></td>")
		}
		 if(newpassword!=newpassword2){
			 $("#npas2").html("<img src='../icon/xx.png' /><td><font style='color:#e2574c'>密碼輸入不一致</font></td>")
				count++;
		}else{
			 $("#npas2").html("<img src='../icon/oo.png' /><td><font style='color:#3db39e'>密碼輸入一致</font></td>")
		}
	})
		
		
	$("#mem_newpassword2").blur(function(){
		count=0;
		var newpassword3=$("#mem_newpassword").val();
		var newpassword4=$("#mem_newpassword2").val();
		if(newpassword4.trim()==""){
			$("#npas2").html("<img src='../icon/xx.png' /><td><font style='color:#e2574c'>請勿空白</font></td>")
		count++;
		}else{
			$("#npas2").html("<td></td>")
		}

		 if(newpassword3!=newpassword4){
			 $("#npas2").html("<img src='../icon/xx.png' /><td><font style='color:#e2574c'>密碼輸入不一致</font></td>")
				count++;
		}else{
			 $("#npas2").html("<img src='../icon/oo.png' /><td><font style='color:#3db39e'>密碼輸入一致</font></td>")
		}
	})
	
$("#allbutton").click(function(){
	var eemail=$("#mem_email").val();
	var oldpass=$("#mem_oldpassword").val();
	count=0;
	var newpass3=$("#mem_newpassword").val();
	var newpass4=$("#mem_newpassword2").val();
	
	if(eemail=null||eemail.trim()==""){
		$("#ema").html("<img src='../icon/xx.png' /><td><font style='color:#e2574c'>請勿空白</font></td>");
		count++
	}
	if(oldpass=null||oldpass.trim()==""){
		$("#ops").html("<img src='../icon/xx.png' /><td><font style='color:#e2574c'>請勿空白</font></td>");
		count++
	}
	if(newpass3=null||newpass3.trim()==""){
		$("#npas").html("<img src='../icon/xx.png' /><td><font style='color:#e2574c'>請勿空白</font></td>");
		count++
	}
	if(newpass4=null||newpass4.trim()==""){
		$("#npas2").html("<img src='../icon/xx.png' /><td><font style='color:#e2574c'>請勿空白</font></td>");
		count++
	}

	if(newpass3!=newpass4){		
		$("#npas2").html("<img src='../icon/xx.png' /><td><font style='color:#e2574c'>密碼輸入不一致</font></td>")
		$("#npas").html("<img src='../icon/xx.png' /><td><font style='color:#e2574c'>密碼輸入不一致</font></td>")
	count++;
	}
	console.log(count)
	if(count==0){
		$("#alertform").submit();
	}
	
	
})
</script>
</body>

</html>
