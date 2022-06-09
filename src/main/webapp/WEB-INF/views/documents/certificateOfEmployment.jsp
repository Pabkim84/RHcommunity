<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: 오후 3:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>재직증명서</title>
    <style>
        .container {

        }

        .table-container {
        }
        .text-container {
            text-align: center;
        }

        .table-container .table-caption {
            font-size: 36px;
            font-weight: 500;
            margin-top: 30px;
            margin-bottom: 60px;
        }

        .text-name {
            margin-left: 20px;
            letter-spacing: 20px;
        }

        .text-auth {
            margin-left: 40px;
        }

        .table-custom {
            border: 0px solid lightgray;
            height: 60px;
            width: 800px;
            border-spacing: 0px;
            padding: 0px;
            margin: 0 auto 40px auto;
            border-collapse: collapse;
        }
        th{
            border: 1px solid lightgray;
            height: 50px;
            border-spacing: 0px;
            padding: 0px;
            border-collapse: collapse;
        }
        td{
            border: 1px solid lightgray;
            height: 50px;
            border-spacing: 0px;
            padding: 10px;
            margin-left: 50px;
            border-collapse: collapse;
        }
        .subTitle{
            font-size: 20px;
            font-weight: 500;
            text-align: left;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="table-container">
        <table class="table-custom">
        <caption class="table-caption">재직증명서</caption>
            <thead>
                <tr style="border: 0">
                    <th style="border: 0">
                    <p class="subTitle">인적사항</p>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>사원명</th>
                    <td>김형수</td>
                    <th>생년월일</th>
                    <td>1984.06.22</td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td>인천광역시 미추홀구 도화2,3동 아파트 몇동 몇호</td>
                    <th>연락처</th>
                    <td>010-2532-4122</td>
                </tr>
            </tbody>
        </table>
        <table class="table-custom">
            <thead>
                <tr style="border: 0">
                    <th style="border: 0">
                        <p class="subTitle">재직사항</p>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>회사명</th>
                    <td>RHcompany</td>
                    <th>사업자등록번호</th>
                    <td>19840622</td>
                </tr>
                <tr>
                    <th>부서</th>
                    <td>개발팀</td>
                    <th>직위</th>
                    <td>대리</td>
                </tr>
                <tr>
                    <th>재직기간</th>
                    <td colspan="3">2020.01.01 부터 2022.06.01 현재까지</td>
                </tr>
            </tbody>
        </table>
        <table class="table-custom">
            <thead>
                <tr style="border: 0">
                    <th style="border: 0">
                        <p class="subTitle">발급용도</p>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td colspan="4" rowspan="4">은행 제출용</td>
                 </tr>
            </tbody>
        </table>
    </div>
    <div class="text-container">
        <p class="text">상기와 같이 재직하고 있음을 증명합니다.</p>
        <p class="text" id="current_date"></p>
        <span>RHcompany 대표이사</span> <span class="text-name">김새롬</span>   <span class="text-auth">(인)</span>
    </div>
</div>
</body>
    <script>
        date = new Date();
        year = date.getFullYear();
        month = date.getMonth() + 1;
        day = date.getDate();
        document.getElementById("current_date").innerHTML = year + "년 " + month + "월 " + day + "일" ;
    </script>
</html>
