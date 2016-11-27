<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="tableSvc" scope="page" class="com.table.model.TableService" />
<jsp:useBean id="empSvc" scope="page" class="com.emp.model.EmpService"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>點餐  - addOrder1.jsp</title>
<link rel="stylesheet" href="../css/bootstrap.css">
<style>
body{
background-image: url("../img/light2.png");
background-size: cover;
}
@font-face{
font-family:"ShowWind";
src: url("../font/ShowWind.ttc");  
}
td{
font-family:"ShowWind";
color:white;
font-size:30px;
padding: 10px
}
h2{
font-family:"ShowWind";
color:white;
font-size:45px;
font-weight: bold;
}
#block {
    	height: 300px; /*高度*/ 
     	width: 800px;  /*寬度*/ 
    	 background-color: black;
     	position: absolute; 
      	top:50%; 
      	left:50%;
      	
     	margin:0px auto;
     	background-color: rgba(0,0,0,0);
		margin-top: -150px;
		margin-left:-400px
}
select{
color: black;
width:180px;
font-weight: bold;"
}
</style>
<link rel="Shortcut Icon" type="image/png" href="../icon/pagelogo.png" />
</head>
<body>
<div align="center" id="block">
<h2 style="color:red">請輸入桌號狀況</h2><br/>
<%-- <c:if test="${not empty errorMsgs}"> --%>
<!-- 	<font color='red' style="font-family:ShowWind;font-size:25px">請修正以下錯誤: -->
<!-- 	<ul> -->
<%-- 		<c:forEach var="message" items="${errorMsgs}"> --%>
<%-- 			<li>${message}</li> --%>
<%-- 		</c:forEach> --%>
<!-- 	</ul> -->
<!-- 	</font> -->
<%-- </c:if> --%>
<form METHOD="post" ACTION="order.do" >
<table>
	<tbody>
		<tr><td>未點餐桌號:<select name="table">
						<c:forEach var="tableVO" items="${tableSvc.getAllTableReadyToOrder() }">
							<option value="${tableVO.table_name }">${tableVO.table_name }</option>
						</c:forEach>
					</select>
					</td></tr>
					<tr><td>員工:<select name="employee" style="color: black">
						<c:forEach var="empVO" items="${empSvc.getAll() }">
							<option value="${empVO.emp_id }">${empVO.emp_name }</option>
						</c:forEach>
					</select>
					</td></tr>
	</tbody>
</table><br/>
<input type="hidden" name="action" value="begin_order">
<input type="submit" value="下一步" class="btn btn-warning" style="font-family:ShowWind;font-size: 25px;font-weight: bold; ">
</form>
</div>
</body>
</html>