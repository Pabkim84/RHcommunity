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
        }
        .filebox .upload-name {
            display: inline-block;
            height: 40px;
            padding: 0 10px;
            vertical-align: middle;
            border: 1px solid #dddddd;
            width: 200px;
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
        .saveBtn:hover{
            background-color: white;
            color: navy;
            font-size: 14px;
            box-shadow: 1px 1px 1px 1px grey inset;
        }
        .request {
            outline-style: none;
            width: 100%;
            text-indent: 10px;
        }
        input[type=text] {
            height: 40px;
        }
        .bg {
            background-color: transparent;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="main-container">
    <div class="subTitle"><img src="../../../resources/img/triangle.png">요청게시판 작성</div>
    <form action="/requestBoard/save" method="post" style="width: 100%" enctype="multipart/form-data">
        <input type="hidden" name="numId" value="${sessionScope.id}">
        <table class="table">
            <tr>
                <th style="width: 12%"><div>작성자</div></th>
                <td style="width: 21%"><input type="text" class="request bg" name="memberName" value="${memberDTO.memberName}" readonly></td>
                <th style="width: 12%"><div>부서</div></th>
                <td style="width: 21%"><input type="text" class="request bg" name="memberDept"  value="${memberDTO.memberDept}"readonly></td>
                <th style="width: 12%"><div>직급</div></th>
                <td style="width: 22%"><input type="text" class="request bg" name="memberPosition" value="${memberDTO.memberPosition}"readonly></td>
            </tr>
            <tr>
                <th><div>제목</div></th>
                <td colspan="2"><input type="text" class="request" name="title"></td>
                <th><div>작성일자</div></th>
                <td colspan="2"><input type="text" class="request bg" name="createdDate" id="createdDate"readonly></td>
            </tr>
            <tr>
                <th><div>내용</div></th>
                <td colspan="5"><textarea class="request" name="contents" id="contents" cols="120" rows="20"></textarea></td>

            </tr>
            <tr>
                <th><div>첨부</div></th>
                <td colspan="5">
                    <div class="filebox">
                        <label for="file" style="height: 40px; width: 100px">첨부파일</label>
                        <input class="request upload-name" value="첨부파일" placeholder="첨부파일">
                        <input type="file" class="request" id= "file" name="file">
                    </div>
                    <input type="submit" class="saveBtn" style="margin-left: 35%" value="작성하기">
                    <input type="button" class="saveBtn" onclick="location.href='/requestBoard/paging'" value="취소하기">
                </td>
            </tr>
        </table>
    </form>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>

</body>
<script>
    window.onload=function (){
        const date = new Date();
        document.getElementById("createdDate").value=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
    }
    $("#file").on('change',function(){
        const fileName = $("#file").val();
        $(".upload-name").val(fileName);
    });
</script>
</html>
