<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>

<div class="right">
        <div class="location">
            <strong>You are at:</strong>
            <span>User Management page >> User Addition page</span>
        </div>
        <div class="productAdd">
            <form id="userForm" name="userForm" method="post" action="${pageContext.request.contextPath }/jsp/user.do">
				<input type="hidden" name="method" value="add">
                <div>
                    <label for="userCode">UserCode:</label>
                    <input type="text" name="userCode" id="userCode" value="">
					<font color="red"></font>
                </div>
                <div>
                    <label for="userName">UserName:</label>
                    <input type="text" name="userName" id="userName" value=""> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="userPassword">Password:</label>
                    <input type="password" name="userPassword" id="userPassword" value=""> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="ruserPassword">Confirm Password:</label>
                    <input type="password" name="ruserPassword" id="ruserPassword" value=""> 
					<font color="red"></font>
                </div>
                <div>
                    <label >Gender:</label>
					<select name="gender" id="gender">
					    <option value="1" selected="selected">Male</option>
					    <option value="2">Female</option>
					 </select>
                </div>
                <div>
                    <label for="birthday">Birthday:</label>
                    <input type="text" Class="Wdate" id="birthday" name="birthday" 
					readonly="readonly" onclick="WdatePicker();">
					<font color="red"></font>
                </div>
                <div>
                    <label for="phone">PhoneNumber:</label>
                    <input type="text" name="phone" id="phone" value=""> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="address">Email:</label>
                   <input name="email" id="address"  value="">
                </div>
                <div>
                    <label >UserRole:</label>
					<select name="userRole" id="userRole"></select>
	        		<font color="red"></font>
                </div>
                <div class="productAddBtn">
                    <input type="button" name="add" id="add" value="Save" >
					<input type="button" id="back" name="back" value="Back" >
                </div>
            </form>
        </div>
</div>
</section>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/useradd.js"></script>
