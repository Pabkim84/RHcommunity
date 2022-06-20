<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-14
  Time: 오후 12:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>결근신청 및 사유서</title>
    <style>
        .container {

        }
        .table-container {

        }
        .text-container {
            text-align: center;
        }

        .table-container .table-caption {
            font-size: 36px;
            font-weight: 500;
            margin-top: 30px;
            margin-bottom: 60px;
        }

        .text-name {
            margin-left: 20px;
            letter-spacing: 20px;
        }

        .text-auth {
            margin-left: 40px;
        }

        .table-custom {
            border: 0px solid lightgray;
            height: 60px;
            width: 800px;
            border-spacing: 0px;
            padding: 0px;
            margin: 0 auto 40px auto;
            border-collapse: collapse;

        }
        th{
            border: 1px solid lightgray;
            height: 50px;
            border-spacing: 0px;
            padding: 0px;
            border-collapse: collapse;
        }
        td{
            border: 1px solid lightgray;
            height: 50px;
            border-spacing: 0px;
            padding: 10px;
            margin-left: 50px;
            border-collapse: collapse;
        }
        .subTitle{
            font-size: 20px;
            font-weight: 500;
            text-align: left;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="table-container">
        <table class="table-custom">
            <caption class="table-caption">결근신청 및 사유서</caption>
            <thead>
            <tr style="border: 0">
                <th style="border: 0">
                    <p class="subTitle">기본정보</p>
                </th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th>사원번호</th>
                <td>${memberDTO.id}</td>
                <th>사원명</th>
                <td>${memberDTO.memberName}</td>
            </tr>
            <tr>
                <th>부서</th>
                <td>${memberDTO.memberDept}</td>
                <th>직위</th>
                <td>${memberDTO.memberPosition}</td>
            </tr>
            <tr>
                <th>주소</th>
                <td>${memberDTO.memberAddress}</td>
                <th>연락처</th>
                <td>${memberDTO.memberMobile}</td>
            </tr>
            </tbody>
        </table>
        <table class="table-custom">
            <thead>
            <tr style="border: 0">
                <th style="border: 0">
                    <p class="subTitle">결근 일정 및 사유</p>
                </th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th colspan="4">
                    <p class="subTitle" style="text-align: center; font-size: 16px">결근일자
                        <input type="date"> 부터 <input type="date"> 까지
                    </p>
                </th>
            </tr>
            <tr>
                <td colspan="4" rowspan="4"><textarea style="border: 0; border-spacing: 0" cols="100%" rows="4" placeholder="결근 사유를 적어주세요"></textarea></td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="text-container">
        <p class="text">위와 같은 사유로 결근합니다.</p>
        <p class="text" id="current_date"></p>
        <span>RHcompany ${memberDTO.memberDept} ${memberDTO.memberPosition}</span> <span class="text-name">${memberDTO.memberName}</span>   <span class="text-auth">(인)</span>
    </div>
    <div class="table-container" style="margin-top: 100px">
        <table class="table-custom" style="border: 0">
            <tr style="border: 0">
                <th style="border: 0"></th>
                <th style="border: 0"></th>
                <th>부서장</th>
                <th>인사팀장</th>
            </tr>
            <tr style="border: 0; text-align: center">
                <td style="border: 0"></td>
                <td style="border: 0"></td>
                <td>홍 길 동</td>
                <td>아 무 개</td>
            </tr>
        </table>
    </div>
</div>
</body>
<script>
    date = new Date();
    year = date.getFullYear();
    month = date.getMonth() + 1;
    day = date.getDate();
    document.getElementById("current_date").innerHTML = year + "년 " + month + "월 " + day + "일" ;
    document.getElementById("current_date2").innerHTML = year + "년 " + month + "월 " + day + "일" ;
</script>
</html>

