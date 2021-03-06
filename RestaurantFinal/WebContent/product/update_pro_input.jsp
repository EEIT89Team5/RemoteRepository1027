<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.product.model.*"%>

<%
	ProductVO proVO = (ProductVO) request.getAttribute("proVO");
%>

<!DOCTYPE HTML>
<html>
<head>
<title>商品修改</title>
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
	
	$("#FileUp").change(function(){
		if (this.files && this.files[0]) {
			var reader = new FileReader();
			
			reader.onload = function (e) {
				$('#Browse').attr('src', e.target.result);
			}
			
			reader.readAsDataURL(this.files[0]);
		}
	});
																
});
</script>
<!--pop up end here-->
<style>
body,.inner-block{
/* 	background-color:black; */
/* 	background: #000 url(../img/0003.jpg) center center fixed no-repeat; */
/* 	background-size: cover; */
/* 	moz-background-size: cover; */
background-color: black
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
  font-family: "BoldFace";  
  src: url("../font/ShowWind.ttc");  
}
#bbody{
background: black;
}
td{
font-family: BoldFace;
font-size:25px;
color:white;
background:black;
}
tr{
height: 50px
}
img{
webkit-border-radius: 10px;
moz-border-radius: 10px;
border-radius: 10px;
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
<div align="center">
	
<!-- <img src="../img/prologo.png"><br> -->
<a href="listAllPro.jsp"><img src="../img/PRODUCTUPDATE.png"></a>
	
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
<c:set var="proVO" value="${proVO}"></c:set>
<FORM  METHOD="post" ACTION="pro.do" name="form1" enctype="multipart/form-data" >

<table border="0">
	<tr>
		<td>商品編號:</td>
		<td><font color=red><%=proVO.getProduct_id()%></font></td>
	</tr>
	
	<tr>
		<td>商品名稱:</td>
		<td>
			<input class="form-control" type="TEXT" name="product_name" size="25"  style="color:black;width:350px;font-family:BoldFace;font-size:20px" value="${proVO.getProduct_name()}" />
		</td>
	</tr>
	
	<tr>
		<td>售價:</td>
		<td>
			<input class="form-control" type="TEXT" name="product_price" size="7"  style="color:black;width:100px;font-family:BoldFace;font-size:20px" value="${proVO.getProduct_price()}" />
		</td>
	</tr>
		
	<tr>
		<td>套餐:</td>

		<td>
	<font color=red><%=proVO.getProductKindVO().getKind_name()%></font>
		</td>
	</tr>
	
	<tr>
		<td>類別:</td>
		<td>
<select name="product_class"  style="color:black;">
	
　	<option value="10" <c:if test="${proVO.getDishClassVO().getClass_id()==10}">selected</c:if>>前菜</option>
　	<option value="20" <c:if test="${proVO.getDishClassVO().getClass_id()==20}">selected</c:if>>沙拉</option>
	<option value="30" <c:if test="${proVO.getDishClassVO().getClass_id()==30}">selected</c:if>>湯品</option>
	<option value="40" <c:if test="${proVO.getDishClassVO().getClass_id()==40}">selected</c:if>>主菜</option>
	<option value="50" <c:if test="${proVO.getDishClassVO().getClass_id()==50}">selected</c:if>>甜點</option>
	<option value="60" <c:if test="${proVO.getDishClassVO().getClass_id()==60}">selected</c:if>>飲料</option>
	
</select>
		</td>
</tr>


	<tr>
		<td>上架/下架:</td>
		<td>
<select name="inMenu"  style="color:black">
	　		<option value="1" <c:if test="${proVO.inMenu==1}">selected</c:if>>上架</option>
　			<option value="0" <c:if test="${proVO.inMenu==0}">selected</c:if>>下架</option>
</select>

		</td>
	</tr>
	
	<tr>
		<td>簡介:</td>
		<td>
			<textarea rows="4" class="form-control" style="width:350px;font-size:20px;color:black"  name="product_intro"  ><c:if test="${proVO.getProduct_price()!=null}"></c:if>${proVO.getProduct_intro()}</textarea>
		</td>
	</tr>
<tr><td>商品圖片:</td>

		<td>
			<input type="file" class="btn btn-default btn-file" style="background: #333;color:white" id="FileUp" name="FileUp" size="50" maxlength="20" width="500">
		</td>

	</tr>

</table>

<table>
	<tr>
<th><img src="../img/before.png" style="display:block;margin: auto"><br></th><th align="center"><img src="../img/after.png" style="display:block;margin: auto"><br></th>
	</tr>
<div>

	<tr>
		<td>
<img id="Browse" src="" alt="即將上傳的圖片預覽" width="500" height="400" border="1px"/>
		</td>

		<td>
<img width="500" height="400" src="${pageContext.servletContext.contextPath}/getImage?id=${proVO.product_id}">
		</td>
	</tr>
</div>

<br />

</table>
<br>

	<tr>
	
</table>

<br />

<input type="hidden" name="action" value="update">
<input type="hidden" name="product_id" value="${proVO.getProduct_id()}">
<input type="hidden" name="product_kind" value="<%=proVO.getProductKindVO().getKind_id()%>">

<input type="submit" value="修改" class="btn btn-warning" style="font-family:BoldFace;font-size:20px">

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
