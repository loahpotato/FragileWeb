<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>
<div class="right">
            <div class="location">
                <strong>You are at:</strong>
                <span>Password Modification page</span>
            </div>
            <div class="productAdd">
                <form id="userForm" name="userForm" method="post" action="${pageContext.request.contextPath }/jsp/user.do">
                    <input type="hidden" name="method" value="savepwd">
                    <div class="info">${message}</div>
                    <div class="">
                        <label for="oldPassword">Original Password:</label>
                        <input type="password" name="oldpassword" id="oldpassword" value=""> 
						<font color="red"></font>
                    </div>
                    <div>
                        <label for="newPassword">New Password:</label>
                        <input type="password" name="newpassword" id="newpassword" value=""> 
						<font color="red"></font>
                    </div>
                    <div>
                        <label for="newPassword">Confirm New Password:</label>
                        <input type="password" name="rnewpassword" id="rnewpassword" value=""> 
						<font color="red"></font>
                    </div>
                    <div class="productAddBtn">
                        <input type="button" name="save" id="save" value="Save" class="input-button">
                    </div>
                </form>
            </div>
        </div>
    </section>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/pwdmodify.js"></script>