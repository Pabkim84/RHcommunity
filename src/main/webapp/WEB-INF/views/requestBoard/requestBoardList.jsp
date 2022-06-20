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
    <title>사내민원 게시판</title>
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
            margin-bottom: 0px;
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
        .sm-container{
            text-align: right;
            width: 80%;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/sidebar.jsp" flush="false"></jsp:include>
<div class="container">
    <div class="sub-container">
        <p class="tableCaption">사내민원 게시판</p>
        <table class="table table-striped table-hover" style="color: whitesmoke; text-align: center; border-color: #3C4858">
            <div class="sm-container">
                <button class="btn btn-secondary btn-sm" onclick="location.href='/requestBoard/save'">새 글작성</button>
            </div>
            <thead>
                <tr>
                    <th scope="col" style="width: 10%">글번호</th>
                    <th scope="col" style="width: 10%">작성자</th>
                    <th scope="col" style="width: 10%">부서</th>
                    <th scope="col" style="width: 40%">제목</th>
                    <th scope="col" style="width: 10%">작성일자</th>
                    <th scope="col" style="width: 10%">조회수</th>
                    <th scope="col" style="width: 10%">삭제</th>
                </tr>
            </thead>
            <tbody>
                 <c:forEach items="${boardList}" var="boardList">
                <tr style="background-color: rgb(31,40,62)">
                    <td>${boardList.id}</td>
                    <td>${boardList.writerId}</td>
                    <td>${boardList.dept}</td>
                    <td style="text-align: left"><a href="/requestBoard/detail?id=${boardList.id}">${boardList.title}</a></td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd"
                        value="${boardList.createdDate}"></fmt:formatDate></td>
                    <td>${boardList.hits}</td>
                    <td><a href="#" id="delete" onclick="deleteMember(${boardList.id})">삭제</a></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
<script>
    const deleteMember = (id) => {
        let result = confirm("글삭제를 진행하시겠습니까?");
        if(result){
            location.href="/requestBoard/delete?id="+id;
            alert("글삭제가 완료되었습니다.");
        }else{
            alert("글삭제를 취소합니다.");
        }
    }
</script>
</html>
