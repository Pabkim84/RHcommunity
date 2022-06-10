<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: 오후 2:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>사원목록</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        body{
            background-color: rgb(26,32,53);
            color: whitesmoke;
        }
        td{
            color: lightgray!important;
        }
        .container{
            margin-top: 200px;
        }
        .tableCaption {
            text-align: center;
            font-size: 36px;
            color: whitesmoke;
            font-weight: 500;
            margin-bottom: 50px;
        }
        .sub-container{
            horiz-align: center;
            margin-left: 5%;
            background-color: #1f283e;
            height: 70%;
            border-radius: 5%;
        }
        td{
            background-color: rgb(31,40,62);
        }
    </style>
</head>
<body>
<jsp:include page="../layout/sidebar.jsp" flush="false"></jsp:include>
<div class="container">
    <div class="sub-container">
        <p class="tableCaption">사원목록</p>
        <table class="table table-striped table-hover" style="color: whitesmoke; text-align: center; border-color: #3C4858">
            <thead>
            <tr>
                <th scope="col">사원번호</th>
                <th scope="col">사원명</th>
                <th scope="col">부서</th>
                <th scope="col">직급</th>
                <th scope="col">입사일</th>
                <th scope="col">출근일자</th>
                <th scope="col">출근일수</th>
                <th scope="col">결근일자</th>
                <th scope="col">결근일수</th>
                <th scope="col">지각조퇴일자</th>
                <th scope="col">지각조퇴시간</th>
                <th scope="col">초과근무시간</th>
            </tr>
            </thead>
            <tbody>
                <tr style="background-color: rgb(31,40,62)">
                    <td>${memberDTO.id}</td>
                    <td>${memberDTO.memberName}</td>
                    <td>${memberDTO.memberDept}</td>
                    <td>${memberDTO.memberPosition}</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd"
                                        value="${memberDTO.memberJoinDate}"></fmt:formatDate></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
