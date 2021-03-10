<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Personal Information</title>
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/Personinfo.css">
</head>
<body>
<%@include file="/HeadFoot/header.jsp"%>
    <div id="info" class="content">
        <div class="title">Personal Information</div>
        <table>
            <tr>
                <th>ID</th>
                <td>${userSession.userCode}</td>
            </tr>
            <tr>
                <th>User Name</th>
                <td>${userSession.userName}</td>
            </tr>
            <tr>
                <th>Gender</th>
                <c:if test="${userSession.gender eq 1}">
                    <td>Male</td>
                </c:if>
                <c:if test="${userSession.gender eq 2}">
                    <td>Male</td>
                </c:if>
            </tr>
            <tr>
                <th>Birthday</th>
                <td>${userSession.birthday}</td>
            </tr>
            <tr>
                <th>Phone Number</th>
                <td>${userSession.phone}</td>
            </tr>
            <tr>
                <th>Email</th>
                <td>${userSession.email}</td>
            </tr>
        </table>
    </div>
<%@include file="/HeadFoot/footer.jsp"%>
    
</body>
</html>