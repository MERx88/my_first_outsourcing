<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="../css/loginPage.css">
</head>

<body>
    <main>
        <img src="../image/stageus_logo_white.png" id="stageusLogoImg">
        <h1 id="title">LOG IN</h1>
        <div id="loginContainer">
            <form action="" id="loginForm" onsubmit="return loginCheck()">
                <input type="text" id="idInsert" name="idValue" class="insert" placeholder="ID">
                <input type="password" id="pwInsert" name="pwValue" class="insert" placeholder="PASSWORD">
                <input type="submit" id="loginBtn" class="formBtn" value="LOGIN">
            </form>
            <section id="extraLinkContainer">
                <a href="findIdPage.jsp" id="findIdLink" class="extraLink">아이디 찾기</a>
                <a href="findPasswordPage.jsp" id="findPasswordLink" class="extraLink">비밀번호 찾기</a>
                <a href="signupPage.jsp" id="signupLink" class="extraLink">회원가입</a>
            </section>
        </div>
    </main>
    <script src="../js/loginPage.js"> </script>
</body>
</html>