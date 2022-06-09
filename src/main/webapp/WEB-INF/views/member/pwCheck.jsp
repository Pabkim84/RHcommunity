<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-07
  Time: 오전 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Signin Template · Bootstrap v5.1</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">



    <!-- Bootstrap core CSS -->
    <link href="../../../resources/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
        .form-custom{
            border: 1px solid lightgray;
            border-radius: 5%;
            background-color: rgba(215,215,215,0.5) !important;
        }
        .form-floating {
            margin: 20px;
        }

    </style>


    <!-- Custom styles for this template -->
    <link href="../../../resources/css/signin.css" rel="stylesheet">
</head>
<body class="text-center">

<main class="form-signin">
    <form action="/member/pwCheck" name="pwCheck1" method="post" class="form-custom"  >
        <h1 class="h3 mb-3 fw-normal mt-5">비밀번호 확인</h1>
        <div class="form-floating">
            <input type="hidden" name="id" value="${memberDTO.id}">
            <input type="password" class="form-control" id="loginPassword" placeholder="Password">
            <label for="loginPassword">비밀번호</label>
        </div>
        <input type="button" onclick="pwCheck(${memberDTO.memberPassword})" class="btn btn-secondary btn-lg" style="width: 260px"  value="비밀번호 확인">
        <p class="mt-5 mb-3 text-muted"></p>
    </form>
</main>
</body>
<script>
    const pwCheck = (pw1) => {
        const pw2 = document.getElementById("loginPassword").value;
        if(pw1==pw2){
            alert("비밀번호가 일치합니다.");
            pwCheck1.submit();
        } else {
            alert("비밀번호가 일치하지 않습니다.");
        }

    }
</script>
</html>

