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

    String nameValue = quotes+request.getParameter("nameValue")+quotes;
    String contactValue = quotes+request.getParameter("contactValue")+quotes;

    //데이터베이스 연결
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect=DriverManager.getConnection("jdbc:mysql://localhost:3306/web","start","1234");
    //sql문 준비
    String sql ="SELECT * FROM member;";
    PreparedStatement query = connect.prepareStatement(sql);
    //sql문 전송
    ResultSet result = query.executeQuery();

   
    ArrayList<ArrayList<String>> memberList = new ArrayList<ArrayList<String>>();
    while(result.next()){
        ArrayList<String> member = new ArrayList();
            member.add(quotes+result.getString(1)+quotes);
            member.add(quotes+result.getString(2)+quotes);
            member.add(quotes+result.getString(3)+quotes);
            member.add(quotes+result.getString(4)+quotes);
            member.add(quotes+result.getString(5)+quotes);
            member.add(quotes+result.getString(6)+quotes);
            member.add(quotes+result.getString(7)+quotes);
            memberList.add(member);
    }
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>idCheckAction</title>
</head>

<body>
    <script type="text/javascript">
        var nameValue=<%=nameValue%>;
        var contactValue=<%=contactValue%>;
        var memberListSize=<%=memberList.size()%>;
        var memberList = <%=memberList%>;
        var j

        for(var i=0; i<memberListSize; i++){
            if(nameValue==memberList[i][3] && contactValue==memberList[i][4]){
                alert(memberList[i][3]+"님의 아이디는 "+memberList[i][1]+"입니다")
                j=1
                location.href="../html/loginPage.jsp"
            }
        }

        if(j==null){
                alert("아이디를 찾을 수 없습니다")
                history.back()
        }

    </script>
</body>
