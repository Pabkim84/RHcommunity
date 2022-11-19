<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8" />
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title></title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">

  <style>

  /*.customHeader{*/
  /*  margin-bottom: 5px;*/
  /*  width: 100%;*/
  /*  max-width: 1500px !important;*/
  /*  margin-left: 300px;*/
  /*  height: 100px;*/
  /*  background: rgba(240,240,240,0.9) !important;*/
  /*}*/
  /*.btn.btn-primary {*/
  /*  color: white;*/
  /*  background-color: lightgrey !important;*/
  /*  border: 0 !important;*/
  /*  box-shadow: none !important;*/
  /*  border-inline-color: transparent;*/
  /*  border-inline: none;*/
  /*  border-spacing: 0;*/
  /*  margin: 0 !important;*/
  /*  border-radius: 0;*/
  /*  padding: 0 !important;*/

  /*}*/
  /*.btn {*/
  /*  height: 100px;*/
  /*  width: 115px;*/
  /*  padding: 12px 0px;*/
  /*  margin: 0;*/
  /*}*/
  /*.btn-group {*/
  /*  margin: 0;*/
  /*}*/
  body {
    margin: 0;
  }
  .left-container {
    background-color: transparent;
    width: 100px;
    height: 100%;
    position: relative;
    float: left;
  }
  .title {
    width: 1163px;
    height: 45px;
    position: relative;
    color: white;
    background: lightgray;
    margin-left: 100px;
    top: 160px;
    color: rgb(30,30,30);
    font-weight: bold;
    padding: 2px 10px;
    line-height: 50px;
    border-radius: 5px;
    display: flex;
  }
  .title img {
    width: 20px;
    height: 20px;
    position: relative;
    top: 12px;
  }
  .close {
    position: relative;
    left: 49%;
  }
  .sup-container {
    background-color: lightgrey;
    width: 1183px;
    height: 73px;
    position: relative;
    display: flex;
    margin-top: 153px;
  }
  .btn-menu {
    width: 10%;
    height: 85%;
    background-color: lightgrey;
    border-spacing: 0;
    border: 0;
    padding: 0;
    float: left;
    box-shadow: 0px 0px 2px 0px grey;


  }
  .btn-menu:hover {
    background-color: rgba(235, 235, 235, 0.5);
    box-shadow: 1px 1px 1px 1px grey inset;

  }
  .img-ico {
    width: 40%;
    height: 70%;
    margin-top: 10px;
    padding: 0;
  }
  .ico-text {
    width: 100%;
    height: 100%;
    margin-left: auto;
    margin-right: auto;

  }
  .ico-text:hover {
    width: 90%;
    height: 90%;
    margin-left: auto;
    margin-right: auto;

  }
  .font-menu {
    width: 10%;
    text-align: center;
    color: whitesmoke;
    position: relative;
    padding: 0;
    margin: 0;
    font-size: 11px;
    font-weight: bold;
    float: left;
    z-index: 5;
  }
  .banner {
    position: absolute;
    top: 58px;
    width: 100%;
    height: 15px;
    background-color: gray;
    z-index: 1;
  }
  .power {
    width: 60%;
    height: 100%;
    position: relative;
    top: -11px;
  }
  .management {
    width: 47%;
    height: 75%;
    margin-top: 9px;
  }
  </style>
</head>

<body>
<div class="left-container"></div>
<div class="title">
  <img src="../../../resources/img/building.png" alt="">
  <div style="width: 140px">어드민즈 Adminz</div> &nbsp;
  <c:choose>
    <c:when test="${sessionScope.id==1}">
      <div style="color: red">[관리자 모드]</div>
    </c:when>
    <c:otherwise>
      <div style="color: blue">[사용자 모드]</div>
    </c:otherwise>
  </c:choose>
  <div style="width: 300px; text-indent: 20px">(${sessionScope.memberName}) 님으로 접속중...</div>
  <a href="/member/main" class="close" ><img src="../../../resources/img/close.png" alt=""></a>
</div>
<div class="sup-container">
  <button type="button" class="btn-menu" onclick="location.href='/member/main'">
    <div class="ico-text">
      <img src="../../../resources/img/home.png" class="img-ico" alt="HOME">
    </div>
  </button>
  <button type="button" class="btn-menu" onclick="location.href='/notice/paging'">
    <div class="ico-text">
      <img src="../../../resources/img/announce.png" class="img-ico" alt="공지사항">
    </div>
  </button>
<c:choose>
  <c:when test="${sessionScope.id==1}">
    <button type="button" class="btn-menu" onclick="location.href='/member/paging'">
      <div class="ico-text">
        <img src="../../../resources/img/memberList.png" class="img-ico" alt="사원목록">
      </div>
    </button>
    <button type="button" class="btn-menu" onclick="location.href='/adminMode/AttendanceOfMonth'">
      <div class="ico-text">
        <img src="../../../resources/img/attendance.png" class="img-ico" alt="근태관리">
      </div>
    </button>
    <button type="button" class="btn-menu" onclick="location.href='/annualHoliday/save-form'">
      <div class="ico-text">
        <img src="../../../resources/img/calender.png" class="img-ico" alt="휴가관리">
      </div>
    </button>
    <button type="button" class="btn-menu" onclick="location.href='/salary/payment'">
      <div class="ico-text">
        <img src="../../../resources/img/salary.png" class="img-ico" alt="급여지출">
      </div>
    </button>
    <button type="button" class="btn-menu" onclick="location.href='/salary/paging'">
      <div class="ico-text">
        <img src="../../../resources/img/management.png" class="img-ico management" alt="급여관리">
      </div>
    </button>
    <button type="button" class="btn-menu" onclick="location.href='/documents/showDocuments'">
      <div class="ico-text">
        <img src="../../../resources/img/document.png" class="img-ico" alt="서류발급서비스">
      </div>
    </button>
  </c:when>
    <c:otherwise>
      <button type="button" class="btn-menu" onclick="location.href='/member/myProfile'">
        <div class="ico-text">
          <img src="../../../resources/img/personalData.png" class="img-ico" style="height: 85%;" alt="내 프로필">
        </div>
      </button>
      <button type="button" class="btn-menu" onclick="location.href='/attendance/findAll'">
        <div class="ico-text">
          <img src="../../../resources/img/attendance.png" class="img-ico" alt="내 근태현황">
        </div>
      </button>
      <button type="button" class="btn-menu" onclick="location.href='/annualHoliday/save-form'">
        <div class="ico-text">
          <img src="../../../resources/img/calender.png" class="img-ico" alt="휴가신청">
        </div>
      </button>
      <button type="button" class="btn-menu" onclick="location.href='/salary/payment'">
        <div class="ico-text">
          <img src="../../../resources/img/payStubs.png" class="img-ico" alt="급여명세서" style="width: 45%; height: 80%; margin-top: 7px">
        </div>
      </button>
      <button type="button" class="btn-menu" onclick="location.href='/salary/payment'">
        <div class="ico-text">
          <img src="../../../resources/img/certificateOfEmployment2.png" class="img-ico" alt="재직증명서">
        </div>
      </button>
      <button type="button" class="btn-menu" onclick="location.href='/salary/payment'">
        <div class="ico-text">
          <img src="../../../resources/img/absenceRequest.png" class="img-ico" alt="결근신청서" style="width: 50%; height: 80%; margin-top: 7px">
        </div>
      </button>
    </c:otherwise>
</c:choose>
  <button type="button" class="btn-menu" onclick="location.href='/requestBoard/paging'">
    <div class="ico-text">
      <img src="../../../resources/img/board.png" class="img-ico" alt="요청게시판">
    </div>
  </button>
  <button type="button" class="btn-menu" onclick="location.href='/member/logout'">
    <div class="ico-text">
      <img src="../../../resources/img/logout.png" class="img-ico power" alt="로그아웃">
    </div>
  </button>
  <div class="banner">
    <div class="font-menu">HOME</div>
    <div class="font-menu">공지사항</div>
    <c:choose>
    <c:when test="${sessionScope.id==1}">
    <div class="font-menu">사원목록</div>
    <div class="font-menu">근태관리</div>
    <div class="font-menu">휴가관리</div>
    <div class="font-menu">급여지출</div>
    <div class="font-menu">급여관리</div>
    <div class="font-menu">서류발급서비스</div>
    </c:when>
    <c:otherwise>
    <div class="font-menu">내 프로필</div>
    <div class="font-menu">내 근태현황</div>
    <div class="font-menu">휴가신청</div>
    <div class="font-menu">급여명세서</div>
    <div class="font-menu">재직증명서</div>
    <div class="font-menu">결근신청서</div>
    </c:otherwise>
    </c:choose>
    <div class="font-menu">요청게시판</div>
    <div class="font-menu">로그아웃</div>
  </div>
</div>
<%--<div class="customHeader">--%>
<%--  <div class="btn-group" role="group" aria-label="Button group with nested dropdown">--%>
<%--      <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--        Dropdown--%>
<%--      </button>--%>
<%--      <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">--%>
<%--        <li><a class="dropdown-item" href="/member/myProfile">내프로필</a></li>--%>
<%--        <li><a class="dropdown-item" href="/member/logout">로그아웃</a></li>--%>
<%--      </ul>--%>
<%--    </div>--%>
<%--  <div class="btn-group" role="group" aria-label="Button group with nested dropdown">--%>
<%--    <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--      Dropdown--%>
<%--    </button>--%>
<%--    <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">--%>
<%--      <li><a class="dropdown-item" href="/member/myProfile">내프로필</a></li>--%>
<%--      <li><a class="dropdown-item" href="/member/logout">로그아웃</a></li>--%>
<%--    </ul>--%>
<%--  </div>--%>
<%--  <div class="btn-group" role="group" aria-label="Button group with nested dropdown">--%>
<%--    <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--      Dropdown--%>
<%--    </button>--%>
<%--    <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">--%>
<%--      <li><a class="dropdown-item" href="/member/myProfile">내프로필</a></li>--%>
<%--      <li><a class="dropdown-item" href="/member/logout">로그아웃</a></li>--%>
<%--    </ul>--%>
<%--  </div>--%>
<%--  <div class="btn-group" role="group" aria-label="Button group with nested dropdown">--%>
<%--    <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--      Dropdown--%>
<%--    </button>--%>
<%--    <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">--%>
<%--      <li><a class="dropdown-item" href="/member/myProfile">내프로필</a></li>--%>
<%--      <li><a class="dropdown-item" href="/member/logout">로그아웃</a></li>--%>
<%--    </ul>--%>
<%--  </div>--%>
<%--  <div class="btn-group" role="group" aria-label="Button group with nested dropdown">--%>
<%--    <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--      Dropdown--%>
<%--    </button>--%>
<%--    <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">--%>
<%--      <li><a class="dropdown-item" href="/member/myProfile">내프로필</a></li>--%>
<%--      <li><a class="dropdown-item" href="/member/logout">로그아웃</a></li>--%>
<%--    </ul>--%>
<%--  </div>--%>
<%--  <div class="btn-group" role="group" aria-label="Button group with nested dropdown">--%>
<%--    <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--      Dropdown--%>
<%--    </button>--%>
<%--    <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">--%>
<%--      <li><a class="dropdown-item" href="/member/myProfile">내프로필</a></li>--%>
<%--      <li><a class="dropdown-item" href="/member/logout">로그아웃</a></li>--%>
<%--    </ul>--%>
<%--  </div>--%>
<%--  <div class="btn-group" role="group" aria-label="Button group with nested dropdown">--%>
<%--    <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--      Dropdown--%>
<%--    </button>--%>
<%--    <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">--%>
<%--      <li><a class="dropdown-item" href="/member/myProfile">내프로필</a></li>--%>
<%--      <li><a class="dropdown-item" href="/member/logout">로그아웃</a></li>--%>
<%--    </ul>--%>
<%--  </div>--%>
<%--  <div class="btn-group" role="group" aria-label="Button group with nested dropdown">--%>
<%--    <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--      Dropdown--%>
<%--    </button>--%>
<%--    <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">--%>
<%--      <li><a class="dropdown-item" href="/member/myProfile">내프로필</a></li>--%>
<%--      <li><a class="dropdown-item" href="/member/logout">로그아웃</a></li>--%>
<%--    </ul>--%>
<%--  </div>--%>
<%--  <div class="btn-group" role="group" aria-label="Button group with nested dropdown">--%>
<%--    <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--      Dropdown--%>
<%--    </button>--%>
<%--    <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">--%>
<%--      <li><a class="dropdown-item" href="/member/myProfile">내프로필</a></li>--%>
<%--      <li><a class="dropdown-item" href="/member/logout">로그아웃</a></li>--%>
<%--    </ul>--%>
<%--  </div>--%>
<%--  <div class="btn-group" role="group" aria-label="Button group with nested dropdown">--%>
<%--    <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--      Dropdown--%>
<%--    </button>--%>
<%--    <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">--%>
<%--      <li><a class="dropdown-item" href="/member/myProfile">내프로필</a></li>--%>
<%--      <li><a class="dropdown-item" href="/member/logout">로그아웃</a></li>--%>
<%--    </ul>--%>
<%--  </div>--%>
<%--  <div class="btn-group" role="group" aria-label="Button group with nested dropdown">--%>
<%--    <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--      Dropdown--%>
<%--    </button>--%>
<%--    <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">--%>
<%--      <li><a class="dropdown-item" href="/member/myProfile">내프로필</a></li>--%>
<%--      <li><a class="dropdown-item" href="/member/logout">로그아웃</a></li>--%>
<%--    </ul>--%>
<%--  </div>--%>
<%--  </div>--%>
<%--</div>--%>
</body>

</html>