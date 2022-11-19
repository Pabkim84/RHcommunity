<%--
  Created by IntelliJ IDEA.
  User: esteb
  Date: 2022-10-20
  Time: 오후 5:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="/resources/js/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
    <title>Title</title>
    <style>
        body {
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
        .filebox{
            position: relative;
            float: left;
            width: 70%;
        }
        .filebox .upload-name {
            display: inline-block;
            height: 40px;
            width: 79%;
            padding: 0 10px;
            vertical-align: middle;
            border: 1px solid #dddddd;
            color: #999999;
            line-height: 40px;
            font-size: 12px;
            overflow: hidden;
        }
        .filebox label {
            display: inline-block;
            color: #fff;
            vertical-align: middle;
            background-color: #999999;
            cursor: pointer;
            height: 40px;
            text-align: center;
            line-height: 40px;
        }
        .filebox input[type="file"] {
            position: absolute;
            width: 0;
            height: 0;
            padding: 0;
            overflow: hidden;
            border: 0;
        }
        input {
            border: 1px solid darkgrey;
        }
        textarea {
            border: 1px solid darkgrey;
        }
        .table {
            width: 80%;
            margin: 100px;
            border: 1px solid whitesmoke;
        }
        .table tr{
            border: 1px solid whitesmoke;
        }
        .table th{
            width: 15%;
            border: 1px solid whitesmoke;

        }
        .table td{
            border: 1px solid whitesmoke;

        }
        .newNotice {
            padding: 5px 0 0 5px;
            border: 0;
            background: transparent;
            outline-style: none;
        }
        .row1 {
            text-align: center;
        }
        .modal {
            max-width: 1183px;
        }
        .btn:hover {
            background-color: rgba(235, 235, 235, 0.5);
            box-shadow: 1px 1px 1px 2px dimgrey inset;
            font-size: 14px;
            cursor: pointer;
        }
        .btn {
            color: black;
            border: 1px solid grey;
            box-shadow: 1px 1px 0px 1px dimgray;
            background: transparent;
        }
        .saveBtn {
            width: 100px;
            height: 40px;
            font-size: 16px;
        }
        .listBtn {
            width: 50px;
            height: 27px;
            font-size: 14px;
            margin-left: 2%;
            position: absolute;
            top: 69px;
            left: 82%;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="main-container">
    <div class="subTitle"><img src="../../../resources/img/triangle.png">공지사항 작성</div>
    <button class="btn listBtn" onclick="location.href='/notice/paging'">목록</button>
    <form action="/notice/save" method="post" style="width: 100%" enctype="multipart/form-data">
        <table class="table">
            <tr>
                <th><div>작성자</div></th>
                <td><input type="text" class="newNotice row1" name="noticeWriter" style="height: 40px" value="${notice.noticeWriter}" readonly></td>
                <th><div>작성일자</div></th>
                <td><input type="text" class="newNotice row1" name="noticeCreatedDateTime" style="height: 40px" value="${notice.noticeCreatedDateTime}" readonly></td>
                <th><div>조회수</div></th>
                <td><input type="text" class="newNotice row1" name="noticeHits" style="height: 40px" value="${notice.noticeHits}" readonly></td>
            </tr>
            <tr>
                <th><div>제목</div></th>
                <td colspan="5"><input type="text" class="newNotice" name="noticeTitle" style="width: 400px; height: 40px" value="${notice.noticeTitle}" readonly></td>
            </tr>
            <tr>
                <th><div>내용</div></th>
                <td colspan="5"><textarea class="newNotice" name="noticeContents" id="noticeContents" cols="120" rows="20" readonly>${notice.noticeContents}</textarea></td>

            </tr>
            <tr>
                <th><div>첨부</div></th>
                <td colspan="5">
                    <div class="filebox">
                        <a href="#ex7"><label style="height: 40px; width: 100px">파일열기</label></a>
                        <a class="newNotice upload-name" id="md" href="#ex7">${notice.noticeFileName}</a>
                        <input type="file" class="newNotice" id= "noticeFile" name="noticeFile" readonly>
                    </div>
                    <c:if test="${sessionScope.id==notice.noticeWriterId}">
                        <input type="button" class="btn saveBtn" id="updateBtn" style="margin-left: 6%" value="수정하기">
                        <input type="button" class="btn saveBtn" id="deleteBtn" onclick="deleteNotice()" value="삭제하기">
                    </c:if>
                </td>
            </tr>

        </table>

        <div id="ex7" class="modal">
            <iframe style="width: 100%; height: 100%; overflow: hidden" src="${pageContext.request.contextPath}/upload/${notice.noticeFileName}"></iframe>
        </div>
    </form>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>

</body>
<script>
    $('#updateBtn').on('click', function (){
        location.href="/notice/update?id=${notice.id}";
    })
    $('a[href="#ex7"]').click(function(event) {
        event.preventDefault();

        $(this).modal({
            fadeDuration: 250
        });
    });
    const deleteNotice = () => {
        if(confirm("정말 이 게시글을 삭제하시겠습니까?")){
            location.href='/notice/delete?id=${notice.id}';
        }
    }
</script>
</html>
