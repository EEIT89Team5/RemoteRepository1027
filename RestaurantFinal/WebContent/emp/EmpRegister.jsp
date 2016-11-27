<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Employee Login</title>
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
<script src="../js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap-datepicker3.min.css">
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
	
	$("#userName").blur(function(){
		var count=0;
		var un=$("#userName").val()
			
		if(un==1){
			$("#idsp").html("<img src='../icon/xx.png' /><span style='color:#e2574c;font-size:18px'>姓名至少要兩個字以上</span>")
			$("#userName").focus();
			count++;
		}else if(un.trim()==""||un==null){
			$("#idsp").html("<img src='../icon/xx.png' /><span style='color:#e2574c;font-size:18px'>姓名不能空白</span>")
			$("#userName").focus();
			count++;
		}else if(un.match(/[^\u3447-\uFA29 a-z A-Z]/ig)){
			$("#idsp").html("<img src='../icon/xx.png' /><span style='color:#e2574c;font-size:18px'>必須為中文或英文</span>")
			$("#userName").focus();
			count++;
		}else{
			$("#idsp").html("<img src='../icon/oo.png' /><span style='color:#3db39e;font-size:18px'>格式正確</span>")
			count=0;
		}		
	})
		
	$("#salary").blur(function(){	
		var sal=$("#salary").val()
			
		if(sal==null||sal==""){
			$("#sap").html("<img src='../icon/xx.png' /><span style='color:#e2574c;font-size:18px'>薪資欄不能空白</span>")
			$("#salary").focus();
			count++;
		}else{
			$("#sap").html("<img src='../icon/oo.png' /><span style='color:#3db39e;font-size:18px'>格式正確</span>")
			count=0;
		}
	})
	
	$("#district").click(function(){
		var cou=$("#district").val()
			if(cou=="台北市"){
			$("#Taipei").removeAttr("hidden")
		}else{
			$("#Taipei").attr("hidden", "hidden")
		}
			if(cou=="基隆市"){
			$("#Keelung").removeAttr("hidden")
		}else{
			$("#Keelung").attr("hidden", "hidden")
		}
			if(cou=="新北市"){
				$("#Taipei2").removeAttr("hidden")
		}else{
				$("#Taipei2").attr("hidden", "hidden")
			}
			if(cou=="宜蘭縣"){
				$("#Yilan").removeAttr("hidden")
		}else{
				$("#Yilan").attr("hidden", "hidden")
			}
	
			if(cou=="新竹市"){
				$("#HsinchuCity").removeAttr("hidden")
		}else{
				$("#HsinchuCity").attr("hidden", "hidden")
			}
			if(cou=="新竹縣"){
				$("#Hsinchu").removeAttr("hidden")
		}else{
				$("#Hsinchu").attr("hidden", "hidden")
			}
			if(cou=="桃園縣"){
				$("#Taoyuan").removeAttr("hidden")
		}else{
				$("#Taoyuan").attr("hidden", "hidden")
			}
			if(cou=="苗栗縣"){
				$("#Miaoli").removeAttr("hidden")
		}else{
				$("#Miaoli").attr("hidden", "hidden")
			}
			if(cou=="台中市"){
				$("#Taichung").removeAttr("hidden")
		}else{
				$("#Taichung").attr("hidden", "hidden")
			}
			if(cou=="彰化縣"){
				$("#Changhua").removeAttr("hidden")
		}else{
				$("#Changhua").attr("hidden", "hidden")
			}
			if(cou=="南投縣"){
				$("#Nantou").removeAttr("hidden")
		}else{
				$("#Nantou").attr("hidden", "hidden")
			}
			if(cou=="嘉義縣"){
				$("#Chiayi").removeAttr("hidden")
		}else{
				$("#Chiayi").attr("hidden", "hidden")
			}
			if(cou=="雲林縣"){
				$("#Yunlin").removeAttr("hidden")
		}else{
				$("#Yunlin").attr("hidden", "hidden")
			}
			if(cou=="台南市"){
				$("#Tainan").removeAttr("hidden")
		}else{
				$("#Tainan").attr("hidden", "hidden")
			}
			if(cou=="高雄市"){
				$("#Kaohsiung").removeAttr("hidden")
		}else{
				$("#Kaohsiung").attr("hidden", "hidden")
			}		
			if(cou=="屏東縣"){
				$("#Pingtung").removeAttr("hidden")
		}else{
				$("#Pingtung").attr("hidden", "hidden")
			}		
			if(cou=="台東縣"){
				$("#Taitung").removeAttr("hidden")
		}else{
				$("#Taitung").attr("hidden", "hidden")
			}		
			if(cou=="花蓮縣"){
				$("#Hualien").removeAttr("hidden")
		}else{
				$("#Hualien").attr("hidden", "hidden")
			}	
			if(cou=="澎湖縣"){
				$("#Penghu").removeAttr("hidden")
		}else{
				$("#Penghu").attr("hidden", "hidden")
			}
		if(cou=="金門縣"){
				$("#Kinmen").removeAttr("hidden")
		}else{
				$("#Kinmen").attr("hidden", "hidden")
			}
		if(cou=="連江縣"){
				$("#Lienchiang").removeAttr("hidden")
		}else{
				$("#Lienchiang").attr("hidden", "hidden")
		}

	})
	
	$("#address").blur(function(){	
		var addr=$("#address").val()
			
		if(addr==null||addr==""){
			$("#sadd").html("<img src='../icon/xx.png' /><span style='color:#e2574c;font-size:18px'>地址欄不能空白</span>")
			$("#address").focus();
			count++;
		}else if(addr.length<8){
				$("#sadd").html("<img src='../icon/xx.png' /><span style='color:#e2574c;font-size:18px'>這不是正確的地址</span>")
				$("#address").focus();
			count++;
		}else{
			$("#sadd").html("<img src='../icon/oo.png' /><span style='color:#3db39e;font-size:18px'>格式正確</span>")
			count=0;
		}
	})

	$('#EmpBdate').datepicker({
		autoclose:true,
		format: 'yyyy-mm-dd',
	    startView:'decade'		
	});
	
	$('#Emphiredate').datepicker({
		autoclose:true,
		format: 'yyyy-mm-dd',
		todayBtn: "linked"		
	});

	var count=null;
$("#allbutton").click(function(){
	count=0;
	
	var name=$("input[name='emp_name']").val()
	var fulltime=$("input[name='emp_hiredate']").val()
	var salary=$("input[name='emp_salary']").val()
	var id=$("input[name='emp_idnumber']").val()
	var phone=$("input[name^='emp_phone']").val()
	var address=$("input[name='address']").val()	
	var bday=$("input[name='emp_birthday']").val()
	var emal=$("input[name='emp_email']").val()	
	
	if(name=null||name.trim()==""){
		$("#idsp").html("<img src='../icon/xx.png' /><span style='color:#e2574c;font-size:18px'>姓名不能空白</span>")
		count++;
	}

	if(fulltime=null || fulltime.trim()==""){
		$("#hiredate").html("<img src='../icon/xx.png' /><span style='color:red;font-size:18px'>到職日不能空白</span>")
		count++;
	}
	if(salary=null || salary.trim()==""){
		$("#sap").html("<img src='../icon/xx.png' /><span style='color:#e2574c;font-size:18px'>薪資欄不能空白</span>")
		count++;
	}
	if(phone=null || phone.trim()==""){
		$("#iphone").html("<img src='../icon/xx.png' /><span style='color:#e2574c;font-size:18px'>電話欄不能空白</span>")
		count++;
	}
	if(id=null || id.trim()==""){
		$("#idc").html("<img src='../icon/xx.png' /><span style='color:#e2574c;font-size:18px'>身分證不能空白</span>")
		count++;
	}
	if(address=null || address.trim()==""){
		$("#sadd").html("<img src='../icon/xx.png' /><span style='color:#e2574c;font-size:18px'>地址欄不能空白</span>")
		count++;
	}
	if(bday=null || bday.trim()==""){
		$("#bdy").html("<img src='../icon/xx.png' /><span style='color:#e2574c;font-size:18px'>生日欄不能空白</span>")
		count++;
	}
	if(emal=null || emal.trim()==""){
		$("#ema").html("<img src='../icon/xx.png' /><span style='color:#e2574c;font-size:18px'>信箱欄不能空白</span>")
		count++;
	}
	var ee=$("#EmpEmail").val()
	
	$.get("AccountCheck",{email:ee},function(data){
		
		if(data=="信箱已存在"||ee.trim()==""||ee==null){
			$("#ema").html("<img src='../icon/xx.png' /><span style='color:#e2574c;font-size:18px'>此信箱不可使用</span>")
			count++;
		}
		if(count==0){
			$("#allbutton").parent().parent().submit();
			$("#ress").attr("hidden", "hidden")
			$("#butt").html("<img src='../icon/load.gif' />")
		}
		})	
	})
	
	$("#EmpEmail").blur(function(){
		var ee=$("#EmpEmail").val()
		
		$.get("AccountCheck",{email:ee},function(data){
			
			if(data=="信箱已存在"||ee.trim()==""||ee==null){
				$("#ema").html("<img src='../icon/xx.png' /><span style='color:#e2574c;font-size:18px'>此信箱不可使用</span>")
				$("#EmpEmail").focus();
			}else{
				$("#ema").html("<img src='../icon/oo.png' /><span style='color:#3db39e;font-size:18px'>此信箱可安心使用</span>")	
			}
			
		})
		
	})
																
});
</script>
<!--pop up end here-->
<style>
body,.inner-block{
	background-image: url("../img/12.jpg"); 
/* 	background-size: 100% 100%; */
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
	height:850px;
	padding:20px;
	border-radius: 10px
	
}

.st1{
	margin: 10px
}
@font-face {  
  font-family: "ShowWind";  
  src: url("../font/ShowWind.ttc");  
}  
.font1{  
  font-family: "ShowWind"; 
  font-size:30px; 
  font-weight: normal;
  color: white
}
 span{ 
font-family: "ShowWind";
font-weight:bold; 
 }

::-webkit-input-placeholder { font-family:"ShowWind";font-size: 18px;font-weight:bold}
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
 <div id="Div1" align="left" style="border: 3px pink solid;background:rgba(0,0,0,0.7);">
              <br />
             <fieldset>
         <legend style="font-size: 40px;font-family:ShowWind;color: white;font-weight:bold">新增員工帳號</legend>
         
         <form name="myform" id="form1" method="post" action="emp.do">
       
        <div class="st1">
            
         <font class="font1">姓名:</font>
           	<input type="text" id="userName" name="emp_name" size="18" maxlength="10" placeholder="請輸入姓名" />
            <span id="idsp"></span>
          
            <br>
            <label class="font1" style="color:#9bff00; font-size:19px">(1.不可空白，2.至少兩個字以上，3.必須為中文或英文)</label> 
            
          
        </div>
        
         <div class="st1">
            
		 <font class="font1">性別:</font>	

		 		<input type="radio" name="emp_gender" value="男性"><font class="font1">男</font>
				<input type="radio" name="emp_gender" value="女性"><font class="font1">女</font>

        </div>
        <!--<hr>-->
        <div class="st1">
            
		<label style="margin-right:  25px"><font class="font1">職級:</font>
		<select name="emp_title" class="font1" style="font-size: 18px;color:gray">
				<option value="員工">員工</option>
				<option value="領班">領班</option>
				<option value="經理">經理</option>
			</select>
		</label>
		<label style="margin-left: 25px"><font class="font1">性質:</font>
		<select name="emp_fulltime" class="font1" style="font-size: 18px;color:gray">
				<option value="全職">全職</option>
				<option value="工讀">工讀</option>
			</select>
		</label>
		       
<!--        		<label style="margin-left: 25px">狀態:<select name="emp_status"> -->
<!-- 				<option value="在職中">在職中</option> -->
<!-- 				<option value="已離職">已離職</option> -->
<!-- 			</select> -->
<!-- 		</label> -->
        
		
        </div>
        
          <div class="st1">
        <div>
       	<font class="font1">到職日:</font><input type="text" id="Emphiredate" name="emp_hiredate">
        <span id="hiredate"></span>
    	</div>
	</div>
         <!--<hr>-->
        <div class="st1">
            
		<font class="font1">薪資:</font><input type="text" id="salary" name="emp_salary" placeholder="請輸入薪資">
             <span id="sap"></span>
            
            <br> 
            <label class="font1" style="color:#9bff00; font-size:19px">(1.薪資欄不可空白2.工讀請輸入時薪)</label>
        </div>
        
        <!--<hr>-->
        <div class="st1">
		<font class="font1">連絡電話:</font><input type="text" name="emp_phone1" size="3" maxlength="4">
			-<input type="text"  name="emp_phone2" size="2" maxlength="3">
			-<input type="text" name="emp_phone3" size="2" maxlength="3">
            <span id="iphone"></span>
        </div>
        <div class="st1">
       <font class="font1">身分證號碼:</font><input type="text" id="emp_idnumber" name="emp_idnumber" size="15" maxlength="10">
        	<span id="idc"></span>
        </div>
         <div class="st1">
		
         <div>
       <font class="font1">居住地:</font>
             <select id="district" name="district" class="font1" style="font-size: 18px;color:gray">
            	<option value="請選擇區域">請選擇區域</option>
            	<option value="台北市">台北市</option>
            	<option value="基隆市">基隆市</option>
            	<option value="新北市">新北市</option>
            	<option value="宜蘭縣">宜蘭縣</option>
            	<option value="新竹市">新竹市</option>
            	<option value="新竹縣">新竹縣</option>
            	<option value="桃園縣">桃園縣</option>
            	<option value="苗栗縣">苗栗縣</option>
            	<option value="台中市">台中市</option>
            	<option value="彰化縣">彰化縣</option>
            	<option value="南投縣">南投縣</option>
            	<option value="嘉義縣">嘉義縣</option>
            	<option value="雲林縣">雲林縣</option>
            	<option value="台南市">台南市</option>
            	<option value="高雄市">高雄市</option>
            	<option value="澎湖縣">澎湖縣</option>
            	<option value="屏東縣">屏東縣</option>
            	<option value="台東縣">台東縣</option>
            	<option value="花蓮縣">花蓮縣</option>
            	<option value="金門縣">金門縣</option>
            	<option value="連江縣">連江縣</option>
            </select>
           <select id="Taipei" name="addr" class="font1" style="font-size: 18px;color:gray" hidden>
            	<option value="請選擇區域">請選擇區域</option>
            	<option value="中正區">中正區</option>
            	<option value="中正區">大同區</option>
            	<option value="中山區">中山區</option>
            	<option value="松山區">松山區</option>
            	<option value="大安區">大安區</option>
            	<option value="萬華區">萬華區</option>
            	<option value="信義區">信義區</option>
            	<option value="士林區">士林區</option>
            	<option value="北投區">北投區</option>
            	<option value="內湖區">內湖區</option>
            	<option value="南港區">南港區</option>
            	<option value="文山區">文山區</option>
            </select>
             <select id="Keelung" name="addr" class="font1" style="font-size: 18px;color:gray" hidden>
            	<option value="請選擇區域">請選擇區域</option>
            	<option value="仁愛區">仁愛區</option>
            	<option value="信義區">信義區</option>
            	<option value="中正區">中正區</option>
            	<option value="中山區">中山區</option>
            	<option value="安樂區">安樂區</option>
            	<option value="暖暖區">暖暖區</option>
            	<option value="七堵區">七堵區</option>	
            </select>
            <select id="Taipei2" name="addr" class="font1" style="font-size: 18px;color:gray" hidden>
            	<option value="請選擇區域">請選擇區域</option>
            	<option value="萬里區">萬里區</option>
            	<option value="金山區">金山區</option>
            	<option value="板橋區">板橋區</option>
            	<option value="汐止區">汐止區</option>
            	<option value="深坑區">深坑區</option>
            	<option value="石碇區">石碇區</option>
            	<option value="瑞芳區">瑞芳區</option>
            	<option value="平溪區">平溪區</option>
            	<option value="雙溪區">雙溪區</option>
            	<option value="貢寮區">貢寮區</option>
            	<option value="新店區">新店區</option>
            	<option value="坪林區">坪林區</option>
            	<option value="烏來區">烏來區</option>
            	<option value="永和區">永和區</option>
            	<option value="中和區">中和區</option>
            	<option value="土城區">土城區</option>
            	<option value="三峽區">三峽區</option>
            	<option value="樹林區">樹林區</option>
            	<option value="鶯歌區">鶯歌區</option>
            	<option value="三重區">三重區</option>
            	<option value="新莊區">新莊區</option>
            	<option value="泰山區">泰山區</option>
            	<option value="林口區">林口區</option>
            	<option value="蘆洲區">蘆洲區</option>
            	<option value="五股區">五股區</option>
            	<option value="八里區">八里區</option>
            	<option value="淡水區">淡水區</option>	
            	<option value="三芝區">三芝區</option>
            	<option value="石門區">石門區</option>
            </select>
            <select id="Yilan" name="addr" class="font1" style="font-size: 18px;color:gray" hidden>
            	<option value="請選擇區域">請選擇區域</option>
            	<option value="宜蘭市">宜蘭市</option>
            	<option value="頭城鎮">頭城鎮</option>
            	<option value="礁溪鄉">礁溪鄉</option>
            	<option value="壯圍鄉">壯圍鄉</option>
            	<option value="員山鄉">員山鄉</option>
            	<option value="羅東鎮">羅東鎮</option>
            	<option value="三星鄉">三星鄉</option>
            	<option value="大同鄉">大同鄉</option>
            	<option value="五結鄉">五結鄉</option>
            	<option value="冬山鄉">冬山鄉</option>
            	<option value="蘇澳鎮">蘇澳鎮</option>
            	<option value="南澳鄉">南澳鄉</option>
            	<option value="釣魚台">釣魚台</option>
            </select>
            <select id="HsinchuCity" name="addr" class="font1" style="font-size: 18px;color:gray" hidden>
            	<option value="請選擇區域">請選擇區域</option>
            	<option value="東區">東區</option>
            	<option value="北區">北區</option>
            	<option value="香山區">香山區</option>

            </select>
                <select id="Hsinchu" name="addr" class="font1" style="font-size: 18px;color:gray" hidden>
            	<option value="請選擇區域">請選擇區域</option>
            	<option value="竹北市">竹北市</option>
            	<option value="湖口鄉">湖口鄉</option>
            	<option value="新豐鄉">新豐鄉</option>
            	<option value="新埔鎮">新埔鎮</option>
            	<option value="關西鎮">關西鎮</option>
            	<option value="芎林鄉">芎林鄉</option>
            	<option value="寶山鄉">寶山鄉</option>
            	<option value="竹東鎮">竹東鎮</option>
            	<option value="五峰鄉">五峰鄉</option>
            	<option value="橫山鄉">橫山鄉</option>
            	<option value="尖石鄉">尖石鄉</option>
            	<option value="北埔鄉">北埔鄉</option>
            	<option value="峨眉鄉">峨眉鄉</option>
            </select>
             <select id="Taoyuan" name="addr" class="font1" style="font-size: 18px;color:gray" hidden>
            	<option value="請選擇區域">請選擇區域</option>
            	<option value="中壢區">中壢區</option>
            	<option value="平鎮區">平鎮區</option>
            	<option value="龍潭區">龍潭區</option>
            	<option value="楊梅區">楊梅區</option>
            	<option value="新屋區">新屋區</option>
            	<option value="觀音區">觀音區</option>
            	<option value="大園區">桃園區</option>
            	<option value="龜山區">龜山區</option>
            	<option value="八德區">八德區</option>
            	<option value="大溪區">大溪區</option>
            	<option value="復興區">復興區</option>
            	<option value="復興區">大園區</option>
            	<option value="蘆竹區">蘆竹區</option>    	
            </select>
			<select id="Miaoli" name="addr" class="font1" style="font-size: 18px;color:gray" hidden>
            	<option value="請選擇區域">請選擇區域</option>
            	<option value="竹南鎮">竹南鎮</option>
            	<option value="頭份市">頭份市</option>
            	<option value="三灣鄉">三灣鄉</option>
            	<option value="南庄鄉">南庄鄉</option>
            	<option value="獅潭鄉">獅潭鄉</option>
            	<option value="後龍鎮">後龍鎮</option>
            	<option value="通霄鎮">通霄鎮</option>
            	<option value="苑裡鎮">苑裡鎮</option>
            	<option value="苗栗市">苗栗市</option>
            	<option value="造橋鄉">造橋鄉</option>
            	<option value="頭屋鄉">頭屋鄉</option>
            	<option value="公館鄉">公館鄉</option>
            	<option value="大湖鄉">大湖鄉</option>
            	<option value="泰安鄉">泰安鄉</option>
            	<option value="銅鑼鄉">銅鑼鄉</option>
            	<option value="三義鄉">三義鄉</option>
            	<option value="西湖鄉">西湖鄉</option>
            	<option value="卓蘭鎮">卓蘭鎮</option>
            </select>
			<select id="Taichung" name="addr" class="font1" style="font-size: 18px;color:gray" hidden>
            	<option value="請選擇區域">請選擇區域</option>
            	<option value="中區">中區</option>
            	<option value="東區">東區</option>
            	<option value="南區">南區</option>
            	<option value="西區">西區</option>
            	<option value="北區">北區</option>
            	<option value="北屯區">北屯區</option>
            	<option value="西屯區">西屯區</option>
            	<option value="南屯區">南屯區</option>
            	<option value="太平區">太平區</option>
            	<option value="大里區">大里區</option>
            	<option value="霧峰區">霧峰區</option>
            	<option value="烏日區">烏日區</option>
            	<option value="豐原區">豐原區</option>
            	<option value="后里區">后里區</option>
            	<option value="石岡區">石岡區</option>
            	<option value="東勢區">東勢區</option>
            	<option value="和平區">和平區</option>
            	<option value="新社區">新社區</option>
            	<option value="潭子區">潭子區</option>
            	<option value="大雅區">大雅區</option>
            	<option value="神岡區">神岡區</option>
            	<option value="大肚區">大肚區</option>
            	<option value="沙鹿區">沙鹿區</option>
            	<option value="龍井區">龍井區</option>
            	<option value="梧棲區">梧棲區</option>       	
            	<option value="清水區">清水區</option>
            	<option value="大甲區">大甲區</option>
            	<option value="外埔區">外埔區</option>
            	<option value="大安區">大安區</option>  	
            </select>
			<select id="Changhua" name="addr" class="font1" style="font-size: 18px;color:gray" hidden>
            	<option value="請選擇區域">請選擇區域</option>
            	<option value="彰化市">彰化市</option>
            	<option value="芬園鄉">芬園鄉</option>
            	<option value="花壇鄉">花壇鄉</option>
            	<option value="秀水鄉">秀水鄉</option>
            	<option value="鹿港鎮">鹿港鎮</option>
            	<option value="福興鄉">福興鄉</option>
            	<option value="線西鎮">線西鄉</option>
            	<option value="和美鎮">和美鎮</option> 	
            	<option value="伸港鄉">伸港鄉</option>
            	<option value="員林鎮">員林鎮</option>
            	<option value="社頭鄉">社頭鄉</option>
            	<option value="永靖鄉">永靖鄉</option>
            	<option value="埔心鄉">埔心鄉</option>
            	<option value="溪湖鎮">溪湖鎮</option>
            	<option value="大村鄉">大村鄉</option>
            	<option value="埔鹽鄉">埔鹽鄉</option>
            	<option value="田中鎮">田中鎮</option>
            	<option value="北斗鎮">北斗鎮</option>
            	<option value="田尾鄉">田尾鄉</option>
            	<option value="埤頭鄉">埤頭鄉</option>
            	<option value="溪州鄉">溪州鄉</option>
            	<option value="竹塘鄉">竹塘鄉</option>
            	<option value="二林鎮">二林鎮</option>
            	<option value="大城鄉">大城鄉</option>
            	<option value="芳苑鄉">芳苑鄉</option>
            	<option value="二水鄉">二水鄉</option>	
            </select>
            <select id="Nantou" name="addr" class="font1" style="font-size: 18px;color:gray" hidden>
            	<option value="請選擇區域">請選擇區域</option>
            	<option value="埔里鎮">埔里鎮</option>
            	<option value="草屯鎮">草屯鎮</option>
            	<option value="竹山鎮">竹山鎮</option>
            	<option value="集集鎮">集集鎮</option>
            	<option value="名間鄉">名間鄉</option>
            	<option value="鹿谷鄉">鹿谷鄉</option>
            	<option value="中寮鄉">中寮鄉</option>
            	<option value="魚池鄉">魚池鄉</option>
            	<option value="國姓鄉">國姓鄉</option>
            	<option value="水里鄉">水里鄉</option>
            	<option value="信義鄉">信義鄉</option>
            	<option value="仁愛鄉">仁愛鄉</option>
            </select>
            <select id="Chiayi" name="addr" class="font1" style="font-size: 18px;color:gray" hidden>
            	<option value="請選擇區域">請選擇區域</option>
            	<option value="番路鄉">番路鄉</option>
            	<option value="梅山鄉">梅山鄉</option>
            	<option value="竹崎鄉">竹崎鄉</option>
            	<option value="阿里山鄉">阿里山鄉</option>
            	<option value="中埔鄉">中埔鄉</option>
            	<option value="大埔鄉">大埔鄉</option>
            	<option value="水上鄉">水上鄉</option>
            	<option value="鹿草鄉">鹿草鄉</option>
            	<option value="太保市">太保市</option>
            	<option value="朴子市">朴子市</option>
            	<option value="東石鄉">東石鄉</option>
            	<option value="六腳鄉">六腳鄉</option>
            	<option value="新港鄉">新港鄉</option>
            	<option value="民雄鄉">民雄鄉</option>
            	<option value="大林鎮">大林鎮</option>
            	<option value="溪口鄉">溪口鄉</option>
            	<option value="義竹鄉">義竹鄉</option>
            	<option value="布袋鎮">布袋鎮</option>
            </select>
            <select id="Yunlin" name="addr" class="font1" style="font-size: 18px;color:gray" hidden>
            	<option value="請選擇區域">請選擇區域</option>
            	<option value="斗南鎮">斗南鎮</option>
            	<option value="大埤鄉">大埤鄉</option>
            	<option value="虎尾鎮">虎尾鎮</option>
            	<option value="土庫鎮">土庫鎮</option>
            	<option value="褒忠鄉">褒忠鄉</option>
            	<option value="東勢鄉">東勢鄉</option>	
            	<option value="臺西鄉">臺西鄉</option>
            	<option value="崙背鄉">崙背鄉</option>
            	<option value="麥寮鄉">麥寮鄉</option>
            	<option value="斗六市">斗六市</option>
            	<option value="林內鄉">林內鄉</option>
            	<option value="古坑鄉">古坑鄉</option>
            	<option value="莿桐鄉">莿桐鄉</option>
            	<option value="西螺鎮">西螺鎮</option>
            	<option value="二崙鄉">二崙鄉</option>
            	<option value="北港鎮">北港鎮</option>
            	<option value="水林鄉">水林鄉</option>
            	<option value="口湖鄉">口湖鄉</option>
            	<option value="四湖鄉">四湖鄉</option>
            	<option value="元長鄉">元長鄉</option>
            </select>
			<select id="Tainan" name="addr" class="font1" style="font-size: 18px;color:gray" hidden>
            	<option value="請選擇區域">請選擇區域</option>
            	<option value="中西區">中西區</option>
            	<option value="東區">東區</option>
            	<option value="南區">南區</option>
            	<option value="北區">北區</option>
            	<option value="安平區">安平區</option>
            	<option value="安南區">安南區</option>
            	<option value="永康區">永康區</option>
            	<option value="歸仁區">歸仁區</option>
            	<option value="新化區">新化區</option>
            	<option value="左鎮區">左鎮區</option>
            	<option value="玉井區">玉井區</option>
            	<option value="楠西區">楠西區</option>
            	<option value="南化區">南化區</option>
            	<option value="仁德區">仁德區</option>
            	<option value="關廟區">關廟區</option>
            	<option value="龍崎區">龍崎區</option>
            	<option value="官田區">官田區</option>
            	<option value="麻豆區">麻豆區</option>
            	<option value="佳里區">佳里區</option>
            	<option value="西港區">西港區</option>
            	<option value="七股區">七股區</option>
            	<option value="將軍區">將軍區</option>
            	<option value="學甲區">學甲區</option>
            	<option value="北門區">北門區</option>
            	<option value="新營區">新營區</option>
            	<option value="後壁區">後壁區</option>
            	<option value="白河區">白河區</option>
            	<option value="東山區">東山區</option>
            	<option value="六甲區">六甲區</option>
            	<option value="下營區">下營區</option>
            	<option value="柳營區">柳營區</option>
            	<option value="鹽水區">鹽水區</option>
            	<option value="善化區">善化區</option>
            	<option value="大內區">大內區</option>
            	<option value="山上區">山上區</option>
            	<option value="新市區">新市區</option>
            	<option value="安定區">安定區</option>
            </select>
            <select id="Kaohsiung" name="addr" class="font1" style="font-size: 18px;color:gray" hidden>
            	<option value="請選擇區域">請選擇區域</option>
            	<option value="新興區">新興區</option>
            	<option value="前金區">前金區</option>
            	<option value="苓雅區">苓雅區</option>
            	<option value="鹽埕區">鹽埕區</option>
            	<option value="鼓山區">鼓山區</option>
            	<option value="旗津區">旗津區</option>
            	<option value="前鎮區">前鎮區</option>
            	<option value="小港區">小港區</option>
            	<option value="左營區">左營區</option>
            	<option value="仁武區">仁武區</option>
            	<option value="大社區">大社區</option>
            	<option value="東沙群島">東沙群島</option>
            	<option value="南沙群島">南沙群島</option>
            	<option value="岡山區">岡山區</option>
            	<option value="路竹區">路竹區</option>
            	<option value="阿蓮區">阿蓮區</option>
            	<option value="左營區">左營區</option>
            	<option value="田貢區">田貢區</option>
            	<option value="燕巢區">燕巢區</option>
            	<option value="橋頭區">橋頭區</option>
            	<option value="梓官區">梓官區</option>
            	<option value="彌陀區">彌陀區</option>
            	<option value="永安區">永安區</option>
            	<option value="湖內區">湖內區</option>
            	<option value="鳳山區">鳳山區</option>
            	<option value="大寮區">大寮區</option>
            	<option value="林園區">林園區</option>
            	<option value="烏松區">烏松區</option>
            	<option value="大樹區">大樹區</option>
            	<option value="旗山區">旗山區</option>
            	<option value="美濃區">美濃區</option>
            	<option value="六龜區">六龜區</option>
            	<option value="內門區">內門區</option>
            	<option value="杉林區">杉林區</option>
            	<option value="甲仙區">甲仙區</option>
            	<option value="桃源區">桃源區</option>
            	<option value="那瑪夏區">那瑪夏區</option>
            	<option value="茂林區">茂林區</option>
            	<option value="茄萣區">茄萣區</option>
            </select>
            	<select id="Pingtung" name="addr" class="font1" style="font-size: 18px;color:gray" hidden>
            	<option value="請選擇區域">請選擇區域</option>
    			<option value="屏東市">屏東市</option>
				<option value="三地門鄉">三地門鄉</option>
				<option value="霧臺鄉">霧臺鄉</option>
				<option value="瑪家鄉">瑪家鄉</option>
				<option value="九如鄉">九如鄉</option>
				<option value="里港鄉">里港鄉</option>
				<option value="高樹鄉">高樹鄉</option>
				<option value="鹽埔鄉">鹽埔鄉</option>
				<option value="長治鄉">長治鄉</option>
				<option value="麟洛鄉">麟洛鄉</option>
				<option value="竹田鄉">竹田鄉</option>
				<option value="內埔鄉">內埔鄉</option>
				<option value="萬丹鄉">萬丹鄉</option>
				<option value="潮州鎮">潮州鎮</option>
				<option value="泰武鄉">泰武鄉</option>
				<option value="來義鄉">來義鄉</option>
				<option value="萬巒鄉">萬巒鄉</option>
				<option value="崁頂鄉">崁頂鄉</option>
				<option value="新埤鄉">新埤鄉</option>
				<option value="南州鄉">南州鄉</option>
				<option value="林邊鄉">林邊鄉</option>
				<option value="東港鎮">東港鎮</option>
				<option value="琉球鄉">琉球鄉</option>
				<option value="佳冬鄉">佳冬鄉</option>
				<option value="新園鄉">新園鄉</option>
				<option value="枋寮鄉">枋寮鄉</option>
				<option value="枋山鄉">枋山鄉</option>
				<option value="春日鄉">春日鄉</option>
				<option value="獅子鄉">獅子鄉</option>
				<option value="車城鄉">車城鄉</option>
				<option value="牡丹鄉">牡丹鄉</option>
				<option value="恆春鎮">恆春鎮</option>
				<option value="滿州鄉">滿州鄉</option>
				</select>
            	<select id="Taitung" name="addr" class="font1" style="font-size: 18px;color:gray" hidden>
            	<option value="請選擇區域">請選擇區域</option>
         		<option value="臺東市">臺東市</option>
				<option value="綠島鄉">綠島鄉</option>
				<option value="蘭嶼鄉">蘭嶼鄉</option>
				<option value="延平鄉">延平鄉</option>
				<option value="卑南鄉">卑南鄉</option>
				<option value="鹿野鄉">鹿野鄉</option>
				<option value="關山鎮">關山鎮</option>
				<option value="海端鄉">海端鄉</option>
				<option value="池上鄉">池上鄉</option>
				<option value="東河鄉">東河鄉</option>
				<option value="成功鎮">成功鎮</option>
				<option value="長濱鄉">長濱鄉</option>
				<option value="太麻里鄉">太麻里鄉</option>
				<option value="金峰鄉">金峰鄉</option>
				<option value="大武鄉">大武鄉</option>
				<option value="達仁鄉">達仁鄉</option>
				</select>
				<select id="Hualien" name="addr" class="font1" style="font-size: 18px;color:gray" hidden>
            	<option value="請選擇區域">請選擇區域</option>
            	<option value="花蓮市">花蓮市</option>
				<option value="新城鄉">新城鄉</option>
				<option value="秀林鄉">秀林鄉</option>
				<option value="吉安鄉">吉安鄉</option>
				<option value="壽豐鄉">壽豐鄉</option>
				<option value="鳳林鎮">鳳林鎮</option>
				<option value="光復鄉">光復鄉</option>
				<option value="豐濱鄉">豐濱鄉</option>
				<option value="瑞穗鄉">瑞穗鄉</option>
				<option value="萬榮鄉">萬榮鄉</option>
				<option value="玉里鎮">玉里鎮</option>	
				<option value="卓溪鄉">卓溪鄉</option>
				<option value="富里鄉">富里鄉</option>
				</select>
				<select id="Penghu" name="addr" class="font1" style="font-size: 18px;color:gray" hidden>
				<option value="請選擇區域">請選擇區域</option>
				<option value="馬公市">馬公市</option>
				<option value="西嶼鄉">西嶼鄉</option>
				<option value="望安鄉">望安鄉</option>
				<option value="七美鄉">七美鄉</option>
				<option value="白沙鄉">白沙鄉</option>
				<option value="湖西鄉">湖西鄉</option>
				</select>
				<select id="Kinmen" name="addr" class="font1" style="font-size: 18px;color:gray" hidden>
				<option value="請選擇區域">請選擇區域</option>
				<option value="金沙鎮">金沙鎮</option>
				<option value="金湖鎮">金湖鎮</option>
				<option value="金寧鄉">金寧鄉</option>
				<option value="金城鎮">金城鎮</option>
				<option value="烈嶼鄉">烈嶼鄉</option>
				<option value="烏坵鄉">烏坵鄉</option>
				</select>
				<select id="Lienchiang" name="addr" class="font1" style="font-size: 18px;color:gray" hidden>
				<option value="請選擇區域">請選擇區域</option>
				<option value="南竿鄉">南竿鄉</option>
				<option value="北竿鄉">北竿鄉</option>
				<option value="莒光鄉">莒光鄉</option>
				<option value="東引鄉">東引鄉</option>
				</select>
				<input type="text" size="20" id="address" name="address" >
				<br>
				<label class="font1" style="color:#9bff00; font-size:19px">(請輸入詳細的聯絡地址)</label> <span id="sadd"></span>
         </div>
            
        </div>
         
     <div class="st1">
        <div>
       	<font class="font1">生日:</font><input type="text" id="EmpBdate" name="emp_birthday">
       		<span id="bdy"></span>
        
    	</div>
	</div>
		
	<div class="st1">
        <div>
       	
       	<font class="font1">信箱:</font><input type="email" id="EmpEmail" name="emp_email">
        	<span id="ema"></span>
        </div>
        <label class="font1" style="color:#9bff00; font-size:19px">(此為登入帳號,請勿輸入無法接收密碼信件的信箱)</label> 
	</div>
        <div align="center"  id="butt">
        	<input type="hidden" name="action" value="insert">
			<input type="button" id="allbutton" value="送出" class="btn btn-primary" style="font-family:ShowWind;font-size: 20px " />
			<input type="reset" value="清除" class="btn btn-primary" style="font-family:ShowWind;font-size: 20px " id="ress"/><span></span>
     	</div>
             </form>
                
    </fieldset>
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
			            <li><a href="EmpRegister.jsp">註冊</a></li>
			         	<li><a href="all_emp.jsp">查詢</a></li> 
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
