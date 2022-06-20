<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: 오후 2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>마이페이지</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <style>
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
        .sub-container{
            margin: 0 0% 0 0%;
            background-color: rgba(31,40,62,0.95);
            height: 70%;
            width: 120%;
            border-radius: 5%;
        }
        .outBtn{
            text-align: right;
            margin-right: 50px;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/sidebar.jsp" flush="false"></jsp:include>
<div class="container">
    <div class="sub-container">
        <p class="tableCaption">내 프로필</p>
        <table class="table table-striped table-hover" style="color: whitesmoke; text-align: center; border-color: #3C4858">
            <thead>
            <tr>
                <th colspan="2" style="text-align: center">
                    <img src="${pageContext.request.contextPath}/upload/${memberDTO.memberProfileName}"
                         alt="" height="100" width="100">
                </th>
                <th scope="col">사원번호</th>
                <td style="border-top: 0">${memberDTO.id}</td>
                <th scope="col">사원아이디</th>
                <td style="border-top: 0">${memberDTO.memberId}</td>
            </tr>
            <tr>

                <th scope="col">사원명</th>
                <td>${memberDTO.memberName}</td>
                <th scope="col">부서</th>
                <td>${memberDTO.memberDept}</td>
                <th scope="col">직급</th>
                <td>${memberDTO.memberPosition}</td>
            </tr>
            <tr>
                <th scope="col">입사일</th>
                <td><fmt:formatDate pattern="yyyy-MM-dd"
                                    value="${memberDTO.memberJoinDate}"></fmt:formatDate></td>
                <th scope="col">연봉</th>
                <td>${memberDTO.salary}</td>
                <th scope="col">이메일</th>
                <td colspan="2">${memberDTO.memberEmail}</td>
            </tr>
            <tr>
                <th scope="col">주민등록번호</th>
                <td>${memberDTO.memberIdNum}</td>
                <th scope="col">생년월일</th>
                <td>${memberDTO.memberBirthDay}</td>
                <th scope="col">연락처</th>
                <td colspan="2">${memberDTO.memberMobile}</td>
            </tr>
            <tr>
                <th scope="col">최종학력</th>
                <td colspan="2">${memberDTO.educationLv}</td>
                <th scope="col">자격증</th>
                <td colspan="2">${memberDTO.certificate}</td>
            </tr>
            <tr>
                <th scope="col">경력사항</th>
                <td colspan="5">${memberDTO.career}</td>
            </tr>
            <tr>
                <th scope="col">출근일수</th>
                <td colspan="2">${memberDTO.countAttendance}</td>
                <th scope="col">결근일수</th>
                <td colspan="2">${memberDTO.countAbsenceDate}</td>
            </tr>
            <tr>
                <th scope="col">지각일수</th>
                <td colspan="2">${memberDTO.countLate}</td>
                <th scope="col">조퇴일수</th>
                <td colspan="2">${memberDTO.countEarly}</td>
            </tr>
            <tr>
                <th scope="col">전체 휴가일수</th>
                <td>${memberDTO.totalHoliday}</td>
                <th scope="col">사용 휴가일수</th>
                <td>${memberDTO.usedHoliday}</td>
                <th scope="col">잔여 휴가일수</th>
                <td>${memberDTO.restHoliday}</td>
            </tr>
            <tr>
                <td colspan="5" class="outBtn"><button class="btn btn-secondary" id="update" onclick="updateMember(${memberDTO.id})">정보수정</button></td>
                <td><button class="btn btn-secondary" id="delete" onclick="deleteMember(${memberDTO.id})">사원탈퇴</button></td>
            </tr>
            </thead>
        </table>
    </div>
</div>
</body>
<script>
    const deleteMember = (id) => {
        let result = confirm("사원탈퇴를 진행하시겠습니까?");
        if(result){
            location.href="/member/delete?id="+id;
            alert("사원탈퇴가 완료되었습니다.");
        }else{
            alert("사원탈퇴를 취소합니다.");
        }
    }
    const updateMember = (id) => {
        location.href="/member/pwCheck?id="+id;
    }
</script>
</html>
