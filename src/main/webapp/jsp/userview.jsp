<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>
 <div class="right">
        <div class="location">
            <strong>You are at:</strong>
            <span>User Management page >> Information Check page</span>
        </div>
        <div class="productView">
            <p><strong>UserCode:</strong><span>${user.userCode }</span></p>
            <p><strong>UserName:</strong><span>${user.userName }</span></p>
            <p><strong>Gender:</strong>
            	<span>
            		<c:if test="${user.gender == 1 }">Male</c:if>
					<c:if test="${user.gender == 2 }">Female</c:if>
				</span>
			</p>
            <p><strong>Birthday:</strong><span>${user.birthday }</span></p>
            <p><strong>PhoneNumber:</strong><span>${user.phone }</span></p>
            <p><strong>Email:</strong><span>${user.email }</span></p>
            <p><strong>UserRole:</strong><span>${user.userRoleName}</span></p>
			<div class="productAddBtn">
            	<input type="button" id="back" name="back" value="Back" >
            </div>
        </div>
    </div>
</section>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/userview.js"></script>