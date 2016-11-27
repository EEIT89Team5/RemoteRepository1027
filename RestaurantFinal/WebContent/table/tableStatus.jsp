<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<title>外場監控</title>
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
$(function() {
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
	
	var peopleform = $('#peopleform');
	var myModalLabel=$('#myModalLabel');
	var pfrom=$('#peopleform p');
	$('#people').click(function (){
		peopleform.slideToggle(300);
	});
	$('#myModal').focus(function(){peopleform.slideUp(300);});
	$('#second div').click(function(){
		var table_name = $(this).find("[name='a']").text();
		myModalLabel.text('選單').append("<b>"+ table_name +"</b>");
		pfrom.html("<input style='display:none' name='table_name' value="+table_name+" />");
		$('#clear').attr('href','formatTable.do?table=clear&table_name='+table_name);
		$('#paymoney').attr('href','formatTable.do?table=paymoney&table_name='+table_name);
	});
	var myVar = setInterval(myTimer, 1000);
	function myTimer() {
	    var d = new Date();

		document.getElementById("xx").innerHTML = d.toTimeString("zh-TW").substring(0,8);
	}
																
});
</script>
<!--pop up end here-->
<style>
/* 	body{background-color:#000000;} */
.inner-block {
    padding: 8em 0em 0em 0em;
}
 	#main{
 		width:100%;
		margin:40px 50px;
 	} 
 	#second{
 		margin:20px 0px;
 		position:relative;
 	}
	.xx{
		text-align:center;
 		font-family:Microsoft JhengHei; 
		font-size:20px;
		font-weight:bold;
		border:3px solid white;
		position:absolute;
		border-radius: 20px 20px;
	}
	.small{
		width: 150px;
	    height: 150px;
	}
	.bigx{
		width: 300px;
	    height: 150px;
	}
	.bigy{
		width: 150px;
	    height: 300px;
	}
	.xx p{
		width:110px;
		border:1px;
 		margin:0px 20px; 
		color:#FFFFFF;
	}
	.xx .a{background-color:#000000;
		color:#FFFFFF;}
	.xx .b{background-color:#F4FA58;
		color:#000000;}
	.xx .c{background-color:#58FAD0;
		color:#000000;}
	.xx .d{background-color:#F5A9F2;
		color:#000000;}
	.bigx p{margin:0px 95px; }
 	.bigy p[name="a"]{margin:75px 20px 0px 20px; } 
	

	
	
.modal{text-align: center; } 

@media screen and (min-width: 768px) { 
  .modal:before {
    display: inline-block;
    vertical-align: middle;
    content: " ";
    height: 100%;
  }
}

 .modal-dialog { 
   display: inline-block; 
   text-align: left; 
   vertical-align: middle; 
 } 
body,.inner-block{
/* 	background-color:#F5F6CE; */
	background-color:black;
}
.clerfix{
	border-style:solid;
}
.titlebar{
/* 	margin:auto 0; */
	background-color:black;
}
#menu span{
	position:absolute;
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
									 <a href="../index.jsp">
									 <img src="../img/title3.png" alt="Logo"/>
<!-- 									  <h1>Eight&Nine</h1>  -->
									<!--<img id="logo" src="" alt="Logo"/>--> 
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
											<li> <a href="../login/login.jsp"><i class="fa fa-sign-out"></i> Login</a> </li>
											<li> <a href="../login/logout.jsp"><i class="fa fa-sign-in"></i> Logout</a> </li>
										</ul>
									</li>
								</ul>
							</div>
							<div class="clearfix"> </div>				
						</div>
				     <div class="clearfix"> </div>	
				</div>
<!--heder end here-->
<!-- script-for sticky-nav -->
		<script>
// 		$(document).ready(function() {
// 			 var navoffeset=$(".header-main").offset().top;
// 			 $(window).scroll(function(){
// 				var scrollpos=$(window).scrollTop(); 
// 				if(scrollpos >=navoffeset){
// 					$(".header-main").addClass("fixed");
// 				}else{
// 					$(".header-main").removeClass("fixed");
// 				}
// 			 });
			 
// 		});
		</script>
<!-- /script-for sticky-nav -->
<!--inner block start here-->
<div class="inner-block">
    <div class="price-block-main">
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h2 class="modal-title text-center" id="myModalLabel" >選單</h2>
      </div>
      <div class="modal-body">
      		<br />
			<button id="people" type="button" class="btn btn-warning btn-lg btn-block">入座資訊</button><br />
			
			<form id="peopleform" role="form" action='formatTable.do' style="display:none;height:100px">
				    <div class="form-group">
					    <label for="table_numP" class="col-sm-2 control-label">人數</label>
					    <div class="col-sm-10">
					    <input type="text" class="form-control" id="table_numP" name="table_numP" placeholder="輸入本桌客人數量">
					    </div>
					</div><input style='display:none' name='table' value="numP" />
					<p></p>
					<div class="col-sm-offset-10 col-sm-10 form-group">
				  		<button type="submit" class="btn btn-secondary ">送出</button>
				  	</div>
			</form>
			<br />
			<a href="formatTable.do" id="paymoney" class="btn btn-primary btn-lg btn-lg btn-block" role="button">結帳</a><br /><br />
			<a href="formatTable.do" id="clear" class="btn btn-danger btn-lg  btn-lg btn-block" role="button">清空</a><br /><br />
			
      </div>
      <div class="modal-footer">
<!--         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
<!--         <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
  </div>
</div>
<!-- Button trigger modal -->
<!-- <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"> -->
<!--   Launch demo modal -->
<!-- </button> -->
<div id="main">
<!-- 	<a href="../index.jsp" class="btn btn-default btn-lg active" role="button"> </a> -->
<%-- 	<h1 style="color:pink" id="xx">${time}</h1> --%>
	<h1 style="color:pink;float:right;position:absolute;top:100px;right:100px" id="xx">${time}</h1>
	<h3 style="color:red;float:right;position:absolute;top:100px;right:500px"> ${errorMsgs}</h3>
	
	<div id="second">
		<c:forEach var="table" items="${AllTable}" varStatus="xx">
			<c:choose>
				<c:when test="${table.table_status=='空桌'}">
					<c:set var="color" value="a" />
				</c:when>
				<c:when test="${table.table_status=='未點餐'}">
					<c:set var="color" value="b" />
				</c:when>
				<c:when test="${table.table_status=='用餐中'}">
					<c:set var="color" value="c" />
				</c:when>
				<c:when test="${table.table_status=='菜上齊'}">
					<c:set var="color" value="d" />
				</c:when>
			</c:choose>
			<div class="xx ${table.table_shape}" style="left:${table.table_x}px;top:${table.table_y}px" data-toggle="modal" data-target="#myModal">
				<p name="a">${table.table_name}</p>
				<p class='${color}'>${table.table_status}</p>
				<p>${table.table_paid}</p>
				<p>${table.table_numP}/${table.table_maxP}</p>
				<p>${table.table_time}</p>
			</div>
		</c:forEach>
	</div>
</div>
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
		<!--//scrolling js -->
		<script src="../js/bootstrap.js"> </script>
<!-- mother grid end here-->
</body>
</html>
