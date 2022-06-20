<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: 오후 2:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>사원목록</title>
    <script src="/resources/js/jquery.js"></script>
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
            margin-bottom: 0px;
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
            background-color: rgba(31,40,62,0.1);
        }
        .inputStyle{
            width: 100%;
            height: 50px;
            background-color: transparent;
            color: lightgray;
            text-align: center;
            border: 0;
        }
        .thStyle{
            text-align: center;
        }

    </style>
</head>
<body>
<jsp:include page="../layout/sidebar.jsp" flush="false"></jsp:include>
<div class="container">
    <div class="sub-container">
        <p class="tableCaption">상담일정</p>
        <p style="text-align: center; margin: 25px auto 0 auto; font-size: 14px; color: darkgrey">예약가능한 날짜의 시간대를 클릭하면 예약가능합니다.</p>
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th class="thStyle" scope="col">날짜</th>
                <th class="thStyle" scope="col" id="dT1">10시-11시</th>
                <th class="thStyle" scope="col" id="dT2">11시-12시</th>
                <th class="thStyle" scope="col" id="dT3">13시-14시</th>
                <th class="thStyle" scope="col" id="dT4">14시-15시</th>
                <th class="thStyle" scope="col" id="dT5">15시-16시</th>
                <th class="thStyle" scope="col" id="dT6">16시-17시</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${reservationList}" var="reservation" varStatus="status">
                <tr style="background-color: rgba(31,40,62,0.1)">
                    <td><input class="inputStyle" type="text" name="reserveDate" value="${reservation.reserveDate}" readonly></td>
                    <td><a href="#" onclick="reservation('${reservation.reserveDate}', 'dT1')"><input class="inputStyle" type="text" name="dT1" value="${reservation.DT1}" readonly></a></td>
                    <td><a href="#" onclick="reservation('${reservation.reserveDate}', 'dT2')"><input class="inputStyle" type="text" name="dT2" value="${reservation.DT2}" readonly></a></td>
                    <td><a href="#" onclick="reservation('${reservation.reserveDate}', 'dT3')"><input class="inputStyle" type="text" name="dT3" value="${reservation.DT3}" readonly></a></td>
                    <td><a href="#" onclick="reservation('${reservation.reserveDate}', 'dT4')"><input class="inputStyle" type="text" name="dT4" value="${reservation.DT4}" readonly></a></td>
                    <td><a href="#" onclick="reservation('${reservation.reserveDate}', 'dT5')"><input class="inputStyle" type="text" name="dT5" value="${reservation.DT5}" readonly></a></td>
                    <td><a href="#" onclick="reservation('${reservation.reserveDate}', 'dT6')"><input class="inputStyle" type="text" name="dT6" value="${reservation.DT6}" readonly></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
<script>
    const reservation = (rDate, dT) => {
        if (confirm("선택한 날짜에 상담예약 하시겠습니까?")) {
            location.href="/reserveConsultation/update?rDate="+rDate + "&dT=" + dT;
        } else {
            alert("상담예약이 취소되었습니다.")
        }
    }
</script>
</html>
