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

        <form action="../action/findPasswordAction.jsp" id="findPasswordForm" onsubmit="return find_password_check()">
            <input type="text" id="idInsert" name="idValue" class="insert" placeholder="ID" maxlength="20">
            <input type="text" id="nameInsert" name="nameValue" class="insert" placeholder="NAME" maxlength="20">
            <input type="text" id="contactInsert" name="contactValue" class="insert" placeholder="H.P" maxlength="20">
            <section id="btnSection">
                <input type="button" id="backLoginFormBtn" class="backBtn" value="<Login" onclick="go_login()">
                <input type="submit" id="findPasswordBtn" class="formBtn" value="FIND P.W">
            </section>
        </form>
    </main>
    <script src="../js/findPasswordPage.js" > </script>
</body>
</html>