<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: 오후 2:25
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <meta charset="utf-8"/>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="/resources/js/jquery.js"></script>
    <title>사원목록</title>
    <style>
        body {
            margin: 0;
            background-color: rgb(26, 32, 53);
            font-family: 'Source Sans Pro', sans-serif;
            overflow: hidden;
        }

        .main-container {
            background-color: lightgrey;
            width: 1183px;
            height: 635px;
            position: relative;
            display: flex;
        }

        .mini-container {
            background-color: lightgrey;
            width: 73%;
            height: 540px;
            position: relative;
            top: 65px;
            left: 2%;
            overflow: scroll;
        }

        .subTitle {
            display: flex;
            position: absolute;
            top: 15px;
            left: 2%;
            width: 45%;
            float: left;
            margin-top: 25px;
            margin-right: 38px;
            color: rgba(30, 30, 30, 0.9);
            font-size: 14px;
            font-weight: bold;
        }

        .subTitle img {
            position: relative;
            top: 5px;
            margin-right: 3px;
            width: 2%;
            height: 2%;
        }

        .table1 {
            position: absolute;
            width: 99%;
            /*height: 561px;*/
            text-align: center;
            color: black;
            background-color: whitesmoke;
            box-shadow: 1px 1px 3px 3px darkgrey inset;

        }

        .table2 {
            position: absolute;
            width: 25%;
            top: 20%;
            left: 75%;
        }

        .table2 th {
            text-align: right;
            padding-right: 5px;
        }

        .table2 td {
            width: 10%;
            text-indent: 17px;
            box-shadow: 1px 2px 2px 2px grey inset;
            background: whitesmoke;
        }

        th {
            border: 1px solid lightgrey;
            font-size: 13px;
            line-height: 0px;
            width: 16.67%;
        }

        td {
            position: relative;
            border: 1px solid lightgrey;
            height: 40px !important;
            font-size: 12px;
        }

        tr {
            height: 40px !important;
        }

        .table1 tr:hover {
            background-color: lightgrey;
            font-weight: 700;
            font-size: 13px !important;
            box-shadow: 2px 3px 3px 3px grey;
        }

        .unit {
            text-align: left !important;
            padding-left: 5px;
        }
        .inputData {
            width: 100%;
            margin: 0;
            padding: 0;
            border: 0;
            background-color: transparent;
            outline-style: none;
        }
        sub {
            position: absolute;
            left: 75%;
            top: 50%;
            color: dimgray;

        }
        table1 td {
            position: relative;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

<div class="main-container">
    <div class="subTitle"><img src="../../../resources/img/triangle.png">이번달 근태현황</div>
    <div class="mini-container">
        <table class="table1">
            <thead>
            <tr>
                <th scope="col" style="width: 5%">사번</th>
                <th scope="col" style="width: 9%">사원명</th>
                <th scope="col" style="width: 10%">부서</th>
                <th scope="col" style="width: 6%">직급</th>
                <th scope="col" style="width: 10%">근무일수</th>
                <th scope="col" style="width: 10%">결근일수</th>
                <th scope="col" style="width: 12.5%">총 근무시간</th>
                <th scope="col" style="width: 12.5%">평균 근무시간</th>
                <th scope="col" style="width: 12.5%">총 지각시간</th>
                <th scope="col" style="width: 12.5%">총 조퇴시간</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${attAdminList}" var="memberAtt" varStatus="i">
                <tr>
                    <input type="hidden" id="numId${i.count}" value="${memberAtt.id}">
                    <td>${memberAtt.id}</td>
                    <td>${memberAtt.memberName}</td>
                    <td>${memberAtt.memberDept}</td>
                    <td>${memberAtt.memberPosition}</td>
                    <td>${memberAtt.countAttendanceDate} <sub>일</sub></td>
                    <td>${memberAtt.countAbsenceDate} <sub>일</sub></td>
                    <td>${memberAtt.totalWorkedTime/60} <sub>시간</sub></td>
                    <td>${memberAtt.avgWorkedTime/60} <sub>시간</sub></td>
                    <td>${memberAtt.totalLateTime} <sub>분</sub></td>
                    <td>${memberAtt.totalEarlyTime} <sub>분</sub></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <table class="table2">
        <tr>
            <th>기준 근무일수:</th>
            <td><input type="text" class="inputData" id="countStandardDate"></td>
            <th class="unit" style="width: 20px">일</th>
        </tr>
        <tr>
            <th>평균 근무일수:</th>
            <td><input type="text" class="inputData" id="totalWorkedDate"></td>
            <th class="unit">일</th>
        </tr>
        <tr>
            <th>평균 결근일수:</th>
            <td><input type="text" class="inputData" id="totalAbsenceDate"></td>
            <th class="unit">일</th>
        </tr>
        <tr>
            <th>기본 근무시간:</th>
            <td><input type="text" class="inputData" id="totalWorkedTime"></td>
            <th class="unit">시간</th>
        </tr>
        <tr>
            <th>평균 근무시간:</th>
            <td><input type="text" class="inputData" id="avgWorkedTime"></td>
            <th class="unit">시간</th>
        </tr>
        <tr>
            <th>초과 근무시간:</th>
            <td><input type="text" class="inputData" id="overTime"></td>
            <th class="unit">분</th>
        </tr>
        <tr>
            <th>평균 지각률:</th>
            <td><input type="text" class="inputData" id="countLateTime"></td>
            <th class="unit">회</th>
        </tr>
        <tr>
            <th>평균 지각시간:</th>
            <td><input type="text" class="inputData" id="totalLateTime"></td>
            <th class="unit">분</th>
        </tr>
        <tr>
            <th>평균 조퇴률:</th>
            <td><input type="text" class="inputData" id="countEarlyTime"></td>
            <th class="unit">회</th>
        </tr>
        <tr>
            <th>평균 조퇴시간:</th>
            <td><input type="text" class="inputData" id="totalEarlyTime"></td>
            <th class="unit">분</th>
        </tr>
    </table>
    <%--        <input type="hidden" id="joinDate" value=${memberDTO.memberJoinDate}>--%>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>

</body>
<script>
    let numId;
    window.onload = function () {
        const countStandardDate = document.getElementById("countStandardDate");
        const totalWorkedDate = document.getElementById("totalWorkedDate");
        const totalAbsenceDate = document.getElementById("totalAbsenceDate");
        const totalWorkedTime = document.getElementById("totalWorkedTime");
        const avgWorkedTime = document.getElementById("avgWorkedTime");
        const overTime = document.getElementById("overTime");
        const countLateTime = document.getElementById("countLateTime");
        const totalLateTime = document.getElementById("totalLateTime");
        const countEarlyTime = document.getElementById("countEarlyTime");
        const totalEarlyTime = document.getElementById("totalEarlyTime");
        let sumWorkedDays=0;
        let sumAbsenceDays=0;
        let sumWorkedTime=0;
        let sumLateTime=0;
        let sumEarlyTime=0;
        let a;
        let b;
        let c;
        let d;
        let e;
        <c:forEach items="${attAdminList}" var="memberAtt" varStatus="i">
        numId = document.getElementById("numId${i.count}").value;
        console.log(numId);
        if (numId==1){
            countStandardDate.value =${memberAtt.countStandardDate};    // 기준 근무일수
            totalWorkedTime.value = ${memberAtt.totalWorkedTime/60};       // 기본 근무시간
        }
        a=${memberAtt.countAttendanceDate};
            b=${memberAtt.countAbsenceDate};
                c=${memberAtt.totalWorkedTime};
                    d=${memberAtt.totalLateTime};
                        e=${memberAtt.totalEarlyTime};
        sumWorkedDays+=Number(a);
        sumAbsenceDays+=Number(b);
        sumWorkedTime+=Number(c);
        sumLateTime+=Number(d);
        sumEarlyTime+=Number(e);
        <%--console.log(${memberAtt.adminDate});--%>
        console.log(${memberAtt.countStandardDate});
        console.log(${memberAtt.countAbsenceDate});
        console.log(${memberAtt.countAttendanceDate});
        console.log(${memberAtt.totalWorkedTime});
        console.log(${memberAtt.avgWorkedTime});
        console.log(${memberAtt.totalEarlyTime});
        console.log(${memberAtt.totalLateTime});
        </c:forEach>
        console.log("=====sumWorkedDays======="+sumWorkedDays);
        console.log("======sumAbsenceDays======"+sumAbsenceDays);
        console.log("=====sumWorkedTime======="+sumWorkedTime);
        console.log("=====sumLateTime======="+sumLateTime);
        console.log("======sumEarlyTime======"+sumEarlyTime);

        let dataSize = ${attAdminList.size()};
        let totalCountLate ="${totalLateTime}";
        let totalCountEarly ="${totalEarlyTime}";
        totalWorkedDate.value = (sumWorkedDays/dataSize).toFixed(2);
            totalAbsenceDate.value = (sumAbsenceDays/countStandardDate.value).toFixed(2);
                avgWorkedTime.value = (sumWorkedTime/dataSize/60).toFixed(2);
                    overTime.value = "${overTime}";
                        countLateTime.value = (totalCountLate/dataSize).toFixed(2);
                            totalLateTime.value = (sumLateTime/dataSize).toFixed(0);
                                countEarlyTime.value = (totalCountEarly/dataSize).toFixed(2);
                                    totalEarlyTime.value =(sumEarlyTime/dataSize).toFixed(0);
    }
</script>
</html>
