<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%@ page import="com.orderx.model.*"%>

<%

OrderXService svc = new OrderXService();
java.sql.Date d=new java.sql.Date(System.currentTimeMillis());
java.sql.Date d2=java.sql.Date.valueOf("2016-10-10");
    
//  	List<KitchenVO> list = dao.getAll(d2);//指定當日
    
    List<OrderXVO> list = svc.getAll(d);
    pageContext.setAttribute("list",list);
%>
<!DOCTYPE HTML>
<html>
<head>
<title>內場資訊</title>
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
	
	$("tr").mouseover(over).mouseout(out);
	
	function over() {
		$(this).css('background-color','rgba(100,100,100,0.4)');
	}
	function out() {
		$(this).css('background-color','black');
	}
																
});

var websocket =new WebSocket("ws://localhost:8081/Restaurant/chatroomServerEndpoint");
websocket.onopen = function(evt){
	console.log("open");
}
 function sendMessage(){
	 console.log(messageText.value);
	 websocket.send(messageText.value);
	 messageText.value="";
 }
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
@font-face {  
  font-family:"ShowWinde";  
  src: url("../font/ShowWind.ttc"); 
}
.button2 {
    background-color: white;
    color: black;
    border: 2px solid #008CBA;
}

.button2:hover {
    background-color: #008CBA;
    color: white;
}
th{ 
font-family:"ShowWinde";  
/* text-align: center; */
font-weight:bolder;
font-size: 40px;
color: white;
width: 1500;
}
td{
 background:rgba(0%,0%,0%,0.1); 
font-family:"ShowWinde";
font-weight:bolder;
font-size: 28px;
color: white;
/* background:rgba(0%,0%,0%,0.1); */
}
 #divdiv{/*控制TABLE的DIV */
/* margin:0px auto; */
width:100%;
}
</style>

<head>
<title>內場資訊</title>

<link rel="Shortcut Icon" type="image/png" href="../icon/pagelogo.png" />

</head>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>
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
<link rel="Shortcut Icon" type="image/png" href="../icon/pagelogo.png" />
<!-- <h3  align="center" style="font-family:ShowWinde ;font-size: 50px;color: white">內場資訊 </h3> -->

<!-- <body style="background-color:black"> -->
<table align="center">
<tr>
<td rowspan="2"><font  align="center" style="font-family:ShowWind ;font-size: 50px;color: white">內場資訊</font></td>
<td></td>
<td><div style="background-color: orange;width: 30px;height: 30px"></div></td>
<td width="20px"></td>
<td><font style="color: white">製作中</font></td>
</tr>
<tr>
<td style="width: 30px;height: 30px"></td>
<td><div style="background-color: white;width: 30px;height: 30px"></div></td>
<td width="20px"></td>
<td><font style="color: white">未製作</font></td>
</tr>
</table>

<div id='divdiv'>
<table  class="table table-hover" >
	<tr>
		<th>桌號</th>
		<th>前菜</th>
		<th>沙拉</th>
		<th>湯品</th>
		<th>主菜</th>
		<th>甜點</th>
		<th>飲料</th>
		
<!-- 		<th>狀態</th> -->
		
	</tr>
	<c:set var="xx" value="0"></c:set> <%-- 使桌號第一次進入時必不相同 --%>
	<c:forEach var="orderX" items="${list}">
	<FORM METHOD="post" ACTION="Inside.do">
	<c:if test="${orderX.orderX_status!='待出餐'&&orderX.orderX_status!='出餐完成'}"><%-- 如果菜色狀態完成則不會顯示在表格內 --%>
  	<c:if test="${xx!=orderX.orderVO.order_table}"> <%--不同桌次建立TRTD桌次 --%>
 			<tr><td>${orderX.orderVO.order_table}</td>
<%--  			<td><div>${orderX.productVO.product_name}</div> --%>
	
 			<c:choose>  <%--第一筆菜色類別的位置 --%>
 				<c:when test="${orderX.productVO.dishClassVO.class_id==10}"><td><c:if test="${orderX.orderX_status!='待出餐'&&orderX.orderX_status!='出餐完成'}"><input type="submit" style="${(orderX.orderX_status=='製作中')?'background-color:orange':''}" onclick="sendMessage();" id="messageText" class="button2" value="${orderX.productVO.product_name}">_x${orderX.orderX_num}<br></c:if></c:when>
 				<c:when test="${orderX.productVO.dishClassVO.class_id==20}"><td></td><td><c:if test="${orderX.orderX_status!='待出餐'&&orderX.orderX_status!='出餐完成'}"><input type="submit" style="${(orderX.orderX_status=='製作中')?'background-color:orange':''}" onclick="sendMessage();" id="messageText" class="button2" value="${orderX.productVO.product_name}">_x${orderX.orderX_num}<br></c:if></c:when>
 				<c:when test="${orderX.productVO.dishClassVO.class_id==30}"><td></td><td></td><td><c:if test="${orderX.orderX_status!='待出餐'&&orderX.orderX_status!='出餐完成'}"><input type="submit" style="${(orderX.orderX_status=='製作中')?'background-color:orange':''}" onclick="sendMessage();" id="messageText" class="button2" value="${orderX.productVO.product_name}">_x${orderX.orderX_num}<br></c:if></c:when>
 				<c:when test="${orderX.productVO.dishClassVO.class_id==40}"><td></td><td></td><td></td><td><c:if test="${orderX.orderX_status!='待出餐'&&orderX.orderX_status!='出餐完成'}"><input type="submit" style="${(orderX.orderX_status=='製作中')?'background-color:orange':''}" onclick="sendMessage();" id="messageText" class="button2" value="${orderX.productVO.product_name}">_x${orderX.orderX_num}<br></c:if></c:when>
 				<c:when test="${orderX.productVO.dishClassVO.class_id==50}"><td></td><td></td><td></td><td></td><td><c:if test="${orderX.orderX_status!='待出餐'&&orderX.orderX_status!='出餐完成'}"><input type="submit" style="${(orderX.orderX_status=='製作中')?'background-color:orange':''}" onclick="sendMessage();" id="messageText" class="button2" value="${orderX.productVO.product_name}">_x${orderX.orderX_num}<br></c:if></c:when>
 				<c:when test="${orderX.productVO.dishClassVO.class_id==60}"><td></td><td></td><td></td><td></td><td></td><td><c:if test="${orderX.orderX_status!='待出餐'&&orderX.orderX_status!='出餐完成'}"><input type="submit" style="${(orderX.orderX_status=='製作中')?'background-color:orange':''}" onclick="sendMessage();" id="messageText" class="button2" value="${orderX.productVO.product_name}">_x${orderX.orderX_num}<br></c:if></c:when>
 			</c:choose>
  	</c:if><%--不同桌次判定完成 --%>
   	<c:if test="${xx==orderX.orderVO.order_table}"><%-- 若桌次相同則進入 --%>
  	  		<c:if test="${classxx==orderX.productVO.dishClassVO.class_id}"><%--若類別相同則同TD內再開一個DIV --%>
	 			<c:if test="${orderX.orderX_status!='待出餐'&&orderX.orderX_status!='出餐完成'}">
	 			<input type="submit" style="${(orderX.orderX_status=='製作中')?'background-color:orange':''}" onclick="sendMessage();" id="messageText" class="button2" value="${orderX.productVO.product_name}">_x${orderX.orderX_num}<br></c:if>
	 		</c:if>
			<c:if test="${classxx!=orderX.productVO.dishClassVO.class_id }"> <%-- 若類別不同 --%>
  				<c:if test="${(orderX.productVO.dishClassVO.class_id-classxx)==10}"><%-- 若兩類別差距一格則開一個TD --%>
				<td><c:if test="${orderX.orderX_status!='待出餐'&&orderX.orderX_status!='出餐完成'}">
				<input type="submit" style="${(orderX.orderX_status=='製作中')?'background-color:orange':''}" onclick="sendMessage();" id="messageText" class="button2" value="${orderX.productVO.product_name}">_x${orderX.orderX_num}<br>
				</c:if>
				</c:if>
				</c:if>
				<c:if test="${(orderX.productVO.dishClassVO.class_id-classxx)>10 }"><%-- 若兩類別差距超過一格 --%>
					<c:forEach var="num" begin="1" end="${(orderX.productVO.dishClassVO.class_id-classxx)/10-1}">
 				<td></td> <!--依差距建立對應的TD -->
				</c:forEach>
				<td>
				<c:if test="${orderX.orderX_status!='待出餐'&&orderX.orderX_status!='出餐完成'}">
				<input type="submit" style="${(orderX.orderX_status=='製作中')?'background-color:orange':''}" onclick="sendMessage();" id="messageText" class="button2" value="${orderX.productVO.product_name}">_x${orderX.orderX_num}<br>
				</c:if>
 			</c:if>
			
 		</c:if>
 		
	<c:set var="classxx" value="${orderX.productVO.dishClassVO.class_id}"></c:set><%--類別佔存 --%>
 	<c:set var="xx" value="${orderX.orderVO.order_table}"></c:set><%--桌次站存 --%>
 	</c:if> <%-- 如果菜色狀態完成則不會顯示在表格內 --%>
 			 <input type="hidden" name="orderX_time" value="${orderX.orderX_time}">
			 <input type="hidden" name="product_id" value="${orderX.productVO.product_id}">
			 <input type="hidden" name="order_id" value="${orderX.orderVO.order_id}">
			 <input type="hidden" name="orderX_status" value="${orderX.orderX_status}">
			 <input type="hidden" name="orderX_num" value="${orderX.orderX_num}">
 			 <input type="hidden" name="action"	value="update"> 
</FORM>
	</c:forEach>

<!-- 	====================以下為原始檔========================================= -->
<%-- 	<c:forEach var="orderX" items="${list}" > --%>
<%-- 	<c:if test="${orderX.orderX_status!='待出餐'&&orderX.orderX_status!='出餐完成'}"> --%>
<!-- 		<tr align='center' valign='middle'}> -->
<!-- 			<FORM METHOD="post" ACTION="Inside.do"> -->
<%-- 			<td>${orderX.orderVO.order_id}</td> --%>
<%-- 			<td>${orderX.orderX_time}</td> --%>
<%-- 			<td>${orderX.orderVO.order_table}</td> --%>
<%-- 			<td>${orderX.productVO.product_id}</td> --%>
<%-- 			<td>${orderX.productVO.product_name}</td> --%>
<%-- 			<td>${orderX.orderX_num}</td> --%>
<%-- 			<td>${orderX.orderX_status}</td> --%>
			
<!-- 			<td> <input type="submit"  value="修改"  onclick="sendMessage();" id="messageText"></td> -->
			
			 <input type="hidden" name="orderX_time" value="${orderX.orderX_time}">
			 <input type="hidden" name="product_id" value="${orderX.productVO.product_id}">
			 <input type="hidden" name="order_id" value="${orderX.orderVO.order_id}">
			 <input type="hidden" name="orderX_status" value="${orderX.orderX_status}">
			 <input type="hidden" name="orderX_num" value="${orderX.orderX_num}">
<!-- 			 <input type="hidden" name="action"	value="update"> -->
<!-- 			</FORM> -->
	

<!-- 		</tr> -->
<%-- 	</c:if> --%>
<%-- 	</c:forEach> --%>
<!-- 	===================以上為原始檔======================================== -->
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
			            <li><a href="Inside.jsp">內場</a></li>
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
<<<<<<< HEAD

=======
<!--scrolling js-->
		<script src="../js/jquery.nicescroll.js"></script>
		<script src="../js/scripts.js"></script>
		<script src="../js/bootstrap.js"> </script>
<!-- mother grid end here-->
</body>
</html>
