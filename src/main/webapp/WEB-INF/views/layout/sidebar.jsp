<!--
=========================================================
* Material Dashboard Dark Edition - v2.1.0
=========================================================

* Product Page: https://www.creative-tim.com/product/material-dashboard-dark
* Copyright 2019 Creative Tim (http://www.creative-tim.com)

* Coded by www.creative-tim.com

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <title></title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <!-- CSS Files -->
    <link href="../../../resources/css/material-dashboard.css?v=2.1.0" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="../../../resources/css/demo.css" rel="stylesheet" />
    <style>
        .custom-sidebar{
            width: 260px;
            margin:0 15% 0 0;
            vertical-align: top;

        }
        HTML CSSResult Skip Results Iframe
        EDIT ON

        @import url('https://fonts.googleapis.com/icon?family=Material+Icons');
        li.nav-item{
            margin: 0 auto 0 auto;
            font-size: small;
        }
        .logo{
            margin-top: 0;
            margin-bottom: 0;
            height: 260px;
            vertical-align: top;
        }

        .dropdown{
            position : relative;
            display : inline-block;
            width: 230px;
            height: 50px;
            margin: 0 auto 0 18px;
        }

        .dropbtn_icon{
            font-family : 'Material Icons';
        }
        .dropbtn{
            border: 0;
            background-color: rgb(31,40,61);
            font-weight: 400;
            color : rgb(138,143,157);
            padding : 15px 46px 6px 13px;
            width :200px;
            text-align: center;
            cursor : pointer;
            font-size : 12px;
        }
        .dropdown-content{
            display : none;
            position : absolute;
            z-index : 1; /*다른 요소들보다 앞에 배치*/
            font-weight: 400;
            background-color: rgb(26,32,53);
            min-width : 180px;
            height: 115px;
            margin-left: 50px;

        }

        .dropdown-content a{
            display : block;
            text-decoration : none;
            color : rgb(37, 37, 37);
            font-size: 12px;
            padding : 12px 20px;
        }

        .dropdown-content a:hover{
            background-color : #1f283e
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }
        .bi bi-person-lines-fill{

        }
        .sidebar{
            background-color: rgba(31,40,62,0.95) !important;
        }
    </style>
</head>

<body class="dark-edition">
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="custom-sidebar">
    <div class="sidebar" data-color="purple" data-background-color="black">

        <div class="logo">
            <a href="/member/main" class="simple-text logo-normal">
            </a>
        </div>
        <div class="sidebar-wrapper">
            <ul class="nav">
                <li class="nav-item active  ">
                    <a class="nav-link" href="/member/main">
                        <i class="material-icons">dashboard</i>
                        <p>HOME</p>
                    </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="/member/memberList">
                        <sub><i class="bi bi-person-lines-fill" style="font-size: 20px"></i></sub>
                        <p class="fontCustom" style="vertical-align: center">사원목록</p>
                    </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="/member/myProfile">
                        <i class="material-icons">person</i>
                        <p>내 프로필</p>
                    </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="/attendance/findAll">
                        <sub><i class="bi bi-alarm-fill" style="font-size: 20px"></i></sub>
                        <p>근태관리</p>
                    </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="/annualHoliday/save">
                       <sub><i class="bi bi-calendar-week" style="font-size: 20px"></i></sub>
                        <p>휴가관리</p>
                    </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="/reserveConsultation/reservationList">
                        <sub><i class="bi bi-receipt-cutoff" style="font-size: 20px"></i></sub>
                        <p>인사상담예약</p>
                    </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="/requestBoard/findAll">
                        <i class="material-icons">content_paste</i>
                        <p>민원요청게시판</p>
                    </a>
                </li>
                <li class="nav-item ">
                    <div class="dropdown">
                        <button class="dropbtn">
                            <i class="material-icons">library_books</i>
                            <p>서류발급 서비스</p>
                        </button>
                        <div class="dropdown-content">
                            <a href="/documents/certificate">재직증명서</a>
                            <a href="/documents/payStub">급여명세서</a>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    </div>
</div>
<!--   Core JS Files   -->

<script src="https://unpkg.com/default-passive-events"></script>
<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!--  Google Maps Plugin    -->
</body>

</html>