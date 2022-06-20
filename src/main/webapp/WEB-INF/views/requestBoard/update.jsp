<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: 오후 2:31
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
        }
        tr{
            background-color: rgb(26,32,53);
        }
        th{
            font-weight: 700;
        }
        td{
            background-color: rgb(26,32,53);
            color: lightgray!important;
            padding: 0 !important;
            border-spacing: 0;
            margin: 0;
            width: 100%;
        }
        .container{
            margin-top: 200px;
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
            margin-left: 5%;
            background-color: #1f283e;
            height: 70%;
            border-radius: 5%;
        }

        .boardInput{
            width: 100%;
            height: 40px;
            border: 0;
            border-spacing: 0;
            background-color: rgb(26,32,53);
            color: lightgray;
        }
        .boardContents{
            background-color: rgb(26,32,53);
            width: 100%;
            border: 0;
            border-spacing: 0;
            padding-inline: 5px;
            margin: 0;
            color: lightgray;
        }
        table{
            width: 90% !important;
            height: 80%;
            margin-left: auto;
            margin-right: auto;
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
        <form action="/requestBoard/update" method="post" enctype="multipart/form-data">
            <table class="table table-striped" style="color: whitesmoke; text-align: center; border-color: #3C4858; background-color: rgb(26,32,53)">
                <div class="sm-container">
                    <input type="button" class="btn btn-secondary btn-sm" onclick="findAll()" value="목록">
                </div>
                <thead>
                <tr>
                    <th scope="col" style="width: 10%">글번호</th>
                    <td style="width: 10%"><input type="text" class="boardInput" name="id" value="${boardDTO.id}" readonly></td>
                    <th scope="col" style="width: 10%">작성자</th>
                    <td style="width: 20%"><input type="text" class="boardInput" name="writerId" value="${boardDTO.writerId}" readonly></td>
                    <th scope="col" style="width: 10%">부서명</th>
                    <td style="width: 15%"><input type="text" class="boardInput" name="dept" value="${boardDTO.dept}" readonly></td>
                    <th scope="col" style="width: 10%">직급</th>
                    <td style="width: 15%"><input type="text" class="boardInput" name="position" value="${boardDTO.position}" readonly></td>
                </tr>
                <tr>
                    <th scope="col">제목</th>
                    <td colspan="7">
                        <input type="text"  class="boardInput" name="title" value="${boardDTO.title}" required>
                    </td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td colspan="6"style="background-color:rgb(26,32,53)">
                        <textarea class="boardContents" name="contents" id="contents" rows="17" required>${boardDTO.contents}
                        </textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="8" style="text-align: center;">
                        <input type="file" name="file" style="margin-right: 20%">
                        <input type="submit" value="수정등록" style="margin-left: 20%">
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
</div>
</body>
<script>
    const findAll = () => {
        location.href="/requestBoard/findAll";
    }
</script>
</html>


