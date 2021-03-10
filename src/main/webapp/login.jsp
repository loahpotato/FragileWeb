<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log in</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
<%@include file="/HeadFoot/header.jsp"%>
    <div class="content">
        <div class="form">
            <form class="loginForm" action="${pageContext.request.contextPath }/login.do"  name="actionForm" id="actionForm"  method="post" >
                <div class="title">Log In</div>
                <div class="name form_area">
                    <label for="user_name" class="text">User name</label>
                    <input type="text" name="userCode" id="user_name">
                </div>
                <div class="password form_area">
                    <label for="password" class="text">Password</label>
                    <input type="Password" name="userPassword" id="password">
                </div>
                <input type="submit" value="Log in">
            </form>
        </div>
    </div>
    <%@include file="/HeadFoot/footer.jsp"%>
    
</body>
</html>