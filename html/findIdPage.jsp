<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="../css/findIdPage.css">
</head>


<body>
    <main>
        <h1 id="title">FIND ID</h1>

        <form action="../action/findIdAction.jsp" id="findIdForm" onsubmit="return find_id_check()">
            <input type="text" id="nameInsert" name="nameValue" class="insert" placeholder="NAME">
            <input type="text" id="contactInsert" name="contactValue" class="insert" placeholder="H.P">
            <section id="btnSection">
                <input type="button" id="backLoginFormBtn" class="backBtn" value="<Login" onclick="go_login()">
                <input type="submit" id="findIdBtn" class="formBtn" value="FIND ID">
            </section>
        </form>
    </main>

    <script src="../js/findIdPage.js" ></script>
</body>
</html>