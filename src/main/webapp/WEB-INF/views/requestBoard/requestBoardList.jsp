<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: esteb
  Date: 2022-10-06
  Time: 오후 8:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
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
        .table1 {
            position: absolute;
            left: 2%;
            top: 65px;
            width: 95%;
            /*border: 1px solid gray;*/
            /*margin: 5px;*/
            /*border-collapse: collapse;*/
            text-align: center;
            color: black;
            background-color: whitesmoke;
            box-shadow: 1px 1px 3px 3px darkgrey inset;
        }
        tr {
            width: 100%;
            height: 44px;
            border: 1px solid rgba(210,210,210,0.9)

        }

        .table1 th {
            border: 1px solid lightgrey;
            font-size: 13px;
            padding-left: 5px;

        }
        .table1 td {
            border: 1px solid lightgrey;
            font-size: 13px;
            padding-left: 5px;
        }
        .table1 tr:hover {
            background-color: lightgrey;
        }
        .paging-container {
            width: 100%;
            height: 50px;
            font-weight: 700;
            position: relative;
            top: 91%;
        }
        ul {
            display: flex;
            justify-content: center;

        }
        li {
            list-style: none;
            position: relative;
            top: -10px;
            margin-right: 6px;
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
        .newContents {
            position: absolute;
            top: 5%;
            left: 88%;
        }
        .btn:hover {
            background-color: rgba(235, 235, 235, 0.5);
            box-shadow: 1px 1px 0px 1px dimgray inset;
            font-size: 11px;
            cursor: pointer;
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
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="main-container">
    <div class="subTitle"><img src="../../../resources/img/triangle.png">요청게시판</div>
        <button class="btn newContents" onclick="location.href='/requestBoard/save'">새 글작성</button>
    <table class="table1">
        <tr>
            <th style="width: 10%">글번호</th>
            <th style="width: 45%">글제목</th>
            <th style="width: 15%">작성자</th>
            <th style="width: 20%">작성일자</th>
            <th style="width: 10%">조회수</th>
        </tr>
        <c:forEach items="${boardList}" var="board">
            <tr>
                <td>${board.id}</td>
                <td onclick="location.href='/requestBoard/findById?id='+${board.id}" style="text-align: left; cursor: pointer">${board.title}</td>
                <td>${board.memberName}</td>
                <td>${board.createdDate}</td>
                <td>${board.hits}</td>
            </tr>
        </c:forEach>
    </table>
    <div class="paging-container">
        <ul class="pagination justify-content-center">
            <c:choose>
                <%-- 현재 페이지가 1페이지면 이전 글자만 보여줌 --%>
                <c:when test="${paging.page<=1}">   <%--if와 동일 --%>
                    <li class="page-item disabled">
                        <button type="button" class="btn page-link">이전페이지</button>
                    </li>
                </c:when>
                <%--1페이지가 아닌 경우에는 [이전]을 클릭하면 현재 페이지보다 1 작은 페이지 요청 --%>
                <c:otherwise>   <%--else와 동일 --%>
                    <li class="page-item">
                        <button type="button" class="btn page-link" onclick="location.href='/requestBoard/paging?page=${paging.page-1}'">이전페이지</button>
                    </li>
                </c:otherwise>
            </c:choose>
            <%--for(int i=startPage; i <=endPage; i++)--%>
            <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
                <c:choose>
                    <%-- 요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보이게 --%>
                    <c:when test="${i eq paging.page}"> <%-- == 대신 eq를 쓴다--%>
                        <li class="page-item active">
                            <button type="button" class="btn page-link" style="width: 37px">${i}</button>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <button type="button" class="btn page-link" style="width: 37px" onclick="location.href='/requestBoard/paging?page=${i}'">${i}</button>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:choose>
                <c:when test="${paging.page>=paging.maxPage}">
                    <li class="page-item disabled">
                        <button class="btn page-link">다음페이지</button>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <button type="button" class="btn page-link" onclick="location.href='/requestBoard/paging?page=${paging.page+1}'">다음페이지</button>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</div>


<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>

</body>
<script>
    <%--    let totalPage;--%>
    <%--window.onload = function () {--%>
    <%--    const id = ${sessionScope.id};--%>
    <%--    let totalData;--%>
    <%--    let dataPerPage = 10;--%>
    <%--    let pageCount = 5;--%>
    <%--    let showPages = 5;--%>
    <%--    let globalCurrentPage = 1;--%>


    <%--    $.ajax({--%>
    <%--        type: "get",--%>
    <%--        url: "/notice/findAll",--%>
    <%--        data: {"id": id},--%>
    <%--        dataType: JSON,--%>
    <%--        success: function (result) {--%>
    <%--            totalData = result.length;--%>

    <%--        }--%>
    <%--    });--%>
    <%--    displayData(1, dataPerPage);--%>

    <%--    paging(totalData, dataPerPage, pageCount, 1);--%>
    <%--}--%>

    <%--const paging = (totalData, dataPerPage, pageCount, currentPage) => {--%>
    <%--  console.log("currentPage: "+ currentPage);--%>

    <%--  totalPage = Math.ceil(totalData / dataPerPage);--%>
    <%--  if(totalPage<pageCount){--%>
    <%--      pageCount = totalPage;--%>
    <%--  }--%>
    <%--  let pageGroup = Math.ceil(currentPage / pageCount);--%>
    <%--  let last = pageGroup * pageCount;--%>
    <%--    if (last > totalPage) {--%>
    <%--        last = totalPage;--%>
    <%--    }--%>
    <%--    let first = last - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호--%>
    <%--    let next = last + 1;--%>
    <%--    let prev = first - 1;--%>

    <%--    let pageHtml = "";--%>

    <%--    if (prev > 0) {--%>
    <%--        pageHtml += "<li><a href='#' id='prev'> 이전 </a></li>";--%>
    <%--    }--%>

    <%--    //페이징 번호 표시--%>
    <%--    for (let i = first; i <= last; i++) {--%>
    <%--        if (currentPage == i) {--%>
    <%--            pageHtml +=--%>
    <%--                "<li class='on'><a href='#' id='" + i + "'>" + i + "</a></li>";--%>
    <%--        } else {--%>
    <%--            pageHtml += "<li><a href='#' id='" + i + "'>" + i + "</a></li>";--%>
    <%--        }--%>
    <%--    }--%>

    <%--    if (last < totalPage) {--%>
    <%--        pageHtml += "<li><a href='#' id='next'> 다음 </a></li>";--%>
    <%--    }--%>

    <%--    $("#pagingUl").html(pageHtml);--%>
    <%--    let displayCount = "";--%>
    <%--    displayCount = "현재 1 - " + totalPage + " 페이지 / " + totalData + "건";--%>
    <%--    $("#displayCount").text(displayCount);--%>


    <%--    //페이징 번호 클릭 이벤트--%>
    <%--    $("#pagingUl li a").click(function () {--%>
    <%--        let $id = $(this).attr("id");--%>
    <%--        let selectedPage = $(this).text();--%>

    <%--        if ($id == "next") selectedPage = next;--%>
    <%--        if ($id == "prev") selectedPage = prev;--%>

    <%--        //전역변수에 선택한 페이지 번호를 담는다...--%>
    <%--        globalCurrentPage = selectedPage;--%>
    <%--        //페이징 표시 재호출--%>
    <%--        paging(totalData, dataPerPage, pageCount, selectedPage);--%>
    <%--        //글 목록 표시 재호출--%>
    <%--        displayData(selectedPage, dataPerPage);--%>
    <%--    });--%>
    <%--}--%>

</script>
</html>
