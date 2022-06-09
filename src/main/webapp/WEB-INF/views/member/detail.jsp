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
    <title>사원조회</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <style>
        body{
            background-color: rgb(26,32,53);
            color: whitesmoke;
        }
        td{
            color: lightgray!important;
        }
        .container{
            margin-top: 200px;
        }
        .tableCaption {
            text-align: center;
            font-size: 36px;
            color: whitesmoke;
            font-weight: 500;
            margin-bottom: 50px;
        }
        .sub-container{
            margin: 0 15% 0 15%;
            background-color: #1f283e;
            height: 70%;
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
        <p class="tableCaption">사원조회</p>
        <table class="table table-striped table-hover" style="color: whitesmoke; text-align: center; border-color: #3C4858">
            <thead>
            <tr>
                <th>
                    <img src="${pageContext.request.contextPath}/upload/${memberDTO.memberProfileName}"
                         alt="" height="100" width="100">
                </th>
            </tr>
            <tr>
                <th scope="col">사원번호</th>
                <td>${memberDTO.id}</td>
                <th scope="col">사원명</th>
                <td>${memberDTO.memberName}</td>
                <th scope="col">사원아이디</th>
                <td>${memberDTO.memberId}</td>
            </tr>
            <tr>
                <th scope="col">부서</th>
                <td>${memberDTO.memberDept}</td>
                <th scope="col">직급</th>
                <td>${memberDTO.memberPosition}</td>
                <th scope="col">입사일</th>
                <td><fmt:formatDate pattern="yyyy-MM-dd"
                                    value="${memberDTO.memberJoinDate}"></fmt:formatDate></td>
            </tr>
            <tr>
                <th scope="col">주민등록번호</th>
                <td>${memberDTO.memberIdNum}</td>
                <th scope="col"></th>
                <td></td>
                <th scope="col"></th>
                <td></td>
            </tr>
            <tr>
                <th scope="col">이메일</th>
                <td colspan="2">${memberDTO.memberEmail}</td>

                <th scope="col">연락처</th>
                <td colspan="2">${memberDTO.memberMobile}</td>
            </tr>
            <tr>
                <td colspan="6" class="outBtn"><button class="btn btn-secondary" id="delete" onclick="deleteMember(${memberDTO.id})">사원삭제</button></td>
            </tr>
            </thead>
        </table>
    </div>
</div>
</body>
<script>
    const deleteMember = (id) => {
        let result = confirm("사원삭제를 진행하시겠습니까?");
        if(result){
            location.href="/member/delete?id="+id;
            alert("사원삭제가 완료되었습니다.");
        }else{
            alert("사원삭제를 취소합니다.");
        }
    }
</script>
</html>
