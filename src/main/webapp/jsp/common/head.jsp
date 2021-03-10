<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Fragile Games</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/public.css" />

</head>
<body>

    <header class="publicHeader">
        <h1>Fragile Games</h1>
        <div class="publicHeaderR">
            <p><span>Good Day!</span><span style="color: #fff21b"> ${userSession.userName }</span> , Welcome!</p>
            <a href="${pageContext.request.contextPath }/jsp/logout.do">Exit</a>
        </div>
    </header>

    <section class="publicTime">
        <span id="time">2015.1.1. 11:11  Monday</span>
        <a href="#">Tips: In order to display normally, please use Google Chrome.</a>
    </section>

 <section class="publicMian ">
     <div class="left">
         <h2 class="leftH2"><span class="span1"></span>Function:<span></span></h2>
         <nav>
             <ul class="list">
                 <li ><a href="${pageContext.request.contextPath }/jsp/bill.do?method=query">Order</a></li>
              <li><a href="${pageContext.request.contextPath }/jsp/product.do?method=query">Product</a></li>
              <li><a href="${pageContext.request.contextPath }/jsp/user.do?method=query">User</a></li>
              <li><a href="${pageContext.request.contextPath }/jsp/pwdmodify.jsp">Password</a></li>
              <li><a href="${pageContext.request.contextPath }/jsp/logout.do">Log Out</a></li>
             </ul>
         </nav>
     </div>
     <input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>
     <input type="hidden" id="referer" name="referer" value="<%=request.getHeader("Referer")%>"/>