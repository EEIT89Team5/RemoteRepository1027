<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<title>結帳清單</title>
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
	var total = $('#origincount').val();
	
	var unfinishmoney = $('#total').text();
	$('#total').html(Math.round(unfinishmoney));
	$('#pricex').val(Math.round(unfinishmoney));
	
// 	$('#discounts').click(function(){
	var disV = $("#discounts").find('option');
	
	$.each(disV,function(i,v){
	var array = $(this).html().split(",");
		if(array[1]!=null){
			$(this).html(array[0]+","+array[1].substring(2,5)+"折")	
		}else{
			$(this).html(array[0])	
		}
	})
// 	disV.html(array[0]+","+array[1].substring(2,5)+'折')
// 	})
	
	$('#discounts').change(function(){
		var dis = $(this).find('option:selected');
		if(dis.val()!=0){
			var array = dis.html().split(",");
			$('#dis_name').html(array[0]);
			$('#dis_val').html(array[1]);
			var discountline=array[1].length
			var newTotal = Math.round(total*("0."+array[1].substring(0,discountline-1)));
			$('#total').html(newTotal);
			$('#pricex').val(newTotal);
			$('#discountx').val(dis.val());
			$('#discoutdiv').removeAttr("hidden");
		}else{
			$('#dis_name').html("");
			$('#dis_val').html("");
			$('#total').html(total);
			$('#pricex').val(total);
			$('#discountx').val("");
			$('#discoutdiv').attr("hidden","hidden");
		}
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
#outerdiv{
	width:670px;
	margin:0 auto;
	font-family:ShowWind;
	font-weight: bold;
	font-size:35px;
	color:white;
}
#outerdiv input,#outerdiv select{
	color:black;
}
th{
text-align: center;
color:yellow
}
td{
text-align: center;
}
#dis_val,#total{
color:yellow;
}
/* #maindiv{ */
/* 	width:500px; */
/* 	margin:0 auto; */
/* 	border:6px solid red; */
/* 	padding:20px; */
/* 	font-size:25px; */
/* 	font-weight:bold; */
/* } */
/* .fontStyle{ */
/* 	font-family:ShowWind; */
/* 	font-weight: bold; */
/* 	font-size:30px; */
/* 	color:white; */
/* } */
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
<!-- 									  <h1>Eight&Nine</h1>  -->
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
<jsp:useBean id="disService" class="com.discount.model.DiscountService"/>
	<div id="outerdiv">
		<div>
			<label for="discounts" class="fontStyle">選擇折扣:</label>
			<select id="discounts" class="fontStyle" >
				<option value="0">無折扣</option>
				<c:forEach var="discount" items="${disService.all}">
					<c:if test='${discount.disc_name =="會員折扣"}'>
							<c:if test="${bills.memberVO.member_name !=null}">
								<option selected value="${discount.disc_id}">${discount.disc_name},${discount.disc_value}</span></option>
								<c:set var="discountid" value="${discount.disc_id}" />
							</c:if>
					</c:if>
					<c:if test='${discount.disc_name !="會員折扣"}'>							
						<option value="${discount.disc_id}">${discount.disc_name},${discount.disc_value}</span></option>
					</c:if>
				</c:forEach>
			</select>
		</div>
		<hr color="white" />
		<div id="maindiv" class="fontStyle">
			<div>
				<div style="display:inline-block;width:300px">桌號:${bills.order_table}</div>
				<div style="display:inline-block;width:350px">消費日期:${bills.order_date }</div>
				<div style="display:inline-block;width:300px">人數:${bills.order_numP }</div>
				<div style="display:inline-block;width:350px">點餐員工:${bills.empVO.emp_name }</div>
				<div style="display:inline-block;width:350px">會員:${bills.memberVO.member_name }</div>
				<c:set var="table" value="${bills.order_table}"/>
				<c:set var="count" value="0"/>
			</div>
			<hr />
				<table width="680px" >
				<th>品名</th><th>價格</th><th>數量</th>

				<c:forEach var="orderx" items="${bills.orderXs}">
					<tr>
						<td>${orderx.productVO.product_name}</td>
						<td>${orderx.productVO.product_price}</td>
						<td>${orderx.orderX_num}</td>
					</tr>
					<c:set var="count" value="${count +orderx.productVO.product_price*orderx.orderX_num}"/>
				</c:forEach>
				</table>
				<hr />
				
				<input type="text" hidden id="origincount" value="${count}">
				<c:if test="${bills.memberVO.member_name != null}">
<!-- 					<div id="discoutdiv" width="500px"><span id="dis_name">會員折扣</span> &nbsp;&nbsp;<span id="dis_val">0.9</span></div> -->

					<div id="discoutdiv" width="500px" align="center"><span id="dis_name">會員折扣</span> &nbsp;&nbsp;<span id="dis_val">9 &nbsp;折</span></div>

					<c:set var="count" value="${count * 0.9}" />
				</c:if>
				<c:if test="${bills.memberVO.member_name == null}">
					<div id="discoutdiv" hidden width="500px" align="center"><span id="dis_name"></span> &nbsp;&nbsp;<span id="dis_val"></span></div>
				</c:if>
				<div width="500px" align="center"><span>總金額:</span>&nbsp;&nbsp;<span id="total">${count}</span></div>

		</div>
		<br>
		<div align="center">
		<form action="formatTable.do">
			<input type="text" hidden name="table" value="money" />
			<input type="text" hidden name="order_table" value="${bills.order_table}" />
			<input type="text" hidden name="order_id" value="${bills.order_id}" />
			<input id="pricex" type="text" hidden name="order_price" value="${count}" />		
			<input id="discountx" type="text" hidden name="order_discount" value="${discountid}" />
			<input type="submit" value="確定明細"/>
		</form>
		</div>
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
		      
		        <li><a href="formatTable.do?table=index"><i class="fa fa-eye"></i><span>監控畫面</span></a></li>
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
