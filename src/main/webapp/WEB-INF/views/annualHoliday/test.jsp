<%--
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
            /*margin: 0;*/
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
            width: 63%;
            height: 400px;
            position: absolute;
            top: 65px;
            left: 2%;
            overflow: visible;
        }
        .chk {
            width: 13%;
            height: 16.3%;
            margin: 0 -2px 0 0;
            padding: 0;
            border: 1px solid darkgrey;
            border-spacing: 0;
            border-inline: none;
            position: relative;
            box-shadow: 1px 1px 0px 1px darkgrey inset;
            background-color: whitesmoke;
        }
        .chk2 {
            width: 13%;
            height: 16.3%;
            margin: 0 -2px 0 0;
            padding: 0;
            border: 1px solid darkgrey;
            border-spacing: 0;
            border-inline: none;
            position: relative;
            box-shadow: 1px 1px 0px 1px darkgrey inset;
            background-color: grey;
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
        .info {
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
        .day {
            height: 40px;
            background-color: grey;

        }
        .calenderPage {
            position: absolute;
            top: 82%;
            left: 23%;
            width: 100%;
            height: 50px;
        }
        .holidayList {
            position: absolute;
            left: 70%;
            top: 10%;
            width: 200px;
            height: 430px;
            background-color: whitesmoke;
            box-shadow: 1px 1px 0px 1px darkgrey inset;
        }
        table th {

        }
        table {
            width: 100%;
            text-align: center;
            border: 1px solid lightgrey;
        }
        tr {
            border: 1px solid lightgrey;
        }
        td {
            border: 1px solid lightgrey;
        }
        tr:hover {
            background-color: lightgrey;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

<div class="main-container">
    <div class="subTitle"><img src="../../../resources/img/triangle.png">휴가신청</div>
    <div class="subTitle" style="left: 20%"><img src="../../../resources/img/triangle.png">사용&신청 휴가일자</div>
    <div class="mini-container">
        <button class="chk day">일요일</button>
        <button class="chk day">월요일</button>
        <button class="chk day">화요일</button>
        <button class="chk day">수요일</button>
        <button class="chk day">목요일</button>
        <button class="chk day">금요일</button>
        <button class="chk day">토요일</button>
        <c:forEach begin="0" end="41" step="1" var="num">
            <input type="button" class="chk" id="btn${num}" style="background-color: whitesmoke" onmousedown="selectDate(this)">
        </c:forEach>
    </div>
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
        <input type="button" class="pageBtn" id="preMonth"  value="<--이전달">
        <input type="button" class="pageBtn" id="actMonth" value="현재달">
        <input type="button" class="pageBtn" id="nextMonth"  value="다음달-->">
    </div>
    <div class="info">
        <span>총 휴가일수:<input type="text" id="total" value=${totalVacations}>일</span>
        <span>사용 휴가일수:<input type="text" id="used" value=${usedVacations}>일</span>
        <span>선택 휴가일수:<input type="text" id="select" value=0>일</span>
        <span>잔여 휴가일수:<input type="text" id="rest" value=${restVacations}>일</span>
        <input type="button" class="btn-submit" onclick="saveHoliday()" value="휴가신청">
    </div>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>

<div class="right-container"></div>
</body>
<script>
    const dayLabel = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    let arr = [];
    let drag = false;
    let btnBkColor="whitesmoke";
    const totalVacations = ${totalVacations};
    let restVacations = ${restVacations};
    let select = document.getElementById("select").value;
    window.onload=function (){
        const date = new Date();
        document.getElementById("actMonth").value = (date.getMonth()+1)+"월";
        const firstDate = new Date(date.getFullYear(), date.getMonth(), 1);
        let firstDay = firstDate.getDay();
        const lastDate = new Date(date.getFullYear(), date.getMonth(), 0);
        const lastDay = lastDate.getDay();
        const startDate = new Date(date.getFullYear(), date.getMonth(), 1-firstDay);
        const countHoliday = ${holidayList.size()};
        for(let i = 0; i<42; i++) {
            document.getElementById("btn"+i).value = startDate.getFullYear()+"-"+(startDate.getMonth()+1)+"-"+startDate.getDate();

            let todayDate = document.getElementById("btn"+i).value;
            let count = ${holidayList.size()};
            let id="";
            console.log(count);

            for(let j=1; j<=count; j++){
                id = "holiday"+j;
                let holidayDate = document.getElementById(id).outerText;
                if(todayDate==holidayDate){
                    document.getElementById("btn" + i).removeAttribute("onmousedown");
                    document.getElementById("btn" + i).setAttribute("class", "chk2");
                    document.getElementById("btn" + i).setAttribute("style", "background-color: skyblue");
                }
            }

            if(startDate<date){
                document.getElementById("btn"+i).removeAttribute("onmousedown");
                document.getElementById("btn"+i).removeAttribute("style");
                document.getElementById("btn"+i).setAttribute("class", "chk2");
            }
            if(startDate.getDay()==0||startDate.getDay()==6){
                document.getElementById("btn"+i).removeAttribute("onmousedown");
                document.getElementById("btn"+i).removeAttribute("style");
                document.getElementById("btn"+i).setAttribute("class", "chk2");
            }
            startDate.setDate(startDate.getDate()+1);
        }
    }
    const selectDate = (clickId) => {
        const id = $(clickId).attr("id");
        // console.log(id);
        const btn = document.getElementById(id);
        btnBkColor=btn.style.backgroundColor;
        drag= true;
        if(btnBkColor=="whitesmoke"){
            btn.style.backgroundColor="skyblue";
            if (!arr.includes(btn.value)) {
                arr.push(btn.value);
                select += 1;
            }
            // console.log("시작"+arr.length);
            $(".chk").mousemove(function (){
                if(drag) {
                    document.getElementById($(this).attr("id")).style.backgroundColor = "skyblue";
                    if(!arr.includes(document.getElementById($(this).attr("id")).value)){
                        arr.push(document.getElementById($(this).attr("id")).value);
                    }
                }
            });
        } else if(btnBkColor=="skyblue"){
            btn.style.backgroundColor = "whitesmoke";

            for (let i = 0; i < arr.length; i++) {
                if (arr[i] == document.getElementById(id).value) {
                    arr.splice(i, 1);
                }
            }
            $(".chk").mousemove(function () {
                if (drag) {
                    document.getElementById($(this).attr("id")).style.backgroundColor = "whitesmoke";

                    for (let i = 0; i < arr.length; i++) {
                        if (arr[i] == document.getElementById($(this).attr("id")).value) {
                            arr.splice(i, 1);
                        }
                    }
                }
            });
        }
    };
    $(".chk").mouseup(function () {
        document.getElementById("select").value= arr.length;
        document.getElementById("rest").value= restVacations-arr.length;
        // console.log("끝"+arr.length);
        arr.sort(function compare(a, b) {
            return a - b;
        });
        // console.log(arr);
        drag = false;
    });
    const saveHoliday = () => {
        if(document.getElementById("rest").value<0){
            alert("신청 휴가일수가 잔여 휴가일수보다 많습니다");
        } else {
            $.ajax({
                type: "post",
                url : "/annualHoliday/save",
                data : {
                    "holidayArray": arr,
                    "totalVacations": totalVacations,
                    "restVacations": restVacations,
                // dataType: JSON,
                },
                success: function (result) {

                    const id = document.getElementById("holidays");
                    let list ="";
                    let count=1;
                    for(let i in result) {
                        list += "<tr><td>"+(count++)+"</td><td>"+result[i]+"</td></tr>";
                    }
                    document.getElementById("holidays").innerHTML = list;
                },
                error: function () {
                    alert("no pass");
                }
            });
        }
    }
    $('.pageBtn').click(function (){
        const id = $(this).attr("id");
        console.log(id);
        const preMonth = "preMonth";
        const actMonth = "actMonth";
        const nextMonth = "nextMonth";
        const date = new Date();
        if (id == preMonth) {
            date.setMonth(date.getMonth() - 1);
        } else if (id == nextMonth) {
            date.setMonth(date.getMonth() + 1);
        }
        const today = new Date();
        const firstDate = new Date(date.getFullYear(), date.getMonth(), 1);
        let firstDay = firstDate.getDay();
        const lastDate = new Date(date.getFullYear(), date.getMonth(), 0);
        const lastDay = lastDate.getDay();
        const startDate = new Date(date.getFullYear(), date.getMonth(), 1 - firstDay);
            // console.log("startDate", startDate);
        for (let i = 0; i < 42; i++) {
            document.getElementById("btn" + i).value = startDate.getFullYear() + "-" + (startDate.getMonth() + 1) + "-" + startDate.getDate();
            aaa(i);
            if (startDate < today) {
                document.getElementById("btn" + i).removeAttribute("onmousedown");
                document.getElementById("btn" + i).removeAttribute("style");
                document.getElementById("btn" + i).setAttribute("class", "chk2");
            } else {
                document.getElementById("btn" + i).setAttribute("onmousedown", "selectDate(this)");
                document.getElementById("btn" + i).setAttribute("style", "background-color: whitesmoke");
                document.getElementById("btn" + i).setAttribute("class", "chk");
                aaa(i);
            }
            if (startDate.getDay() == 0 || startDate.getDay() == 6) {
                document.getElementById("btn" + i).removeAttribute("onmousedown");
                document.getElementById("btn" + i).removeAttribute("style");
                document.getElementById("btn" + i).setAttribute("class", "chk2");
            }
            startDate.setDate(startDate.getDate() + 1);
        }
    });
    function aaa (i){
        let todayDate = document.getElementById("btn"+i).value;
        let count = ${holidayList.size()};
        let id="";
        for(let j=1; j<=count; j++){
            id = "holiday"+j;
            let holidayDate = document.getElementById(id).outerText;
            if(todayDate==holidayDate){
                document.getElementById("btn" + i).removeAttribute("onmousedown");
                document.getElementById("btn" + i).setAttribute("class", "chk2");
                document.getElementById("btn" + i).setAttribute("style", "background-color: skyblue");
            }
        }
    }
</script>
</html>
