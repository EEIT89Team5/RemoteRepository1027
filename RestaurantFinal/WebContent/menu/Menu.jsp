<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="productSvc" scope="page" class="com.product.model.ProductService" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜單</title>
<link rel="Shortcut Icon" type="image/png" href="../icon/pagelogo.png" />
</head>
<body>

<table>
<tr><td>圖片</td><td>菜名</td><td>價格</td><td>介紹</td></tr>
<c:forEach var="productVO" items="${productSvc.getSingleDishesByClass(10) }">
<tr>
<td><img alt="${product.product_id}" src="${pageContext.servletContext.contextPath}/getImage?id=${productVO.product_id}" height="200"></td>
<td>${productVO.product_name}</td>
<td>${productVO.product_price}元</td>
<td>${productVO.product_intro}</td>
</tr>
</c:forEach>
<c:forEach var="productVO" items="${productSvc.getSingleDishesByClass(20) }">
<tr>
<td><img alt="${product.product_id}" src="${pageContext.servletContext.contextPath}/getImage?id=${productVO.product_id}" height="200"></td>
<td>${productVO.product_name}</td>
<td>${productVO.product_price}元</td>
<td>${productVO.product_intro}</td>
</tr>
</c:forEach>
<c:forEach var="productVO" items="${productSvc.getSingleDishesByClass(30) }">
<tr>
<td><img alt="${product.product_id}" src="${pageContext.servletContext.contextPath}/getImage?id=${productVO.product_id}" height="200"></td>
<td>${productVO.product_name}</td>
<td>${productVO.product_price}元</td>
<td>${productVO.product_intro}</td>
</tr>
</c:forEach>
<c:forEach var="productVO" items="${productSvc.getSingleDishesByClass(40) }">
<tr>
<td><img alt="${product.product_id}" src="${pageContext.servletContext.contextPath}/getImage?id=${productVO.product_id}" height="200"></td>
<td>${productVO.product_name}</td>
<td>${productVO.product_price}元</td>
<td>${productVO.product_intro}</td>
</tr>
</c:forEach>
<c:forEach var="productVO" items="${productSvc.getSingleDishesByClass(50) }">
<tr>
<td><img alt="${product.product_id}" src="${pageContext.servletContext.contextPath}/getImage?id=${productVO.product_id}" height="200"></td>
<td>${productVO.product_name}</td>
<td>${productVO.product_price}元</td>
<td>${productVO.product_intro}</td>
</tr>
</c:forEach>
<c:forEach var="productVO" items="${productSvc.getSingleDishesByClass(60) }">
<tr>
<td><img alt="${product.product_id}" src="${pageContext.servletContext.contextPath}/getImage?id=${productVO.product_id}" height="200"></td>
<td>${productVO.product_name}</td>
<td>${productVO.product_price}元</td>
<td>${productVO.product_intro}</td>
</tr>
</c:forEach>

</table>

</body>
</html>