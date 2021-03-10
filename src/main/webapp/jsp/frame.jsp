<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>
<div class="right">
    <img class="wColck" src="${pageContext.request.contextPath }/images/clock.jpg" alt=""/>
    <div class="wFont">
        <h2>${userSession.userName }</h2>
        <p>Welcome to Fragile Games!</p>
    </div>
</div>
</section>
<%@include file="/jsp/common/foot.jsp" %>
