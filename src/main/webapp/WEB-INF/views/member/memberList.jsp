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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <script src="/resources/js/jquery.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <title>사원목록</title>
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
            display: flex;
        }

        .table1 {
            position: absolute;
            left: 2%;
            top: 65px;
            width: 95%;
            height: 80%;
            text-align: center;
            color: black;
            background-color: whitesmoke;
            box-shadow: 1px 1px 3px 3px darkgrey inset;
        }
        th{
            border: 1px solid lightgrey;
            font-size: 13px;
            line-height: 0px;
        }
        td{
            border: 1px solid lightgrey;
            height: 40px !important;
            font-size: 12px;
        }
        tr{
            height: 40px !important;
        }
        tr:hover {
            background-color: lightgray;
            cursor: pointer;
        }
        .dark-edition a {
            color: black !important;
        }
        .paging-container {
            width: 100%;
            height: 50px;
            font-weight: 700;
            position: relative;
            top: 91%;
        }
        .myBanner {
            position: absolute;
            left: 2%;
            width: 95%;
            height: 90%;
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
        .table1 tr:hover {
            background-color: lightgrey;
            font-weight: 700;
        }
        .btn {
            width: 90px;
            height: 30px;
            font-size: 12px;
            color: black;
            border: 1px solid grey;
            box-shadow: 1px 1px 0px 1px dimgray;
            background: transparent;
        }
        .btn:hover {
            background-color: rgba(235, 235, 235, 0.5);
            box-shadow: 1px 1px 1px 2px dimgrey inset;
            font-size: 11px;
            cursor: pointer;
        }
        ul {
            display: flex;
            justify-content: center;
        }
        li {
            position: relative;
            top: -10px;
            margin-right: 6px;
            list-style: none;

        }
        .signupMember {
            position: absolute;
            top: 33px;
            left: 89%;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="main-container">
    <div class="subTitle"><img src="../../../resources/img/triangle.png">전체 사원목록</div>
    <div class="signupMember"><button type="button" class="btn" id="signupBtn" onclick="signupForm()">사원등록</button></div>
    <table class="table1">
            <thead>
                <tr>
                    <th scope="col" style="width: 7%">사원번호</th>
                    <th scope="col" style="width: 11%">사원아이디</th>
                    <th scope="col" style="width: 11%">사원명</th>
                    <th scope="col" style="width: 11%">부서</th>
                    <th scope="col" style="width: 11%">직급</th>
                    <th scope="col" style="width: 11%">입사일</th>
                    <th scope="col" style="width: 12%">이메일</th>
                    <th scope="col" style="width: 12%">연락처</th>
                    <th scope="col" style="width: 7%">사원삭제</th>
                </tr>
            </thead>
            <tbody>
                 <c:forEach items="${memberList}" var="memberList">
                <tr onclick="location.href='/member/detail?id=${memberList.id}'">
                    <td>${memberList.id}</td>
                    <td>${memberList.memberId}</td>
                    <td>${memberList.memberName}</td>
                    <td>${memberList.memberDept}</td>
                    <td>${memberList.memberPosition}</td>
                    <td>${memberList.memberJoinDate}</td>
                    <td>${memberList.memberEmail}</td>
                    <td>${memberList.memberMobile}</td>
                    <td><a href="#" id="delete" onclick="deleteMember(${memberList.id})">사원삭제</a></td>
                </tr>
                </c:forEach>
            <c:if test="${memberList.size()<10}">
                <c:forEach begin="1" end="${10-memberList.size()}" step="1">
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                </c:forEach>
            </c:if>
            </tbody>
        </table>
    <div class="paging-container">
            <ul class="pagination justify-content-center">
                <c:choose>
                    <%-- 현재 페이지가 1페이지면 이전 글자만 보여줌 --%>
                    <c:when test="${paging.page<=1}">   <%--if와 동일 --%>
                        <li class="page-item disabled">
                            <button type="button" class="btn page-link" style="left: 512px">이전페이지</button>
                        </li>
                    </c:when>
                    <%--1페이지가 아닌 경우에는 [이전]을 클릭하면 현재 페이지보다 1 작은 페이지 요청 --%>
                    <c:otherwise>   <%--else와 동일 --%>
                        <li class="page-item">
                            <button type="button" class="btn page-link"  style="left: 512px" onclick="location.href='/member/paging?page=${paging.page-1}'">이전페이지</button>
                        </li>
                    </c:otherwise>
                </c:choose>
                <%--for(int i=startPage; i <=endPage; i++)--%>
                <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
                    <c:choose>
                        <%-- 요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보이게 --%>
                        <c:when test="${i eq paging.page}"> <%-- == 대신 eq를 쓴다--%>
                            <li class="page-item active">
                                <button type="button" class="btn page-link" style="width: 37px; top: 14px;left: 580px">${i}</button>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <button type="button" class="btn page-link" style="width: 37px; top: 14px;left: 580px" onclick="location.href='/member/paging?page=${i}'">${i}</button>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:choose>
                    <c:when test="${paging.page>=paging.maxPage}">
                        <li class="page-item disabled">
                            <button class="btn page-link" style="left: 620px">다음페이지</button>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <button type="button" class="btn page-link" style="left: 620px" onclick="location.href='/member/paging?page=${paging.page+1}'">다음페이지</button>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
<%--<div class="sub-container">--%>
<%--    <img src="../../../resources/img/adminz-banner.png" class="myBanner" alt="">--%>
<%--</div>--%>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
<div class="right-container"></div>
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
 const signupForm = () => {
   location.href="/member/signUp";
 }
</script>
</html>
