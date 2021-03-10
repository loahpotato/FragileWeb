<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<div id="header">
    <a href="#" class="left font"></a>
    <a href="#" class="left font"></a>
    <a href="${pageContext.request.contextPath }/search.do" class="left">Shop</a>
    <a href="${pageContext.request.contextPath }/search.do?method=querygame" class="left">Games</a>
    <a href="${pageContext.request.contextPath }/jsp/Personinfo.jsp" class="left">Profile</a>
    <a href="#" class="left">Library</a>


    <c:if test="${not empty userSession.userName }">
        <a href="#" class="right user"><span class="font"></span> ${userSession.userName}<span class="font"></span></a>
        <a href="${pageContext.request.contextPath }/jsp/logout.do" class="right user"> <span class="font"></span> Log out</a>
    </c:if>

    <c:if test="${empty userSession.userName }">
        <a href="${pageContext.request.contextPath }/register.jsp" class="right user"> <span class="font"></span> Register </a>
        <a href="${pageContext.request.contextPath }/login.jsp" class="right user"> <span class="font"></span> Log in</a>
    </c:if>
    <a href="#" class="right message font"></a>
    <a href="#" class="right inform font"></a>
</div>