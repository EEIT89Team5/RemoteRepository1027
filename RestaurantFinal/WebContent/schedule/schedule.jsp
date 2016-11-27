<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<title>班表</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />


<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<link href="../css/style.css" rel="stylesheet" type="text/css" media="all"/>
<script src="../js/jquery-3.1.1.min.js"></script> 
<script src="../js/jquery.magnific-popup.js" type="text/javascript"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script> -->
<link href="../css/font-awesome.css" rel="stylesheet"> 
<link rel="stylesheet" href="../css/fullcalendar.css">
<!-- <script src="../js/event.js"></script> -->
<script src="../js/moment.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/fullcalendar.min.js"></script>
<script src="../js/locale-all.js"></script>
<link rel="Shortcut Icon" type="image/png" href="../icon/pagelogo.png" />
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
	
	var selectmonth=$('#prevselmonth').val();
    if(selectmonth!=""){
    	$('#calendar').fullCalendar({
    		locale: 'zh-tw',
    		header: {
    			left: 'prev,next',
    			center: 'title',
    			right: null
    		},
    		defaultDate:selectmonth,
    		views:{
    			month:{
    				titleFormat:'YYYY-MM'
    			}
    		},
    		fixedWeekCount:false
    	});
    }else{
    	$('#calendar').fullCalendar({
    		locale: 'zh-tw',
    		header: {
    			left: 'prev,next',
    			center: 'title',
    			right: null
    		},
    		views:{
    			month:{
    				titleFormat:'YYYY-MM'		
    			},
    		},
    		fixedWeekCount:false
    	});
    }
    
	$('div[class="fc-bg"] td').css("border","2px solid gray").html('<div style="height:50%;background:rgba(0,0,0,0.3);color:white" name="午班">&nbsp;</div><div style="height:50%;background:rgba(255,255,255,0.3);color:black" name="晚班">&nbsp;</div>');
	$('div[class="fc-bg"] td div').attr("data-toggle","modal").attr("data-target","#myModal");
	$('div[class="fc-bg"] td[class*=" fc-other-month"]').empty().css("background-color","lightgray");
	
	var monthDate=$("#calendar h2").text();
	var dd=monthDate.split('-')
	
	$("#calendar h2").html('<font style="color:white">'+dd[0]+'年'+dd[1]+'月 班表</font>');
	
	$.getJSON("schedule.do",{"action":"getAllByMonth","monthDate":monthDate},function(datass){
		var divv = $('div[class="fc-bg"]');
		$.each(datass,function(index,value){
			var datediv = divv.find('td[data-date="'+datass[index].date+'"]');
			var timeperioddiv = datediv.find('div[name="'+datass[index].timeperiod+'"]');
			var array = timeperioddiv.text().split(" ");
			if((array.length-1)%2==0){
				if((array.length-1)==0){
					timeperioddiv.text("");
				}else{				
					timeperioddiv.append("<br />");
				}
			}
			timeperioddiv.append(datass[index].name+" ");
		})
	});
	
	
	$('div[class="fc-bg"] td div').click(function(){
		$('input[name="emps"]').prop("checked",false);
		var prevemps=$(this).text().split(" ");
		var empslabel=$('#empform label');
		$.each(prevemps,function(i,v){
// 			console.log(i+"----->"+prevemps[i]);
			$.each(empslabel,function(ii,vv){
				if(prevemps[i].trim()==empslabel[ii].innerHTML){
					($(this).prev()).prop("checked",true);
// 					console.log(ii+"/////////"+$(this).text());
				}
			});
		});
		$("#scheduledate").val(($(this).parent('td')).attr("data-date"));
		$("#timeperiod").val($(this).attr("name"));
		$('#myModalLabel').html(($(this).parent('td')).attr("data-date")+" "+$(this).attr("name"));
		var modeltotal=$('#myModalLabel').text();
		var modelyyymm=modeltotal.split("-");
		var modeldd=modelyyymm[2].split(" ");
		$('#myModalLabel').html("<td>"+modelyyymm[0]+"年"+modelyyymm[1]+"月"+modeldd[0]+"日"+" <font>"+modeldd[1]+"</font></td>")
		
	});
	
	
	
<%--按下往下一月和上一月的button會執行的程式碼--%>
	
	$('div[class="fc-button-group"] button').click(function(){
		$('div[class="fc-bg"] td').css("border","2px solid gray").html('<div style="height:50%;background:rgba(0,0,0,0.3);color:white" name="午班">&nbsp;</div><div style="height:50%;background:rgba(255,255,255,0.3);color:black" name="晚班">&nbsp;</div>');
		$('div[class="fc-bg"] td div').attr("data-toggle","modal").attr("data-target","#myModal");
		$('div[class="fc-bg"] td[class*=" fc-other-month"]').empty().css("background-color","lightgray");
		
		monthDate=$("#calendar h2").text();
		dd=monthDate.split("-")
		$("#calendar h2").html('<font style="color:white">'+dd[0]+'年'+dd[1]+'月 班表</font>');
		$.getJSON("schedule.do",{"action":"getAllByMonth","monthDate":monthDate},function(datass){
			var divv = $('div[class="fc-bg"]');
			$.each(datass,function(index,value){
				var datediv = divv.find('td[data-date="'+datass[index].date+'"]');
				var timeperioddiv = datediv.find('div[name="'+datass[index].timeperiod+'"]');
				var array = timeperioddiv.text().split(" ");
				if((array.length-1)%2==0){
					if((array.length-1)==0){
						timeperioddiv.text("");
					}else{				
						timeperioddiv.append("<br />");
					}
				}
				timeperioddiv.append(datass[index].name+" ");
			})
		});
		
		$('div[class="fc-bg"] td div').click(function(){
			$('input[name="emps"]').prop("checked",false);
			var prevemps=$(this).text().split(" ");
			var empslabel=$('#empform label');
			$.each(prevemps,function(i,v){
// 				console.log(i+"----->"+prevemps[i]);
				$.each(empslabel,function(ii,vv){
					if(prevemps[i].trim()==empslabel[ii].innerHTML){
						($(this).prev()).prop("checked",true);
//	 					console.log(ii+"/////////"+$(this).text());
					}
				});
			});
			$("#scheduledate").val(($(this).parent('td')).attr("data-date"));
			$("#timeperiod").val($(this).attr("name"));
			$('#myModalLabel').html(($(this).parent('td')).attr("data-date")+" "+$(this).attr("name"));
			var modeltotal=$('#myModalLabel').text();
			var modelyyymm=modeltotal.split("-");
			var modeldd=modelyyymm[2].split(" ");
			$('#myModalLabel').html("<td>"+modelyyymm[0]+"年"+modelyyymm[1]+"月"+modeldd[0]+"日"+" <font color:red>"+modeldd[1]+"</font></td>")
		});
		

	});
																

	
});
</script>
<!--pop up end here-->
<style>
body,.inner-block{
/*  	background-color:white;  */
 	background-image: url("../img/21.jpg");
}
.clerfix{
	border-style:solid;
}
th{
font-family:ShowWind;
height: 60px;
text-align: center;
font-size:35px;
font-weight: bold;
color:white
}
.titlebar{
	background-color:black;
	background-size: cover;
}
#menu span{
	position:absolute;
}

#calendar {
	width: 1500px;
	margin: 0 auto;
	overflow-y: auto;
	z-index:0;
}
.fixed {
    z-index: 100;
}
	
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
 
span[class="fc-day-number"]{
 	font-size: 20px;
 	font-weight: bold;
 	background-color:rgba(249, 249, 124, 0.8)
}
div[class="fc-bg"] td div{
	font-family:ShowWind;
 	font-size: 25px;
 	font-weight: bold;
}
div[class="fc-row fc-week fc-widget-content"]{
	height: 150px;
}
div[name="午班"],div[name="晚班"]{ 
 	overflow-y: auto; 
 	padding: 8px 13px;
} 
#calendar h2{
	font-family:ShowWind;
 	font-size: 50px;
 	font-weight: bold;
}
td{
font-family:ShowWind;
}
font{
 color:red
}

</style>
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

<div id="calendar"></div>

<input hidden id="prevselmonth" value="${calendar}" />

<jsp:useBean id="empvo" class="com.emp.model.EmpService" />
<!-- 	<div style="height: 50%;"></div> -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
<!--         <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--           <span aria-hidden="true">&times;</span> -->
<!--         </button> -->
        <h2 class="modal-title text-center" id="myModalLabel" ></h2>
      </div>
      <div class="modal-body">
      		<br />
<!-- 			<button id="people" type="button" class="btn btn-warning btn-lg btn-block">入座資訊</button><br /> -->
			
			<form id="empform" role="form" action='schedule.do' style="height:100px">
				   <input hidden id="scheduledate" name="scheduledate" value="" />
				   <input  hidden name="action" value="insertschedule" />
<!-- 				   <select id="timeperiod" name="timeperiod"> -->
<!-- 				   		<option value="午班">午班</option> -->
<!-- 				   		<option value="晚班">晚班</option> -->
<!-- 				   </select> -->
<!-- 				   <select multiple="multiple" name="emps"> -->
<%-- 				   <c:forEach var="empx" items="${empvo.getAll2()}"> --%>
<%-- 				   		<option value="${empx.emp_id}">${empx.emp_name}</option> --%>
<%-- 				   </c:forEach> --%>
<!-- 				   </select> -->
					<input hidden id="timeperiod" name="timeperiod" value="" />
					<c:forEach var="empx" items="${empvo.getAll2()}"> 
						<span>
							<input id="${empx.emp_id}" type="checkbox" value="${empx.emp_id}" name="emps" /><label for="${empx.emp_id}">${empx.emp_name}</label>
				   		</span>
				   </c:forEach>
					<br />
					<br />
			<button type="submit" class="btn btn-primary btn-lg btn-block">確認</button><br /><br />
			</form>
			
<!-- 			<a href="formatTable.do" id="paymoney" class="btn btn-primary btn-lg btn-lg btn-block" role="button">確認</a><br /><br /> -->
<!-- 			<a href="formatTable.do" id="clear" class="btn btn-danger btn-lg  btn-lg btn-block" role="button">清空</a><br /><br /> -->
			

<!-- 			<!-- 提供額外視覺上的重量和識別一組按鈕中主要的操作項目 --> 
<!-- 			<!-- 指出危險或潛在負面作用的行動 --> 
<!-- 			<button type="button" class="btn btn-danger btn-lg btn-block">清空</button><br /><br /> -->
      </div>
      <div class="modal-footer">
<!--         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
<!--         <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
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
		        <li><a><i class="fa fa-calendar"></i><span>班表</span><span class="fa fa-angle-right" style="float: right"></span></a>
		         	<ul id="menu-academico-sub" >
			            <li><a href="schedule.jsp">新增班表</a></li>
			         	<li><a href="eachSchedule.jsp">查詢個人班表</a></li>
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
