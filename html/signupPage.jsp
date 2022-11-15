<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../css/signupPage.css">
</head>

<body>
    <main>
        <h1 id="title">SIGN UP</h1>
        <form action="" onsubmit="return signupCheck()" id="signupForm">
            <section id="idSection">
                <input type="text" id="idInsert" name="idValue" placeholder="ID">
                <input type="button" id="idCheckBtn" onclick="idCheck()" value="아이디중복">
                <input type="hidden" id="idCheckHidden" name="idCheckHiddenValue" value="0">
            </section>
            
            <input type="password" id="pwInsert" name="pwValue" class="insert" placeholder="PASSWORD">
            <input type="password" id="pwCheckInsert" name="pwCheckValue" class="insert" placeholder="PASSWORD CHECK">

            <input type="text" id="nameInsert" name="nameValue" class="insert" placeholder="NAME">
            <input type="text" id="contactInsert" name="contactValue" class="insert" placeholder="H.P">

            <select id="departmentInsert" name="departmentValue">
                <option disabled selected>DEPARTMENT</option>
                <option value="frontEndValue">FrontEnd</option>
                <option value="backEndValue">BackEnd</option>
            </select>

            <input type="submit" id="signupBtn" class="formBtn" value="SIGNUP">
        </form>
    </main>

    <script src="../js/signupPage.js" > </script>
</body>
</html>