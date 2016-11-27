<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.product.model.ProductVO"%>
<%@ page import="com.product.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE HTML>
<html>
<head>
<title>上架菜色</title>
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
	
	$('input[name="product_id"]').click(function() {

		$('div[align="center"] div').attr("hidden", "hidden");
		var aa = $(this).val();
		var bb = "#" + aa;

		$(bb).removeAttr("hidden");
	});
});
																
</script>
<!--pop up end here-->
<style>
body,.inner-block{
 	background-color:black;
	background: #000 url(../img/0003.jpg) center center fixed no-repeat;
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
th{
font-family: ShowWind;
font-size:25px;
font-weight:bold;
color:white;
background-color:rgba(0,0,0,0);
text-align: center
}
td{
font-family: ShowWind;
font-size:35px;
color:white;
background-color:rgba(0,0,0,0);
text-align: center;
}
#bbody{
background: #333;
}
@font-face {  
  font-family: "ShowWind";  
  src: url("../font/ShowWind.ttc");  
}
font{
font-family: ShowWind;
color:white;
font-size:30px
}
img{
webkit-border-radius: 10px;
moz-border-radius: 10px;
border-radius: 10px;
}
</style>
<link rel="Shortcut Icon" type="image/png" href="../icon/pagelogo.png" />
</head>
<%
	ProductVO proVO = (ProductVO) request.getAttribute("proVO");

	ProductService proSvc = new ProductService();
	List<ProductVO> getAppetizer = proSvc.getOneClass(10,1);
	pageContext.setAttribute("getAppetizer", getAppetizer);
	List<ProductVO> getSalad = proSvc.getOneClass(20,1);
	pageContext.setAttribute("getSalad", getSalad);
	List<ProductVO> getSoup = proSvc.getOneClass(30,1);
	pageContext.setAttribute("getSoup", getSoup);
	List<ProductVO> getMain = proSvc.getOneClass(40,1);
	pageContext.setAttribute("getMain", getMain);
	List<ProductVO> getDessert = proSvc.getOneClass(50,1);
	pageContext.setAttribute("getDessert", getDessert);
	List<ProductVO> getDrink = proSvc.getOneClass(60,1);
	pageContext.setAttribute("getDrink", getDrink);
%>
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
<div class="inner-block" >
<div class="price-block-main" >
<div align="center">
		<img src="../img/PROONLINE.png"><br>
<!-- 		<a href="../index.jsp"><img src="../img/ONLINE.png"></a> -->

<br>
<br>
		<input type="radio" name="product_id" value="Appetizer"><font>前菜</font>
		<input type="radio" name="product_id" value="Salad"><font>沙拉</font>
		<input type="radio" name="product_id" value="Soup"><font>湯品</font>
		<input type="radio" name="product_id" value="Main"><font>主菜</font>
		<input type="radio" name="product_id" value="Dessert"><font>甜點</font>
		<input type="radio" name="product_id" value="Drink" ><font>飲料</font>
	<br>
	<br>
	
				<div id="Appetizer" hidden>
	<table align="center" class="table" style="width: 1400px">
	

		
	<tr>
				<th>商品編號</th>
				<th>商品名稱</th>
				<th>售價</th>
				<th>商品類別</th>
				<th>商品圖片</th>
				<th>上架</th>

	</tr>
	
				<c:forEach var="getAppetizer" items="${getAppetizer}">
	<tr>	
						<td>${getAppetizer.product_id}</td>
						<td>${getAppetizer.product_name}</td>
						<td>${getAppetizer.product_price}</td>
						<td>${getAppetizer.dishClassVO.class_name}</td>
						<td><img width="300" height="200" src="${pageContext.servletContext.contextPath}/getImage?id=${getAppetizer.product_id}"></td>
						<td><c:if test="${getAppetizer.inMenu==1}">上架中</c:if><c:if test="${getAppetizer.inMenu==0}">下架中</c:if></td>
	</tr>			
				</c:forEach>
				</table>
			</div>
		
	<div id="Salad" hidden>
		<table align="center" class="table" style="width: 1400px">
	<tr>
				<th>商品編號</th>
				<th>商品名稱</th>
				<th>售價</th>
				<th>商品類別</th>
				<th>商品圖片</th>
				<th>上架</th>

	</tr>
	
				<c:forEach var="getSalad" items="${getSalad}">
	<tr>	
						<td>${getSalad.product_id}</td>
						<td>${getSalad.product_name}</td>
						<td>${getSalad.product_price}</td>
						<td>${getSalad.dishClassVO.class_name}</td>
						<td><img width="300" height="200" src="${pageContext.servletContext.contextPath}/getImage?id=${getSalad.product_id}"></td>
						<td><c:if test="${getSalad.inMenu==1}">上架中</c:if><c:if test="${getSalad.inMenu==0}">下架中</c:if></td>
	</tr>			
				</c:forEach>
				</table>
	</div>	
		
	<div hidden id="Soup">
		<table align="center" class="table" style="width: 1400px">

			<tr>
				<th>商品編號</th>
				<th>商品名稱</th>
				<th>售價</th>
				<th>商品類別</th>
				<th>商品圖片</th>
				<th>上架</th>

	</tr>
	
				<c:forEach var="getSoup" items="${getSoup}">
	<tr>	
						<td>${getSoup.product_id}</td>
						<td>${getSoup.product_name}</td>
						<td>${getSoup.product_price}</td>
						<td>${getSoup.dishClassVO.class_name}</td>
						<td><img width="300" height="200" src="${pageContext.servletContext.contextPath}/getImage?id=${getSoup.product_id}"></td>
						<td><c:if test="${getSoup.inMenu==1}">上架中</c:if><c:if test="${getSoup.inMenu==0}">下架中</c:if></td>
	</tr>			
				</c:forEach>

		</table>
	</div>
		
	
		
	<div hidden id="Main">
		<table align="center" class="table " style="width: 1400px">

			<tr>
				<th>商品編號</th>
				<th>商品名稱</th>
				<th>售價</th>
				<th>商品類別</th>
				<th>商品圖片</th>
				<th>上架</th>

	</tr>
	
				<c:forEach var="getMain" items="${getMain}">
	<tr>	
						<td>${getMain.product_id}</td>
						<td>${getMain.product_name}</td>
						<td>${getMain.product_price}</td>
						<td>${getMain.dishClassVO.class_name}</td>
						<td><img width="300" height="200" src="${pageContext.servletContext.contextPath}/getImage?id=${getMain.product_id}"></td>
						<td><c:if test="${getMain.inMenu==1}">上架中</c:if><c:if test="${getMain.inMenu==0}">下架中</c:if></td>
	</tr>			
				</c:forEach>

		</table>
	</div>
		
		
		
	<div hidden id="Dessert">
		<table align="center" class="table" style="width: 1400px">

			<tr>
				<th>商品編號</th>
				<th>商品名稱</th>
				<th>售價</th>
				<th>商品類別</th>
				<th>商品圖片</th>
				<th>上架</th>

	</tr>
	
				<c:forEach var="getDessert" items="${getDessert}">
	<tr>	
						<td>${getDessert.product_id}</td>
						<td>${getDessert.product_name}</td>
						<td>${getDessert.product_price}</td>
						<td>${getDessert.dishClassVO.class_name}</td>
						<td><img width="300" height="200" src="${pageContext.servletContext.contextPath}/getImage?id=${getDessert.product_id}"></td>
						<td><c:if test="${getDessert.inMenu==1}">上架中</c:if><c:if test="${getDessert.inMenu==0}">下架中</c:if></td>
	</tr>			
				</c:forEach>

		</table>
	</div>
		
		
		
	<div hidden id="Drink">
		<table align="center" class="table" style="width: 1400px">

			<tr>
				<th>商品編號</th>
				<th>商品名稱</th>
				<th>售價</th>
				<th>商品類別</th>
				<th>商品圖片</th>
				<th>上架</th>

	</tr>
	
				<c:forEach var="getDrink" items="${getDrink}">
	<tr>	
						<td>${getDrink.product_id}</td>
						<td>${getDrink.product_name}</td>
						<td>${getDrink.product_price}</td>
						<td>${getDrink.dishClassVO.class_name}</td>
						<td><img width="300" height="200" src="${pageContext.servletContext.contextPath}/getImage?id=${getDrink.product_id}"></td>
						<td><c:if test="${getDrink.inMenu==1}">上架中</c:if><c:if test="${getDrink.inMenu==0}">下架中</c:if></td>
	</tr>			
				</c:forEach>

		</table>
	</div>	

<br>
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
		        <li><a><i class="fa fa-calendar"></i><span>班表</span><span class="fa fa-angle-right" style="float: right"></span></a>
		         	<ul id="menu-academico-sub" >
			            <li><a href="../schedule/schedule.jsp">新增班表</a></li>
			         	<li><a href="../schedule/eachSchedule.jsp">查詢個人班表</a></li>
		             </ul>
		        </li>
		        <li id="menu-academico" ><a><i class="fa fa-cutlery"></i><span>菜單</span><span class="fa fa-angle-right" style="float: right"></span></a>
		          <ul id="menu-academico-sub" >
			          <li><a href="listAllPro.jsp">菜色查詢</a></li>
			          <li><a href="select_online_page.jsp">上架產品查詢</a></li>
			          <li><a href="select_offline_page.jsp">下架產品查詢</a></li>
			          <li><a href="addSinglePro.jsp">新增菜色</a></li>
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
