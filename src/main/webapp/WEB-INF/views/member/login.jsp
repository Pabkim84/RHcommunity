<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-07
  Time: 오전 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<!doctype html>
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
            background-color: rgb(77,84,102) !important;
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
    <form action="/member/login" method="post" class="form-custom">
        <h1 class="h3 mb-3 fw-normal mt-5" style="color: whitesmoke">Login</h1>

        <div class="form-floating">
            <input type="text" class="form-control" id="memberId" name="memberId">
            <label for="memberId">아이디</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" id="memberPassword" name="memberPassword">
            <label for="memberPassword">비밀번호</label>
        </div>

        <div class="checkbox mb-3">
            <label style="color: whitesmoke">
                <input type="checkbox" value="remember-me"> 아이디기억
            </label>
        </div>
        <input type="submit" class="btn btn-secondary btn-lg" style="width: 130px"  value="Login">
        <input type="button" class="btn btn-secondary btn-lg" style="width: 130px"  onclick="signUp()" value="SignUp">
        <p class="mt-5 mb-3" style="color: whitesmoke">&copy; 2017–2022</p>
    </form>
</main>
</body>
<script>
const signUp = () => {
  location.href="/member/signUp";
}
</script>
</html>

