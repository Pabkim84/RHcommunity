<%--
  Created by IntelliJ IDEA.
  User: esteb
  Date: 2022-10-20
  Time: 오후 5:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="/resources/js/jquery.js"></script>
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
            width: 76%;
        }
        .filebox .upload-name {
            display: inline-block;
            height: 40px;
            padding: 0 10px;
            vertical-align: middle;
            border: 1px solid #dddddd;
            width: 83%;
            color: #999999;
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
        .saveBtn {
            width: 100px;
            height: 40px;
            font-size: 16px;
            cursor: pointer;
        }
        .saveBtn:hover {
            background-color: white;
            font-size: 14px;
            box-shadow: 1px 1px 1px 1px grey inset;
        }
        .newNotice {
            outline-style: none;
        }

    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="main-container">
    <div class="subTitle"><img src="../../../resources/img/triangle.png">공지사항 작성</div>
    <form action="/notice/update" method="post" style="width: 100%" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${noticeDTO.id}">
        <table class="table">
            <tr>
                <th><div>작성자</div></th>
                <td><input type="text" class="newNotice" name="noticeWriter" style="height: 40px" value="${noticeDTO.noticeWriter}" readonly></td>
            </tr>
            <tr>
                <th><div>제목</div></th>
                <td><input type="text" class="newNotice" name="noticeTitle" style="width: 400px; height: 40px" value="${noticeDTO.noticeTitle}"></td>
            </tr>
            <tr>
                <th><div>내용</div></th>
                <td><textarea class="newNotice" name="noticeContents" id="noticeContents" cols="120" rows="20">${noticeDTO.noticeContents}</textarea></td>

            </tr>
            <tr>
                <td colspan="2" style="padding-left: 75px">
                    <div class="filebox">
                        <label for="noticeFile" style="height: 40px; width: 100px">첨부파일</label>
                        <input class="newNotice upload-name" value="${noticeDTO.noticeFileName}" placeholder="첨부파일">
                        <input type="file" class="newNotice" id= "noticeFile" name="noticeFile" value="${pageContext.request.contextPath}/upload/${noticeDTO.noticeFileName}">
                    </div>
                    <input type="submit" class="saveBtn" value="수정완료">
                    <input type="button" class="saveBtn" onclick="location.href='/notice/paging'" value="취소하기">
                </td>
            </tr>

        </table>

    </form>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>

</body>
<script>
    $("#noticeFile").on('change',function(){
        const fileName = $("#noticeFile").val();
        $(".upload-name").val(fileName);
    });
</script>
</html>
