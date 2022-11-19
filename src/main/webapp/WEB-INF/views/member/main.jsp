<%--
  Created by IntelliJ IDEA.
  User: esteb
  Date: 2022-09-21
  Time: 오후 9:17
  To change this template use File | Settings | File Templates.
--%>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <title>Title</title>
    <script src="/resources/js/jquery.js"></script>

    <style>
        body {
            margin: 0;
            background-color: rgb(26,32,53);
            font-family: 'Source Sans Pro', sans-serif;
            overflow: hidden;
        }
        .main-container {
            background-color: lightgrey;
            width: 1183px;
            height: 635px;
            position: relative;
            left: 100px;
        }

        .subTitle {
            display: flex;
            position: absolute;
            top: 15px;
            left: 2%;
            width: 45%;
            float: left;
            margin-top: 25px;
            color: rgba(30,30,30,0.9);
            font-size: 14px;
            font-weight: bold;
        }
        .left-1{
            top: 15px;
        }
        .right-1{
            top: 15px;
            left: 50%;
        }
        .left-2{
            top: 270px;
        }
        .right-2{
            top: 270px;
            left: 50%;
        }
        .left-3{
            top: 390px;
        }
        .right-3{
            top: 390px;
            left: 50%;
        }
        .left-4{
            top: 510px;
        }
        .right-4{
            top: 510px;
            left: 50%;
        }
        .subTitle img {
            position: relative;
            top: 5px;
            margin-right: 3px;
            width: 2%;
            height: 2%;
        }
        .main {
            position: absolute;
            top: 65px;
            left: 2%;
            width: 47%;
            height: 200px;
            border: 1px solid whitesmoke;
            background-color: whitesmoke;
            box-shadow: 0px 0px 5px 2px grey inset;

        }
        .main2{
            position: absolute;
            top: 320px;
            left: 2%;
            width: 47%;
            height: 65px;
            border: 1px solid whitesmoke;
            background-color: whitesmoke;
            box-shadow: 0px 0px 5px 2px grey inset;
        }
        .main3{
            position: absolute;
            top: 440px;
            left: 2%;
            width: 47%;
            height: 65px;
            border: 1px solid whitesmoke;
            background-color: whitesmoke;
            box-shadow: 0px 0px 5px 2px grey inset;
        }
        .main4{
            position: absolute;
            top: 560px;
            left: 2%;
            width: 47%;
            height: 65px;
            border: 1px solid whitesmoke;
            background-color: whitesmoke;
            box-shadow: 0px 0px 5px 2px grey inset;
        }
        .body2 {
            left: 50%;
        }



        .table1 {
            position: relative;
            width: 98%;
            height: 95%;
            border: 1px solid gray;
            margin: 5px;
            border-collapse: collapse;
        }
        .table2 {
            position: relative;
            width: 98%;
            height: 95%;
            border: 1px solid gray;
            margin: 5px;
            border-collapse: collapse;
        }
        .table3 {
            position: relative;
            width: 98%;
            height: 86%;
            border: 1px solid gray;
            margin: 5px;
            border-collapse: collapse;
        }
        tr {
            width: 100%;
            border: 1px solid rgba(210,210,210,0.9)

        }
        .table1 th {
            height: 20%;
            font-size: 12px;
            color: blue;
            text-align: left;
            padding-left: 5px;

        }
        .table1 td {
            height: 20%;
            font-size: 12px;
            color: blue;
            text-align: left;
            padding-left: 5px;
        }
        .table2 th {
            width: 25%;
            height: 20%;
            font-size: 12px;
            color: dimgray;
            text-align: center;
            padding-left: 2px;
        }
        .table2 td {
            width: 25%;
            height: 20%;
            font-size: 12px;
            color: gray;
            text-align: center;
            padding-left: 2px;
        }
        .table3 th {
            width: 20%;
            height: 20%;
            font-size: 12px;
            color: dimgray;
            text-align: center;
            padding-left: 2px;
        }
        .table3 td {
            width: 20%;
            height: 20%;
            font-size: 12px;
            color: gray;
            text-align: center;
            padding-left: 2px;
        }
        .table1 tr:hover {
            background-color: lightgrey;
        }
        .table2 tr:hover {
            background-color: lightgrey;
        }
        .table3 tr:hover {
            background-color: lightgrey;
        }
        .btn-check {
            border: 1px solid whitesmoke;
            width: 66px;
            height: 64px;
            position: relative;
            box-shadow: -3px -3px 0px 0px gray inset;
        }
        .btn-check:hover {
            width: 64px;
            height: 62px;
            box-shadow: -1px -1px 0px 0px gray inset;
        }

    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="main-container">
    <div class="subTitle left-1"><img src="../../../resources/img/triangle.png">이번달 소식</div>
    <div class="subTitle right-1"><img src="../../../resources/img/triangle.png">이번달 신입/경력 사원</div>
    <div class="main body1">
        <table class="table1">
            <tr>
                <th style="width: 70%">새롭게 수정하고 있어요</th>
                <th style="width: 30%; color: dimgray; text-align: right; padding-right: 5px">2020.06.06.</th>
            </tr>
            <tr>
                <td style="width: 70%">[추석맞이]추석연휴 잘보내세요</td>
                <td style="width: 30%; color: dimgray; text-align: right; padding-right: 5px">2020.06.06.</td>

            </tr>
            <tr>
                <td style="width: 70%">테스트 단계입니다</td>
                <td style="width: 30%; color: dimgray; text-align: right; padding-right: 5px">2020.06.06.</td>
            </tr>
            <tr>
                <td style="width: 70%">어떻게 만들어야 잘만들까요?</td>
                <td style="width: 30%; color: dimgray; text-align: right; padding-right: 5px">2020.06.06.</td>
            </tr>
            <tr>
                <td style="width: 70%">공지사항란</td>
                <td style="width: 30%; color: dimgray; text-align: right; padding-right: 5px">2020.06.06.</td>
            </tr>
        </table>
    </div>
    <div class="main body2">
        <table class="table2">
            <thead>
                <tr>
                    <th>사원명</th>
                    <th>부서</th>
                    <th>직급</th>
                    <th>입사일자</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${newList}" var="newList">
                <tr>
                    <td>${newList.memberName}</td>
                    <td>${newList.memberDept}</td>
                    <td>${newList.memberPosition}</td>
                    <td>${newList.memberJoinDate}</td>
<%--                    <td><fmt:formatDate pattern="yyyy-MM-dd" value="${newList.memberJoinDate}"></fmt:formatDate></td>--%>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="subTitle left-2"><img src="../../../resources/img/triangle.png">이번달 전체 근태현황</div>
    <div class="subTitle right-2"><img src="../../../resources/img/triangle.png">저번달 전체 근태현황</div>
    <div class="main2 body1">
        <table class="table3">
            <tr>
                <th>근무일</th>
                <th>출근률</th>
                <th>지각률</th>
                <th>조퇴률</th>
                <th>결근률</th>
            </tr>
            <tr>
                <td>100%</td>
                <td>95%</td>
                <td>95%</td>
                <td>5%</td>
                <td>5%</td>
            </tr>
        </table>
    </div>
    <div class="main2 body2">
        <table class="table3">
            <tr>
                <th>근무일</th>
                <th>출근률</th>
                <th>지각률</th>
                <th>조퇴률</th>
                <th>결근률</th>
            </tr>
            <tr>
                <td>100%</td>
                <td>95%</td>
                <td>95%</td>
                <td>5%</td>
                <td>5%</td>
            </tr>
        </table>
    </div>
    <div class="subTitle left-3"><img src="../../../resources/img/triangle.png">이번달 내 근태현황</div>
    <div class="subTitle right-3"><img src="../../../resources/img/triangle.png">저번달 내 근태현황</div>
    <div class="main3 body1" >
        <table class="table3">
            <tr>
                <th>근무일수</th>
                <th>출근일수</th>
                <th>지각일수</th>
                <th>조퇴일수</th>
                <th>결근일수</th>
            </tr>
            <tr>
                <td>15/일</td>
                <td>15/일</td>
                <td>1/일</td>
                <td>1/일</td>
                <td>0/일</td>
            </tr>
        </table>
    </div>
    <div class="main3 body2">
        <table class="table3">
            <tr>
                <th>근무일수</th>
                <th>출근일수</th>
                <th>지각일수</th>
                <th>조퇴일수</th>
                <th>결근일수</th>
            </tr>
            <tr>
                <td>15/일</td>
                <td>/일</td>
                <td>1/일</td>
                <td>/일</td>
                <td>/일</td>
            </tr>
        </table>
    </div>
    <div class="subTitle left-4"><img src="../../../resources/img/triangle.png">출근 체크기</div>
    <div class="subTitle right-4"><img src="../../../resources/img/triangle.png">퇴근 체크기</div>

    <div class="main4 body1">
        <button class="btn-check" onclick="location.href='/attendance/attendance?id=${sessionScope.id}'">
            <img src="../../../resources/img/check-in.png" alt="">
        </button>
        <span style="position: absolute; left: 70px; line-height: 66px">아직 출근체크 전입니다. 출근 체크하세요~!!</span>
    </div>
    <div class="main4 body2">
        <button class="btn-check" style="position: absolute;" onclick="location.href='/attendance/closing?id=${sessionScope.id}'">
            <img src="../../../resources/img/check-out.png" alt="">
        </button>
        <span style="position: absolute; left: 70px; line-height: 66px">아직 퇴근체크할 시간이 아닙니다.</span>
    </div>
</div>
<%--<div class="sub-container">--%>
<%--    <img src="../../../resources/img/adminz-banner.png" class="myBanner" alt="">--%>
<%--</div>--%>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
</body>
<script>
    function getRandRange(min,max){
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    function getRandWeight(listItem){
        let pickVal = Number.MAX_VALUE;
        let pickItem = null;
        for(let item in listItem){
            if(listItem.hasOwnProperty(item)){
                let tmpVal = -Math.log(Math.random()) / listItem[item];
                if(tmpVal < pickVal){
                    pickVal = tmpVal;
                    pickItem = item;
                }
            }
        }
        return pickItem;
    }

    $(document).ready(function(){
        let listItem = [];
        listItem["김"] = 30;
        listItem["이"] = 20;
        listItem["박"] = 11;
        listItem["최"] = 6;
        listItem["정"] = 5.6;
        listItem["조"] = 3.5;
        listItem["강"] = 2.75
        listItem["윤"] = 2.65
        listItem["장"] = 2.6;
        listItem["임"] = 2.5;
        listItem["한"] = 1.95;
        listItem["전"] = 1.75;
        listItem["권"] = 1.55;
        listItem["신"] = 1.5;
        listItem["송"] = 1.25;
        listItem["오"] = 1.15;
        listItem["서"] = 1;
        listItem["황"] = 0.95;
        listItem["고"] = 0.85;
        listItem["양"] = 0.75;
        listItem["문"] = 0.7;
        let boysNames = new Array(100);
        let girlsNames = new Array(100);
        let memberIdArr = new Array();
        boysNames = ["민준","서준","도윤","예준","시우","하준","주원","지호","지후","준우","준서","건우","도현","현우","지훈","우진","선우","서진","유준","연우","민재","현준","은우","정우","시윤","승우","승현","준혁","지환","윤우","승민","유찬","지우","이준","민성","준영","시후","진우","수호","지원","수현","재윤","시현","동현","태윤","이안","민규","한결","재원","민우","재민","은찬","윤호","시원","민찬","지안","시온","성민","준호","승준","성현","현서","재현","하율","지한","우빈","태민","지성","예성","민호","태현","지율","서우","민혁","은호","성준","규민","정민","준","지민","윤성","율","윤재","우주","하람","하진","민석","준수","은성","태양","예찬","준희","도훈","하민","준성","건","지완","현수","승원","강민"];
        girlsNames = ["서연","서윤","지우","서현","하은","하윤","민서","지유","윤서","지민","채원","수아","지아","지윤","은서","다은","예은","수빈","지안","소율","예린","예원","하린","지원","소윤","서아","시은","유나","유진","채은","윤아","가은","서영","민지","예진","예나","수민","수연","연우","시아","아린","예서","주아","하율","시연","연서","다인","서우","유주","다연","아인","현서","아윤","서은","채윤","하연","서율","서진","유빈","나윤","지율","나은","수현","예지","다현","서하","소은","나연","지은","민주","사랑","시현","예빈","윤지","지현","소연","채아","혜원","지수","은채","주하","승아","다윤","소민","서희","나현","채린","민아","하영","세아","세은","도연","규리","아영","다온","가윤","지연","예림","태희","민채"];
        memberIdArr = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];
        // for(let i=0; i<100; i++){
        //     let pickItem = getRandWeight(listItem);
        //     console.log(pickItem+boysNames[getRandRange(0,99)]);
        //     console.log(pickItem+girlsNames[getRandRange(0,99)]);
        // }
        let memberId="";
        let year1="19";
        let year2=getRandRange(70,99);
        let month=getRandRange(1,12);
        if (month<10){
            month="0"+month;
        }
        let day;
        if (month==1|3|5|7|8|10|12){
            day=getRandRange(1,31);
        } else if(month==4|6|9|11){
            day=getRandRange(1,30);
        } else {
            day=getRandRange(1,28);
        }
        let memberIdNum = year1+year2+month+day;
        console.log(memberIdNum);
        for(let i=0; i<6; i++){
            memberId+=memberIdArr[getRandRange(0,memberIdArr.length)];
        }
        for(let i=0; i<4; i++){
            memberId+=getRandRange(0,9);
        }
        console.log(memberId);
    });
</script>
</html>
