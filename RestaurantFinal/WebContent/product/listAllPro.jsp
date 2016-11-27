<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%@ page import="com.product.model.*"%>
<%
	ProductService proSvc = new ProductService();
	List<ProductVO> list = proSvc.getSingle();
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE HTML>
<html>
<head>
<title>所有商品資料</title>
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
	
	var del=null;
	$("input[name='delete']").click(function(){
		del=$(this);
		sweetAlert({
			  title: "此事當真?",
			  text: "您確定要將此筆資料刪除嗎?",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonColor: "#DD6B55",
			  confirmButtonText: "刪除此筆資料",
			  cancelButtonText: "放棄刪除",
			  closeOnConfirm: false,
			  closeOnCancel: false
			},
			function(isConfirm){
			  if (isConfirm) {
				  del.parent().submit();
			  } else {
				 sweetAlert("已取消", "您已取消刪除此筆資料", "error");
			  }
			});
	})
																
});
</script>
<!--pop up end here-->
<style>
 body,.inner-block{ 
background-color:black;
/* 	background: #000 url(../img/003.jpg) center center fixed no-repeat; */
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
@font-face {  
  font-family: "ShowWind";  
  src: url("../font/ShowWind.ttc");  
}
td{
font-family: ShowWind;
font-size:30px;
color:white;
background-color:rgba(0,0,0,0);
text-align: center;
}
b{
font-family: ShowWind;
font-size:18px;
font-weight:bold;
}
/* #bbody{ */
/* background: black; */
/* } */
th{
font-family: ShowWind;
font-size:30px;
font-weight:bold;
color:white;
background-color:rgba(0,0,0,0);
text-align: center
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
		
 		<img src="../img/prologototal.png"><br> 
<!-- 		<a href="../index.jsp"><img src="../img/TOTAL.png"></a><br> -->
<br>
		<table align="center" class="table" style="width: 1350px">
			<tr>
				<th>商品編號</th>
				<th>商品名稱</th>
				<th>產品圖片</th>
				<th>售價</th>
				<th>商品類別</th>
				<th>上架/下架</th>
				<th>修改</th>
				<th>刪除</th>
			</tr>
			
			
		<%@ include file="../page1.file"%>
			<c:forEach var="proVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
				<tr align='center'>
					<td>${proVO.product_id}</td>
					<td>${proVO.product_name}</td>	
				<td><img width="240" height="160" src="${pageContext.servletContext.contextPath}/getImage?id=${proVO.product_id}"></td>
					<td>${proVO.product_price}</td>
					<td>${proVO.getDishClassVO().getClass_name()}</td>
					<td><c:if test="${proVO.inMenu==1}">上架中</c:if><c:if test="${proVO.inMenu==0}">下架中</c:if></td>

					<td>
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/pro.do">
							<input type="submit" value="修改" class="btn btn-primary" style="font-family:ShowWind;font-size:18px"> 
							<input type="hidden" name="product_id" value="${proVO.product_id}"> 
							<input type="hidden" name="action" value="getOne_For_Update">
						</FORM>
					</td>
					
					<td>
						<FORM METHOD="post" name="DleteForm" ACTION="<%=request.getContextPath()%>/product/pro.do">
							<input type="button" name="delete" value="刪除" class="btn btn-primary" style="font-family:ShowWind;font-size:18px"> 
							<input type="hidden" name="product_id" value="${proVO.product_id}">
							<input type="hidden" name="action" value="delete">
						</FORM>
					</td>
				</tr>
				
			</c:forEach>
			
		</table>
		
		<%@ include file="../page2.file"%>
		
	</div>
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
