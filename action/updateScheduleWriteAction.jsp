<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<!-- connector파일을 찾아오는 라이브러리 -->
<%@ page import="java.sql.DriverManager"%>

<!-- 데이터베이스에 연결하는 라이브러리 -->
<%@ page import="java.sql.Connection"%>

<!-- sql문을 만들어주는 라이브러리 -->
<%@ page import="java.sql.PreparedStatement"%>

<!-- 데이터베이스에서 온값을 저장하는 라이브러리 -->
<%@ page import="java.sql.ResultSet"%>

<!-- 어레이리스트 라이브러리 -->
<%@ page import="java.util.ArrayList"%>

<%  
    //전페이지에서 받아온 한글을 깨지지 않게 해줌
    request.setCharacterEncoding("utf-8");
    //전페이지 값저장
    String sessionIdValue=(String)session.getAttribute("idSession");
    String updateScheduleDateValue = request.getParameter("updateScheduleDateValue");
    String updateScheduleTimeValue = request.getParameter("updateScheduleTimeValue");
    String updateContentValue = request.getParameter("updateContentValue");
    
    //데이터베이스 연결
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect=DriverManager.getConnection("jdbc:mysql://localhost:3306/web","start","1234");
    //sql문 준비
    String sql ="UPDATE schedule SET schedule_date=?, schedule_time=?, schedule_content=? WHERE id=?;";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, updateScheduleDateValue);
    query.setString(2, updateScheduleTimeValue);
    query.setString(3, updateContentValue);
    query.setString(4, sessionIdValue);
    //sql문 전송
    query.executeUpdate();
    
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>updateScheduleWriteAction</title>
</head>
<body>

    <script>
        location.href="../html/mainPage.jsp"
    </script>
    
</body>