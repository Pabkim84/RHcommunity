<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: 오후 2:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>사원목록</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        body{
            background-color: rgb(26,32,53);
            color: whitesmoke;
            margin-left: 300px;
            margin-top: 200px;
        }
        td{
            color: lightgray!important;
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
            margin-left: 0%;
            background-color: rgba(31,40,62,0.95);
            height: 70%;
            width: 120%;
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
        <p class="tableCaption">근태관리</p>
        <table class="table table-striped table-hover" style="color: whitesmoke; text-align: center; border-color: #3C4858">
            <thead>
            <tr>
                <th scope="col">관리번호</th>
                <th scope="col">사원번호</th>
                <th scope="col">사원명</th>
                <th scope="col">부서</th>
                <th scope="col">직급</th>
                <th scope="col">입사일</th>
                <th scope="col">출근체크</th>
                <th scope="col">퇴근체크</th>
                <th scope="col">결근일자</th>
                <th scope="col">지각일자</th>
                <th scope="col">조퇴일자</th>
            </tr>
            </thead>
            <tbody>
                <c:forEach items="${attendanceList}" var="list">

                <tr style="background-color: rgb(31,40,62)">
                    <td>${list.id}</td>
                    <td>${list.numId}</td>
                    <td>${list.memberName}</td>
                    <td>${list.memberDept}</td>
                    <td>${list.memberPosition}</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd"
                                        value="${list.memberJoinDate}"></fmt:formatDate></td>
                    <td>${list.attendanceDate}</td>
                    <td>${list.closingDate}</td>
                    <td>${list.absenceDate}</td>
                    <td>${list.lateDate}</td>
                    <td>${list.earlyDate}</td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
