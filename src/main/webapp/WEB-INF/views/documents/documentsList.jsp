<%@ page import="com.its.rhCommunity.dto.SalaryDTO" %><%--
  Created by IntelliJ IDEA.
  User: PABLO
  Date: 2022-10-31
  Time: 오전 12:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <script src="/resources/js/jquery.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <title>사원목록</title>
    <style>
        body{
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
            display: flex;
        }
        .part1 {
            left: 2%;
            top: 65px;
            width: 95%;
            height: 80%;
            position: absolute;
            overflow: scroll;
            overflow-x: hidden;
        }
        .part2 {
            top: 100px;
            width: 36%;
            height: 74%;
            position: absolute;
            left: 62%;
            overflow: scroll;
            overflow-x: hidden;
            overflow-y: hidden;
            background: aliceblue;
        }
        .table {
            position: absolute;
            width: 85%;
            text-align: center;
            color: black;
            background-color: whitesmoke;
            border: 1px solid whitesmoke;
            box-shadow: 2px 2px 1px 2px darkgrey inset;
            height: 100%;
        }

        th{
            background-color: lightgray;
            border: 1px solid lightgrey;
            font-size: 13px;
            line-height: 0px;
            box-shadow: 1px 1px 1px 0px dimgrey inset;
        }
        td{
            position: relative;
            border: 1px solid lightgrey;
            height: 40px;
            font-size: 12px;
            box-shadow: 1px 1px 1px 0px dimgrey inset;
        }
        tr{
            height: 40px;
        }
        .paging-container {
            width: 40%;
            height: 50px;
            font-weight: 700;
            position: absolute;
            top: 72%;
            left: 5%;
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
        .table tr:hover {
            cursor: pointer;
            /*background-color: rgb(225,225,230) !important;*/
        }
        .btn {
            width: 100%;
            height: 100%;
            /*margin-bottom: 50px;*/
            font-size: 14px;
            color: black;
            border: 0;
            /*box-shadow: 1px 1px 0px 1px dimgrey;*/
            background: transparent;
            /*line-height: 82px;*/
            text-align: center;
        }
        .btn:hover {
            background-color: rgba(235, 235, 235, 0.5);
            box-shadow: 1px 1px 1px 2px dimgrey inset;
            font-size: 12px;
            background-color:#fff6af;
        }
        ul {
            padding: 0;
            display: flex;
            justify-content: center;
        }
        li {
            position: relative;
            top: -10px;
            margin-right: 6px;
            list-style: none;

        }
        select {
            background-color: transparent;
            outline-style: none;
            width: 100%;
            height: 100%;
        }
        input[type=text]{
            width: 100%;
            height: 100%;
            border: 0;
            border-spacing: 0;
            border-inline: 0;
            outline-style: none;
            padding: 0;
            margin: 0;
            text-align: center;
        }
        .table1 {
            width: 100%;
            height: 40px;
        }
        .table1 input[type=text] {
            background-color: transparent;
            display: none;
        }
        .spaceDiv {
            width: 5%;
            height: 74%;
            position: absolute;
            top: 100px;
            left: 57%;
            font-size: 25px;
            line-height: 508px;
            text-align: center;
            background: darkgrey;
        }
        .searchDiv {
            position: relative;
            left: 76%;
            top: 40px;
            width: 21%;
            height: 25px;
            line-height: 25px;
            font-size: 14px;
            font-weight: bold;
        }
        .searchDiv input {
            position: absolute;
            width: 60%;
            border: 1px solid gray;
            left: 20%;
        }
        #searchName {
            text-align: left;
            text-indent: 5px;
        }
        .searchBtn {
            width: 20%;
            position: absolute;
            left: 80%;
            height: 25px;
        }
        option {
            height: 100%;
        }

    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="main-container">
    <div class="subTitle"><img src="../../../resources/img/triangle.png">서류발급 서비스</div>
    <div class="searchDiv">
        <button class="searchBtn" id="list" style="left: 0; width: 20%">목록</button>
        <input type="text" id="searchName" placeholder="사원명 검색">
        <button class="searchBtn" id="searchBtn"><img src="../../../resources/img/search.png" style="width: 19px;height: 19px"></button>
    </div>
    <div class="part1">

        <table class="table table1">
            <thead>
            <tr>
                <th scope="col" style="width: 4%">선택</th>
                <th scope="col" style="width: 5%">사번</th>
                <th scope="col" style="width: 10%">성명</th>
                <th scope="col" style="width: 10%">부서</th>
                <th scope="col" style="width: 5%">직급</th>
                <th scope="col" style="width: 10%">입사일</th>
                <th scope="col" style="width: 20%">이메일</th>
                <th scope="col" style="width: 10%">연락처</th>
                <th scope="col" style="width: 10%">발급서류</th>
                <th scope="col" style="width: 10%">하위옵션</th>
                <th scope="col" style="width: 6%">보기</th>

            </tr>
            </thead>
            <tbody id="tbodyId">
                <c:forEach items="${memberList}" var="memberDTO" varStatus="member">
                    <tr class="parents" id="showTr${member.count}">
                        <td><input type="radio" onchange="selectMember(this)" name="id" value="${memberDTO.id}"></td>
                        <td>${memberDTO.id}</td>
                        <td>${memberDTO.memberName}</td>
                        <td>${memberDTO.memberDept}</td>
                        <td>${memberDTO.memberPosition}</td>
                        <td>${memberDTO.memberJoinDate}</td>
                        <td>${memberDTO.memberEmail}</td>
                        <td>${memberDTO.memberMobile}</td>
                        <td><select name="documents" class="selectDoc" id="documents${member.count}">
                            <option value="">선택서류</option>
                            <option value="certificate">재직증명서</option>
                            <option value="payStub">급여명세서</option>
                            <option value="absence-form">결근신청서</option>
                            <option value="holiday-form">휴가신청서</option>
                            </select>
                        </td>
                        <td>
                            <select name="subOption" class="selectOption" id="subOption${member.count}">
                                <option value="">선택</option>
                            </select>
                        </td>
                        <td id="printBtn${member.count}"><button type="button" class="btn" id="submitBtn${member.count}" >보기</button></td>
                    </tr>
                </c:forEach>
            <c:if test="${memberList.size()<11}">
                <c:forEach begin="1" end="${11-memberList.size()}" step="1">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </c:forEach>
            </c:if>
            </tbody>
        </table>
    </div>
<%--    <div class="spaceDiv"> >> </div>--%>
<%--        <div class="part2">--%>
<%--            <div class="btn" id="coe">재직증명서</div>--%>
<%--            <div class="btn" id="ps">급여명세서</div>--%>
<%--            <div class="btn" id="abs">결근신청서</div>--%>
<%--            <div class="btn" id="holiday">휴가신청서</div>--%>
<%--        </div>--%>

</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
<div class="right-container"></div>
</body>
<script type="text/javascript">
    const tbodyId = document.getElementById("tbodyId");

    // $(".parents").click(function (){
    //     clickId = $(this).attr("id");
    //     const showTr = document.getElementById(clickId);
    //     console.log(clickId);
    //     const showChildren = $('#'+clickId).find('input').attr('id');
    //     const searchId = document.getElementById(showChildren).value;
    //     console.log(showChildren);
    //     console.log(searchId);
    // });


    $('#list').click(function (e) {
        location.reload();
    });

    $('#searchBtn').click(function (e) {
        search();
    });

    $('#searchName').keypress(function (e){
        if(e.keyCode==13){
            search();
        }
    });
    function search() {
        const searchName = $('#searchName').val();
        console.log(searchName);
        $.ajax({
            type: "get",
            url: "/documents/findByName",
            data: {"memberName": searchName},
            contentType: "application/json; charset=utf-8",
            success: function (jsonData){
                let memberList = JSON.parse(jsonData);
                // console.log(memberList);
                if(memberList.length!=0){
                    $.each(memberList, function (index, item){
                        // console.log(memberList[index].id);
                        let id = memberList[index].id;
                        let name = memberList[index].memberName;
                        let dept = memberList[index].memberDept;
                        let position = memberList[index].memberPosition;
                        let joinDate = memberList[index].memberJoinDate;
                        let email = memberList[index].memberEmail;
                        let tel = memberList[index].memberMobile;
                        insertData(id, name, dept, position, joinDate, email, tel);
                    });
                } else {
                    alert("검색하신 사원명은 존재하지 않는 사원명입니다. 다시 확인해주세요.");
                    location.reload();
                }
            },
            error: function (){
                alert("전송실패");
            }
        });
    }
    function insertData(id, name, dept, position, joinDate, email, tel){
        let html="";
        let count=0;
        html = '<tr class="parents" id="showTr'+(++count)+'">';
        html+= '<td><input type="radio" onchange="selectMember(this)" name="id" value="'+id+'"></td>';
        html+= '<td>'+id+'</td>';
        html+= '<td>'+name+'</td>';
        html+= '<td>'+dept+'</td>';
        html+= '<td>'+position+'</td>';
        html+= '<td>'+joinDate+'</td>';
        html+= '<td>'+email+'</td>';
        html+= '<td>'+tel+'</td>';
        html+= '<td><select name="documents" class="selectDoc" id="documents'+count+'">' +
                '<option value="">선택서류</option>'+
                '<option value="certificate">재직증명서</option>'+
                '<option value="payStub">선택서류</option>'+
                '<option value="absence-form">결근신청서</option>'+
                '<option value="holiday-form">휴가신청서</option>'+'</select></td>';
        html+= '<td><select name="subOption" class="selectOption" id="subOption'+count+'">' +
                '<option value="">선택</option></select></td>';
        html+= '<td id="printBtn'+count+'"><button type="button" class="btn" id="submitBtn'+count+'">보기</button></td></tr>';
        if(count<=11) {
            for(let i=0; i<11-count; i++){
                html+= '<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>';
            }
        }
        tbodyId.innerHTML=html;
    }
    let selectBgId;
    let subOption;
    // $('input[type=radio]').change(function (){
    const selectMember = (data) => {
        console.log("들어와");
        console.log(data);
        const showTr = document.getElementById($(data).closest('tr').attr('id'));
      console.log(showTr);
        if(selectBgId){
            document.getElementById(selectBgId).style.backgroundColor="whitesmoke";
        }
        let id = $(showTr).find('td')[0].outerText;
        let clickBtn="";
        showTr.style.backgroundColor="khaki";
        selectBgId = showTr.id;
        // console.log("id====point1: "+id);
        let selectBgId2;
            // $(".btn").click(function (){
            //     clickBtn = document.getElementById($(this).attr("id"));
            //     console.log(clickBtn);
            //     clickBtn.style.backgroundColor="khaki";
            //     if(selectBgId2){
            //         document.getElementById(selectBgId2).style.backgroundColor="transparent";
            //     }
            //     selectBgId2=clickBtn.id;
            //     switch (clickBtn.id) {
            //         case "coe": location.href="/documents/certificate?id="+id; break;
            //         case "ps": location.href="/documents/payStub?id="+id; break;
            //         case "abs": location.href="/documents/absence-form?id="+id; break;
            //         case "holiday": location.href="/documents/holiday-form?id="+id; break;
            //     }
            // });
            subOption = document.getElementById($(showTr).find('select:eq(1)').attr('id'));
        $('.selectDoc').change (function (){
            subOption.innerHTML='<option value="">선택</option>';
            const selectOption = this.value;
            const printBtn = $(showTr).find('button').attr('id');
            console.log(printBtn);
            console.log(subOption.id);
            let html ="";
            console.log("selectOption: "+selectOption);
            switch (selectOption) {
                case "certificate": subOption.innerHTML='<option value="">선택없음</option>';
                    document.getElementById(printBtn).addEventListener('click', submitBtn);
                    break;
                case "payStub": html = '<option value="1">1월</option>'+
                    '<option value="2">2월</option>'+
                    '<option value="3">3월</option>'+
                    '<option value="4">4월</option>'+
                    '<option value="5">5월</option>'+
                    '<option value="6">6월</option>'+
                    '<option value="7">7월</option>'+
                    '<option value="8">8월</option>'+
                    '<option value="9">9월</option>'+
                    '<option value="10">10월</option>'+
                    '<option value="11">11월</option>'+
                    '<option value="12">12월</option>';
                    subOption.innerHTML+=html;
                    printBtn.innerHTML='<button class="btn" id="ps">선택보기</button>';
                    document.getElementById(printBtn).addEventListener('click', submitBtn);
                    break;
                case "absence-form": subOption.innerHTML='<option value="">선택없음</option>';
                    document.getElementById(printBtn).addEventListener('click', submitBtn);
                    break;
                case "holiday-form": subOption.innerHTML='<option value="">선택없음</option>';
                    document.getElementById(printBtn).addEventListener('click', submitBtn);
                    break;
            }
        });
    };
    const submitBtn = (e) => {
        const btn = e.target.id;
        console.log(btn);
        const clickBtn= document.getElementById(btn);
        console.log(clickBtn);
        const findTr=$(clickBtn).closest('tr').attr('id');
        const id= $(document.getElementById(findTr)).find('input').attr('value');
        console.log("사원id: "+id);
        const selectDoc = $(document.getElementById(findTr)).find('select').attr('id');
        const selectVal = document.getElementById(selectDoc).value;
        console.log("발급서류: "+selectVal);
        if(selectVal=="payStub") {
        const subOption = $(document.getElementById(findTr)).find('select:eq(1)').attr('id');
        const subOptionVal = document.getElementById(subOption).value;
        console.log(subOptionVal+"월");
            location.href="/documents/payStub?id="+id+"&subOption="+subOptionVal;
        } else if(selectVal=="certificate") {
            location.href="/documents/certificate?id="+id;
        } else if(selectVal=="absence-form") {
            location.href="/documents/absence-form?id="+id;
        } else if(selectVal=="holiday-form") {
            location.href="/documents/holiday-form?id="+id;
        }
        document.querySelector('.btn').addEventListener('click', submitBtn);
    }

</script>
</html>
