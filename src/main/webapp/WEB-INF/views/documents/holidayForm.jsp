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
    <script src="/resources/js/jquery.js"></script>

    <title>휴가신청서</title>
    <style>
        .container {
            margin-right: auto;
            margin-left: auto;
        }
        .table-container {
            text-align: center;
            margin-right: auto;
            margin-left: auto;
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
        .selectRadio {
            margin-left: 5px;
        }
        .intext  {
            width: 400px;
            height: 30px;
            line-height: 50px;
            background-color: lightgray;
            outline-style: none;
            border: 1px solid lightgray;
        }
        .btnDiv {
            position: absolute;
            top: 95%;
            width: 99%;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="table-container">
        <table class="table-custom">
            <caption class="table-caption">휴가신청서</caption>
            <thead>
            <tr style="border: 0">
                <th style="border: 0">
                    <p class="subTitle">기본정보</p>
                </th>
            </tr>
            </thead>
            <tbody style="text-align: center;">
            <tr>
                <th>사원번호</th>
                <td>${memberDTO.id}</td>
                <th>사원명</th>
                <td>${memberDTO.memberName}</td>
                <th>전체휴가일수</th>
                <td>${holidayDTO.totalVacations}일</td>
            </tr>
            <tr>
                <th>부서</th>
                <td>${memberDTO.memberDept}</td>
                <th>직위</th>
                <td>${memberDTO.memberPosition}</td>
                <th>잔여휴가일수</th>
                <td>${holidayDTO.restVacations}일</td>
            </tr>
            <tr>
                <th>주소</th>
                <td colspan="3">${memberDTO.memberAddress}</td>
                <th>연락처</th>
                <td>${memberDTO.memberMobile}</td>
            </tr>
            </tbody>
        </table>
        <table class="table-custom">
            <thead>
            <tr style="border: 0">
                <th style="border: 0">
                    <p class="subTitle">휴가 일정 및 사유</p>
                </th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th colspan="4">
                    <p class="subTitle" style="text-align: center; font-size: 16px">휴가 신청일자
                        <input type="date" class="selectDate" id="startDate"> 부터 <input type="date" class="selectDate" id="endDate"> 까지 총
                        <input type="text" id="countDays" style="width: 12px; border: 0; font-weight: bold; text-align: right">일 신청합니다.
                    </p>
                </th>
            </tr>
            <tr>
                <td colspan="4" rowspan="4">
                    <input type="radio" class="selectRadio" id="selectVal1" name="motive" value="무급휴가" checked>무급휴가
                    <input type="radio" class="selectRadio" id="selectVal2" name="motive" value="유급휴가">유급휴가
                    <input type="radio" class="selectRadio" id="selectVal3" name="motive" value="병가휴가">병가휴가
                    <input type="radio" class="selectRadio" id="selectVal4" name="motive" value="기타사유">기타사유:
                    <input type="text" class="selectRadio intext" name="motive" id="selectInText">
                </td>
            </tr>
            </tbody>
        </table>
        <p class="text">위와 같은 날짜로 휴가를 신청합니다.</p>
        <p class="text" id="current_date"></p>
        <span>신청인</span> <span class="text-name">${memberDTO.memberName}</span>   <span class="text-auth">(인)</span>
        <table class="table-custom" style="border: 0; margin-top: 100px">
            <tr style="border: 0">
                <th style="border: 0"></th>
                <th style="border: 0"></th>
                <th style="border: 0"></th>
                <th style="border: 0"></th>
                <th>부서장</th>
                <th>인사팀장</th>
            </tr>
            <tr style="border: 0; text-align: center">
                <td style="border: 0"></td>
                <td style="border: 0"></td>
                <td style="border: 0"></td>
                <td style="border: 0"></td>
                <td>홍 길 동</td>
                <td>아 무 개</td>
            </tr>
        </table>
    </div>
    <div class="btnDiv"><button class="btn"  id="print">출력하기</button></div>
</div>
</body>
<script>
    date = new Date();
    year = date.getFullYear();
    month = date.getMonth() + 1;
    day = date.getDate();
    document.getElementById("current_date").innerHTML = year + "년 " + month + "월 " + day + "일" ;
    const start = document.getElementById("startDate");
    const end = document.getElementById("endDate");
    $('.selectDate').on('change', function (){
    let countDays=1;

        if(isNaN(start.value)&&isNaN(end.value)){
            const startDate = new Date(start.value);
            const endDate = new Date(end.value);
            countDays += endDate.getDate()-startDate.getDate();
            document.getElementById("countDays").value = countDays;
            console.log(start.value);
            console.log(end.value);
        }
            console.log(countDays);
    });

    const selectVal = document.getElementById("selectVal");
    let clickIdVal;
    $('.selectRadio').click(function (){
        clickIdVal = $(this).attr("value");
        console.log(clickIdVal);
        if(clickIdVal=="기타사유"){
            $('#selectInText').keyup(function (e){
                document.getElementById("selectVal4").value=e.target.value;
                console.log("clickIdVal: point---------1===="+document.getElementById("selectVal4").value);
            });
        }
    });


    $('#print').click(function () {
        if(!isNaN(start.value)||!isNaN(end.value)){
            console.log(start);
            console.log(end);
            alert("희망날짜를 입력해주세요");
        } else {
            document.querySelector('#print').style.display="none";
            window.print();
            document.querySelector('#print').style.display="inline";
        }
    });
</script>
</html>

