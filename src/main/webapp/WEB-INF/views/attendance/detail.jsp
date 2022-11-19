<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: 오후 2:25
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <meta charset="utf-8" />
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <title>사원목록</title>
    <style>
        body {
            margin: 0;
            background-color: rgb(26,32,53);
            font-family: 'Source Sans Pro', sans-serif;
            overflow: hidden;
        }
        .main-container{
            background-color: lightgrey;
            width: 1183px;
            height: 635px;
            position: relative;
            display: flex;
        }
        .mini-container{
            background-color: lightgrey;
            width: 65%;
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
            color: rgba(30,30,30,0.9);
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
            left: 70%;
        }
        .table2 th{
            text-align: right;
            padding-right: 5px;
        }
        .table2 td {
            width: 10%;
            text-indent: 17px;
            box-shadow: 1px 2px 2px 2px grey inset;
            background: whitesmoke;
        }
        th{
            border: 1px solid lightgrey;
            font-size: 13px;
            line-height: 0px;
            width: 16.67%;
        }
        td{
            border: 1px solid lightgrey;
            height: 40px !important;
            font-size: 12px;
        }
        tr{
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
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

    <div class="main-container">
        <div class="subTitle"><img src="../../../resources/img/triangle.png">내 근태현황</div>
        <div class="mini-container">
            <table class="table1">
                <thead>
                <tr>
                    <th scope="col">근태일자</th>
                    <th scope="col">출근시간</th>
                    <th scope="col">퇴근시간</th>
                    <th scope="col">결근일자</th>
                    <th scope="col">지각시간</th>
                    <th scope="col">조퇴시간</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${attendanceList}" var="list">

                    <tr>
                        <td>${list.today}</td>
                        <td>${list.attendanceTime}</td>
                        <td>${list.closingTime}</td>
                        <td>${list.absenceDate}</td>
                        <td>${list.lateTime}</td>
                        <td>${list.earlyTime}</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <table class="table2">
            <tr>
                <th>총 근무일수:</th>
                <td><input type="text" class="inputData" id="totalWorkingDays"></td>
                <th class="unit">일</th>
            </tr>
            <tr>
                <th>내 근무일수:</th>
                <td><input type="text" class="inputData" id="myWorkingDays"></td>
                <th class="unit">일</th>
            </tr>
            <tr>
                <th>내 결근일수:</th>
                <td><input type="text" class="inputData" id="myAbsenceDays"></td>
                <th class="unit">일</th>
            </tr>
            <tr>
                <th>총 근무시간:</th>
                <td id="totalWorkingTime">${totalWorkedTime/60}</td>
                <th class="unit">시간</th>
            </tr>
            <tr>
                <th>평균 근무시간:</th>
                <td id="avgWorkingTime">${avgWorkedTime/60}</td>
                <th class="unit">시간</th>
            </tr>
            <tr>
                <th>초과 근무시간:</th>
                <td id="overTime">${overTime}</td>
                <th class="unit">시간</th>
            </tr>
            <tr>
                <th>총 지각횟수:</th>
                <td>${totalLateCount}</td>
                <th class="unit">회</th>
            </tr>
            <tr>
                <th>총 지각시간:</th>
                <td>${totalLateTime}</td>
                <th class="unit">분</th>
            </tr>
            <tr>
                <th>총 조퇴횟수:</th>
                <td>${totalEarlyCount}</td>
                <th class="unit">회</th>
            </tr>
            <tr>
                <th>총 조퇴시간:</th>
                <td>${totalEarlyTime}</td>
                <th class="unit">분</th>
            </tr>
        </table>
        <input type="hidden" id="joinDate" value=${memberDTO.memberJoinDate}>
    </div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>

</body>
<script>
    window.onload=function (){
        let date = new Date();
        let firstDay = new Date(date.getFullYear(),date.getMonth(),1);
        console.log("firstDay: "+firstDay);
        let lastDay = new Date(date.getFullYear(),date.getMonth()+1,0);
        console.log("lastDay: "+lastDay);
        let lastDate = lastDay.getDate();

        console.log("lastDate: "+lastDate);
        let y = date.getFullYear();
        let m = date.getMonth()+1;
        let d = date.getDate();
        console.log("y+m+d: "+y+m+d);

        const memberJoinDate = new Date(document.getElementById("joinDate").value);
        console.log("memberJoinDate: "+memberJoinDate);

        const y1 = memberJoinDate.getFullYear();
        const m1 = memberJoinDate.getMonth()+1;
        const d1 = memberJoinDate.getDate();
        console.log("y1+m1+d1: "+y1+m1+d1);

        let i = 1;
        let j = 1;
        let cal = [];
        let cal2 = [];
        if(y==y1 && m==m1){
            i = d1;
            j = d1;
        }
        for(i; i<=lastDate; i++) {
            let days = new Date(y+"-"+m+"-"+i);
            if(days.getDay()!=0 && days.getDay()!=6){
                days= days.getFullYear()+"-"+(days.getMonth()+1)+"-"+days.getDate();
                cal.push(days);
            }
        }
        for(j; j<=d; j++) {
            let days = new Date(y+"-"+m+"-"+j);
            if(days.getDay()!=0 && days.getDay()!=6){
                days= days.getFullYear()+"-"+(days.getMonth()+1)+"-"+days.getDate();
                cal2.push(days);
            }
        }
        console.log(cal);
        console.log(cal2);
        document.getElementById("totalWorkingDays").value = cal.length;
        document.getElementById("myWorkingDays").value = ${attendanceList.size()-totalAbsenceCount};
        document.getElementById("myAbsenceDays").value = ${totalAbsenceCount};
    }
</script>
</html>
