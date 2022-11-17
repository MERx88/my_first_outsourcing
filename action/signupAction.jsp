<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<!-- connector파일을 찾아오는 라이브러리 -->
<%@ page import="java.sql.DriverManager"%>

<!-- 데이터베이스에 연결하는 라이브러리 -->
<%@ page import="java.sql.Connection"%>

<!-- sql문을 만들어주는 라이브러리 -->
<%@ page import="java.sql.PreparedStatement"%>

<%  
    //전페이지에서 받아온 한글을 깨지지 않게 해줌
    request.setCharacterEncoding("utf-8");

    //전페이지 값저장
    String idValue = request.getParameter("idValue");
    String pwValue = request.getParameter("pwValue");
    String nameValue = request.getParameter("nameValue");
    String contactValue = request.getParameter("contactValue");
    String departmentValue = request.getParameter("departmentValue");

    //데이터베이스 연결
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect=DriverManager.getConnection("jdbc:mysql://localhost:3306/web","start","1234");

    //sql문 준비
    String sql ="INSERT INTO member(id, password, name, contact, department, date) VALUES(?,?,?,?,?,now());";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, idValue);
    query.setString(2, pwValue);
    query.setString(3, nameValue);
    query.setString(4, contactValue);
    query.setString(5, departmentValue);
    
    //sql문 전송
    query.executeUpdate();
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>signupAction</title>
</head>
<body>

    <script>
        alert("회원가입이 완료되었습니다")
        location.href="../html/loginPage.jsp "
    </script>
    
</body>