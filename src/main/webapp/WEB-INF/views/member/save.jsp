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
    <script src="/resources/js/jquery.js"></script>
    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- Font-->
    <link rel="stylesheet" type="text/css" href="../../../resources/colorlib-regform-36/css/montserrat-font.css">
    <link rel="stylesheet" type="text/css" href="../../../resources/colorlib-regform-36/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
    <!-- Main Style Css -->
    <link rel="stylesheet" href="../../../resources/colorlib-regform-36/css/style.css"/>
    <style type="text/css">
        .page-content {
            background: white !important;
        }
        .form-right {
            background-color: rgba(32,41,64,0.8) !important;
        }
        .form-left {
            background-color: lightgray !important;
        }
        .labelStyle{
            color: darkgrey;
            font-size: 12px;
            vertical-align: sub;
            margin-left: 15px;
        }
    </style>
</head>
<body class="form-v10">
<div class="page-content">
    <div class="form-v10-content">
        <form class="form-detail" action="/member/save" method="post" enctype="multipart/form-data">
            <div class="form-left">
                <h2 style="color: dimgrey">사원정보</h2>
                    <div class="form-row">
                        <input type="text" name="memberId" id="memberId" class="input-text" placeholder="아이디" required>
                    </div>
                    <div class="form-row">
                        <input type="password" name="memberPassword" id="memberPassword" class="input-text" placeholder="비밀번호" required>
                    </div>
                    <div class="form-row">
                        <input type="text" name="memberName" id="memberName" class="input-text" placeholder="사원명" required>
                    </div>
                <div class="form-row">
                    <select name="memberDept">
                        <option class="option" value="">부서명</option>
                        <option class="option" value="임원">임원진</option>
                        <option class="option" value="경영관리팀">경영관리팀</option>
                        <option class="option" value="비서팀">비서팀</option>
                        <option class="option" value="회계팀">회계팀</option>
                        <option class="option" value="인사팀">인사팀</option>
                        <option class="option" value="영업팀">영업팀</option>
                        <option class="option" value="전산팀">전산팀</option>
                        <option class="option" value="디자인팀">디자인팀</option>
                        <option class="option" value="생산팀">생산팀</option>
                    </select>
                    <span class="select-btn">
						  	<i class="zmdi zmdi-chevron-down"></i>
						</span>
                </div>
                <div class="form-row">
                    <select name="memberPosition">
                        <option value="">직급</option>
                        <option value="임원">임원급</option>
                        <option value="부장">부장급</option>
                        <option value="차장">차장급</option>
                        <option value="과장">과장급</option>
                        <option value="대리">대리급</option>
                        <option value="주임">주임급</option>
                        <option value="사원">사원급</option>
                        <option value="인턴">인턴급</option>
                    </select>
                    <span class="select-btn">
						  	<i class="zmdi zmdi-chevron-down"></i>
						</span>
                </div>
                <div class="form-row">
                    <input type="text" name="salary" class="company" id="salary" placeholder="연봉" required>
                </div>
                <div class="form-row">
                    <input type="text" name="career" class="company" id="career" placeholder="경력" required>
                </div>
                <div class="form-row">
                    <input type="file" name="memberProfile" class="company" id="profile" value="사진첨부" style="background-color: lightgray" required>
                </div>

            </div>
            <div class="form-right">
                <h2>개인정보</h2>
                <div class="form-row">
                    <label class="labelStyle" for="memberIdNum">주민등록번호 7자리</label>
                    <input type="text" name="memberIdNum" class="company" id="memberIdNum" placeholder="주민등록번호" maxlength="7" required>
                </div>
                <div class="form-row">
                    <input type="text" name="MemberBirthDay" class="company" id="birthDay" placeholder="생년월일" required>
                </div>
                <div class="form-row">
                    <input type="text" name="memberAddress" class="company" id="address" placeholder="거주지" required>
                </div>
                <div class="form-row">
                    <input type="text" name="educationLv" class="company" id="educationLv" placeholder="학력" required>
                </div>
                <div class="form-row">
                    <input type="text" name="certificate" class="company" id="certificate" placeholder="자격증">
                </div>
                <div class="form-group">
                    <div class="form-row form-row-1">
                        <input type="text" name="firstNum" class="code" id="firstNum" placeholder="010" required>
                    </div>
                    <div class="form-row form-row-2">
                        <input type="text" name="memberMobile" class="phone" id="mobile" placeholder="0000-0000" maxlength="11"required>
                    </div>
                </div>
                <div class="form-row">
                    <input type="text" name="memberEmail" id="your_email" class="input-text" required placeholder="이메일주소">
                </div>
                <div class="form-checkbox">
                    <label class="container"><p>I do accept the <a href="#" class="text">Terms and Conditions</a> of your site.</p>
                        <input type="checkbox">
                        <span class="checkmark"></span>
                    </label>
                </div>
                <div class="form-row-last">
                    <input type="submit" name="register" class="register" value="사원등록" >
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script>

</script>

</html>
