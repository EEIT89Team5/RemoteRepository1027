<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.reserve.model.ReserveVO" %>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<title>修改預約</title>
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
<link rel="stylesheet" href="../css/bootstrap-datepicker3.min.css">
<script src="../js/bootstrap-datepicker.min.js"></script>
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
	
	$.each($('#time option'),function(){
		if($(this).val()==<%= session.getAttribute("ReserveVOtime") %>)
			$(this).attr("selected","selected");
	});
	
	<% ReserveVO reserve = (ReserveVO)session.getAttribute("updateReserveVO"); %>
	$.each($('input[type="radio"]'),function(){
		if($(this).val()=="<%= reserve.getRes_gender() %>")
			$(this).attr("checked","checked");
	});
	
	$('#date').datepicker({
		autoclose: true,
		format: 'yyyy-mm-dd',
	    todayBtn: "linked",
	    todayHighlight: true
	});
	
	$('#submitx').click(function(){
		var count = 0;
		var date = $('#date');
		if(date.val()==""){
			$('#sp1').html("不可為空白");
			count++;
		}else
			$('#sp1').empty();
		var res_name = $('#res_name');
		if(res_name.val()==""){
			$('#sp2').html("不可為空白");
			count++;
		}else
			$('#sp2').empty();
		var res_phone = $('#res_phone');
		if(res_phone.val()==""){
			$('#sp3').html("不可為空白");
			count++;
		}else
			$('#sp3').empty();
		var res_nump = $('#res_numP');
		if(res_nump.val()==""){
			$('#sp4').html("不可為空白");
			count++;
		}else{
			if(isNaN(res_nump.val())){
				$('#sp4').html("請輸入數字");
				count++;
			}else
				$('#sp4').empty();
		}
		if(count==0){
// 			alert("success");
			$('#formq').submit();
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
form{
	/*border:3px double #7e85c4;
	border-radius:20px;
	width:500px;
 	margin: 0px auto;*/
 	border-radius:20px;
	width:1200px; 
	height:600px;
 	margin: 0px auto;
 	font-family:ShowWind;
	font-size:40px;
	font-weight:bold;
	text-align:center;
	}
fieldset {
/* 	margin: 0px auto; */
/* 	width:700px; */
/*     border:3px double #7e85c4; */
/*     border-radius:20px; */
	}
legend {
	color:white;
	text-align:center;
	font-size:50px;
	font-weight:bold;
	}
.stl {
    width:300px;
/*     float:left; */
    text-align:right; 
	font-size:50px;
    }
 .stl label{
 	font-size:50px;
 }  
.std {
	text-align:left;
	height:60px;
	padding-bottom:16px;
	color:white;
	font-size:50px;
	}
.std input,.std select{
	font-size: 30px;
	color:black;
}
.labelsize{
	font-size: 40px;
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
    
<form id="formq" class="form-inline" action="ReserveServlet.do?doWhat=update2" method="post">
	    <img src="../img/ReserUPDATE.png">
	    <fieldset>
	        <legend>修改預約資料</legend>
	        <div class="std">
	            <label class="stl" for="date">日期 :</label>
	            <input type="text" class="form-control" id="date" name="date" placeholder="yyyy-mm-dd"
	            	 	value="${ReserveVOdate}"/><span id="sp1"></span>
	            <br/>
	        </div>
	        <div class="std">
	            <label class="stl" for="time">時間 :</label>
<!-- 	            <input type="text" id="time" name="time"  /> -->
	            <select id="time" name="time" >
	            	<option value="11">11點</option>
	            	<option value="12">12點</option>
	            	<option value="13">13點</option>
	            	<option value="17">17點</option>
	            	<option value="18">18點</option>
	            	<option value="19">19點</option>
	            	<option value="20">20點</option>
	            </select>
	            <br/>
	        </div>
	        <div class="std">
	            <label class="stl" for="res_name">姓氏 :</label>
	            <input type="text" class="form-control" size="1" id="res_name" name="res_name"
	                    value="${updateReserveVO.res_name}" placeholder="請輸入姓氏" /><span id="sp2"></span>
	            <br/>
	        </div>
	        <div class="std">
	            <label class="stl" for="man">性別 :</label>
	            	<input type="radio" id="man" name="res_gender" value="先生" checked="checked"><label class="labelsize" for="man">先生</label>
	            	<input type="radio" id="woman" name="res_gender" value="小姐"><label class="labelsize" for="woman">小姐</label>
	            <br/>
	        </div>
	        <div class="std">
	            <label class="stl" for="res_phone">手機 :</label>
	            <input type="text" class="form-control" id="res_phone" maxlength="10" name="res_phone" 
	            		value="${updateReserveVO.res_phone}" placeholder="請輸入電話號碼" /><span id="sp3"></span>
	            <br/>
	        </div>
	        <div class="std">
	            <label class="stl" for="res_numP">人數 :</label>
	            <input type="text" class="form-control" id="res_numP" name="res_numP" 
	            		value="${updateReserveVO.res_numP}" placeholder="請輸入人數" /><span id="sp4"></span>
	            <br/>
	        </div>
	        <div class="std">
	            <label class="stl" for="res_remark">特殊需求 :</label>
	            <input type="text" class="form-control" id="res_remark" name="res_remark" value="${updateReserveVO.res_remark}"/>
	            <br/>
	        </div>
	        <br />
	        <div class="std" style="text-align: center;">
	            <input type="button" id="submitx" value="送出" />
	            <input type="reset" value="清除" />
	        </div>
	    </fieldset>
	</form>
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
