<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
            request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>game list</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/Cart.css">
</head>
<body>
<%@include file="/HeadFoot/header.jsp"%>
<div id="nav" class="content">
    <a href="${pageContext.request.contextPath }/search.do" class="loggo font">
        <span class="font log1"></span>
        <span class="font log2"></span>
    </a>

    <form class="right" method="get" action="${pageContext.request.contextPath }/search.do">
        <input name="method" value="querygame" type="hidden">
        <input type="submit" value="" class="right" id="searchbutton">
        <input type="search" name="queryProName" value="${queryProName }"placeholder="Dota2" class="right">

    </form>

    <a href="${pageContext.request.contextPath }/jsp/cart.do?method=querycart" class="ShoppingCart font right"> ShoppintCart</a>
</div>
    <div id="cart" class="content">
        <div class="title">All Games</div>
        <div class="goods">

            <table class="productTable" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
                    <th width="20%"></th>
                    <th width="10%">Name</th>
                    <th width="10%">Developer</th>
                    <th width="10%">Publisher</th>
                    <th width="20%">Price</th>
                    <th width="20%">Issue Date</th>
                </tr>
                <c:forEach var="product" items="${productList }" varStatus="status">
                <tr>
                    <td>
                        <span>
							<img src="${pageContext.request.contextPath }/images/product/${product.proFilename }" height ="80">
						</span>
                    </td>
                    <td>
                        <span>${product.proName }</span>
                    </td>
                    <td>
                        <span>${product.proDeveloper}</span>
                    </td>
                    <td>
                        <span>${product.proPublisher}</span>
                    </td>
                    <td>
                        <span>${product.proPrice}</span>
                    </td>
                    <td>
					<span>
					<fmt:formatDate value="${product.proDate}" pattern="yyyy-MM-dd"/>
					</span>
                    </td>
                    <td>
                    <span>
                        <div class="option">
                            <span><a class="viewProduct" href="${pageContext.request.contextPath }/search.do?method=game&proid=${product.id }">
                                <input type="button" value="See more" alt="Check">
                            </a></span>

                        </div>
                    </span>
                    </td>
                    <td>
                    <span></span>
                    </td>
                </tr>
                </c:forEach>
            </table>
        </div>
    </div>
<%@include file="/HeadFoot/footer.jsp"%>
</body>
</html>