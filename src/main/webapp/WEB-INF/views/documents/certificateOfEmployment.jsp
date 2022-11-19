<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: 오후 3:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>

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
        .btnDiv {
            position: absolute;
            top: 95%;
            width: 99%;
            text-align: center;
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
                    <td>${memberDTO.memberName}</td>
                    <th>생년월일</th>
                    <td>${memberDTO.memberBirthDay}</td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td>${memberDTO.memberAddress}</td>
                    <th>연락처</th>
                    <td>${memberDTO.memberMobile}</td>
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
                    <td>123-456-78910</td>
                </tr>
                <tr>
                    <th>부서</th>
                    <td>${memberDTO.memberDept}</td>
                    <th>직위</th>
                    <td>${memberDTO.memberPosition}</td>
                </tr>
                <tr>
                    <th>재직기간</th>
                    <td colspan="3">${memberDTO.memberJoinDate}<span style="font-weight: 700">부터 </span> <span class="text" id="current_date2"></span> <span style="font-weight: 700">현재까지</span></td>
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
                    <td colspan="4" rowspan="4"><textarea id="purpose" style="border: 0; outline-style: none" cols="100%" rows="4" placeholder="용도를 적어주세요" autofocus></textarea></td>
                 </tr>
            </tbody>
        </table>
    </div>
    <div class="text-container">
        <p class="text">상기와 같이 재직하고 있음을 증명합니다.</p>
        <p class="text" id="current_date"></p>
        <span>RHcompany 대표이사</span> <span class="text-name">김새롬</span>   <span class="text-auth">(인)<sub><img src="http://dojangnara.net/web/product/big/201507/1362_shop1_638289.jpg" style="width: 100px" alt="회사직인"></sub></span>
    </div>
    <div class="btnDiv"><button class="btn"  id="print">출력하기</button></div>
</div>
</body>
    <script>
        date = new Date();
        year = date.getFullYear();
        month = date.getMonth() + 1;
        day = date.getDate();
        document.getElementById("current_date").innerHTML = year + "년 " + month + "월 " + day + "일" ;
        document.getElementById("current_date2").innerHTML = year + "년 " + month + "월 " + day + "일" ;

        $('#print').click(function () {
            document.querySelector('#print').style.display="none";
            const purpose = document.getElementById("purpose").value;
            if(!purpose){
                alert("발급용도를 적어주세요");
            } else {
                document.querySelector('#print').style.display="none";
                window.print();
                document.querySelector('#print').style.display="inline";
            }
            document.querySelector('#print').style.display="inline";
        });


    </script>
</html>
