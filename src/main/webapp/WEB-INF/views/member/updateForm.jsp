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
    <script src="/resources/js/jquery.js"></script>
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
            left: 100px;
        }

        .table1 {
            width: 96%;
            height: 85%;
            font-size: 13px;
            position: absolute;
            left: 2%;
            top: 57px;
            color: dimgray;
            text-align: left;
            background-color: whitesmoke;
            border-spacing: 1px;
        }
        .table1 th {
            width: 255px;
            height: 7.7%;
            text-indent: 62px;
            font-weight: 700;
            background-color: lightgrey;
            color: rgb(40,40,40);
        }
        .table1 td {
            border: 4px solid lightgrey;
            box-shadow: 1px 1px 2px 2px darkgrey inset;
            width: 284px;
            height: 40px;
            color: black;
            text-indent: 15px;
            padding: 0;
            border-inline-color: darkgray;
        }
        .table1 th:hover {
            background-color: lightgrey;
            font-weight: 700;
        }
        .table1 td:hover {
            background-color: lightgrey;
            font-weight: 700;
        }
        .outBtn{
            text-align: right;
            margin-right: 50px;
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

        .btn-UD {
            position: absolute;
            top: 95%;
            right: 3%;
        }
        .table1 img {
            width: 100%;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
    <div class="main-container">
        <div class="subTitle"><img src="../../../resources/img/triangle.png">내 프로필</div>
        <table class="table1">
            <thead>
            <tr>
                <th colspan="2" rowspan="5" style="text-indent: unset">
                    <img src="${pageContext.request.contextPath}/upload/${memberDTO.memberProfileName}" alt="profile">
                </th>
                <th scope="col">사원번호</th>
                <td>${memberDTO.id}</td>
                <th scope="col">사원명</th>
                <td>${memberDTO.memberName}</td>
                <th scope="col">사원아이디</th>
                <td>${memberDTO.memberId}</td>
            </tr>
            <tr>
                <th scope="col">소속번호</th>
                <td></td>
                <th scope="col">소속본부</th>
                <td></td>
                <th scope="col">입사일</th>
                <td colspan="3">${memberDTO.memberJoinDate}"></td>
            </tr>
            <tr>
                <th scope="col">부서번호</th>
                <td></td>
                <th scope="col">부서명</th>
                <td>${memberDTO.memberDept}</td>
                <th>퇴사일</th>
                <td></td>
            </tr>
            <tr>
                <th>소속팀</th>
                <td></td>
                <th>직무</th>
                <td></td>
                <th>직위</th>
                <td>${memberDTO.memberPosition}</td>
            </tr>
            <tr>
                <th>연봉</th>
                <td>${memberDTO.salary}</td>
                <th>스톡옵션</th>
                <td></td>
                <th>기타옵션</th>
                <td></td>
            </tr>
            <tr>
                <th scope="col">주민등록번호</th>
                <td colspan="3">${memberDTO.memberIdNum}</td>
                <th scope="col">생년월일</th>
                <td>${memberDTO.memberBirthDay}</td>
                <th scope="col">성별</th>
                <td></td>
            </tr>
            <tr>
                <th scope="col">건강상태</th>
                <td colspan="3"></td>
                <th scope="col">혼인유무</th>
                <td></td>
                <th scope="col">이메일</th>
                <td colspan="2">${memberDTO.memberEmail}</td>
            </tr>
            <tr>
                <th scope="col">장애여부</th>
                <td colspan="3"></td>
                <th scope="col">장애등급</th>
                <td></td>
                <th scope="col">연락처</th>
                <td colspan="2">${memberDTO.memberMobile}</td>
            </tr>
            <tr>
                <th scope="col">거주지 주소</th>
                <td colspan="7"></td>
            </tr>
            <tr>
                <th scope="col">취미</th>
                <td colspan="3"></td>
                <th scope="col">특기</th>
                <td></td>
                <th scope="col">종교</th>
                <td></td>
            </tr>
            <tr>
                <th scope="col">경력사항1</th>
                <td colspan="4">${memberDTO.career}</td>
                <th scope="col">최종학력</th>
                <td colspan="2">${memberDTO.educationLv}</td>
            </tr>

            <tr>
                <th scope="col">경력사항2</th>
                <td colspan="4"></td>
                <th scope="col">기타학력</th>
                <td colspan="2"></td>
            </tr>
            <tr>
                <th scope="col">경력사항3</th>
                <td colspan="4"></td>
                <th scope="col">자격증</th>
                <td colspan="2"></td>
            </tr>

            </thead>
        </table>
        <div class="btn-UD">
        <button class="btn btn-secondary" id="update" onclick="updateMember(${memberDTO.id})">정보수정</button>
        <button class="btn btn-secondary" id="delete" onclick="deleteMember(${memberDTO.id})">사원탈퇴</button>
        </div>
    </div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>

<%--<div class="sub-container">--%>
<%--    <img src="../../../resources/img/adminz-banner.png" class="myBanner" alt="">--%>
<%--</div>--%>
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
