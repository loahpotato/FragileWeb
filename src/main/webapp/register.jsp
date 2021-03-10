<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/register.css">
</head>
<body>
<%@include file="/HeadFoot/header.jsp"%>
    <input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>
    <input type="hidden" id="referer" name="referer" value="<%=request.getHeader("Referer")%>"/>
    <div class="content">
        <div class="form">
            <form name="registerForm" id="registerForm"  method="post" action="${pageContext.request.contextPath }/register.do">
                <div class="title">Create Your Account</div>
                <div class="ID form_area">
                    <label for="userCode" class="text">ID</label>
                    <input type="text" name="userCode" id="userCode">
                    <font color="red"></font>
                </div>
                <div class="name form_area">
                    <label for="userName" class="text">User name</label>
                    <input type="text" name="userName" id="userName">
                    <font color="red"></font>
                </div>
                <div class="password form_area">
                    <label for="userPassword" class="text">Password</label>
                    <input type="password" name="userPassword" id="userPassword">
                    <font color="red"></font>
                </div>
                <div class="password_Confirm form_area">
                    <label for="ruserPassword" class="text">Confirm Your Password</label>
                    <input type="password" name="ruserPassword" id="ruserPassword">
                    <font color="red"></font>
                </div>
                <div class="gender">
                    <label for="gender" class="text">Gender</label>
                    <select name="gender" id="gender">
                        <option value="0" selected="selected">Select</option>
                        <option value="1">Male</option>
                        <option value="2">Female</option>
                    </select>
                </div>
                <div class="birth form_area">
                    <label for="birthday" class="text">Birthday</label>
                    <input type="date" name="birthday" id="birthday">
                    <font color="red"></font>
                </div>
                <div class="email form_area">
                    <label for="email" class="text">Email Address</label>
                    <input type="email" name="email" id="email">
                </div>
                <div class="telnum form_area">
                    <label for="phone" class="text">Telephone Number</label>
                    <input type="tel" name="phone" id="phone">
                    <font color="red"></font>
                </div>
                <div class="agreement form_area">
                    <input type="checkbox" id="agreement"> I am 18 years of age and agree to the terms of the
                    <span>Steam Subscriber Agreement</span> and <span>Valve Privacy Policy.</span>
                </div>
                <input type="button" name="add" id="add" value="Submit" >
            </form>
        </div>
    </div>
<%@include file="/HeadFoot/footer.jsp"%>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/time.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/common.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/calendar/WdatePicker.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/register.js"></script>
</body>

</html>