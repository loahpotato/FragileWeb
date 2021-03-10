<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart</title>
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/Cart.css">
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
        <div class="title">YOUR SHOPPING CART</div>
        <div class="goods">
            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Number</th>
                        <th>Price</th>
                        <th> </th>
                        <th> </th>
                        <th> </th>
                    </tr>
                </thead>

                <tbody>
                <c:set value="0" var="cartTotal"/>
                <c:forEach var="cart" items="${cartList }" varStatus="status">
                <tr>
                    <c:if test="${cart.cart_uid eq userSession.id }">
                    <td>
                        <span><img src="${pageContext.request.contextPath }/images/product/${cart.cart_pimage }"
                        height="80"></span>
                    </td>
                    <td>
                        <span>${cart.cart_pname }</span>
                    </td>
                    <td>
                        <span>${cart.cart_pprice }</span>
                    </td>
                    <td>
                    <span>
                        <div class="option">
                         <span><a class="viewProduct" href="${pageContext.request.contextPath }/search.do?method=game&proid=${cart.cart_pid }">
                                <input type="button" value="See more" alt="Check">
                            </a></span>
                        </div>
                    </span>
                    </td>
                    <td>
                    <span>
                        <div class="option">
                         <span>
                                <input type="button" name="del" id="del" value="Delete" alt="Delete" onclick="del(${cart.cart_id })">
                            </span>
                        </div>
                    </span>
                    </td>
                    <c:set var="cartTotal" value="${cartTotal + cart.cart_pprice}"/>
                    </c:if>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="total">Total: ￥${cartTotal}</div>
        <div class="option">
            <a href="${pageContext.request.contextPath }/search.do" class="continue">Continue Shopping</a>
            <input type="button" value="Purchase">
        </div>

    </div>
<%@include file="/HeadFoot/footer.jsp"%>
</body>
</html>
<script type="text/javascript" language="javaScript">
    function del(cartid){
        var path = "${pageContext.request.contextPath }"
        if(confirm("Confirm whether to delete the game")){
            window.location.href = path+"/jsp/cart.do?method=delcart&cartid="+cartid;

        }
    }

</script>