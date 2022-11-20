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

    String sessionIdValue=quotes+(String)session.getAttribute("idSession")+quotes;

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
            memberList.add(member);
}

%>

<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mainPage</title>
    <link rel="stylesheet" type="text/css" href="../css/mainPage.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
</head>

<body>
    

    <section id="headMenuSection">
        <label for="sideMenu">
            <img src="../image/menu.png" id="menuBtnImg">
        </label>
        <div id="myIdSection">
            <p>#ID</p>
            <p id="idText" ></p>
        </div>
    </section>  
    
    <input id="sideMenu" type="checkbox">
    <section id="sidebarList">
        <button id="myScheduleBtn">My Schedule</button>
        <ul id="departmentList">DEPARTMENT -----------
        <li class="department">
            <p>
                Front End
            </p>
            <ul id="frontEndList">
            </ul>
        </li>
        <li class="department">
            <p>
                Back End
            </p>
            <ul id="backEndList">
            </ul>
        </li>
        </ul>
        <button id="logoutBtn" onclick="logout_btn()">LOGOUT</button>
    </section>

    <main>

        <!-- MONTH schedule -->

        <section id="monthScheduleSection">
            <h1 id="title">My Schedule</h1>
            <div id="monthSchedule">
                <h2 id="month"><!-- 동적생성 --></h2>
                <table id="monthScheduleList">
                    <!-- 동적생성 -->
                </table>
            </div>
            <div id="pageBtnSection">
                <button onclick="previous_page_btn()" class="pageBtn">
                    <img src="../image/left-arrow.png"  class="pageBtnImg">
                </button>
                <button onclick="next_page_btn()" class="pageBtn">
                    <img src="../image/right-arrow.png"  class="pageBtnImg">
                </button>
            </div>
        </section>

        <!-- DAY schedule -->
        
        <section id="dayScheduleSection">
            <div id="daySchedule">
                <h2 id="day">DAY 4</h2>
                <table id="dayScheduleList">
                     <!-- 예시입니다 -->
                    <tr id="dayScheduleRow">
                        <td id="dayScheduleDetail" class="dayScheduleText">
                            15:00 <br>
                            front end 개발
                        </td>
                        <td id="switchBtnSection">
                            <button id="updateBtn" class="switchBtn" onclick="update_form_btn()">
                                <img src="../image/update.png" class="switchBtnImg">
                            </button>
                            <button id="deleteBtn" class="switchBtn" onclick="delete_btn()">
                                <img src="../image/delete.png" class="switchBtnImg">
                            </button>
                        </td>
                    </tr>
                        <td>
                            <button id="newBtn" onclick="new_form_btn()">+</button>
                        </td>
                    </tr>
                     <!-- 예시입니다 -->
                </table>
            </div>
        </section>

        <!-- New Schedule< section -->

        <section id="newScheduleSection">

            <div id="newSchedule">
                <h2 id="new">New Schedule</h2>
                <form id="newScheduleForm" action="../action/newScheduleWriteAction.jsp" onsubmit="return new_schedule_write_check()">
                    <input type="date" id="newScheduleDateInsert" name="newScheduleDateValue" class="insert">
                    <input type="time" id="newScheduleTimeInsert" name="newScheduleTimeValue" class="insert">
                    <textarea id="newContentInsert" name="newContentValue" maxlength="2048"></textarea>
                    <input type="submit" value="SUBMIT" id="submitFormBtn" class="formBtn">
                </form>
            </div>
            <button onclick="new_back_btn()" class="backBtn">
                <img src="../image/left-arrow.png"  class="backBtnImg">
            </button>
        </section>

        <!-- New Schedule< section -->

        <section id="updateScheduleSection">

            <div id="updateSchedule">
                <h2 id="update">Update Schedule</h2>
                <form id="updateScheduleForm" action="../action/updateScheduleWriteAction.jsp" onsubmit="return update_schedule_write_check()">
                    <input type="date" id="updateScheduleDateInsert" name="updateScheduleDateValue" class="insert">
                    <input type="time" id="updateScheduleTimeInsert" name="updateScheduleTimeValue" class="insert">
                    <textarea id="updateContentInsert" name="updateContentValue" maxlength="2048"></textarea>
                    <input type="submit" value="UPDATE" id="updateFormBtn" class="formBtn">
                </form>
            </div>
            <button onclick="update_back_btn()" class="backBtn">
                <img src="../image/left-arrow.png"  class="backBtnImg">
            </button>
        </section>

    </main>
    




    <script>
    
    var sessionIdValue=<%=sessionIdValue%>;
    var memberListSize=<%=memberList.size()%>;
    var memberList = <%=memberList%>;
    
    //자신의 닉네임 상단에 띄우기
    var idText=document.getElementById("idText")
    idText.innerHTML=sessionIdValue

    //부서 클릭시 부서 해당멤버 보여주기
    for(var i = 0; i < memberListSize; i++){
        if("frontEndValue"==memberList[i][5]){
            if(sessionIdValue!=memberList[i][1]){
                var frontEndMember=document.createElement("li")
                frontEndMember.innerHTML=memberList[i][1]
                frontEndMember.setAttribute('onclick',"show_member_schedule()")
                document.getElementById("frontEndList").appendChild(frontEndMember)
            }
        }if("backEndValue"==memberList[i][5]){
            if(sessionIdValue!=memberList[i][1]){
            var backEndMember=document.createElement("li")
            backEndMember.innerHTML=memberList[i][1]
            backEndMember.setAttribute('onclick',"show_member_schedule()")
            document.getElementById("backEndList").appendChild(backEndMember)
            }
        }
    }

    //======Schedule part=====//

    // var idSession=<%=session.getAttribute("idSession")%>;
    // var idText=document.getElementById("idText")
    // idText.innerHTML=idSession

    var monthsText=["January","February","March","April","May","June","July","August","September","October","November","December"]
    var date = new Date()
    var daysNow = new Date(date.getFullYear(), date.getMonth() + 1, 0).getDate()

    var month=document.getElementById("month")
    month.innerHTML=monthsText[date.getMonth()]


    for (var idx = 1; idx <= daysNow; idx++) {

        var monthScheduleRow=document.createElement("tr")
        monthScheduleRow.id="monthScheduleRow"+(idx)
        monthScheduleRow.className="monthScheduleRowClass"
        monthScheduleRow.setAttribute('onclick',`show_day_schedule(`+idx+')')
        document.getElementById("monthScheduleList").appendChild(monthScheduleRow)

        var dayNum=document.createElement("td")
        dayNum.id="dayNumId"+(idx)
        dayNum.className="dayNum"
        dayNum.innerHTML=idx
        document.getElementById("monthScheduleRow"+(idx)).appendChild(dayNum)

        var dayDetail=document.createElement("td")
        dayDetail.id="dayDetailId"+(idx)
        dayDetail.className="dayDetail"
        document.getElementById("monthScheduleRow"+(idx)).appendChild(dayDetail)

        var scheduleDetail_1=document.createElement("div")
        scheduleDetail_1.id="scheduleDetailId_1"
        scheduleDetail_1.className="detail"
        scheduleDetail_1.innerHTML="15:00 front end 개발"
        document.getElementById("dayDetailId"+(idx)).appendChild(scheduleDetail_1)

        var scheduleDetail_2=document.createElement("div")
        scheduleDetail_2.id="scheduleDetailId_2"
        scheduleDetail_2.className="detail"
        scheduleDetail_2.innerHTML="17:00 back end 개발"
        document.getElementById("dayDetailId"+(idx)).appendChild(scheduleDetail_2)

    }

    var monthNow=date.getMonth()

    function previous_page_btn(){
        if(monthNow==0){
            monthNow=12
        }
        if(monthNow==-1){
            monthNow=11
        }
        monthNow--
        month.innerHTML=monthsText[monthNow]
        console.log(monthNow)

        var days = new Date(2022, monthNow+1, 0).getDate()

        for (var idx = 1; idx <= days; idx++) {

            var monthScheduleRow=document.createElement("tr")
            monthScheduleRow.id="monthScheduleRow"+(idx)
            monthScheduleRow.className="monthScheduleRowClass"
            monthScheduleRow.setAttribute('onclick',`show_day_schedule(`+idx+')')
            document.getElementById("monthScheduleList").appendChild(monthScheduleRow)
        
            var dayNum=document.createElement("td")
            dayNum.id="dayNumId"+(idx)
            dayNum.className="dayNum"
            dayNum.innerHTML=idx
            document.getElementById("monthScheduleRow"+(idx)).appendChild(dayNum)
        
            var dayDetail=document.createElement("td")
            dayDetail.id="dayDetailId"+(idx)
            dayDetail.className="dayDetail"
            document.getElementById("monthScheduleRow"+(idx)).appendChild(dayDetail)
        
            var scheduleDetail_1=document.createElement("div")
            scheduleDetail_1.id="scheduleDetailId_1"
            scheduleDetail_1.className="detail"
            scheduleDetail_1.innerHTML="15:00 front end 개발"
            document.getElementById("dayDetailId"+(idx)).appendChild(scheduleDetail_1)
        
            var scheduleDetail_2=document.createElement("div")
            scheduleDetail_2.id="scheduleDetailId_2"
            scheduleDetail_2.className="detail"
            scheduleDetail_2.innerHTML="17:00 back end 개발"
            document.getElementById("dayDetailId"+(idx)).appendChild(scheduleDetail_2)
        
        }

        if(monthNow<=0){
            monthNow=12
        }
    }
        

    function next_page_btn(){
        if(monthNow==11){
            monthNow=(-1)
        }
        if(monthNow==12){
            monthNow=(0)
        }
        monthNow++
        month.innerHTML=monthsText[monthNow]
        console.log(monthNow)

        var days = new Date(2022, monthNow+1, 0).getDate()

        for (var idx = 1; idx <= days; idx++) {

            var monthScheduleRow=document.createElement("tr")
            monthScheduleRow.id="monthScheduleRow"+(idx)
            monthScheduleRow.className="monthScheduleRowClass"
            monthScheduleRow.setAttribute('onclick',`show_day_schedule(`+idx+')')
            document.getElementById("monthScheduleList").appendChild(monthScheduleRow)
        
            var dayNum=document.createElement("td")
            dayNum.id="dayNumId"+(idx)
            dayNum.className="dayNum"
            dayNum.innerHTML=idx
            document.getElementById("monthScheduleRow"+(idx)).appendChild(dayNum)
        
            var dayDetail=document.createElement("td")
            dayDetail.id="dayDetailId"+(idx)
            dayDetail.className="dayDetail"
            document.getElementById("monthScheduleRow"+(idx)).appendChild(dayDetail)
        
            var scheduleDetail_1=document.createElement("div")
            scheduleDetail_1.id="scheduleDetailId_1"
            scheduleDetail_1.className="detail"
            scheduleDetail_1.innerHTML="15:00 front end 개발"
            document.getElementById("dayDetailId"+(idx)).appendChild(scheduleDetail_1)
        
            var scheduleDetail_2=document.createElement("div")
            scheduleDetail_2.id="scheduleDetailId_2"
            scheduleDetail_2.className="detail"
            scheduleDetail_2.innerHTML="17:00 back end 개발"
            document.getElementById("dayDetailId"+(idx)).appendChild(scheduleDetail_2)
        
        }

        if(monthNow>=11){
            monthNow=(-1)
        }
    }


    //================================


    function show_sidebar(){
        sidebarList.style.display="flex"
        sidebar.style.backgroundColor="#D1DEF2"  
    }

    function show_day_schedule(){
        dayScheduleSection.style.display="flex"
        dayNumId.style.backgroundColor="#D1DEF2"
        dayDetailId.style.backgroundColor="#D1DEF2"
    }

    function logout_btn(){
        location.href='../action/logoutAction.jsp'
    }

    function new_form_btn(){
        newScheduleSection.style.display="flex"
        newBtn.style.backgroundColor="#38B774"
    }

    function update_form_btn(){
        updateScheduleSection.style.display="flex"
        updateBtn1.style.backgroundColor="#38B774"
    }

    function delete_btn(){
    
    }

    function new_back_btn(){
        newScheduleSection.style.display="none"
        newBtn.style.backgroundColor="#293E98"
    }

    function update_back_btn(){
        updateScheduleSection.style.display="none"
        updateBtn1.style.backgroundColor="#4668ff"
    }

    //새로운 스케쥴 추가
    function new_schedule_write_check(){
        var newScheduleDateValue= document.getElementById("newScheduleDateInsert").value
        var newScheduleTimeValue=document.getElementById("newScheduleTimeInsert").value
        var newContentValue= document.getElementById("newContentInsert").value
        
        if(newScheduleDateValue==""){
            alert("날짜를 입력해주세요")
            return false;
        }
        if(newScheduleTimeValue==""){
            alert("시간을 입력해주세요")
            return false;
        }
        if(newContentValue==""){
            alert("내용을 입력해주세요")
            return false;
        }
    }
        //스케쥴 수정
    function update_schedule_write_check(){
        var updateScheduleDateValue= document.getElementById("updateScheduleDateInsert").value
        var updateScheduleTimeValue=document.getElementById("updateScheduleTimeInsert").value
        var updateContentValue= document.getElementById("updateContentInsert").value
        
        if(updateScheduleDateValue==""){
            alert("날짜를 입력해주세요")
            return false;
        }
        if(updateScheduleTimeValue==""){
            alert("시간을 입력해주세요")
            return false;
        }
        if(updateContentValue==""){
            alert("내용을 입력해주세요")
            return false;
        }
    }
    </script>
</body>
</html>