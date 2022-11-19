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
    left: 85%;
  }
  .sup-container {
    background-color: lightgrey;
    border: 1px solid darkgrey;
    width: 1181px;
    height: 73px;
    position: relative;
    display: flex;
    margin-top: 153px;
  }

  .banner {
    position: absolute;
    top: 58px;
    width: 100%;
    height: 15px;
    background-color: gray;
  }
  .title1 {
    position: absolute;
    width: 100%;
    height: 100%;
    text-align: center;
    font-size: 30px;
    font-weight: bold;
    line-height: 73px;
  }
  </style>
</head>

<body>
<div class="left-container"></div>
<div class="title">
  <img src="../../../resources/img/building.png" alt="">
  어드민즈 Adminz
  <img src="../../../resources/img/close.png" class="close" alt="">
</div>
<div class="sup-container">
  <div class="title1">사 원 정 보</div>
  <div class="banner">

  </div>
</div>

</body>

</html>