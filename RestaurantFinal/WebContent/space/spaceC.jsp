<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<title>新增場地</title>
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
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/sweetalert.css">
 <script>
$(document).ready(function() {
	
	sweetAlert({   title: "場地名稱!",   
//			text: "Write something interesting:",   
		type: "input",   
		showCancelButton: true,   
		closeOnConfirm: false,   
		animation: "slide-from-top",   
		inputPlaceholder: "請輸入場地名稱" }, 
		function(inputValue){   
			if (inputValue === false) {
				location.replace("../index.jsp");
				return false;
			}if (inputValue === "") {     
				sweetAlert.showInputError("名稱不可空白!");     
				return false 
			}
			if (inputValue.trim() === "") {     
				sweetAlert.showInputError("請輸入非空白字元!");     
				return false 
			}

			
			$('#space_name').text("場地名稱:"+inputValue);
			
			$.post("spacename.do",{"space_name":inputValue,"whatdo":"addspace"},function(data){
// 				console.log(data);
				
				if(data=="falsex"){

					sweetAlert.showInputError("場地名稱已存在!!!!");     
					return false
				
				}else{
						sweetAlert("Nice!", "場地名稱 : " + inputValue, "success"); 
					}
			});
			
		});



	$('#dragThis,#dragBigx,#dragBigy').draggable(
	    {
	        containment: $('#dropHere'),
	        cursor:'crosshair',
			helper:'clone',
			appenTo:'#dropHere',
			start:function(event,ui){
				if($(this).attr("id")=="dragThis")
					ui.helper.addClass("showx").addClass("small");
				if($(this).attr("id")=="dragBigx")
					ui.helper.addClass("showx").addClass("bigx");
				if($(this).attr("id")=="dragBigy")
					ui.helper.addClass("showx").addClass("bigy");
			},
	        stop: function(event,ui){
	            var copy = $(ui.helper.clone());
	            copy.find('div:lt(2),div:eq(5)').removeAttr("hidden");
	            copy.find('input:eq(2)').val(ui.position.left);
	            copy.find('input:eq(3)').val(ui.position.top);
	            $('#dropHere').append(copy);
	        }
	    });
	
	$(document).on('mouseover','.showx',function(){
		$(this).draggable(
			    {
			        containment: $('#dropHere'),
			        cursor:'crosshair',
					appenTo:'#dropHere',
					drag:function(event,ui){
						$(this).find('input:eq(2)').val(ui.position.left);
			            $(this).find('input:eq(3)').val(ui.position.top);
					},
			        stop: function(event,ui){

			        }
			    });
 	});
	
	
	$('#dropHere').droppable(
	    {
	        accept: '.showx',
	        start : function(){
	            $('#dragThis').draggable('option','containment',$(this));
	        }
	    });
	
	var error="";
	$('#submitx').click(function(){
		error="";
		var arr = $('.showx');
		var tnamearr= arr.find("input:eq(0)");
		var tpeoplearr= arr.find("input:eq(1)");
		var xxx=[];
		for(var i=0;i<tnamearr.length;i++){
			xxx.push(tnamearr[i].value);
			if(tnamearr[i].value.trim()==""){
				error+="桌位不可為空白";
				break;
			}
			if(tpeoplearr[i].value.trim()==""){
				error+="人數不可為空白";
				break;
			}
			if(isNaN(tpeoplearr[i].value)){
				error+="人數請輸入數字";
				break;
			}
		}
		for(var i=0;i<xxx.length;i++){
			var tindex = xxx.indexOf(xxx[i]);
			if(tindex!=i){
				error+="桌位名稱不可重複";
				break;
			}
		}
		if(error==""){
			if($('#dropHere').html()!=""){
				var arrary = $('.showx');
				$.each(arrary,function(index,value){
					var text = "";
					var arr = $(this).find('input');
					$.each(arr,function(idx,va){
						if(idx==(arr.length-1))
							text+=$(this).val();
						else
							text+=$(this).val()+",";
					});
					$.post("spacename.do",{"text":text,"whatdo":"addspaceX","spacename":$('#space_name').text().substring(5)}
									,function(){
						location.replace("spaceQ.jsp");
					});
				});
			}else{
				sweetAlert("請新增桌子");
			}
		}else{
			sweetAlert(error);
		}
	});
	
	
	$(document).on('click','input[value="刪除"]',function(){
		$(this).parent().parent().remove();
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
	background-color:#F5F6CE;
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
.showx {
	padding: 0.5em;
	border: 3px solid #ccc;
	border-radius: 20px 20px;
	background-color: #fff;
	background-color: rgba(255,255,255,0.5);
	text-align:center;
	font-family:ShowWind;
	font-weight: bold;
}
.small{
	width: 150px;
    height: 150px;
    font-size: 25px;
}
.bigx{
	width: 300px;
    height: 150px;
    font-size: 25px;
}
.bigy{
	width: 150px;
    height: 300px;
    font-size: 25px;
}
#dragThis{
	width: 50px;
    height: 50px;
    border: 3px solid #ccc;
/*     background-color: #ccc; */
	background-image:url("../icon/wood.png");
}
#dragBigx{
	width: 100px;
    height: 50px;
    border: 3px solid #ccc;
/*     background-color: #ccc; */
    background-image:url("../icon/wood.png");
}
#dragBigy{
	width: 50px;
    height: 100px;
    border: 3px solid #ccc;
/*     background-color: #ccc; */
	background-image:url("../icon/wood2.png");
}
div input{
	width: 60px;
 	margin:1px 0px; 
}
.bigy input[name="table_name"]{
	margin-top:80px;
}

#dropHere {
    width: 100%;
    height: 700px;
    padding: 0.5em;
    border: 3px solid #f90;
    border-radius: 1em;
    margin: 0 auto;
    position:relative;
}
.fontStyle{
	font-family:ShowWind;
	font-size:40px;
	font-weight:bold;
}
.fontbig{
	font-size:18px;
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
    
	<div >
<!-- 		<span id="space_name" class="fontStyle" style="display: inline-block">場地名稱:</span> -->

		<table width=100% >
		<tr><td id="space_name" class="fontStyle" style="width:65%">場地名稱:</td>
			<td class="fontStyle" align="center">桌位樣式:</td>
			<td "><div id="dragThis">
					<div hidden>桌號<input type="text" name="table_name" /></div>
					<div hidden>人數<input type="text" name="table_maxP" /></div>
			    	<div hidden><input type="text" name="table_x" /></div>
			        <div hidden><input type="text" name="table_y" /></div>
			        <div hidden><input type="text" name="table_size" value="small" /></div>
			        <div hidden><input type="button" value="刪除" class="btn btn-warning fontbig"/></div>
			</div></td>
			<td><div id="dragBigx">
					<div hidden>桌號<input type="text" name="table_name" /></div>
					<div hidden>人數<input type="text" name="table_maxP" /></div>
			    	<div hidden><input type="text" name="table_x" /></div>
			        <div hidden><input type="text" name="table_y" /></div>
			        <div hidden><input type="text" name="table_size" value="bigx" /></div>
			        <div hidden><input type="button" value="刪除" class="btn btn-warning fontbig" /></div>
			</div></td>
			<td><div id="dragBigy">
					<div hidden>桌號<input type="text" name="table_name" /></div>
					<div hidden>人數<input type="text" name="table_maxP" /></div>
			    	<div hidden><input type="text" name="table_x" /></div>
			        <div hidden><input type="text" name="table_y" /></div>
			        <div hidden><input type="text" name="table_size" value="bigy" /></div>
			        <div hidden><input type="button" value="刪除" class="btn btn-warning fontbig"/></div>
			</div></td>
		</tr>
		</table>
	</div>
	<div id="dropHere" ></div>
	<div align="right">
		<button id="submitx" type="submit" class="btn btn-primary fontStyle">送出</button>
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
		            <li><a href="spaceC.jsp">新增場地</a></li>
		            <li><a href="spaceQ.jsp">查詢場地</a></li>
		            <li><a href="spaceU.jsp">修改場地</a></li>		            
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
