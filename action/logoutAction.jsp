<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<!-- connector파일을 찾아오는 라이브러리 -->
<%@ page import="java.sql.DriverManager"%>

<!-- 데이터베이스에 연결하는 라이브러리 -->
<%@ page import="java.sql.Connection"%>

<!-- sql문을 만들어주는 라이브러리 -->
<%@ page import="java.sql.PreparedStatement"%>

<%  
    session.invalidate();
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>logoutAction</title>
</head>
<body>

    <script>
        alert("로그아웃");
	    location.href="../html/loginPage.jsp";
    </script>
    
</body>