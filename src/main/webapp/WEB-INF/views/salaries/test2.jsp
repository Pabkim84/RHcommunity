<%@ page import="com.its.rhCommunity.dto.SalaryDTO" %><%--
  Created by IntelliJ IDEA.
  User: PABLO
  Date: 2022-10-31
  Time: 오전 12:52
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <title>급여관리대장</title>
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
            width: 98%;
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
            width: 11px;
            height: 11px;
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
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="main-container">
    <div class="subTitle"><img src="../../../resources/img/triangle.png">급여관리대장
        <div style="margin-left: 70%"><span>날짜별 조회</span>
            <select name="selectDate" id="selectDate" onchange="selectDateOption(this)">
                <option value="">선택년도</option>
                <c:forEach items="${payDayList}" var="payDay">
                    <option value="${payDay}">${payDay}년</option>
                </c:forEach>
            </select>

        </div>
    </div>

    <table class="table1">
        <thead>
        <tr>
            <th scope="col" style="width: 10%">급여지급일</th>
            <th scope="col" style="width: 10%">사원번호</th>
            <th scope="col" style="width: 10%">사원명</th>
            <th scope="col" style="width: 10%">부서</th>
            <th scope="col" style="width: 10%">직급</th>
            <th scope="col" style="width: 10%">연봉</th>
            <th scope="col" style="width: 10%">기본급</th>
            <th scope="col" style="width: 10%">수당합계</th>
            <th scope="col" style="width: 10%">공제합계</th>
            <th scope="col" style="width: 10%">실지급액</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${salaryList}" var="salaryDTO" varStatus="sts">
            <tr onclick="">
                <td id="payDay${sts.count}">${salaryDTO.payDay}</td>
                <td>${salaryDTO.numId}</td>
                <td>${salaryDTO.memberName}</td>
                <td>${salaryDTO.memberDept}</td>
                <td>${salaryDTO.memberPosition}</td>
                <td id="salary${sts.count}"></td>
                <td>${salaryDTO.baseSalary}</td>
                <td>${salaryDTO.totalExtraPay}</td>
                <td>${salaryDTO.totalDeduction}</td>
                <td id="actualPayment${sts.count}" ></td>
            </tr>
        </c:forEach>
        <c:if test="${salaryList.size()<10}">
            <c:forEach begin="1" end="${10-salaryList.size()}" step="1">
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
                        <button type="button" class="btn page-link"  style="left: 512px" onclick="location.href='/salary/paging?page=${paging.page-1}'">이전페이지</button>
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
                            <button type="button" class="btn page-link" style="width: 37px; top: 14px;left: 580px" onclick="location.href='/salary/paging?page=${i}'">${i}</button>
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
                        <button type="button" class="btn page-link" style="left: 620px" onclick="location.href='/salary/paging?page=${paging.page+1}'">다음페이지</button>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
<div class="right-container"></div>
</body>
<script type="text/javascript">
    window.onload = function (){
        <c:forEach items="${salaryList}" var="salaryDTO" varStatus="sts">
            const actualPayment${sts.count} = parseInt(${salaryDTO.actualPayment});
            const salary${sts.count} = parseInt(${salaryDTO.salary});
            document.getElementById("actualPayment${sts.count}").innerText= actualPayment${sts.count}.toLocaleString('ko-KR');
            document.getElementById("salary${sts.count}").innerText = salary${sts.count}.toLocaleString('ko-KR');
        </c:forEach>
        console.log(${payDayMap.size()});
    };

    function selectDateOption(selection) {
        console.log(selection.value);
        $.ajax({
            type:"get",
            url: "/salary/ajaxList",
            data: {"payYear": selection.value},
            success: function (result) {
                alert("전송성공");
                console.log(result);
            },
            error: function () {
                alert("전송실패");
            }
        });

    }

</script>
</html>
