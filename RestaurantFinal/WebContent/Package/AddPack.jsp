<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.product.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE HTML>
<html>
<%
	ProductVO proVO = (ProductVO) request.getAttribute("proVO");
%>
<head>
<title>新增套餐菜色</title>
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
	
	$("#NewFileUp").change(function() {
		if (this.files && this.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#Browse').attr('src', e.target.result);
			}

			reader.readAsDataURL(this.files[0]);
		}
	});
	$("#product_name").blur(function(){
		var un=$("#product_name").val()
			
		if(un.length>0&&un.length<2){
			$("#pna").html("<img src='../icon/xx.png' /><span style='color:#e2574c;font-size:18px'>產品名稱至少要兩個字以上</span>")
			$("#product_name").focus();
		}else if(un.trim()==""||un==null){
			$("#pna").html("<img src='../icon/xx.png' /><span style='color:#e2574c;font-size:18px'>產品名稱不能空白</span>")
			$("#product_name").focus();	
		}else if(un.match(/[^\u3447-\uFA29 a-z A-Z]/ig)){
			$("#pna").html("<img src='../icon/xx.png' /><span style='color:#e2574c;font-size:18px'>必須為中文或英文</span>")
			$("#product_name").focus();
		}else{
			$("#pna").html("<img src='../icon/oo.png' /><span style='color:#3db39e;font-size:18px'>格式正確</span>")
			
		}
	})
		$("#product_price").blur(function(){
			var count=0;
			var pdv=$("#product_price").val()	
			if(pdv==null||pdv==""){
				$("#ppi").html("<img src='../icon/xx.png' /><span style='color:#e2574c;font-size:18px'>售價不能空白</span>")
				$("#product_price").focus();
				
			}else if(pdv.match(/[^0-9]/ig)){
				$("#ppi").html("<img src='../icon/xx.png' /><span style='color:#e2574c;font-size:18px'>售價必須是數字</span>")
				
			}else{
				$("#ppi").html("<img src='../icon/oo.png' /><span style='color:#3db39e;font-size:18px'>格式正確</span>")
				
			}
		})
	
	$("#allbutton").click(function(){
		var count=0;
		var pna=$("input[name='product_name']").val()
		var pdv=$("input[name='product_price']").val()
		
		if(pna=null||pna.trim()==""){
			$("#pna").html("<img src='../icon/xx.png' /><span style='color:#e2574c;font-size:18px'>產品名稱不能空白</span>")
			count++;
		}

		if(pdv=null || pdv.trim()==""){
			$("#ppi").html("<img src='../icon/xx.png' /><span style='color:red;font-size:18px'>售價不能空白</span>")
			count++;
		}
		if(count==0){
			$("#allbutton").parent().parent().submit();
		}
	
	})
																
});
</script>
<!--pop up end here-->
<style>
body,.inner-block{
	background-image: url("../img/14.jpg");
	background-size: cover;
	moz-background-size: cover;
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
#Div1{
	width: 700px;
	padding:20px;
	border-radius: 10px
}

@font-face {  
  font-family: "ShowWind";  
  src: url("../font/ShowWind.ttc");  
}
td{
font-family: ShowWind;
font-size:25px;
color:white;
background:#333;
}
.st1{
margin: 10px
}
.font1{  
  font-family: "ShowWind"; 
  font-size:30px; 
  font-weight: normal;
  color: white
}
img{
webkit-border-radius: 10px;
moz-border-radius: 10px;
border-radius: 10px;
}
::-webkit-input-placeholder { font-family:"ShowWind";font-size: 20px;font-weight:bold}
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
<div align="center">

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
<div id="Div1" align="left" style="border: 3px red solid;background:rgba(0,0,0,0.7);">
		 <legend style="font-size: 40px;font-family:ShowWind;color: white;font-weight:bold">新增套餐</legend>

	<FORM METHOD="post" ACTION="pro.do" name="form1" enctype="multipart/form-data">
			
			<div class="st1">
					<td><font class="font1">商品名稱:</font></td>
					<td><input type="TEXT" name="product_name" size="25" placeholder="請輸入套餐名稱"/></td>
					<span id="pna"></span>
			</div>	
			<div class="st1">
					<td><font class="font1">售價:</font></td>
					<td><input type="TEXT" name="product_price" size="7" placeholder="套餐價格"/></td>
					<span id="ppi"></span>
			</div>
			
			<div class="st1">
					<td><font class="font1">上架/下架:</font></td>
					<td>
					<select name="inMenu" class="font1" style="font-size: 20px;color:gray;font-weight: bold;">
							<option value="1">上架中</option>
							<option value="0">下架中</option>
					</select>
					</td>
			</div>
			
			<div class="st1">		
					<td><font class="font1">簡介:</font></td><br>
					<td><textarea cols="40" rows="5" name="product_intro" style="font-size:25px;font-family: ShowWind;font-weight: bold;"></textarea></td>
			</div>

					<td><font class="font1">商品圖片:</font></td>
					<font class="font1" style="font-size:20px">
					<td><input type="file" name="NewFileUp" id="NewFileUp"
						size="50" maxlength="20"></td></font>
				
				
			<br>
			<div align="center">
			<img id="Browse" src="" alt="上傳的圖片將能先在此預覽" width="500" height="400" border="1px" />
			</div>
			<br> 
			<div align="center">
				<input type="hidden" name="product_kind" value="2"> 
				<input type="hidden" name="action" value="insertPackage"> 
				<input type="button" value="新增" id="allbutton" class="btn btn-warning" style="font-family:ShowWind;font-size:20px">
			</div>
		</FORM>
</div>
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
			            <li><a href="../emp/EmpRegister.jsp">註冊</a></li>
			         	<li><a href="../emp/all_emp.jsp">修改</a></li> 
		             </ul>
		        </li>
		        <li><a href="../schedule/schedule.jsp"><i class="fa fa-calendar"></i><span>班表</span></a></li>
<!-- 		        <li><a><i class="fa fa-calendar"></i><span>班表</span><span class="fa fa-angle-right" style="float: right"></span></a> -->
<!-- 		         	<ul id="menu-academico-sub" > -->
<!-- 			            <li><a href="../index.jsp">新增</a></li> -->
<!-- 			         	<li><a href="../index.jsp">修改</a></li> -->
<!-- 		             </ul> -->
<!-- 		        </li> -->
		        <li id="menu-academico" ><a><i class="fa fa-cutlery"></i><span>菜單</span><span class="fa fa-angle-right" style="float: right"></span></a>
		          <ul id="menu-academico-sub" >
			          <li><a href="../product/listAllPro.jsp">菜色查詢</a></li>
			          <li><a href="../product/select_online_page.jsp">上架產品查詢</a></li>
			          <li><a href="../product/select_offline_page.jsp">下架產品查詢</a></li>
			          <li><a href="../product/addSinglePro.jsp">新增菜色</a></li>
			          <li><a href="AddPack.jsp">新增套餐</a></li>
			          <li><a href="UpdatePro.jsp">套餐查詢修改</a></li>            
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
