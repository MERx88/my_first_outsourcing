<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="../css/findPasswordPage.css">
</head>


<body>
    <main>
        <h1 id="title">FIND P.W</h1>

        <form action="" id="findPasswordForm" onsubmit="return findPasswordCheck()">
            <input type="text" id="idInsert" name="idValue" class="insert" placeholder="ID">
            <input type="text" id="nameInsert" name="nameValue" class="insert" placeholder="NAME">
            <input type="text" id="contactInsert" name="contactValue" class="insert" placeholder="H.P">
            <section id="btnSection">
                <input type="button" id="backLoginFormBtn" class="backBtn" value="<Login" onclick="goLogin()">
                <input type="submit" id="findPasswordBtn" class="formBtn" value="FIND P.W">
            </section>
        </form>
    </main>
    <script src="../js/findPasswordPage.js" > </script>
</body>
</html>