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

</style>
</head>
<body>
<div align="center">
<div align="center"><img src="../img/memberlogin.png"></div>
<!-- <div align="center"><font style="color:#31aada;font-size:45px;font-family:ShowWind;font-weight: bold;">會員登入系統</font></div> -->
<br>
<br>
<br>
<br>
<br>
<Form Action="memberlogin.do" method="POST">
    <Table>
         <TR><TH colspan='2'>
<!--             <H1>會員登入</H1>  -->
         </TH><TH></TH></TR>
         <TR>
             <TD align="CENTER">帳號：</TD><TD align="center"><input	type="text" name="userId" id="userId" style="width: 300px;color:black"></TD>
        </TR>
        <TR>
             <TD width='150' colspan='2'><small><Font color='red' size="6" >${ErrorMsgKey.AccountEmptyError}</Font></small></TD>
        </TR>
         <TR>
             <TD align="CENTER">密碼：</TD><TD align="center"><input	type="password" name="pswd"  size="20" style="width: 300px;color:black"></TD>
         </TR>
         <TR>    
             <TD width='150' colspan='2'><small><Font color='red'  size="6">${ErrorMsgKey.PasswordEmptyError}</Font></small></TD>
         </TR>            
         <TR>
             <TD align="CENTER" colspan='2'><Font color='red' size="6">${ErrorMsgKey.LoginError}&nbsp;</Font></TD>
             
         </TR>
            
        <TR>
       		 <input type="hidden" name="action" value="memberlogin">
           <td></td> <TD align="center">  <input type="submit" value="確認" class="button button-3d-primary button-rounded" style="font-family:ShowWind;font-size:30px;"> </TD>
         </TR>
         </Form>
         <TR>
         <td></td>
         <td>
            <input id="forgetlogin" type="button" value="忘記密碼" class="button button-3d-primary button-rounded" style="font-family:ShowWind;font-size:30px;">  
        	<a href="alertmember.jsp" ><input type="button" value="修改密碼" class="button button-3d-primary button-rounded" style="font-family:ShowWind;font-size:30px;"></a>	
        	</td>
         </TR>
         </Table>

</div>
<script src="../js/jquery-3.1.1.min.js"></script> 
<script src="../js/buttons.js"></script>
<link rel="stylesheet" href="../css/buttons.css">
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<link rel="stylesheet" type="text/css" href="../js/sweetalert.css">
<script language="JavaScript" src="../js/sweetalert.min.js"></script>
<script>
$("#forgetlogin").click(function(){
// 	var dd=$("#userId").val();
// 	if(dd!=""){	
	
// 	$.post("memberlogin.do",{"action":"forgetlogin","userId":dd},function(){
// 		swal("密碼已經寄至您的信件囉~你這沒記性的小BITCH")
		
// 	});
// 	}

	swal({
		  title: "忘記密碼囉 !",
		  text: "請輸入您的電話:",
		  type: "input",
		  showCancelButton: true,
		  closeOnConfirm: false,
		  animation: "slide-from-top",
		  inputPlaceholder: "密碼將會寄至您的註冊信箱中"
		},
		function(inputValue){
			
		  if (inputValue === false) return false;
		  
		  if (inputValue === "") {
		    swal.showInputError("You need to write something!");
		    return false
		  }
		  
		  $.post("memberlogin.do",{"action":"forgetlogin","userId":inputValue},function(){
		 		swal("密碼已經寄至您的信件囉~")
				
		 	});
		});
	
	
})

</script>
</body>

</html>
