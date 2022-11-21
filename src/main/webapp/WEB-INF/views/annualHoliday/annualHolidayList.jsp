<%--
  Created by IntelliJ IDEA.
  User: PABLO
  Date: 2022-11-20
  Time: 오전 4:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <script src="/resources/js/jquery.js"></script>
    <title>휴가관리</title>
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
    .subTitle {
      display: flex;
      position: absolute;
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
    .subContainer {
      position: absolute;
      left: 2%;
      top: 65px;
      width: 95%;
      height: 80%;
      text-align: center;
      color: black;
      background-color: whitesmoke;
      box-shadow: 1px 1px 1px 2px darkgrey inset;
    }
    table {
      position: absolute;
      /*width: 100%;*/
      text-align: center;
      color: black;
      background-color: transparent;
      /*border: 1px solid darkgrey;*/

    }
    th {
      border: 1px solid darkgray;
      border-spacing: 0;
      margin: 0;
      padding: 0;
    }
    td {
      border: 1px solid darkgray;
      border-spacing: 0;
      margin: 0;
      padding: 0;
    }
    tr {
      border: 1px solid lightgrey;
      height: 29px;
    }
    tr:hover {
      background-color: lightgray;
      cursor: pointer;
    }
    .searchDiv {
      position: relative;
      top: 37px;
      left: 75%;
      width: 250px;
      height: 25px;
    }
    input[type=search] {
      position: absolute;
      left: 50%;
      width: 30%;
      height: 28px;
      margin: 0;
      padding: 0;
      border: 1px solid gray;
      outline-style: none;
      text-indent: 5px;

    }
    .btn {
      width: 20%;
      height: 28px;
      position: absolute;
      top: 0px;
      left: 80%;
    }
    input[type=text] {
      width: 100%;
      text-align: center;
      border: 0;
      background-color: transparent;
      cursor: pointer;
      outline-style: none;
    }

  </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="main-container">
  <div class="searchDiv" id="searchDiv">
      <input type="button" class="btn" style="left: 0%;" id="listBtn" value="목록" onclick="holidayOfMonth()">
      <input type="search" id="year" style="left: 20%" placeholder="  연도" maxlength="4">
      <input type="search" id="month" placeholder="  월" maxlength="2">
      <input type="button" class="btn" id="searchBtn" value="검색">
  </div>
<div class="subTitle"><img src="../../../resources/img/triangle.png">이번달 휴가관리</div>
  <div class="subContainer">
    <table class="table1">
      <thead>
      <tr>
        <th scope="col" style="width: 5%">사번</th>
        <th scope="col" style="width: 10%">사원명</th>
        <th scope="col" style="width: 10%">부서</th>
        <th scope="col" style="width: 7%">직급</th>
        <th scope="col" style="width: 10%">휴가일자</th>
        <th scope="col" style="width: 10%">총 휴가일수</th>
        <th scope="col" style="width: 10%">사용 휴가일수</th>
        <th scope="col" style="width: 10%">잔여 휴가일수</th>
        <th scope="col" style="width: 16%">이메일</th>
        <th scope="col" style="width: 12%">연락처</th>
      </tr>
      </thead>
      <tbody>
          <c:forEach items="${holidayList}" var="holidayDTO" varStatus="i">
          <tr>
            <td><input type="text" id=numId${i.count}" value="${holidayDTO.numId}" readonly></td>
            <td><input type="text" id="memberName${i.count}" value="${holidayDTO.memberName}" readonly></td>
            <td><input type="text" id="memberDept${i.count}" value="${holidayDTO.memberDept}" readonly></td>
            <td><input type="text" id="memberPosition${i.count}" value="${holidayDTO.memberPosition}" readonly></td>
            <td><input type="text" id="holidayDate${i.count}" value="${holidayDTO.holidayDate}" readonly></td>
            <td><input type="text" id="totalVacations${i.count}" value="${holidayDTO.totalVacations}" readonly></td>
            <td><input type="text" id="usedVacations${i.count}" value="${holidayDTO.usedVacations}" readonly></td>
            <td><input type="text" id="restVacations${i.count}" value="${holidayDTO.restVacations}" readonly></td>
            <td><input type="text" id="memberEmail${i.count}" value="${holidayDTO.memberEmail}" readonly></td>
            <td><input type="text" id="memberMobile${i.count}" value="${holidayDTO.memberMobile}" readonly></td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>

</body>
<script>
  $('#searchBtn').click(function (){
    searchByDate();
  });
  $('#month').keypress(function (e){
    if(e.keyCode==13){
      searchByDate();
    }
  });
  function searchByDate(){
    const year = document.getElementById("year").value;
    const month = document.getElementById("month").value;
    const date = new Date;
    const thisYear = date.getFullYear();
    if(parseInt(year)>=2000&parseInt(year)<=thisYear&parseInt(month)>0&parseInt(month)<=12){
      location.href='/adminMode/annualHolidayList?year='+year+'&month='+month;
    }
    else if(!year||!month) {
      alert("연도와 월을 모두 입력해주세요.");
    }
    else {
        alert("검색날짜 범위가 초과되었습니다. 다시 입력해주세요.");
    }
  }

</script>
</html>
