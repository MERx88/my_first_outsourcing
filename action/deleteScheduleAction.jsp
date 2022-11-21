<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<!-- connector파일을 찾아오는 라이브러리 -->
<%@ page import="java.sql.DriverManager"%>

<!-- 데이터베이스에 연결하는 라이브러리 -->
<%@ page import="java.sql.Connection"%>

<!-- sql문을 만들어주는 라이브러리 -->
<%@ page import="java.sql.PreparedStatement"%>

<%@ page import="java.sql.ResultSet"%>

<%  
    request.setCharacterEncoding("utf-8");
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect=DriverManager.getConnection("jdbc:mysql://localhost:3306/web","start","1234");

    int scheduleValue= Integer.parseInt(request.getParameter("scheduleValueHidden"));
    
    String sql ="DELETE FROM schedule WHERE schedule_id=?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setInt(1, scheduleValue);
    query.executeUpdate();
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>deleteScheduleAction</title>
</head>
<body>

    <script>
        this.close()
    </script>
    
</body>