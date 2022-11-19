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
    <title>사원목록</title>
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
        .part1 {
            left: 2%;
            top: 65px;
            width: 50%;
            height: 74%;
            position: absolute;
            overflow: scroll;
            overflow-x: hidden;
        }
        .part2 {
            top: 65px;
            width: 40%;
            height: 60%;
            position: absolute;
            left: 57%;
            overflow: scroll;
            overflow-x: hidden;
            overflow-y: hidden;
        }
        .part3 {
            position: absolute;
            top: 84%;
            left: 2%;
            width: 50%;
            height: 11%;
        }
        .part4 {
            position: absolute;
            top: 72.5%;
            left: 57%;
            width: 40%;
            height: 25%;
            overflow: scroll;
            overflow-x: hidden;
            overflow-y: hidden;
        }

        .table {
            position: absolute;
            width: 85%;
            text-align: center;
            color: black;
            background-color: whitesmoke;
            border: 1px solid whitesmoke;
            box-shadow: 2px 2px 1px 2px darkgrey inset;
            height: 100%;
        }

        th{
            background-color: lightgray;
            border: 1px solid lightgrey;
            font-size: 13px;
            line-height: 0px;
            box-shadow: 1px 1px 1px 0px dimgrey inset;
        }
        td{
            position: relative;
            border: 1px solid lightgrey;
            height: 40px;
            font-size: 12px;
            box-shadow: 1px 1px 1px 0px dimgrey inset;
        }
        tr{
            height: 40px;
        }
        .paging-container {
            width: 40%;
            height: 50px;
            font-weight: 700;
            position: absolute;
            top: 72%;
            left: 5%;
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
        .table tr:hover {
            /*background-color: khaki;*/
            font-weight: 700;
            box-shadow: 0px 0px 1px 3px khaki;
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
        }
        .btn-salary {
            position: absolute;
            left: 32%;
            top: 80%;
        }
        .btn-cancel {
            position: absolute;
            left: 52%;
            top: 80%;
        }
        .btn-salaryConfirm {
            position: absolute;
            left: 42%;
            top: 75%;
        }
        ul {
            padding: 0;
            display: flex;
            justify-content: center;
        }
        li {
            position: relative;
            top: -10px;
            margin-right: 6px;
            list-style: none;

        }
        input[type=text]{
            width: 100%;
            height: 100%;
            border: 0;
            border-spacing: 0;
            border-inline: 0;
            outline-style: none;
            padding: 0;
            margin: 0;
            text-align: center;
        }
        .table1 {
            width: 100%;
            height: 40px;
        }
        .table1 input[type=text] {
            background-color: transparent;
            display: none;
        }
        .table2 {
            width: 100%;
            height: 76%;
        }
        .table2 input[type=text] {
            text-align: right;
            padding-right: 20%;
        }
        .input1 {
            text-align: right;
            padding-right: 20%;
        }
        .part3 table{
            height: 65%;
        }
        .part3 table th{
            width: 20%;
        }
        .part3 table td{
            width: 30%;
        }
        .spaceDiv {
            width: 5%;
            height: 80%;
            position: absolute;
            top: 65px;
            left: 52%;
            font-size: 25px;
            line-height: 508px;
            text-align: center;
        }
        .salaryLabel {
            position: absolute;
            top: 50%;
            left: 85%;
        }
        .confirmParents {
            background-color: lightgray !important;
        }

    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>
<div class="main-container">
    <div class="subTitle"><img src="../../../resources/img/triangle.png">급여내역</div>
    <div class="part1">
        <input type="hidden" id="payDay" value="${salaryDTO.payDay}">
        <table class="table table1">
            <thead>
            <tr>
                <th scope="col" style="width: 10%">사번</th>
                <th scope="col" style="width: 13%">성명</th>
                <th scope="col" style="width: 13%">부서</th>
                <th scope="col" style="width: 10%">직급</th>
                <th scope="col" style="width: 18%">지급총액</th>
                <th scope="col" style="width: 18%">공제총액</th>
                <th scope="col" style="width: 18%">실지급액</th>

            </tr>
            </thead>
            <tbody>
            <form action="#" name="saveForm2">
                <c:forEach items="${memberList}" var="memberDTO" varStatus="member">
                <tr class="parents" id="showTr${member.count}" >
                    <td><input type="text" class="showMember" id="showId${member.count}" name="numId" value="${memberDTO.id}" style="display: block"></td>
                    <td>${memberDTO.memberName}</td>
                    <td>${memberDTO.memberDept}</td>
                    <td>${memberDTO.memberPosition}</td>
                    <td><label for="paymentTotal${member.count}" class="salaryLabel">원</label><input type="text" class="input1 child1" id="paymentTotal${member.count}" numberOnlyMinComma="true" koreanCurrency="true" readonly></td>
                    <td><label for="deductionTotal${member.count}" class="salaryLabel">원</label><input type="text" class="input1 child2" id="deductionTotal${member.count}" numberOnlyMinComma="true" koreanCurrency="true" readonly></td>
                    <td><label for="actualPayTotal${member.count}" class="salaryLabel">원</label><input type="text" class="input1 child3" id="actualPayTotal${member.count}" numberOnlyMinComma="true" koreanCurrency="true" readonly></td>
                </tr>
                </c:forEach>
            </form>
                <c:if test="${memberList.size()<10}">
                    <c:forEach begin="1" end="${10-memberList.size()}" step="1">
                        <tr>
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
    </div>
    <div class="spaceDiv"> >> </div>
    <form action="#" name="saveForm">
        <div class="part2">

            <table class="table table2">
                <thead>
                <tr>
                    <th scope="col" colspan="2" style="width: 25%">지급항목</th>
                    <th scope="col" colspan="2" style="width: 25%">공제항목</th>
                </tr>
                </thead>
                <tbody>
                        <tr>
                            <td>기본급 &nbsp;<i class="bi bi-info-circle-fill" title="연봉 / 52주 / 6일 * 평일수" style="font-size: 14px; color: dimgray; cursor: help"></i></td>
                            <td><label for="baseSalary" class="salaryLabel">원</label><input type="text" id="baseSalary" name="baseSalary" readonly></td>
                            <td style="width: 115px">국민연금</td>
                            <td><label for="nationalPension" class="salaryLabel">원</label><input type="text" id="nationalPension" name="nationalPension"  readonly></td>
                        </tr>
                        <tr><td>직책수당</td>
                            <td><label for="positionAllowance" class="salaryLabel">원</label><input type="text" id="positionAllowance" name="positionAllowance" numberOnlyMinComma="true" koreanCurrency="true" readonly></td>
                            <td>건강보험</td>
                            <td><label for="healthInsurance" class="salaryLabel">원</label><input type="text" id="healthInsurance" name="healthInsurance" readonly></td>
                        </tr>
                        <tr><td>주휴수당</td>
                            <td><label for="holidayAllowance" class="salaryLabel">원</label><input type="text" id="holidayAllowance" name="holidayAllowance" numberOnlyMinComma="true" koreanCurrency="true" readonly></td>
                            <td>장기요양보험</td>
                            <td><label for="longTermCareInsurance" class="salaryLabel">원</label><input type="text" id="longTermCareInsurance" name="longTermCareInsurance" readonly></td>
                        </tr>
                        <tr><td>식비지원</td>
                            <td><label for="mealAllowance" class="salaryLabel">원</label><input type="text" id="mealAllowance"  name="mealAllowance" numberOnlyMinComma="true" koreanCurrency="true" readonly></td>
                            <td>고용보험</td>
                            <td><label for="employmentInsurance" class="salaryLabel">원</label><input type="text" id="employmentInsurance" name="employmentInsurance" readonly></td>
                        </tr>
                        <tr><td>휴가수당</td>
                            <td><label for="vacationPay" class="salaryLabel">원</label><input type="text" id="vacationPay" name="vacationPay" placeholder="직접입력" numberOnlyMinComma="true" koreanCurrency="true"></td>
                            <td>간이소득세</td>
                            <td><label for="incomeTax" class="salaryLabel">원</label><input type="text" id="incomeTax" name="incomeTax" readonly></td>
                        </tr>
                        <tr><td>상여금</td>
                            <td><label for="bonus" class="salaryLabel">원</label><input type="text" id="bonus"  name="bonus" numberOnlyMinComma="true" koreanCurrency="true" placeholder="직접입력"></td>
                            <td>지방소득세</td>
                            <td><label for="localIncomeTax" class="salaryLabel">원</label><input type="text" id="localIncomeTax" name="localIncomeTax" readonly></td>
                        </tr>
                        <tr>
                            <td><input type="text" id="etc1" style="text-align: center; background-color: transparent" placeholder="항목추가"></td>
                            <td><label for="etcPay1" class="salaryLabel">원</label><input type="text" id="etcPay1" name="etcPay1" numberOnlyMinComma="true" koreanCurrency="true" placeholder="직접입력"></td>
                            <td><input type="text" id="etc2" style="text-align: center; background-color: transparent" placeholder="항목추가"></td>
                            <td><label for="etcDeduction1" class="salaryLabel">원</label><input type="text" id="etcDeduction1" name="etcDeduction1" numberOnlyMinComma="true" koreanCurrency="true" placeholder="직접입력"></td>
                        </tr>
                        <tr>
                            <td><input type="text" id="etc3" style="text-align: center; background-color: transparent" placeholder="항목추가"></td>
                            <td><label for="etcPay2" class="salaryLabel">원</label><input type="text" id="etcPay2" name="etcPay2" numberOnlyMinComma="true" koreanCurrency="true" placeholder="직접입력"></td>
                            <td><input type="text" id="etc4" style="text-align: center; background-color: transparent" placeholder="항목추가"></td>
                            <td><label for="etcDeduction2" class="salaryLabel">원</label><input type="text" id="etcDeduction2" name="etcDeduction2" numberOnlyMinComma="true" koreanCurrency="true" placeholder="직접입력"></td>
                        </tr>
                </tbody>
            </table>
        </div>
        <div class="part3">
            <table class="table table1">
                <tr>
                    <th>총 인원</th>
                    <td><label for="payMemberTotal" class="salaryLabel">명</label><input type="text" id="payMemberTotal"></td>
                    <th>실지급 총액</th>
                    <td><label for="actPayTotal" class="salaryLabel">원</label><input type="text" id="actPayTotal"></td>
                </tr>
            </table>
            <button type="button" class="btn btn-salaryConfirm" id="paySalaries">전체 급여지출</button>
        </div>
        <div class="part4">
            <table class="table table2">
                <tr>
                    <th>지급합계</th>
                    <th>공제합계</th>
                    <th>실지급액</th>
                </tr>
                <tr>
                    <td><label for="totalPayment" class="salaryLabel">원</label><input type="text" id="totalPayment" readonly></td>
                    <td><label for="totalDeduction" class="salaryLabel">원</label><input type="text" id="totalDeduction" readonly></td>
                    <td><label for="actualPayment" class="salaryLabel">원</label><input type="text" id="actualPayment" readonly></td>
                </tr>
            </table>
            <button type="button" class="btn btn-salary" id="confirmSalary">급여확정</button>
            <button type="button" class="btn btn-cancel" id="confirmCancel">확정취소</button>
        </div>
    </form>
</div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>
<div class="right-container"></div>
</body>
<script type="text/javascript">
    let clickId = "";
    let totalPayment;
    let totalDeduction;
    let actualPayment;
    let obj={};
    let arr=[];
    let savedArr=[];
    let actPayTotal = 0;
    let preArr = new Array(1);
    // let totalPaymentArr=[];
    // let totalDeductionArr=[];
    // let actualPaymentArr=[];
    $(document).on("keyup", "input:text[numberOnlyMinComma]", function()	{
        const strVal = $(this).val();

        event = event || window.event;
        const keyID = (event.which) ? event.which : event.keyCode;

        if( ( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105 )
            || keyID == 46 || keyID == 8 || keyID == 109
            || keyID == 189 || keyID == 9
            || keyID == 37 || keyID == 39){

            if(strVal.length > 1 && (keyID == 109 || keyID == 189)){
                return false;
            }else{
                return;
            }
        }else{
            return false;
        }
    });

    $(document).on("keyup", "input:text[numberOnlyMinComma]", function()	{
        let count = $(this).val().length;
        if(count>10){
            $(this).css({
               fontSize: "11px"
            });
        } else if(count<=10) {
            $(this).css({
                fontSize: "13px"
            });
        }
        // console.log("글자수"+count);
        $(this).val( $(this).val().replace(/[^-\.0-9]/gi,"") );
        $(this).val( $(this).val().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") );
    });
    $(document).on("focusout", "input:text[koreanCurrency]", function()	{
        $(this).val( $(this).val().replace(",","") );
        $(this).val( $(this).val().replace(/[^-\.0-9]/gi,"") );
        $(this).val( $(this).val().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") );
        // if($(this).val() != '' ) {
        //     $(this).val( $(this).val()+"   원");
        // }
    });

    // $(document).on("focus", "input:text[koreanCurrency]", function()	{
    //     $(this).val( $(this).val().replace("원", ""));
    // });

    // const showDetails = (showTr) => {
    window.onload=function (){
        const savedPayDay = document.getElementById("payDay").value;
        // console.log("저장날짜: "+savedPayDay);
        const payDay = new Date(savedPayDay);
        // console.log("월급날: "+payDay);
        const date = new Date();
        const thisMonth = date.getMonth()+1;
        const payMonth = payDay.getMonth()+1;
        // console.log("이번달: "+thisMonth+"/ 월급달: "+payMonth);

        if(thisMonth>payMonth||isNaN(payMonth)){
            // $(".parents").on('click').click();
        } else {
            alert(thisMonth+"월달은 이미 급여지출이 되었습니다");
            $(".parents").off('click').click();
        }

    }
    let selectBgId;
    $(".parents").click(function (){
        console.log("클릭안했자나=============checkPoint1");
        clickId = $(this).attr("id");
        const showTr = document.getElementById(clickId);
        // console.log(showTr);
        // console.log("저장리스트:  "+savedArr);
        if(selectBgId){
            document.getElementById(selectBgId).style.backgroundColor="whitesmoke";
        }
        for(let i=0; i<savedArr; i++){
            console.log("저장된 아이디: "+savedArr[i].id);
        }
        // console.log("====================showTr: "+clickId);
        document.getElementById("etc1").value = "";
        document.getElementById("etc2").value = "";
        document.getElementById("etc3").value = "";
        document.getElementById("etc4").value = "";
        document.getElementById("etcPay1").value = "";
        document.getElementById("etcPay2").value = "";
        document.getElementById("etcDeduction1").value = "";
        document.getElementById("etcDeduction2").value = "";
        // let memberNo = ($(showTr).children()[0]).firstChild.id;
        const memberNo= document.getElementById($('#'+clickId).find(".showMember").attr("id"));
       console.log("클릭안했자나=============checkPoint2");
        showTr.style.backgroundColor="khaki";
        selectBgId = showTr.id;
        // console.log(memberNo.id);
        //
        // let findId = arr.findIndex((element) => element.id == clickId);
        // const bkColor = $('#'+clickId).css("backgroundColor");
        // preArr[0]={"id": clickId, "bkColor": bkColor};
        // console.log(preArr[0]);
    // 클릭 아이디를 아직 급여확정하지 않았으면
    //     if(findId==-1){
        // 첫번째 클릭한 사원이면
        //     preArr[0]=preArr[1];
        //     preArr.push({"id": clickId, "bkColor": bkColor});
        //         $('#'+preArr[0].id).css("backgroundColor", preArr[0].bkColor);
        //         $('#clickId').css("backgroundColor", "khaki");
                // console.log(preArr[0].id+" / "+preArr[1]);
                // $('#'+preArr[1].id).css("backgroundColor", "khaki");
                // console.log(preArr[0].id+": "+preArr[0].bkColor+" / "+preArr[1].id+": "+preArr[0].bkColor);
        // 두번째 이후 클릭한 사원이면
            // else {
            //     preArr[0]=preArr[1];
            //     preArr[1]={"id": clickId, "bkColor": bkColor};
            //     $('#'+preArr[1].id).css("backgroundColor", "khaki");
            //     // if(arr.includes(preArr[0].id)){
            //     $('#'+preArr[0].id).css("backgroundColor", preArr[0].bkColor);
            //     // }
            //     console.log(preArr[0].id+": "+preArr[0].bkColor+" / "+preArr[1].id+": "+preArr[0].bkColor);
            // }
        // }

        // $('#'+preArr[0]).css("backgroundColor", "transparent");
        // console.log(clickId);
        const showChildren = $('#'+clickId).find('input').attr('id');
        const memberId = document.getElementById(showChildren).value;
        let memberSalary = "";
        let memberPosition = "";
        <c:forEach items="${memberList}" var="memberDTO">
            if(memberId==${memberDTO.id}){
                memberSalary = ${memberDTO.salary};
                memberPosition = "${memberDTO.memberPosition}";
            }
        </c:forEach>
        console.log(memberSalary);
        const date = new Date();
        const endDate = new Date(date.getFullYear(), date.getMonth()+1, 0);
        const dayOfMonth = endDate.getDate();
        let saturday =0;
        let sunday =0;
        for(let i = 1; i<=dayOfMonth; i++){
            let oneDay = new Date(date.getFullYear(), date.getMonth(), i);
            if(oneDay.getDay()==0){
                sunday += 1;
                // console.log(oneDay);
            } else if(oneDay.getDay()==6) {
                saturday += 1;
                // console.log(oneDay);
            }
        }
            // console.log("토요일: "+saturday);
            // console.log("일요일: "+sunday);
        // console.log(endDate);
        // console.log(dayOfMonth);
        const salary = parseInt(memberSalary);
        console.log(memberSalary);
        const chargePerDay = salary / 52 / 6;
        const holidayAllowance = chargePerDay * saturday;
        const baseSalary = chargePerDay * (dayOfMonth-saturday-sunday);
        // console.log("평일: "+(dayOfMonth-saturday-sunday));
        const vacationPay = 0;
        const bonus = 0;
        const mealAllowance = 100000;
        const etcPay1 = document.getElementById("etcPay1").value;
        const etcPay2 = document.getElementById("etcPay2").value;
        const etcDeduction1 = document.getElementById("etcDeduction1").value;
        const etcDeduction2 = document.getElementById("etcDeduction2").value;
        const nationalPension = baseSalary * 45 / 1000;
        const healthInsurance = baseSalary * 3495 / 100000;
        const longTermCareInsurance = healthInsurance * 1227 / 10000;
        const employmentInsurance = baseSalary * 9 / 1000;
        // console.log(salary);
        // console.log(baseSalary);
        // console.log(nationalPension);
        // console.log(healthInsurance);
        // console.log(longTermCareInsurance);
        // console.log(employmentInsurance);
        let positionAllowance;
        if(memberPosition=="대리"){
            positionAllowance = 50000;
        } else if(memberPosition=="과장") {
            positionAllowance = 100000;
        } else if(memberPosition=="차장") {
            positionAllowance = 200000;
        } else if(memberPosition=="부장") {
            positionAllowance = 300000;
        } else if(memberPosition=="임원") {
            positionAllowance = 500000;
        } else {
            positionAllowance = 0;
        }
        let incomeTax = 0;
        let incomeTaxRate = 0;
        let deductionTax = 0;
        const totalInsurance = nationalPension + healthInsurance + employmentInsurance + longTermCareInsurance;
        if (memberSalary <= 12000000) {
            incomeTaxRate = 6;
            incomeTax = (memberSalary - deductionTax) * (incomeTaxRate / 100) / 12 - totalInsurance;
        } else if (memberSalary > 12000000 && memberSalary <= 46000000) {
            deductionTax = 1080000;
            incomeTaxRate = 15;
            incomeTax = (memberSalary - deductionTax) * (incomeTaxRate / 100) / 12 - totalInsurance;
        } else if (memberSalary > 46000000 && memberSalary <= 88000000) {
            deductionTax = 5220000;
            incomeTaxRate = 24;
            incomeTax = (memberSalary - deductionTax) * (incomeTaxRate / 100) / 12 - totalInsurance;
        } else if (memberSalary > 88000000 && memberSalary <= 150000000) {
            deductionTax = 14900000;
            incomeTaxRate = 35;
            incomeTax = (memberSalary - deductionTax) * (incomeTaxRate / 100) / 12 - totalInsurance;
        } else if (memberSalary > 150000000 && memberSalary <= 300000000) {
            deductionTax = 19400000;
            incomeTaxRate = 38;
            incomeTax = (memberSalary - deductionTax) * (incomeTaxRate / 100) / 12 - totalInsurance;
        } else if (memberSalary > 300000000 && memberSalary <= 500000000) {
            deductionTax = 25400000;
            incomeTaxRate = 40;
            incomeTax = (memberSalary - deductionTax) * (incomeTaxRate / 100) / 12 - totalInsurance;
        } else if (memberSalary > 500000000 && memberSalary <= 1000000000) {
            deductionTax = 35400000;
            incomeTaxRate = 42;
            incomeTax = (memberSalary - deductionTax) * (incomeTaxRate / 100) / 12 - totalInsurance;
        } else {
            deductionTax = 65400000;
            incomeTaxRate = 45;
            incomeTax = (memberSalary - deductionTax) * (incomeTaxRate / 100) / 12 - totalInsurance;
        }
        const strBaseSalary = ((Math.ceil(baseSalary/10))*10).toLocaleString('ko-KR');
        document.getElementById("baseSalary").value = strBaseSalary;
        const strNationalPension = (Math.floor(nationalPension/10)*10).toLocaleString('ko-KR');
        document.getElementById("nationalPension").value = strNationalPension;
        const strPositionAllowance = (Math.floor(positionAllowance/10)*10).toLocaleString('ko-KR');
        document.getElementById("positionAllowance").value= strPositionAllowance;
        const strHealthInsurance = (Math.floor(healthInsurance/10)*10).toLocaleString('ko-KR');
        document.getElementById("healthInsurance").value = strHealthInsurance;
        const strHolidayAllowance = (Math.floor(holidayAllowance/10)*10).toLocaleString('ko-KR');
        document.getElementById("holidayAllowance").value= strHolidayAllowance;
        const strLongTermCareInsurance = (Math.floor(longTermCareInsurance/10)*10).toLocaleString('ko-KR');
        document.getElementById("longTermCareInsurance").value = strLongTermCareInsurance;
        const strVacationPay = "";
        document.getElementById("vacationPay").value = strVacationPay;
        const strEmploymentInsurance = (Math.floor(employmentInsurance/10)*10).toLocaleString('ko-KR');
        document.getElementById("employmentInsurance").value = strEmploymentInsurance;
        const strMealAllowance = mealAllowance.toLocaleString('ko-KR');
        document.getElementById("mealAllowance").value= strMealAllowance;
        const strIncomeTax = (Math.floor(incomeTax/10)*10).toLocaleString('ko-KR');
        document.getElementById("incomeTax").value = strIncomeTax;
        const strBonus = "";
        document.getElementById("bonus").value= strBonus;
        const strLocalIncomeTax = (Math.floor(incomeTax/100)*10).toLocaleString('ko-KR');
        document.getElementById("localIncomeTax").value = strLocalIncomeTax;
        totalPayment = Math.ceil((baseSalary+positionAllowance+holidayAllowance+mealAllowance+vacationPay+bonus+etcPay1+etcPay2)/10)*10;
        totalDeduction = Math.floor((nationalPension+healthInsurance+longTermCareInsurance+employmentInsurance+incomeTax+(incomeTax/10)+etcDeduction1+etcDeduction2)/10)*10;
        actualPayment = totalPayment - totalDeduction;
        const totalExtraPay = Math.ceil((positionAllowance+holidayAllowance+mealAllowance+vacationPay+bonus+etcPay1+etcPay2)/10)*10;
        document.getElementById("totalPayment").value = totalPayment.toLocaleString('ko-KR');
        document.getElementById("totalDeduction").value = totalDeduction.toLocaleString('ko-KR');
        document.getElementById("actualPayment").value = actualPayment.toLocaleString('ko-KR');
        const paymentTotal = document.getElementById($(showTr).find(".child1").attr("id"));
        const deductionTotal = document.getElementById($(showTr).find(".child2").attr("id"));
        const actualPayTotal = document.getElementById($(showTr).find(".child3").attr("id"));
           // console.log(paymentTotal.id);
           // console.log(deductionTotal.id);
           // console.log(actualPayTotal.id);
        paymentTotal.value= totalPayment.toLocaleString('ko-KR');
        deductionTotal.value= totalDeduction.toLocaleString('ko-KR');
        actualPayTotal.value= actualPayment.toLocaleString('ko-KR');
        obj={"id":clickId, "total":actualPayment.toLocaleString('ko-KR'), "numId": memberNo.value, "baseSalary": strBaseSalary, "nationalPension": strNationalPension,
            "healthInsurance": strHealthInsurance, "employmentInsurance": strEmploymentInsurance, "longTermCareInsurance": strLongTermCareInsurance,
            "incomeTax": strIncomeTax, "localIncomeTax": strLocalIncomeTax, "positionAllowance": strPositionAllowance,
            "strHolidayAllowance": strHolidayAllowance, "strVacationPay": strVacationPay, "strMealAllowance": strMealAllowance, "strBonus": strBonus,
            "etcPay1": etcPay1, "etcPay2": etcPay2, "etcDeduction1": etcDeduction1, "etcDeduction2": etcDeduction2, "totalExtraPay":totalExtraPay.toLocaleString('ko-KR'), "totalDeduction":totalDeduction.toLocaleString('ko-KR')};

        const confirmSalary = document.getElementById("confirmSalary");
        confirmSalary.addEventListener("click", sendData, true);
    });
    function sendData(){
        // console.log("클릭아이디: "+clickId.id);
        const memberNo= document.getElementById($('#'+clickId).find(".showMember").attr("id"));
        const child1= document.getElementById($('#'+clickId).find(".child1").attr("id"));
        const child2= document.getElementById($('#'+clickId).find(".child2").attr("id"));
        const child3= document.getElementById($('#'+clickId).find(".child3").attr("id"));
        // console.log("사번 값: "+child1.value);
        let findId = arr.findIndex((element) => element.id == clickId);
        if(findId==-1){
            // console.log("등록아이디: "+child1.id);
            // console.log("등록 값: "+child1.value);
            // obj={"id":clickId, "total":actualPayment};
            obj.id=clickId;
            obj.total=actualPayment;
            arr.push(obj);
            console.log(arr);
        };
        actPayTotal = 0;
        for(let i=0; i<arr.length;i++){
            actPayTotal += arr[i].total;
            console.log("등록된 arrId: "+arr[i].id);
        }
        document.getElementById("payMemberTotal").value = arr.length;
        document.getElementById("actPayTotal").value = actPayTotal.toLocaleString('ko-KR');
        console.log("지불총액: "+actPayTotal.toLocaleString('ko-KR')+" 원");

        // if ($(child1).css("display", "none")){
        //     $('#'+clickId).css("backgroundColor", "lightgray");
            document.getElementById(clickId).setAttribute("class", "confirmParents");
            $(child1).css("display", "block");
            $(child2).css("display", "block");
            $(child3).css("display", "block");
            $('#actPayTotal').css("display", "block");
            $('#payMemberTotal').css("display", "block");
        // }
        const cancel = document.getElementById("confirmCancel");
        const pay = document.getElementById("paySalaries");
        cancel.addEventListener("click", sendCancel);
        pay.addEventListener("click", paySalaries);

    }
    function sendCancel() {
        // console.log("클릭아이디: "+clickId.id);
        const memberNo= document.getElementById($('#'+clickId).find(".showMember").attr("id"));
        const child1= document.getElementById($('#'+clickId).find(".child1").attr("id"));
        const child2= document.getElementById($('#'+clickId).find(".child2").attr("id"));
        const child3= document.getElementById($('#'+clickId).find(".child3").attr("id"));
        let findId = arr.findIndex((element) => element.id == clickId);
        console.log("삭제할 id: "+arr[findId].id);
        actPayTotal -= arr[findId].total;
        arr.splice(findId, 1);
        for(let i=0; i<arr.length;i++){
            console.log("삭제후 등록된 arrId: "+arr[i].id);
            console.log("삭제후 총 지불금액: "+actPayTotal);
        }

        if ($(child2).css("display", "block")) {
            $('#'+clickId).css("backgroundColor", "transparent");
            $(child1).css("display", "none");
            $(child2).css("display", "none");
            $(child3).css("display", "none");
        }
        saveForm.reset();
        document.getElementById("payMemberTotal").value = arr.length;
        document.getElementById("actPayTotal").value = actPayTotal.toLocaleString('ko-KR');
    }
    function paySalaries(){
        // console.log(actPayTotal);
        const memberCount = ${memberList.size()};
        if(arr.length==memberCount){
            if(confirm("총 "+arr.length+" 명, "+"총액 "+actPayTotal.toLocaleString('ko-KR')+" 원을 지출하시겠습니까?")){
                console.log(actPayTotal.toLocaleString('ko-KR')+" 원 지출 성공");
                console.log(arr);

                $.ajax({
                    type: "post",
                    url: "/salary/save",
                    data: {"paramList": JSON.stringify(arr)},
                    success: function (result){
                        alert("전송성공");
                        savedArr = arr;
                        for(let i=0; i<savedArr.length; i++) {
                            $('#'+savedArr[i].id).css("color", "darkgray");
                        }
                        arr = new Array();
                        obj = new Object();
                        saveForm.reset();
                        saveForm2.reset();
                        console.log(arr);
                        console.log(arr.length);
                        console.log(actPayTotal);
                        $(".parents").off('click').click();
                        location.reload();
                    },
                    error: function (){
                        alert("전송실패");
                    }
                });
            } else {
                console.log("지출 취소");
            }
        } else {
            alert("급여확정이 되지않은 인원이 있습니다. 전체 확정후 진행해주세요");
        }
    };
</script>
</html>
