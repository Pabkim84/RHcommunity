<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: 오후 2:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>사원등록페이지</title>
    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- Font-->
    <link rel="stylesheet" type="text/css" href="../../../resources/colorlib-regform-36/css/montserrat-font.css">
    <link rel="stylesheet" type="text/css" href="../../../resources/colorlib-regform-36/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
    <!-- Main Style Css -->
    <link rel="stylesheet" href="../../../resources/colorlib-regform-36/css/style.css"/>
    <style type="text/css">
        .page-content {
            background: rgba(26,32,53,0.8) !important;
        }
        .form-right {
            background-color: rgba(32,41,64,0.8) !important;
        }
        .form-left {
            background-color: lightgray !important;
        }
    </style>
</head>
<body class="form-v10">
<div class="page-content">
    <div class="form-v10-content">
        <form class="form-detail" action="#" method="post" id="myform">
            <div class="form-left">
                <h2>사원정보</h2>
                    <div class="form-row">
                        <input type="text" name="memberId" id="memberId" class="input-text" placeholder="아이디" required>
                    </div>
                    <div class="form-row">
                        <input type="text" name="memberPassword" id="memberPassword" class="input-text" placeholder="비밀번호" required>
                    </div>
                    <div class="form-row">
                        <input type="text" name="first_name" id="first_name" class="input-text" placeholder="사원명" required>
                    </div>
                <div class="form-row">
                    <select name="dept">
                        <option class="option" value="dept">부서명</option>
                        <option class="option" value="executive">임원진</option>
                        <option class="option" value="admin">경영관리팀</option>
                        <option class="option" value="secretary">비서팀</option>
                        <option class="option" value="accounting">회계팀</option>
                        <option class="option" value="personnel">인사팀</option>
                        <option class="option" value="sales">영업팀</option>
                        <option class="option" value="computing">전산팀</option>
                        <option class="option" value="design">디자인팀</option>
                        <option class="option" value="production">생산팀</option>
                    </select>
                    <span class="select-btn">
						  	<i class="zmdi zmdi-chevron-down"></i>
						</span>
                </div>
                <div class="form-row">
                    <select name="position">
                        <option value="position">직급</option>
                        <option value="director">임원급</option>
                        <option value="generalManager">부장급</option>
                        <option value="deputyGeneralManager">차장급</option>
                        <option value="manager">과장급</option>
                        <option value="assistantManager">대리급</option>
                        <option value="seniorStaff">주임급</option>
                        <option value="staff">사원급</option>
                        <option value="intern">인턴급</option>
                    </select>
                    <span class="select-btn">
						  	<i class="zmdi zmdi-chevron-down"></i>
						</span>
                </div>
                <div class="form-row">
                    <input type="file" name="profile" class="company" id="profile" value="사진첨부" style="background-color: lightgray" required>
                </div>

            </div>
            <div class="form-right">
                <h2>개인정보</h2>
                <div class="form-row">
                    <input type="text" name="memberIdNum" class="company" id="memberIdNum" placeholder="주민등록번호" required>
                </div>
                <div class="form-row">
                    <input type="text" name="birthDay" class="company" id="birthDay" placeholder="생년월일" required>
                </div>
                <div class="form-row">
                    <input type="text" name="address" class="company" id="address" placeholder="거주지" required>
                </div>
                <div class="form-group">
                    <div class="form-row form-row-1">
                        <input type="text" name="firstNum" class="code" id="firstNum" placeholder="010" required>
                    </div>
                    <div class="form-row form-row-2">
                        <input type="text" name="mobile" class="phone" id="mobile" placeholder="전화번호" required>
                    </div>
                </div>
                <div class="form-row">
                    <input type="text" name="your_email" id="your_email" class="input-text" required pattern="[^@]+@[^@]+.[a-zA-Z]{2,6}" placeholder="이메일주소">
                </div>
                <div class="form-checkbox">
                    <label class="container"><p>I do accept the <a href="#" class="text">Terms and Conditions</a> of your site.</p>
                        <input type="checkbox" name="checkbox" required>
                        <span class="checkmark"></span>
                    </label>
                </div>
                <div class="form-row-last">
                    <input type="submit" name="register" class="register" value="사원등록">
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
