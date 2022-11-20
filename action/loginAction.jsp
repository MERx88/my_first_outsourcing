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
    request.setCharacterEncoding("utf-8");
    char quotes = '"';

    String idValue = request.getParameter("idValue");
    String pwValue = request.getParameter("pwValue");
    int i=0;
   
    //데이터베이스 연결
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect=DriverManager.getConnection("jdbc:mysql://localhost:3306/web","start","1234");

    String sql ="SELECT * FROM member WHERE id=? && password=?;";
    
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, idValue);
    query.setString(2, pwValue);

    ResultSet result = query.executeQuery();

    if(result.next()){
        i=1;
        session.setAttribute("idSession", idValue); 
		response.sendRedirect("../html/mainPage.jsp"); 
    }else{
        i=0;
    }

%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>loginAction</title>
</head>

<body>
    <script>
        var i= <%=i%>;
    
        if(i==0){
            alert("로그인 정보를 다시 확인해주세요")
            location.href="../html/loginPage.jsp "
        }
        else{
            location.href="../html/mainPage.jsp "
        }

    </script>
</body>
