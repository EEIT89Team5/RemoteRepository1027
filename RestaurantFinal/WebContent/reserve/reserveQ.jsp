<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<title>查詢預約表</title>
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
<link rel="stylesheet" type="text/css" href="../js/sweetalert.css">
<script language="JavaScript" src="../js/sweetalert.min.js"></script>
<script>
$(document).ready(function() {
	
	$.each($('#todayList tr'),function(){
		var x = $(this).find('td:eq(0)');
		x.text(x.text().substring(0,19));
	});
	
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
	
	$.each($('select[name="months"] option'),function(){
		var monthx=$(this).val();
		if(monthx == <%= request.getParameter("months") %>){
			$(this).attr("selected","selected");
			var d=0;
			if(monthx==1 || monthx==3 || monthx==5 || monthx==7 || monthx==8 || monthx==10 || monthx==12)
				d=31;
			else if(monthx==2)
				d=29;
			else
				d=30;
			var days = $('select[name="days"]');
			var i=1;
			for(i;i<=d;i++){
				if(i==<%= request.getParameter("days") %>)
					days.append("<option value='"+i+"' selected>"+i+"日</option>");
				else
					days.append("<option value='"+i+"'>"+i+"日</option>");
			}	
		}
	});
	
	
	$('#todayList tr').hover(function(){
		$(this).css("background-color","blue");
	},function(){
		$(this).css("background-color","black");
	});
	
		
	$('select[name="months"]').change(function(){
		var monthx = $(this).find('option:selected').val();
		var dayx = $('select[name="days"]');
		dayx.html("<option value='0'>選擇日期</option>");
		if(monthx!=0){
			if(monthx==1 || monthx==3 || monthx==5 || monthx==7 || monthx==8 || monthx==10 || monthx==12)
				d=31;
			else if(monthx==2)
				d=29;
			else
				d=30;
			var i=1;
			for(i;i<=d;i++){
				dayx.append("<option value='"+i+"'>"+i+"日</option>")
			}
		}
	});
	
	$('#btn_select').click(function(){
		var check = $('select[name="months"]').val();
		if(check=="0"){
// 			alert("請選擇月份");
		sweetAlert("請選擇月份");
		}else{
			$(this).parent().submit();
		}
	});
	
	$('#showbtn').click(function(){
		$('td form').removeAttr("hidden");
		$(this).attr("hidden","hidden");
	});
	
	$('#todayList td input[type="button"]').click(function(){
		if($(this).val()=="修改"){
			$(this).parent().attr("action","ReserveServlet.do?doWhat=update").submit();
		}
		if($(this).val()=="刪除"){
			$(this).parent().attr("action","ReserveServlet.do?doWhat=delete").submit();
		}
	});
																
});
</script>
<!--pop up end here-->
<style>
body,.inner-block{
	background-color:black;
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
#main{
	text-align:center;
	margin-left:20px;
	font-family:ShowWind;
	font-weight:bold;
	color:white;
	font-size:30px;
}
#todayList{
/* 	border:2px solid gray; */
	text-align:center;
	border-collapse:collapse;
 	width:100%; 
	font-size: 35px;
}
#main input,#main select,#main button{
	color:black;
}
#main input,#main button{
	font-size:22px;
}
th {
 	text-align: center; 
}
td{
	padding:0 10px;
} 
</style>
<link rel="Shortcut Icon" type="image/png" href="../icon/pagelogo.png" />
</head>
<body>	
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
<jsp:useBean id="reserveBean" class="com.reserve.model.ReserveService"></jsp:useBean>
	
	<div id="main">
		<table style="width:100%">
			<tr>
			<td align="left">	
				<form id="selectReserve" action="ReserveServlet.do?doWhat=selects" method="post">
					選擇時間:
					<select name="months">
						<option value="0">選擇月份</option>
						<c:forEach var="month" begin="1" end="12">
							<option value="${month}">${month}月</option>
						</c:forEach>
					</select>
					<select name="days">
						<option value="0">選擇日期</option>
					</select>
					<input type="button" id="btn_select" value="查詢" />
				</form>
			</td>
			<td align="right">
				<button id="showbtn">修改預約表</button>
			</td>
			</tr>
		</table>
		<br />
		<table id="todayList">
			<tr><th>預約的時間</th><th>名稱</th><th>手機</th><th>人數</th><th>特殊需求</th><th width="200px"></th></tr>
			<c:if test="${test != 'xxx'}">
				<c:forEach var="reserveVO" items="${reserveBean.today}">
					<tr>
					<td >${reserveVO.res_time}</td>
					<td >${reserveVO.res_name}${reserveVO.res_gender}</td>
					<td >${reserveVO.res_phone}</td>
					<td >${reserveVO.res_numP}人</td>
					<td >${reserveVO.res_remark}</td>
					<td>
						<form hidden action="" method="post">
							<input hidden type="text" name="res_time" value="${reserveVO.res_time}" />
							<input hidden type="text" name="res_phone" value="${reserveVO.res_phone}"/>
							<input type="button" value="修改" />
							<input type="button" value="刪除" />
						</form>
					</td>
				</tr>
			</c:forEach>
			</c:if>
			<c:if test="${test == 'xxx'}">
				<c:forEach var="reserveVO" items="${resVO}">
				<tr>
					<td >${reserveVO.res_time}</td>
					<td >${reserveVO.res_name}${reserveVO.res_gender}</td>
					<td >${reserveVO.res_phone}</td>
					<td >${reserveVO.res_numP}人</td>
					<td >${reserveVO.res_remark}</td>
					<td>
						<form hidden action="" method="post">
							<input hidden type="text" name="res_time" value="${reserveVO.res_time}" />
							<input hidden type="text" name="res_phone" value="${reserveVO.res_phone}"/>
							<input type="button" value="修改" />
							<input type="button" value="刪除" />
						</form>
					</td>
				</tr>
			</c:forEach>
			</c:if>
		</table>
	</div>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>




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
		          	<li><a href="reserveC.jsp">新增預約</a></li>
		            <li><a href="reserveQ.jsp">查詢預約</a></li>
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
			            <li><a href="../emp/EmpRegister.jsp">註冊</a></li>
			         	<li><a href="../emp/all_emp.jsp">修改</a></li> 
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
