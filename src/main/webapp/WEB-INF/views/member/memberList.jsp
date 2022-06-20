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
    <title>사원목록</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
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
            horiz-align: center;
            margin-left: 0%;
            background-color: rgba(31,40,62,0.95);
            height: 70%;
            width: 120%;
            border-radius: 5%;
        }
        td{
            background-color: rgb(31,40,62);
        }
        .container{

        }
    </style>
</head>
<body>
<jsp:include page="../layout/sidebar.jsp" flush="false"></jsp:include>
<div class="container">
    <div class="sub-container">
        <p class="tableCaption">사원목록</p>
        <table class="table table-striped table-hover" style="color: whitesmoke; text-align: center; border-color: #3C4858">
            <thead>
                <tr>
                    <th scope="col">사원번호</th>
                    <th scope="col">사원아이디</th>
                    <th scope="col">사원명</th>
                    <th scope="col">부서</th>
                    <th scope="col">직급</th>
                    <th scope="col">입사일</th>
                    <th scope="col">이메일</th>
                    <th scope="col">연락처</th>
                    <th scope="col">상세조회</th>
                    <th scope="col">사원삭제</th>
                </tr>
            </thead>
            <tbody>
                 <c:forEach items="${memberList}" var="memberList">
                <tr style="background-color: rgb(31,40,62)">
                    <td>${memberList.id}</td>
                    <td>${memberList.memberId}</td>
                    <td>${memberList.memberName}</td>
                    <td>${memberList.memberDept}</td>
                    <td>${memberList.memberPosition}</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd"
                        value="${memberList.memberJoinDate}"></fmt:formatDate></td>
                    <td>${memberList.memberEmail}</td>
                    <td>${memberList.memberMobile}</td>
                    <td><a href="/member/detail?id=${memberList.id}">사원조회</a></td>
                    <td><a href="#" id="delete" onclick="deleteMember(${memberList.id})">사원삭제</a></td>
                </tr>
                </c:forEach>
            </tbody>
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
