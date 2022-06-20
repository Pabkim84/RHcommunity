<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: 오후 2:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <title>Title</title>
    <style>
        .btn-group{
            width: 100% !important;
        }
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
        .container{
            width: 100%;
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
        .div-inTable{
            width: 100% !important;
            height: 70%;
            margin: 10% auto 0 auto;
        }
        .calenderForm{
            width: 100%;
            height: auto;
        }
        .btn{
            width: 100%;
            height: 100px;
            border: 1px solid darkgray !important;
            color: #1a2035 !important;
        }
    </style>
</head>
<body onload="loadPage()">
<jsp:include page="../layout/sidebar.jsp" flush="false"></jsp:include>
<div class="container">
    <div class="sub-container">
        <form class="calenderForm" name="calenderForm" action="/annualHoliday/save" method="post">
            <p class="tableCaption" id="subTitle"></p>
            <table class="table table-striped table-hover" style="color: whitesmoke; text-align: center; border-color: #3C4858">
                <div class="div-inTable">
                    <div class="btn-group" id="hhh1" role="group" aria-label="Basic checkbox toggle button group">

                    </div><br/>
                    <div class="btn-group" id="hhh2" role="group" aria-label="Basic checkbox toggle button group">

                    </div><br/>
                    <div class="btn-group" id="hhh3" role="group" aria-label="Basic checkbox toggle button group">

                    </div><br/>
                    <div class="btn-group" id="hhh4" role="group" aria-label="Basic checkbox toggle button group">

                    </div><br/>
                    <div class="btn-group" id="hhh5" role="group" aria-label="Basic checkbox toggle button group">
                    </div>
                </div>
            </table>
        </form>
    </div>
</div>
</body>
<script>
    const day1 = new Date();
    function loadPage(){
        const subTitle = document.getElementById("subTitle");
        let days = new Date(day1.getFullYear(), day1.getMonth(), 0).getDate();
        let week = ['일', '월', '화', '수', '목', '금', '토'];
        let dayOfWeek = week[day1.getDay()];
        let month = day1.getMonth()+1;
        subTitle.innerText = month+"월 휴가신청";
        console.log(dayOfWeek);

        const id1 = document.getElementById("hhh1");
        const id2 = document.getElementById("hhh2");
        const id3 = document.getElementById("hhh3");
        const id4 = document.getElementById("hhh4");
        const id5 = document.getElementById("hhh5");

        let aaaa = "";
        let bbbb = "";
        let cccc = "";
        let dddd = "";
        let eeee = "";

        for(let i = 1; i<=7; i++){
            aaaa+='<input type="checkbox" class="btn-check" id="btncheck'+i+'"autocomplete="off"><label class="btn btn-outline-primary" for="btncheck'+i+'">0'+i+'일</label>';
        }id1.innerHTML=aaaa;
        for(let i = 8; i<=14; i++){
            if(i<10){
            bbbb+='<input type="checkbox" class="btn-check" id="btncheck'+i+'"autocomplete="off"><label class="btn btn-outline-primary" for="btncheck'+i+'">0'+i+'일</label>';
            } else {
            bbbb+='<input type="checkbox" class="btn-check" id="btncheck'+i+'"autocomplete="off"><label class="btn btn-outline-primary" for="btncheck'+i+'">'+i+'일</label>';
            }
        }id2.innerHTML=bbbb;
        for(let i = 15; i<=21; i++){
            cccc+='<input type="checkbox" class="btn-check" id="btncheck'+i+'"autocomplete="off"><label class="btn btn-outline-primary" for="btncheck'+i+'">'+i+'일</label>';
        }id3.innerHTML=cccc;
        for(let i = 22; i<=28; i++){
            dddd+='<input type="checkbox" class="btn-check" id="btncheck'+i+'"autocomplete="off"><label class="btn btn-outline-primary" for="btncheck'+i+'">'+i+'일</label>';
        }id4.innerHTML=dddd;
        for(let i = 29; i<=days; i++){
            eeee+='<input type="checkbox" class="btn-check" id="btncheck'+i+'"autocomplete="off"><label class="btn btn-outline-primary" for="btncheck'+i+'">'+i+'일</label>';
        }id5.innerHTML=eeee;
        };
</script>
</html>
