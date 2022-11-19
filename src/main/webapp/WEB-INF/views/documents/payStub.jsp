<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-14
  Time: 오후 12:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>급여명세서</title>
    <script src="/resources/js/jquery.js"></script>
    <style>
        .container {
            text-align: center;
        }

        .table-container {
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
            height: 40px;
            width: 800px;
            border-spacing: 0px;
            padding: 0px;
            margin: 0 auto 40px auto;
            border-collapse: collapse;
            text-align: center;
        }
        th{
            border: 1px solid lightgray;
            height: 30px;
            border-spacing: 0px;
            padding: 0px;
            border-collapse: collapse;
        }
        td{
            border: 1px solid lightgray;
            height: 30px;
            border-spacing: 0px;
            padding: 10px;
            margin-left: 50px;
            border-collapse: collapse;
        }
        .subTitle{
            font-size: 20px;
            font-weight: 700;
            text-align: center;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="table-container">
        <table class="table-custom">
            <caption class="table-caption" id="title"></caption>
            <thead>
            <tr style="border: 0">
                <th colspan="7" style="border: 0">
                    <p class="subTitle">기본정보</p>
                </th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th>사원번호</th>
                <td>${memberDTO.id}</td>
                <th>사원명</th>
                <td>${memberDTO.memberName}</td>
            </tr>
            <tr>
                <th>부서</th>
                <td>${memberDTO.memberDept}</td>
                <th>직위</th>
                <td>${memberDTO.memberPosition}</td>
            </tr>
            <tr>
                <th>입사일</th>
                <td>${memberDTO.memberJoinDate}</td>
                <th>급여지급일</th>
                <td><span id="payDay">${salaryDTO.payDay}</span></td>
            </tr>
            </tbody>
        </table>
        <table class="table-custom">
            <thead>
            <tr style="border: 0">
                <th colspan="7" style="border: 0">
                    <p class="subTitle">급여내역</p>
                </th>
            </tr>
            <tr>
                <th rowspan="7" style="width: 15%">지급항목</th>
                <th colspan="2" style="width: 30%">항목명</th>
                <th colspan="2" style="width: 25%">금액</th>
                <th colspan="2" style="width: 30%">비고</th>
            </tr>
            <tr>
                <td colspan="2">월기본급여액</td>
                <td colspan="2" id="salary"></td>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td colspan="2">주휴수당</td>
                <td colspan="2" id="id1">${salaryDTO.holidayAllowance}</td>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td colspan="2">직책수당</td>
                <td colspan="2" id="id2">${salaryDTO.positionAllowance}</td>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td colspan="2">식비지원</td>
                <td colspan="2" id="id3">${salaryDTO.mealAllowance}</td>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td colspan="2">휴가수당</td>
                <td colspan="2" id="id4">${salaryDTO.vacationPay}</td>
                <td colspan="2"></td>
            </tr>
            <tr>
                <th colspan="3">합계</th>
                <td colspan="3" id="sum1">${salaryDTO.totalExtraPay}</td>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th rowspan="8">공제항목</th>
                <th colspan="2">항목명</th>
                <th colspan="2">금액</th>
                <th colspan="2">비고</th>
            </tr>
            <tr>
                <td colspan="2">국민연금 4.5%</td>
                <td colspan="2" id="id5">${salaryDTO.nationalPension}</td>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td colspan="2">건강보험 3.495%</td>
                <td colspan="2" id="id6">${salaryDTO.healthInsurance}</td>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td colspan="2">장기요양 건강보험의 12.27%</td>
                <td colspan="2" id="id7">${salaryDTO.longTermCareInsurance}</td>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td colspan="2">고용보험 0.8%</td>
                <td colspan="2" id="id8">${salaryDTO.employmentInsurance}</td>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td colspan="2">소득세 35%</td>
                <td colspan="2" id="id9">${salaryDTO.incomeTax}</td>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td colspan="2">지방소득세 소득세의 10%</td>
                <td colspan="2" id="id10">${salaryDTO.localIncomeTax}</td>
                <td colspan="2"></td>
            </tr>
            <tr>
                <th colspan="3">합계</th>
                <td colspan="3" id="sum2">${salaryDTO.totalDeduction}</td>
            </tr>
            <tr>
                <th colspan="4">실수령액</th>
                <td colspan="3" id="totalSum"></td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="text-container">
        <p class="text">귀하의 노고에 감사드리며, 수고 많으셨습니다.</p>
        <span>RHcompany 대표이사</span> <span class="text-name">김새롬</span>   <span class="text-auth">(인)<sub><img src="http://dojangnara.net/web/product/big/201507/1362_shop1_638289.jpg" style="width: 100px" alt="회사직인"></sub></span>
    </div>
</div>
</body>
<script>
    window.onload=function (){
        date = new Date(${salaryDTO.payDay});
        // year = date.getFullYear();
        // month = date.getMonth() + 1;
        // day = date.getDate();
        // let lastDate = new Date(year, month, 0);
        document.getElementById("title").innerHTML = "${salaryDTO.payDay} 급여명세서";
        // document.getElementById("title").innerHTML = year+"년 "+month+"월 "+"급여명세서";
        // document.getElementById("payDay").innerHTML = year+"년 "+month+"월 "+lastDate.getDate()+"일";
        const total = parseFloat(${salaryDTO.baseSalary}).toFixed(2);
        const salary = total.toLocaleString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
        // document.getElementById("salary").innerHTML = salary+"원"
        // const id1_v = document.getElementById("id1").value;
        // const id2_v = document.getElementById("id2").value;
        // const id3_v = document.getElementById("id3").value;
        // const id4_v = document.getElementById("id4").value;
        // const id5_v = document.getElementById("id5").value;
        // const id6_v = document.getElementById("id6").value;
        // const id7_v = document.getElementById("id7").value;
        // const id8_v = document.getElementById("id8").value;
        // const id9_v = document.getElementById("id9").value;
        // const id10_v = document.getElementById("id10").value;
        const sum1_v = Number(${salaryDTO.totalExtraPay});
        const sum2_v = Number(${salaryDTO.totalDeduction});
        const totalSum = Number(${salaryDTO.actualPayment});
        document.getElementById("sum1").innerHTML = String(sum1_v+" 원");
        document.getElementById("sum2").innerHTML = String(sum2_v+" 원");
        document.getElementById("totalSum").innerHTML = totalSum.toLocaleString('ko-KR')+" 원";
    }


</script>
</html>

