<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: 오후 2:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <script src="/resources/js/jquery.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
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
            horiz-align: center;
            margin-left: 5%;
            background-color: #1f283e;
            height: 70%;
            border-radius: 5%;
        }
        td{
            background-color: rgb(31,40,62);
        }
    </style>
</head>
<body>

    <jsp:include page="../layout/sidebar.jsp" flush="false"></jsp:include>
    <div class="container">
        <div class="sub-container">
            <p class="tableCaption">상담예약</p>
            <form action="/reserveConsultation/save" method="post">
                <table class="table table-striped table-hover" style="color: whitesmoke; text-align: center; border-color: #3C4858">
                    <thead>
                    <tr>
                        <th scope="col">날짜</th>
                        <th scope="col">요일</th>
                        <th scope="col">T1</th>
                        <th scope="col">T2</th>
                        <th scope="col">T3</th>
                        <th scope="col">T4</th>
                        <th scope="col">T5</th>
                        <th scope="col">T6</th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr style="background-color: rgb(31,40,62)">
                            <td><input type="text" id='currentDate' value="${memberList.id}" readonly></td>
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
                    </tbody>
                </table>
            </form>
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
function getInputDayLabel() {
    const week = new Array('일요일', '월요일', '화요일', '수요일','목요일','금요일','토요일');
    let today = new Date().getDay();
    let todayLabel = week[today];
    return todayLabel;
}
document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);;
</script>
</html>
