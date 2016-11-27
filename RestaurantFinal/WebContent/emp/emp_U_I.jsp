<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.emp.model.*"%>

<%
	EmpVO empVO = (EmpVO) request.getAttribute("empVO");

%>
<!DOCTYPE HTML>
<html>
<head>
<title>員工資料修改</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<link href="../css/style.css" rel="stylesheet" type="text/css" media="all"/>
<script src="../js/jquery-3.1.1.min.js"></script> 
<link href="../css/font-awesome.css" rel="stylesheet"> 
<script src="../js/jquery.magnific-popup.js" type="text/javascript"></script>
<script src="../js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap-datepicker3.min.css">
 <script>
$(document).ready(function() {
	$('.popup-with-zoom-anim').magnificPopup({
		type: 'inline',
		fixedContentPos: false,
		fixedBgPos: true,
		overflowY: 'auto',
		closeBtnInside: true,
		preloader: false,
		midClick: true,
		removalDelay: 300,
		mainClass: 'my-mfp-zoom-in'
	});
	
	$('#emp_hiredate').datepicker({
		autoclose:true,
		format: 'yyyy-mm-dd',
		todayBtn: "linked"		
	});

	$('#emp_birthday').datepicker({	
		autoclose:true,
		format: 'yyyy-mm-dd',
	    startView:'decade'		
	});
																
});
</script>
<!--pop up end here-->
<style>
body,.inner-block{
	background-color:black;
/* 	background: #000 url(../img/0003.jpg) center center fixed no-repeat; */
/* 	background-size: cover; */
/* 	moz-background-size: cover; */
}
.clerfix{
	border-style:solid;
}
.titlebar{
	background-color:black;
}
#menu span{
	position:absolute;
}
@font-face{
   font-family: "BoldFace";   
   src: url("../font/ShowWind.ttc");  
}
td{
   	font-family: "BoldFace";   
   	font-size:25px; 
/*   	color:white;   */
}
#bbody{
background: black;
}
#Div1{
	width: 650px;
	padding:20px;
	border-radius: 10px
	
}
tr{
 	height: 50px 
}
</style>
<link rel="Shortcut Icon" type="image/png" href="../icon/pagelogo.png" />
</head>
<body id="bbody">	
<div class="page-container sidebar-collapsed">	
   <div class="left-content">
	   <div class="mother-grid-inner">
            <!--header start here-->
				<div class="header-main titlebar fixed">
					<div class="header-left">
							<div class="logo-name">
									 <a href="../index.jsp" >
									<img src="../img/title3.png" alt="Logo"/> 
								  </a> 								
							</div>
							<div class="clearfix"> </div>
						 </div>
						 <div class="header-right">
							
							<!--notification menu end -->
							<div class="profile_details">		
								<ul>
									<li class="dropdown profile_details_drop">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
											<div class="profile_img">	
<!-- 												<span class="prfil-img"><img src="images/p1.png" alt=""> </span>  -->
												<div class="user-name">
													<p><c:if test="${! empty LoginOK }">${LoginOK.emp_title}</c:if></p>
													<p><c:if test="${! empty LoginOK }">${LoginOK.emp_name}</c:if></p>
												</div>
												<i class="fa fa-angle-down lnr"></i>
												<i class="fa fa-angle-up lnr"></i>
												<div class="clearfix"></div>	
											</div>	
										</a>
										<ul class="dropdown-menu drp-mnu">
											<li> <a href="../login/login.jsp"><i class="fa fa-sign-in"></i> Login</a> </li>
											<li> <a href="../login/logout.jsp"><i class="fa fa-sign-out"></i> Logout</a> </li>
										</ul>
									</li>
								</ul>
							</div>
							<div class="clearfix"> </div>				
						</div>
				     <div class="clearfix"> </div>	
				</div>
<!--heder end here-->
<!--inner block start here-->
<div class="inner-block">
    <div class="price-block-main">
<div align="center">

<!-- <img src="../img/emplogo.png"><br> -->
<a href="all_emp.jsp"><img src="../img/UpdateEMP.png"></a>
<br>
<br>

<%-- 錯誤表列 --%>
<br>
<c:if test="${not empty errorMsgs}">
	<font color='red' style="font-family: BoldFace;font-size:20px">請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<FORM METHOD="post" ACTION="emp.do" name="form1">
<c:set var="empp" value="${empVO}"></c:set>
<div id="Div1" align="left" style="background:rgba(0,0,0,0.5);">
<table border="0" >
	<tr>
		<td style="color:white;">員工編號:</td>
		<td style="color:red"><%=empVO.getEmp_id()%></td>
	</tr>
	<tr>
		<td style="color:white;">員工姓名:</td>
		<td><input class="form-control" type="TEXT" name="emp_name" size="45" style="font-size:25px;width: 200px" value="<%=empVO.getEmp_name()%>" /></td>
	</tr>
	<tr>
		<td style="color:white;">性別:</td>
		<td><select name="emp_gender" class="form-control" style="font-size:25px;width: 200px;height: 45px">
			<option  value="男性" <c:if test="${empp.emp_gender=='男性'}">selected</c:if>>男</option>
			<option  value="女性" <c:if test="${empp.emp_gender=='女性'}">selected</c:if>>女</option>
		</select></td>
<%-- 		<td><input class="form-control" type="TEXT" name="emp_gender" size="45"	style="font-size:25px;width: 300px" value="<%=empVO.getEmp_gender()%>" /></td> --%>
	</tr>
	<tr>
		<td style="color:white;">職位:</td>
		<td><select name="emp_title" class="form-control" style="font-size:25px;width: 200px;height: 45px" >
			<option  value="員工" <c:if test="${empp.emp_title=='員工'}">selected</c:if>>員工</option>
			<option  value="領班" <c:if test="${empp.emp_title=='領班'}">selected</c:if>>領班</option>
			<option  value="經理" <c:if test="${empp.emp_title=='經理'}">selected</c:if>>經理</option>
		</select></td>
<%-- 		<td><input class="form-control" type="TEXT" name="emp_title" size="45"	style="font-size:25px;width: 300px" value="<%=empVO.getEmp_title()%>" /></td> --%>
	</tr>
	<tr>
		<td style="color:white;">正職/工讀:</td>
		<td><select name="emp_fulltime" class="form-control" style="font-size:25px;width: 200px;height: 45px">
			<option  value="正職" <c:if test="${empp.emp_fulltime=='正職'}">selected</c:if>>正職</option>
			<option  value="工讀" <c:if test="${empp.emp_fulltime=='工讀'}">selected</c:if>>工讀</option>
		</select></td>
<%-- 		<td><input class="form-control" type="TEXT" name="emp_fulltime" size="45" style="font-size:25px" value="<%=empVO.getEmp_fulltime()%>" /></td> --%>
	</tr>
	<tr>
		<td style="color:white;">薪水:</td>
		<td><input class="form-control" type="TEXT" name="emp_salary" size="45"	style="font-size:25px;width: 200px" value="<%=empVO.getEmp_salary()%>" /></td>
	</tr>
	<tr>
		<td style="color:white;">雇用日期:</td>
		<td>
		    <input class="form-control" size="9" readonly type="text" name="emp_hiredate" id="emp_hiredate" style="font-size:25px;width: 200px" value="<%=empVO.getEmp_hiredate()%>">
<!-- 			<a class="so-BtnLink" -->
<!-- 			href="javascript:calClick();return false;" -->
<!-- 			onmouseover="calSwapImg('BTN_date', 'img_Date_OVER',true);" -->
<!-- 			onmouseout="calSwapImg('BTN_date', 'img_Date_UP',true);" -->
<!-- 			onclick="calSwapImg('BTN_date', 'img_Date_DOWN');showCalendar('form1','hiredate','BTN_date');return false;"> -->
<!-- 		    <img align="middle" border="0" name="BTN_date"	src="images/btn_date_up.gif" width="22" height="17" alt="開始日期"></a> -->
		</td>
	</tr>
	<tr>
		<td style="color:white;">狀態:</td>

		<td>
		<select name="emp_status" class="form-control" style="font-size:25px;width: 200px;height: 45px">	
			<option value="在職中" <c:if test="${empp.emp_status=='在職中'}">selected</c:if>>在職中</option>
			<option value="已離職" <c:if test="${empp.emp_status=='已離職'}">selected</c:if>>已離職</option>
		</select>
		</td>
<%-- 		<td><input class="form-control" type="TEXT" name="emp_status" size="45"	style="font-size:25px" value="<%=empVO.getEmp_status()%>" /></td> --%>
	</tr>

	<tr>
		<td style="color:white;">生日:</td>
		<td>
		    <input class="form-control" size="9" readonly type="text" name="emp_birthday" id="emp_birthday" style="font-size:25px;width: 200px;" value="<%=empVO.getEmp_birthday()%>">
<!-- 			<a class="so-BtnLink" -->
<!-- 			href="javascript:calClick();return false;" -->
<!-- 			onmouseover="calSwapImg('BTN_date', 'img_Date_OVER',true);" -->
<!-- 			onmouseout="calSwapImg('BTN_date', 'img_Date_UP',true);" -->
<!-- 			onclick="calSwapImg('BTN_date', 'img_Date_DOWN');showCalendar('form1','hiredate','BTN_date');return false;"> -->
<!-- 		    <img align="middle" border="0" name="BTN_date"	src="images/btn_date_up.gif" width="22" height="17" alt="開始日期"></a> -->
		</td>
	</tr>
	<tr>
		<td style="color:white;">身份證號碼:</td>
		<td><input class="form-control" type="TEXT" name="emp_idnumber" size="45"	style="font-size:25px;width: 200px" value="<%=empVO.getEmp_idnumber()%>" /></td>
	</tr>
	<tr>
		<td style="color:white;">電話:</td>
		<td><input class="form-control" type="TEXT" name="emp_phone" size="45"	style="font-size:25px;width: 200px" value="<%=empVO.getEmp_phone()%>" /></td>
	</tr>
	<tr>
		<td style="color:white;">住址:</td>
		<td><input class="form-control" type="TEXT" name="emp_addr" size="55"	style="font-size:25px;width: 450px" value="<%=empVO.getEmp_addr()%>" /></td>
	</tr>
	<tr>
		<td style="color:white;">E-Mail:</td>
		<td><input class="form-control" type="TEXT" name="emp_email" size="55"	style="font-size:25px;width: 450px" value="<%=empVO.getEmp_email()%>" /></td>
	</tr>
	<tr>
		<td style="color:white;">密碼:</td>
		<td><input class="form-control" type="password" name="emp_password" size="55" style="font-size:25px;width: 450px" value="<%=empVO.getEmp_password()%>" /></td>
	</tr>

</table>

<br>
<div align="center">
<input type="hidden" name="action" value="update">
<input type="hidden" name="emp_id" value="<%=empVO.getEmp_id()%>">
<input type="submit" value="修改" class="btn btn-warning" style="font-family:BoldFace;font-size:20px">
</div>
</div>
</FORM>
</div>


</div>
</div>

<!--pop-up-grid-->

</div>
</div>
<!--slider menu-->
    <div class="sidebar-menu">
		  	<div class="logo"> <a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> <a href="#"> <span id="logo" ></span> 
<!-- 			      <img id="logo" src="" alt="Logo"/>  -->
			  </a> </div>		  
		    <div class="menu">
		      <ul id="menu" >
		      
		        <li><a href="../table/formatTable.do?table=index"><i class="fa fa-eye"></i><span>監控畫面</span></a></li>
		        <li id="menu-comunicacao" ><a><i class="fa fa-phone-square"></i><span>預約</span><span class="fa fa-angle-right" style="float: right"></span></a>
		          <ul id="menu-comunicacao-sub" >
		          	<li><a href="../reserve/reserveC.jsp">新增預約</a></li>
		            <li><a href="../reserve/reserveQ.jsp">查詢預約</a></li>
		          </ul>
		        </li>
		        <li><a><i class="fa fa-free-code-camp"></i><span>內場狀態</span><span class="fa fa-angle-right" style="float: right"></span></a>
		         	 <ul id="menu-academico-sub" >
			            <li><a href="../InsideView/Inside.jsp">內場</a></li>
			         	<li><a href="../Outsideview/Outside.jsp">出餐口</a></li>
		             </ul>
		        </li>
		        <li><a><i class="fa fa-id-badge"></i><span>員工</span><span class="fa fa-angle-right" style="float: right"></span></a>
		        	 <ul id="menu-academico-sub" >
			            <li><a href="EmpRegister.jsp">註冊</a></li>
			         	<li><a href="all_emp.jsp">查詢</a></li> 
		             </ul>
		        </li>
		        <li><a><i class="fa fa-calendar"></i><span>班表</span><span class="fa fa-angle-right" style="float: right"></span></a>
		         	<ul id="menu-academico-sub" >
			            <li><a href="../schedule/schedule.jsp">新增班表</a></li>
			         	<li><a href="../schedule/eachSchedule.jsp">查詢個人班表</a></li>
		             </ul>
		        </li>
		        <li id="menu-academico" ><a><i class="fa fa-cutlery"></i><span>菜單</span><span class="fa fa-angle-right" style="float: right"></span></a>
		          <ul id="menu-academico-sub" >
			          <li><a href="../product/listAllPro.jsp">菜色查詢</a></li>
			          <li><a href="../product/select_online_page.jsp">上架產品查詢</a></li>
			          <li><a href="../product/select_offline_page.jsp">下架產品查詢</a></li>
			          <li><a href="../product/addSinglePro.jsp">新增菜色</a></li>
			          <li><a href="../Package/AddPack.jsp">新增套餐</a></li>
			          <li><a href="../Package/UpdatePro.jsp">套餐查詢修改</a></li>           
		          </ul>
		        </li>
		        <li><a><i class="fa fa-sort-numeric-desc"></i><span>折扣</span><span class="fa fa-angle-right" style="float: right"></span></a>
		          <ul>
		            <li><a href="../discount/add_discount.jsp">新增折扣</a></li>
		            <li><a href="../discount/all_discount.jsp">查詢折扣</a></li>		            
		          </ul>
		        </li>
		        <li><a><i class="fa fa-braille"></i><span>場地配置</span><span class="fa fa-angle-right" style="float: right"></span></a>
		          <ul>
		            <li><a href="../space/spaceC.jsp">新增場地</a></li>
		            <li><a href="../space/spaceQ.jsp">查詢場地</a></li>
		            <li><a href="../space/spaceU.jsp">修改場地</a></li>		            
		          </ul>
		        </li>
		        <li id="menu-academico" ><a><i class="fa fa-bar-chart"></i><span>統計圖</span><span class="fa fa-angle-right" style="float: right"></span></a>
		          <ul id="menu-academico-sub" >
			          <li><a href="../chart/chartPcg.jsp">套餐</a></li>
			          <li><a href="../chart/chartDish.jsp">菜色</a></li>
			          <li><a href="../chart/chartMoney.jsp">營收</a></li>      
		          </ul>
		        </li> 
		      
		      </ul>
		    </div>
	 </div>
	<div class="clearfix"> </div>
</div>
<!--slide bar menu end here-->
<script>
var toggle = false;
            
$(".sidebar-icon").click(function() {                
  if (toggle)
  {
   		$(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
    	$("#menu span").css({"position":"absolute"});
  }
  else{
    	$(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
    	setTimeout(function() {
      		$("#menu span").css({"position":"relative"}); }, 400);
  }               
  toggle = !toggle;
});
</script>
<!--scrolling js-->
		<script src="../js/jquery.nicescroll.js"></script>
		<script src="../js/scripts.js"></script>
		<script src="../js/bootstrap.js"> </script>
<!-- mother grid end here-->
</body>
</html>
