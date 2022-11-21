<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>deleteSchedulePage</title>
    <link rel="stylesheet" type="text/css" href="../css/deleteSchedulePage.css">
</head>
<body>
     <form action="../action/deleteScheduleAction.jsp"  id="postForm">
        <span id="checkText">
            정말 삭제 하시겠습니까?
        </span>
        <input type="hidden" id="scheduleValueId" name="scheduleValueHidden" >
        <section id="btnSection">
            <input type="submit" value="확인" id="submitBtn" class="btn" onclick="delete_btn()">
            <button id="cancelBtn"  class="btn" onclick="cancel_btn()">
                취소
            </button>
        </section>   
    </form>

    <script>
        var scheduleValue=localStorage.getItem('scheduleValue')
        scheduleId=document.getElementById("scheduleValueId")
        scheduleId.setAttribute('value',scheduleValue)

        function delete_btn(){
            window.opener.parent.location.reload()
            
        }

        function cancel_btn(){
            window.close()
        }

    </script>
</body>

