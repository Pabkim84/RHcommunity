<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-02
  Time: 오후 2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>마이페이지</title>
    <script src="/resources/js/jquery.js"></script>
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
            width: 96%;
            height: 85%;
            font-size: 13px;
            position: absolute;
            left: 2%;
            top: 57px;
            color: dimgray;
            text-align: left;
            background-color: whitesmoke;
            border-spacing: 1px;
        }
        .table1 th {
            width: 255px;
            height: 7.7%;
            text-indent: 50px;
            font-weight: 700;
            background-color: lightgrey;
            color: rgb(40,40,40);
            position: relative;
        }
        .table1 td {
            border: 4px solid lightgrey;
            box-shadow: 1px 1px 2px 2px darkgrey inset;
            width: 284px;
            height: 40px;
            color: black;
            text-indent: 15px;
            padding: 0;
            border-inline-color: darkgray;
            position: relative;

        }
        .table1 th:hover {
            background-color: lightgrey;
            font-weight: 700;
        }
        .table1 td:hover {
            background-color: lightgrey;
            font-weight: 700;
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

        .btn-UD {
            position: absolute;
            top: 95%;
            right: 3%;
        }
        .inputData {
            position: absolute;
            border: 0;
            padding-left: 5px;
            margin: 0;
            width: 100%;
            height: 100%;
            top: 0px;
            left: 0px;
            background: transparent;
            outline: none;
        }
        .table1 img {
            width: 100%;
            position: absolute;
            left: 0;
            top: 0;
        }

    </style>
</head>
<body>
<jsp:include page="../layout/signupHeader.jsp" flush="false"></jsp:include>
    <div class="main-container">
        <div class="subTitle" id="msg"></div>
        <form action="/member/save" method="post" enctype="multipart/form-data">
            <table class="table1">
                <thead>
                <tr>
                    <th colspan="2" rowspan="5" id="preview" style="text-indent: unset; text-align: center">
                        <label for="profile"><img src="/img.png" alt="">프로필 사진등록</label>
                        <input type="file" name="memberProfile" class="company" id="profile" value="사진첨부" hidden>
                    </th>
                    <th scope="col">사원아이디</th>
                    <td><input type="text" class="inputData" name="memberId" id="memberId" minlength="4" placeholder="직접입력" autocomplete='off'></td>
                    <th scope="col">비밀번호</th>
                    <td><input type="password" class="inputData" name="memberPassword" id="memberPassword" placeholder="직접입력"></td>
                    <th scope="col">비밀번호 재확인</th>
                    <td><input type="password" class="inputData" id="confirmPassword" placeholder="직접입력"></td>
                </tr>
                <tr>
                    <th scope="col">소속번호</th>
                    <td><input type="text" name="groupNo" id="groupNo" class="inputData" style="background: grey" readonly></td>
                    <th scope="col">소속본부</th>
                    <td>
                        <select class="inputData" name="memberGroup" id="memberGroup" onchange="select1()">
                            <option value="">본부선택</option>
                            <option value="경기본부">경기본부</option>
                            <option value="충청본부">충청본부</option>
                            <option value="강원본부">강원본부</option>
                            <option value="전라본부">전라본부</option>
                            <option value="경상본부">경상본부</option>
                            <option value="제주본부">제주본부</option>
                        </select>
                    </td>
                    <th scope="col">사원명</th>
                    <td><input type="text" class="inputData" name="memberName" id="memberName" placeholder="직접입력" autocomplete='off'></td>
                </tr>
                <tr>
                    <th scope="col">부서번호</th>
                    <td><input type="text" name="deptNo" id="deptNo" class="inputData" style="background: grey" readonly></td>
                    <th scope="col">부서명</th>
                    <td>
                        <select class="inputData" name="memberDept" id="memberDept" onchange="select2()">
                            <option class="option" value="">부서선택</option>
                            <option class="option" value="임원">임원</option>
                            <option class="option" value="경영지원팀">경영지원팀</option>
                            <option class="option" value="비서팀">비서팀</option>
                            <option class="option" value="회계팀">회계팀</option>
                            <option class="option" value="인사팀">인사팀</option>
                            <option class="option" value="영업부">영업부</option>
                            <option class="option" value="전산팀">전산팀</option>
                            <option class="option" value="디자인팀">디자인팀</option>
                            <option class="option" value="생산팀">생산팀</option>
                        </select>
                    </td>
                    <th scope="col">입사일</th>
                    <td colspan="3" id="joinDate" style="background: grey"></td>
                </tr>
                <tr>
                    <th>소속팀</th>
                    <td>
                        <select class="inputData" name="memberTeam" id="memberTeam">
                            <option class="option" value="">팀선택</option>
                            <option class="option" value="본사1팀">본사1팀</option>
                            <option class="option" value="본사2팀">본사2팀</option>
                            <option class="option" value="본사3팀">본사3팀</option>
                            <option class="option" value="지사1팀">지사1팀</option>
                            <option class="option" value="지사2팀">지사2팀</option>
                            <option class="option" value="해외1팀">해외1팀</option>
                            <option class="option" value="해외2팀">해외2팀</option>
                        </select>
                    </td>
                    <th>직무</th>
                    <td>
                        <select class="inputData" name="memberDuty" id="memberDuty">
                            <option class="option" value="">직무선택</option>
                            <option class="option" value="경영관리직">경영관리직</option>
                            <option class="option" value="총무기획직">총무기획직</option>
                            <option class="option" value="국내영업직">국내영업직</option>
                            <option class="option" value="해외영업직">해외영업직</option>
                            <option class="option" value="영업관리직">영업관리직</option>
                            <option class="option" value="일반사무직">일반사무직</option>
                            <option class="option" value="업무지원직">업무지원직</option>
                            <option class="option" value="기타계약직">기타계약직</option>
                        </select>
                    </td>
                    <th>직위</th>
                    <td>
                        <select class="inputData" name="memberPosition">
                            <option value="">직위선택</option>
                            <option value="임원">임원</option>
                            <option value="부장">부장</option>
                            <option value="차장">차장</option>
                            <option value="과장">과장</option>
                            <option value="대리">대리</option>
                            <option value="주임">주임</option>
                            <option value="사원">사원</option>
                            <option value="인턴">인턴</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>연봉</th>
                    <td style="text-align: right"><input type="text" class="inputData" name="salary" id="salary" placeholder="직접입력" autocomplete='off'>원</td>
                    <th>스톡옵션</th>
                    <td>
                        <select class="inputData" name="stockOption">
                            <option value="">유무선택</option>
                            <option value="유">유</option>
                            <option value="무">무</option>
                        </select>
                    </td>
                    <th>기타옵션</th>
                    <td><input type="text" class="inputData" name="contractOption" id="contractOption" placeholder="직접입력" autocomplete='off'></td>
                </tr>
                <tr>
                    <th scope="col">주민등록번호</th>
                    <td colspan="3"><input type="text" class="inputData" name="memberIdNum" id="memberIdNum" onkeyup="idNumFormat(this)" maxlength="8" placeholder="직접입력" autocomplete='off'></td>
                    <th scope="col">생년월일</th>
                    <td><input type="text" class="inputData" name="memberBirthDay" id="memberBirthDay" onkeyup="dateFormat(this)" maxlength="10" placeholder="직접입력" autocomplete='off'></td>
                    <th scope="col">성별</th>
                    <td>
                        <select class="inputData" name="gender">
                            <option value="">성별선택</option>
                            <option value="남">남</option>
                            <option value="여">여</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th scope="col">건강상태</th>
                    <td colspan="3">
                        <select class="inputData" name="health">
                            <option value="">상태선택</option>
                            <option value="매우양호">매우양호</option>
                            <option value="보통">보통</option>
                            <option value="기저질환">기저질환</option>
                        </select>
                    </td>
                    <th scope="col">혼인유무</th>
                    <td>
                        <select class="inputData" name="maritalStatus">
                            <option value="">혼인상태</option>
                            <option value="미혼">미혼</option>
                            <option value="기혼">기혼</option>
                            <option value="기타">기타</option>
                        </select>
                    </td>
                    <th scope="col">이메일</th>
                    <td colspan="2"><input type="email" class="inputData" name="memberEmail" id="memberEmail" placeholder="직접입력" autocomplete='off'></td>
                </tr>
                <tr>
                    <th scope="col">장애여부</th>
                    <td colspan="3">
                        <select class="inputData" name="impairment">
                            <option value="없음">없음</option>
                            <option value="있음">있음</option>
                        </select>
                    </td>
                    <th scope="col">장애등급</th>
                    <td>
                        <select class="inputData" name="levImpairment">
                            <option value="">등급선택</option>
                            <option value="1급">1급</option>
                            <option value="2급">2급</option>
                            <option value="3급">3급</option>
                            <option value="4급">4급</option>
                            <option value="5급">5급</option>
                            <option value="6급">6급</option>
                            <option value="7급">7급</option>
                        </select>
                    </td>
                    <th scope="col">연락처</th>
                    <td colspan="2"><input type="text" class="inputData" name="memberMobile" id="memberMobile" onkeyup="mobileFormat(this)" maxlength="13" placeholder="직접입력" autocomplete='off'></td>
                </tr>
                <tr>
                    <th scope="col">거주지 주소</th>
                    <td colspan="7"><input type="text" class="inputData" name="memberAddress" id="memberAddress" placeholder="직접입력" autocomplete='off'></td>
                </tr>
                <tr>
                    <th scope="col">취미</th>
                    <td colspan="3"><input type="text" class="inputData" name="hobby" id="hobby" placeholder="직접입력" autocomplete='off'></td>
                    <th scope="col">특기</th>
                    <td><input type="text" class="inputData" name="specialty" id="specialty" placeholder="직접입력" autocomplete='off'></td>
                    <th scope="col">종교</th>
                    <td><input type="text" class="inputData" name="religion" id="religion" placeholder="직접입력" autocomplete='off'></td>
                </tr>
                <tr>
                    <th scope="col">경력사항1</th>
                    <td colspan="4"><input type="text" class="inputData" name="career1" id="career1" placeholder="직접입력" autocomplete='off'></td>
                    <th scope="col">최종학력</th>
                    <td colspan="2">
                        <select class="inputData" name="education1">
                            <option value="">학력선택</option>
                            <option value="고졸이하">고졸이하</option>
                            <option value="고등학교 졸업">고등학교 졸업</option>
                            <option value="전문대 졸업">전문대 졸업</option>
                            <option value="4년제대 졸업">4년제대 졸업</option>
                            <option value="석사학위">석사학위</option>
                            <option value="박사학위">박사학위</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th scope="col">경력사항2</th>
                    <td colspan="4"><input type="text" class="inputData" name="career2" id="career2" placeholder="직접입력" autocomplete='off'></td>
                    <th scope="col">기타학력</th>
                    <td colspan="2"><input type="text" class="inputData" name="education2" id="education2" placeholder="직접입력" autocomplete='off'></td>
                </tr>
                <tr>
                    <th scope="col">경력사항3</th>
                    <td colspan="4"><input type="text" class="inputData" name="career3" id="career3" placeholder="직접입력" autocomplete='off'></td>
                    <th scope="col">자격증</th>
                    <td colspan="2"><input type="text" class="inputData" name="license" id="license" placeholder="직접입력" autocomplete='off'></td>
                </tr>

                </thead>
            </table>
            <div class="btn-UD">
                <input class="btn btn-secondary" id="saveMember" type="submit" value="사원등록">
            </div>
        </form>
    </div>
<jsp:include page="../layout/footer.jsp" flush="false"></jsp:include>

</body>
<script>
    window.onload=function () {
        const date = new Date();
        const year = date.getFullYear();
        const month = date.getMonth()+1;
        const day = date.getDate();
        const today = year+"년 "+month+"월 "+day+"일";
        document.getElementById("joinDate").innerText=today;
    }
    const select1 = () => {
        const memberGroup = document.getElementById("memberGroup").value;
        if (memberGroup=="경기본부") {
            document.getElementById("groupNo").value = "01";
        } else if (memberGroup=="충청본부") {
            document.getElementById("groupNo").value = "02";
        } else if (memberGroup=="강원본부") {
            document.getElementById("groupNo").value = "03";
        } else if (memberGroup=="전라본부") {
            document.getElementById("groupNo").value = "04";
        } else if (memberGroup=="경상본부") {
            document.getElementById("groupNo").value = "05";
        } else if (memberGroup=="제주본부") {
            document.getElementById("groupNo").value = "06";
        }
    }
    const select2 = () => {
        const memberDept = document.getElementById("memberDept").value;
        if (memberDept=="임원") {
            document.getElementById("deptNo").value = "00";
        } else if (memberDept=="경영지원팀") {
            document.getElementById("deptNo").value = "01";
        } else if (memberDept=="비서팀") {
            document.getElementById("deptNo").value = "02";
        } else if (memberDept=="회계팀") {
            document.getElementById("deptNo").value = "03";
        } else if (memberDept=="인사팀") {
            document.getElementById("deptNo").value = "04";
        } else if (memberDept=="영업부") {
            document.getElementById("deptNo").value = "05";
        } else if (memberDept=="전산팀") {
            document.getElementById("deptNo").value = "06";
        } else if (memberDept=="디자인팀") {
            document.getElementById("deptNo").value = "07";
        } else if (memberDept=="생산팀") {
            document.getElementById("deptNo").value = "08";
        }
    }

    const dateFormat = (id) => {
      const date = id.value;
      if(date.length==4) {
          id.value += "-";
      } else if(date.length==7) {
          id.value += "-";
      }
    }
    const idNumFormat = (id) => {
        const idNum = id.value;
        if(idNum.length==6) {
            id.value += "-";
        }
    }
    const mobileFormat = (id) => {
        const mobile = id.value;
        if(mobile.length==3) {
            id.value += "-";
        } else if (mobile.length==8) {
            id.value += "-";
        }
    }
    $('.inputData').keydown(function(event) {
        if ( event.keyCode == 8 || event.which == 8 ) {
            const id = $(this).attr("id");
            document.getElementById(id).value = "";
        }
    });
    $('#profile').on('change', function() {
        ext = $(this).val().split('.').pop().toLowerCase(); //확장자
        //배열에 추출한 확장자가 존재하는지 체크
        if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
            resetFormElement($(this)); //폼 초기화
            window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
        } else {
            file = $('#profile').prop("files")[0];
            blobURL = window.URL.createObjectURL(file);
            $('#preview img').attr('src', blobURL);
            $('#preview').slideDown(); //업로드한 이미지 미리보기
            $(this).slideUp(); //파일 양식 감춤
        }
    });
    $('#confirmPassword').on('blur', function (){
        const memberPassword = document.getElementById("memberPassword").value;
        const confirmPassword = document.getElementById("confirmPassword").value;
        if(memberPassword==confirmPassword) {
            document.getElementById("msg").innerText="* 비밀번호가 일치합니다.";
            document.getElementById("msg").style.color="green";
        } else {
            document.getElementById("msg").innerText="* 비밀번호가 일치하지 않습니다";
            document.getElementById("msg").style.color="red";
        }

    });
    $('#memberId').on('keyup', function (){
        const memberId = document.getElementById("memberId").value;
        if(memberId.length>3){
            $.ajax({
                type: "get",
                url: "/member/findByMemberId",
                data: {"memberId": memberId},
                success: function (result) {
                    if(result){
                        document.getElementById("msg").innerText="* 사용가능한 아이디입니다.";
                        document.getElementById("msg").style.color="green";
                    } else {
                        document.getElementById("msg").innerText="* 이미 사용중인 아이디입니다.";
                        document.getElementById("msg").style.color="red";
                    }
                },
                error: function (){
                    alert("전송실패");
                }
            });
        }
    });
</script>
</html>
