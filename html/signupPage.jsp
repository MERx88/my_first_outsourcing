<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>signupPage</title>
    <link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../css/signupPage.css">
</head>

<body>
    <main>
        <h1 id="title">SIGN UP</h1>
        <form action="../action/signupAction.jsp" onsubmit="return signup_check()" id="signupForm">
            <section id="idSection">
                <input type="text" id="idInsert" name="idValue" placeholder="ID">
                <input type="button" id="idCheckBtn" onclick="id_check()" value="아이디중복">
                <input type="hidden" id="idCheckHidden" name="idCheckHiddenValue" value="0">
            </section>
            
            <section id="pwSection" class="passwordSection">
                <input type="password" id="pwInsert" name="pwValue" class="passwordInsert" placeholder="PASSWORD">
                <i class="pwViewkBtn" onclick="pw_view_check(0)"><img src="../image/view.png" class="viewImg"></i>
            </section>
            
            <section id="pwCheckSection" class="passwordSection">
                <input type="password" id="pwCheckInsert" name="pwCheckValue" class="passwordInsert" placeholder="PASSWORD CHECK">
                <i class="pwViewkBtn" onclick="pw_view_check(1)"><img src="../image/view.png" class="viewImg"></i>
            </section>
            
            <input type="text" id="nameInsert" name="nameValue" class="insert" placeholder="NAME">
            <input type="text" id="contactInsert" name="contactValue" class="insert" placeholder="H.P">

            <select id="departmentInsert" name="departmentValue">
                <option disabled selected value="">DEPARTMENT</option>
                <option value="frontEndValue">FrontEnd</option>
                <option value="backEndValue">BackEnd</option>
            </select>

            <input type="submit" id="signupBtn" class="formBtn" value="SIGNUP">
        </form>
    </main>

    <script src="../js/signupPage.js" > </script>
</body>
</html>