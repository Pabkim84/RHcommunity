<%@ page import="com.its.rhCommunity.dto.AnnualHolidayDTO" %>
<%@ page import="org.springframework.web.bind.annotation.RequestParam" %>
<%@ page import="org.springframework.web.bind.annotation.ModelAttribute" %>
<%@ page import="com.its.rhCommunity.repository.AnnualHolidayRepository" %><%--
  Created by IntelliJ IDEA.
  User: esteb
  Date: 2022-09-26
  Time: 오전 2:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="/resources/js/jquery.js"></script>

    <title>Title</title>
    <style>
        body {
            overflow: hidden;
            background-color: rgb(26,32,53);
            font-family: 'Source Sans Pro', sans-serif;
        }
        .main-container {
            background-color: lightgrey;
            width: 1183px;
            height: 635px;
            position: relative;
            display: flex;
        }
        .mini-container{
            background-color: lightgrey;
            width: 70%;
            height: 500px;
            position: absolute;
            top: 65px;
            left: 2%;
            overflow: visible;
            border: 2px solid whitesmoke;
        }
        .day {
            height: 10% !important;
            background-color: darkgrey !important;
            border: 1px solid darkgrey!important;
            font-weight: bold;
        }
        .chk {
            width: 13.9%;
            height: 15%;
            margin: 0 -2px 0 0;
            padding: 0;
            border: 1px solid darkgrey;
            border-spacing: 0;
            border-inline: none;
            position: relative;
            box-shadow: 0px 1px 0px 1px darkgrey inset;
            background-color: whitesmoke;
        }
        .chk2 {
            width: 13.9%;
            height: 15%;
            margin: 0 -2px 0 0;
            padding: 0;
            border: 1px solid darkgrey;
            border-spacing: 0;
            border-inline: none;
            position: relative;
            box-shadow: 0px 1px 0px 1px darkgrey inset;
            background-color: lightgrey;
        }
        .chk3 {
            width: 13.9%;
            height: 15%;
            margin: 0 -2px 0 0;
            padding: 0;
            border: 1px solid darkgrey;
            border-spacing: 0;
            border-inline: none;
            position: relative;
            box-shadow: 0px 1px 0px 1px darkgrey inset;
            background-color: khaki;
        }
        .chk4 {
            width: 13.9%;
            height: 15%;
            margin: 0 -2px 0 0;
            padding: 0;
            border: 1px solid darkgrey;
            border-spacing: 0;
            border-inline: none;
            position: relative;
            box-shadow: 0px 1px 0px 1px darkgrey inset;
            background-color: khaki;
        }
        .subTitle {
            display: flex;
            position: relative;
            top: 15px;
            left: 2%;
            width: 50%;
            height: 20px;
            float: left;
            margin-top: 25px;
            color: rgba(30,30,30,0.9);
            font-size: 14px;
            font-weight: bold;
        }
        .subTitle img {
            position: relative;
            top: 5px;
            margin-right: 3px;
            width: 11px;
            height: 11px;
        }
        .info {;
            position: absolute;
            top: 93%;
            left: 405px;
            font-size: 16px;
            font-weight: bold;
        }
        span {
            margin-right: 10px;
        }
        input[type="text"] {
            width: 30px;
            margin-left: 5px;
            text-align: right;
        }
        .calenderPage {
            position: absolute;
            top: 5%;
            left: 33%;
            width: 100px;
            height: 30px;
        }
        .holidayList {
            position: absolute;
            left: 80%;
            top: 10%;
            width: 200px;
            height: 500px;
            background-color: whitesmoke;
            box-shadow: 2px 2px 3px 2px darkgrey inset;
            overflow: scroll;
            overflow-x: hidden;
            overflow-y: hidden;
            border: 1px solid darkgrey;
        }
        table th {
        }
        table {
            width: 100%;
            text-align: center;
            border: 1px solid lightgrey;
            font-size: 16px;
        }
        tr {
            border: 1px solid lightgrey;
            height: 29px;

        }
        td {
            border: 1px solid lightgrey;
        }
        tr:hover {
            background-color: lightgrey;
        }
        .space {
            position: absolute;
            top: 65px;
            left: 74%;
            width: 50px;
            height: 500px;
            line-height: 500px;
            font-size: 30px;
            color: rgb(60,60,60)
        }
        .btn {
            width: 45px;
            height: 25px;
            font-size: 12px;
            color: black;
            border: 1px solid grey;
            box-shadow: 1px 1px 0px 1px dimgray;
            background: transparent;
        }
        .btn:hover {
            background-color: rgba(235, 235, 235, 0.5);
            box-shadow: 1px 1px 0px 1px dimgrey inset;
            font-size: 11px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

<div class="main-container">
    <div class="subTitle"><img src="../../../resources/img/triangle.png">휴가신청</div>
    <div class="subTitle" style="left: 30%"><img src="../../../resources/img/triangle.png">사용&신청 휴가일자</div>
    <div class="mini-container">
        <button class="chk day">일요일</button>
        <button class="chk day">월요일</button>
        <button class="chk day">화요일</button>
        <button class="chk day">수요일</button>
        <button class="chk day">목요일</button>
        <button class="chk day">금요일</button>
        <button class="chk day">토요일</button>
        <c:forEach begin="0" end="41" step="1" var="num">
            <input type="button" class="chk" id="btn${num}">
        </c:forEach>
    </div>
    <div class="space">>></div>
    <div class="holidayList">
        <table>
            <tbody id="holidays">
                <c:forEach items="${holidayList}" var="holiday" varStatus="status">
                    <tr class="papa">
                        <td>${status.count}</td>
                        <td id="holiday${status.count}">${holiday.holidayDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="calenderPage">
<%--        <input type="button" class="btn pageBtn" id="preMonth"  value="<--이전달">--%>
        <input type="button" class="btn pageBtn" id="actMonth" value="이번달">
        <input type="button" class="btn pageBtn" id="nextMonth"  value="다음달">
    </div>
    <div class="info">
        <span>총 휴가일수:<input type="text" id="total" value=${totalVacations}>일</span>
        <span>사용 휴가일수:<input type="text" id="used" value=${usedVacations}>일</span>
        <span>선택 휴가일수:<input type="text" id="select" value=0>일</span>
        <span>잔여 휴가일수:<input type="text" id="rest" value=${restVacations}>일</span>
        <input type="button" class="btn btn-submit" onclick="saveHoliday()" style="width: 70px; height: 30px;" value="휴가신청">
    </div>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>

<div class="right-container"></div>
</body>
<script>
    const dayLabel = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    let arr = [];
    let selectId = [];
    let selectedId = [];
    let selectedDate = [];
    const totalVacations = ${totalVacations};
    let restVacations = ${totalVacations}-${usedVacations};
    let rest = document.getElementById("rest").value;
    let selectVacations = document.getElementById("select").value;
    window.onload=function (){
        const date = new Date();
        const today = new Date();
        const firstDate = new Date(date.getFullYear(), date.getMonth(), 1);
        const firstDay = firstDate.getDay();
        const startDate = new Date(date.getFullYear(), date.getMonth(), 1-firstDay);
        document.getElementById("actMonth").value = (date.getMonth()+1)+"월";
        document.getElementById("nextMonth").value = (date.getMonth()+2)+"월";
        <c:forEach var="holiday" items="${holidayList}">
            selectedDate.push("${holiday.holidayDate}");
        </c:forEach>
        // console.log("onload/selectedDate: "+selectedDate);
        basePage(startDate, today);
    }
    function basePage (startDate, today) {
        // console.log("basePage/selectedDate=="+selectedDate);

        for(let i = 0; i<42; i++) {
        // 페이지 달 전체 일자 입력
            if(startDate.getDate()<10){
                document.getElementById("btn"+i).value = startDate.getFullYear()+"-"+(startDate.getMonth()+1)+"-0"+startDate.getDate();
            } else if ((startDate.getMonth()+1)<10){
                document.getElementById("btn"+i).value = startDate.getFullYear()+"-0"+(startDate.getMonth()+1)+"-"+startDate.getDate();
            } else {
                document.getElementById("btn"+i).value = startDate.getFullYear()+"-"+(startDate.getMonth()+1)+"-"+startDate.getDate();
            }

        // 선택일자 (내일-미래, 평일)
            if(startDate>=today&&startDate.getDay()!=0&&startDate.getDay()!=6){
                // 사용&신청 휴가일자 파란색으로 변경
                let todayDate = document.getElementById("btn"+i).value;
                document.getElementById("btn" + i).setAttribute("class", "chk");
                for(let j=0; j<selectedDate.length; j++) {
                    // 사용&신청 휴가일자가 있으면 파란색표시
                    if (todayDate == selectedDate[j]) {
                        document.getElementById("btn" + i).setAttribute("class", "chk4");
                        // console.log("chk4: btn"+i);
                    } else if (startDate<today||startDate.getDay()==0||startDate.getDay()==6) {
                        for (let k = 0; k < selectId.length; k++) {
                            const id = "btn" + i;
                            if (selectId[k] == id) {
                                selectId.splice(k, 1);
                                arr.splice(k, 1);
                                document.getElementById(id).removeAttribute("style");
                                document.getElementById(id).setAttribute("class", "chk");
                            }
                        }
                    }
                }
            }
        // 선택제외일자 (과거-오늘, 토, 일)
            else {
                document.getElementById("btn"+i).removeAttribute("style");
                document.getElementById("btn"+i).setAttribute("class", "chk2");
                // console.log("chk2: btn"+i);
            }
            startDate.setDate(startDate.getDate()+1);
        }
    }
    $('.pageBtn').click(function () {
        const id = $(this).attr("id");
        // console.log(id);
        // const preMonth = "preMonth";
        const actMonth = "actMonth";
        const nextMonth = "nextMonth";
        const date = new Date();
        const today = new Date();
        let firstDate;
        let firstDay;
        let startDate;
        if (id ==nextMonth ) {
            date.setMonth(date.getMonth()+1);
            // else if (id == preMonth) {
            //     date.setMonth(date.getMonth() - 1);
            // }
            firstDate = new Date(date.getFullYear(), date.getMonth(), 1);
            firstDay = firstDate.getDay();
            startDate = new Date(date.getFullYear(), date.getMonth(), 1 - firstDay);
        } else if (id ==actMonth ) {
            date.setMonth(date.getMonth());
            // else if (id == preMonth) {
            //     date.setMonth(date.getMonth() - 1);
            // }
            firstDate = new Date(date.getFullYear(), date.getMonth(), 1);
            firstDay = firstDate.getDay();
            startDate = new Date(date.getFullYear(), date.getMonth(), 1 - firstDay);
        }
        basePage(startDate, today);
    });
    $('.chk').click(function (){
        // console.log("사용휴가+선택휴가: "+(arr.length+1)+" + "+selectedDate.length);
        // console.log("총선택일자: "+((arr.length+1)+selectedDate.length));
        // console.log("총휴가일수: "+totalVacations);

        if((arr.length+1+selectedDate.length)<=totalVacations){
            let id = $(this).attr("id");
            let selectDate = document.getElementById(id).value;
            if (!arr.includes(selectDate)&&!selectId.includes(id)&&$(this).attr("class")=="chk") {
                selectId.push(id);
                arr.push(selectDate);
                document.getElementById(id).setAttribute("style", "background-color: khaki;")
                // document.getElementById(id).setAttribute("class", "chk3");
            } else if(arr.includes(selectDate)&&selectId.includes(id)&&$(this).attr("class")=="chk"){
                for (let i = 0; i < selectId.length; i++) {
                    if (selectId[i] == id) {
                        selectId.splice(i, 1);
                        arr.splice(i,1);
                        document.getElementById(id).removeAttribute("style");
                    }
                }
                document.getElementById(id).setAttribute("class", "chk");
            }
            document.getElementById("select").value = arr.length;
            document.getElementById("rest").value = restVacations-arr.length;
            // console.log(selectId);
        } else {
            alert("신청 휴가일수가 잔여 휴가일수보다 많습니다");
        }
    });

    const saveHoliday = () => {
        $.ajax({
            type: "post",
            url : "/annualHoliday/save",
            data : {
                "holidayArray": arr,
                "btnId": selectId,
                "totalVacations": totalVacations,
            },
            success: function (result) {
                const id = document.getElementById("holidays");
                let list ="";
                let count=1;
                selectedDate=[];
                for(let i in result) {
                    list += "<tr><td>"+(count)+"</td><td id='holiday"+(count++)+"'>"+result[i]+"</td></tr>";
                    selectedDate.push(result[i]);
                    // console.log(i);
                    // console.log(result[i]);
                }
                // console.log("selectedDate: "+selectedDate);
                document.getElementById("holidays").innerHTML = list;
                for(let i in selectId) {
                    // console.log("selectId: "+selectId[i]);
                    document.getElementById(selectId[i]).setAttribute("class", "chk4");
                }
                document.getElementById("select").value = 0;
                document.getElementById("used").value = selectedDate.length;
                document.getElementById("rest").value = totalVacations - selectedDate.length;

                // selectId=[];
                arr=[];
            },
            error: function () {
                alert("no pass");
            }
        });
    }
    <%--$('.btn pageBtn').click(function (){--%>
    <%--    const id = $(this).attr("id");--%>
    <%--    console.log(id);--%>
    <%--    const preMonth = "preMonth";--%>
    <%--    const actMonth = "actMonth";--%>
    <%--    const nextMonth = "nextMonth";--%>
    <%--    const date = new Date();--%>
    <%--    if (id == preMonth) {--%>
    <%--        date.setMonth(date.getMonth() - 1);--%>
    <%--    } else if (id == nextMonth) {--%>
    <%--        date.setMonth(date.getMonth() + 1);--%>
    <%--    }--%>
    <%--    const today = new Date();--%>
    <%--    const firstDate = new Date(date.getFullYear(), date.getMonth(), 1);--%>
    <%--    let firstDay = firstDate.getDay();--%>
    <%--    const lastDate = new Date(date.getFullYear(), date.getMonth(), 0);--%>
    <%--    const lastDay = lastDate.getDay();--%>
    <%--    const startDate = new Date(date.getFullYear(), date.getMonth(), 1 - firstDay);--%>
    <%--        // console.log("startDate", startDate);--%>
    <%--    for (let i = 0; i < 42; i++) {--%>
    <%--        document.getElementById("btn" + i).value = startDate.getFullYear() + "-" + (startDate.getMonth() + 1) + "-" + startDate.getDate();--%>
    <%--        aaa(i);--%>
    <%--        if (startDate < today) {--%>
    <%--            document.getElementById("btn" + i).removeAttribute("onmousedown");--%>
    <%--            document.getElementById("btn" + i).removeAttribute("style");--%>
    <%--            document.getElementById("btn" + i).setAttribute("class", "chk2");--%>
    <%--        } else {--%>
    <%--            document.getElementById("btn" + i).setAttribute("onmousedown", "selectDate(this)");--%>
    <%--            document.getElementById("btn" + i).setAttribute("style", "background-color: whitesmoke");--%>
    <%--            document.getElementById("btn" + i).setAttribute("class", "chk");--%>
    <%--            aaa(i);--%>
    <%--        }--%>
    <%--        if (startDate.getDay() == 0 || startDate.getDay() == 6) {--%>
    <%--            document.getElementById("btn" + i).removeAttribute("onmousedown");--%>
    <%--            document.getElementById("btn" + i).removeAttribute("style");--%>
    <%--            document.getElementById("btn" + i).setAttribute("class", "chk2");--%>
    <%--        }--%>
    <%--        startDate.setDate(startDate.getDate() + 1);--%>
    <%--    }--%>
    <%--});--%>
    <%--function aaa (i){--%>
    <%--    let todayDate = document.getElementById("btn"+i).value;--%>
    <%--    let count = ${holidayList.size()};--%>
    <%--    let id="";--%>
    <%--    for(let j=1; j<=count; j++){--%>
    <%--        id = "holiday"+j;--%>
    <%--        let holidayDate = document.getElementById(id).outerText;--%>
    <%--        if(todayDate==holidayDate){--%>
    <%--            document.getElementById("btn" + i).removeAttribute("onmousedown");--%>
    <%--            document.getElementById("btn" + i).setAttribute("class", "chk2");--%>
    <%--            document.getElementById("btn" + i).setAttribute("style", "background-color: khaki");--%>
    <%--        }--%>
    <%--    }--%>
    <%--}--%>
</script>
</html>
