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
    

    String sql ="SELECT * FROM member;";
    PreparedStatement query = connect.prepareStatement(sql);
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
    String scheduleSql ="SELECT * FROM schedule";
    PreparedStatement pstmt = connect.prepareStatement(scheduleSql);
    ResultSet scheduleResult = pstmt.executeQuery();

    ArrayList<ArrayList<String>> scheduleList = new ArrayList<ArrayList<String>>();
    while(scheduleResult.next()){
        ArrayList<String> schedule = new ArrayList();
            schedule.add(quotes+scheduleResult.getString(1)+quotes);
            schedule.add(quotes+scheduleResult.getString(2)+quotes);
            schedule.add(quotes+scheduleResult.getString(3)+quotes);
            schedule.add(quotes+scheduleResult.getString(4)+quotes);
            schedule.add(quotes+scheduleResult.getString(5)+quotes);
            schedule.add(quotes+scheduleResult.getString(6)+quotes);
            scheduleList.add(schedule);
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
                <h2 id="day"><!-- 동적생성 --></h2>
                <table id="dayScheduleList">
                    <!-- 동적생성 -->
                </table>
                <button id="newBtn" onclick="new_form_btn()">+</button>
            </div>
            <button onclick="day_back_btn()" class="backBtn">
                <img src="../image/left-arrow.png"  class="backBtnImg">
            </button>
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
    var scheduleListSize=<%=scheduleList.size()%>;
    var scheduleList = <%=scheduleList%>;
    
    //자신의 닉네임 상단에 띄우기
    var idText=document.getElementById("idText")
    idText.innerHTML=sessionIdValue
    console.log(scheduleList[0][2].slice(5,7))

    //부서 클릭시 부서 해당멤버 보여주기
    for(var i = 0; i < memberListSize; i++){
        if("frontEndValue"==memberList[i][4]){
            if(sessionIdValue!=memberList[i][0]){
                var frontEndMember=document.createElement("li")
                frontEndMember.innerHTML=memberList[i][0]
                frontEndMember.setAttribute('onclick',`show_member_schedule(`+i+`)`)
                document.getElementById("frontEndList").appendChild(frontEndMember)
            }
        }if("backEndValue"==memberList[i][4]){
            if(sessionIdValue!=memberList[i][0]){
            var backEndMember=document.createElement("li")
            backEndMember.innerHTML=memberList[i][0]
            backEndMember.setAttribute('onclick',`show_member_schedule(`+i+`)`)
            document.getElementById("backEndList").appendChild(backEndMember)
            }
        }
    }

    function show_member_schedule(i){
        localStorage.setItem('memberValue', memberList[i][0])
        window.open(`memberSchedulePage.jsp`,`_self`)
    }

    //======Schedule part=====//

    var monthsText=["January","February","March","April","May","June","July","August","September","October","November","December"]
    var date = new Date()
    var daysNow = new Date(date.getFullYear(), date.getMonth() + 1, 0).getDate()
    var monthNow=date.getMonth()

    var month=document.getElementById("month")
    month.innerHTML=monthsText[date.getMonth()]


    for (var idx = 0; idx < daysNow; idx++) {

        var monthScheduleRow=document.createElement("tr")
        monthScheduleRow.id="monthScheduleRow"+(idx)
        monthScheduleRow.className="monthScheduleRowClass"
        monthScheduleRow.setAttribute('onclick',`show_day_schedule(`+idx+')')
        document.getElementById("monthScheduleList").appendChild(monthScheduleRow)

        var dayNum=document.createElement("td")
        dayNum.id="dayNumId"+(idx)
        dayNum.className="dayNum"
        dayNum.innerHTML=idx+1
        document.getElementById("monthScheduleRow"+(idx)).appendChild(dayNum)

        var dayDetail=document.createElement("td")
        dayDetail.id="dayDetailId"+(idx)
        dayDetail.className="dayDetail"
        document.getElementById("monthScheduleRow"+(idx)).appendChild(dayDetail)

        // if((date.getMonth()+1)==)

        
        for(var j = 0; j < scheduleListSize; j++){
            if(sessionIdValue==scheduleList[j][1]){
                if(document.getElementById("dayDetailId"+(idx)).childElementCount<2){
                    if(scheduleList[j][2].slice(5,7)==(date.getMonth() + 1) && scheduleList[j][2].slice(8,10)==(idx + 1)){
                        var scheduleDetail=document.createElement("div")
                        scheduleDetail.id="scheduleDetailId_"+(j)
                        scheduleDetail.className="detail"
                        scheduleDetail.innerHTML=scheduleList[j][3].slice(0,5)+"  "+scheduleList[j][4]
                        document.getElementById("dayDetailId"+(idx)).appendChild(scheduleDetail)
                    }else{
                        if(scheduleList[j][2].slice(6,7)==(date.getMonth() + 1) && scheduleList[j][2].slice(8,10)==(idx + 1)){
                            if(document.getElementById("dayDetailId"+(idx)).childElementCount<2){
                            var scheduleDetail=document.createElement("div")
                            scheduleDetail.id="scheduleDetailId_"+(j)
                            scheduleDetail.className="detail"
                            scheduleDetail.innerHTML=scheduleList[j][3].slice(0,5)+"  "+scheduleList[j][4]
                            document.getElementById("dayDetailId"+(idx)).appendChild(scheduleDetail)
                            }
                        }
                    }
                }
            }
        }
    }

    

    //==========이전달 페이지 버튼==========//

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

        var afterDays= new Date(2022, monthNow+2, 0).getDate()
        var days = new Date(2022, monthNow+1, 0).getDate()

        for (var i = 0; i < afterDays; i++) {
            var deleteMonthScheduleRow=document.getElementById("monthScheduleRow"+(i))
            deleteMonthScheduleRow.remove()

        }

        for (var idx = 0; idx < days; idx++) {


            var monthScheduleRow=document.createElement("tr")
            monthScheduleRow.id="monthScheduleRow"+(idx)
            monthScheduleRow.className="monthScheduleRowClass"
            monthScheduleRow.setAttribute('onclick',`show_day_schedule(`+idx+')')
            document.getElementById("monthScheduleList").appendChild(monthScheduleRow)
        
            var dayNum=document.createElement("td")
            dayNum.id="dayNumId"+(idx)
            dayNum.className="dayNum"
            dayNum.innerHTML=(idx+1)
            document.getElementById("monthScheduleRow"+(idx)).appendChild(dayNum)
        
            var dayDetail=document.createElement("td")
            dayDetail.id="dayDetailId"+(idx)
            dayDetail.className="dayDetail"
            document.getElementById("monthScheduleRow"+(idx)).appendChild(dayDetail)


            for(var j = 0; j < scheduleListSize; j++){
                if(sessionIdValue==scheduleList[j][1]){
                    if(document.getElementById("dayDetailId"+(idx)).childElementCount<2){
                        if(scheduleList[j][2].slice(5,7)==(monthNow+1) && scheduleList[j][2].slice(8,10)==(idx + 1)){
                            var scheduleDetail=document.createElement("div")
                            scheduleDetail.id="scheduleDetailId_"+(j)
                            scheduleDetail.className="detail"
                            scheduleDetail.innerHTML=scheduleList[j][3].slice(0,5)+"  "+scheduleList[j][4]
                            document.getElementById("dayDetailId"+(idx)).appendChild(scheduleDetail)
                        }else{
                            if(scheduleList[j][2].slice(6,7)==(date.getMonth() + 1) && scheduleList[j][2].slice(8,10)==(idx + 1)){
                                if(document.getElementById("dayDetailId"+(idx)).childElementCount<2){
                                var scheduleDetail=document.createElement("div")
                                scheduleDetail.id="scheduleDetailId_"+(j)
                                scheduleDetail.className="detail"
                                scheduleDetail.innerHTML=scheduleList[j][3].slice(0,5)+"  "+scheduleList[j][4]
                                document.getElementById("dayDetailId"+(idx)).appendChild(scheduleDetail)
                                }
                            }
                        }
                    }
                }
            }
        }

        if(monthNow<=0){
            monthNow=12
        }
    }
        
    //==========다음달 페이지 버튼==========//

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

        var beforeDays= new Date(2022, monthNow, 0).getDate()
        var days = new Date(2022, monthNow+1, 0).getDate()

        for (var i = 0; i < beforeDays; i++) {
            var deleteMonthScheduleRow=document.getElementById("monthScheduleRow"+(i))
            deleteMonthScheduleRow.remove()
        }

        for (var idx = 0; idx < days; idx++) {

            var monthScheduleRow=document.createElement("tr")
            monthScheduleRow.id="monthScheduleRow"+(idx)
            monthScheduleRow.className="monthScheduleRowClass"
            monthScheduleRow.setAttribute('onclick',`show_day_schedule(`+idx+')')
            document.getElementById("monthScheduleList").appendChild(monthScheduleRow)
        
            var dayNum=document.createElement("td")
            dayNum.id="dayNumId"+(idx)
            dayNum.className="dayNum"
            dayNum.innerHTML=(idx+1)
            document.getElementById("monthScheduleRow"+(idx)).appendChild(dayNum)
        
            var dayDetail=document.createElement("td")
            dayDetail.id="dayDetailId"+(idx)
            dayDetail.className="dayDetail"
            document.getElementById("monthScheduleRow"+(idx)).appendChild(dayDetail)

            for(var j = 0; j < scheduleListSize; j++){
                if(sessionIdValue==scheduleList[j][1]){    
                    if(document.getElementById("dayDetailId"+(idx)).childElementCount<2){
                        if(scheduleList[j][2].slice(5,7)==(monthNow+1) && scheduleList[j][2].slice(8,10)==(idx + 1)){
                            var scheduleDetail=document.createElement("div")
                            scheduleDetail.id="scheduleDetailId_"+(j)
                            scheduleDetail.className="detail"
                            scheduleDetail.innerHTML=scheduleList[j][3].slice(0,5)+"  "+scheduleList[j][4]
                            document.getElementById("dayDetailId"+(idx)).appendChild(scheduleDetail)
                        }else{
                            if(scheduleList[j][2].slice(6,7)==(date.getMonth() + 1) && scheduleList[j][2].slice(8,10)==(idx + 1)){
                                if(document.getElementById("dayDetailId"+(idx)).childElementCount<2){
                                var scheduleDetail=document.createElement("div")
                                scheduleDetail.id="scheduleDetailId_"+(j)
                                scheduleDetail.className="detail"
                                scheduleDetail.innerHTML=scheduleList[j][3].slice(0,5)+"  "+scheduleList[j][4]
                                document.getElementById("dayDetailId"+(idx)).appendChild(scheduleDetail)
                                }
                            }
                        }
                    }
                }
            }
        }

        if(monthNow>=11){
            monthNow=(-1)
        }
    }

    //==========해당일 일정 페이지 열기 버튼==========//

    function show_day_schedule(idx){

        dayScheduleSection.style.display="flex"
        // dayNumId+(idx).style.backgroundColor="#D1DEF2"
        // dayDetailId+(idx).style.backgroundColor="#D1DEF2"

        var dayText=document.getElementById("day")
        dayText.innerHTML="DAY "+(idx+1)

       
        var deleteDayScheduleRow=document.getElementById("dayScheduleList")

        while(deleteDayScheduleRow.hasChildNodes()){ 
            deleteDayScheduleRow.removeChild(deleteDayScheduleRow.firstChild); 
        }

        for(var j = 0; j < scheduleListSize; j++){

            if(scheduleList[j][2].slice(5,7)==(monthNow + 1) && scheduleList[j][2].slice(8,10)==(idx + 1)){
                if(sessionIdValue==scheduleList[j][1]){    
                    var dayScheduleRow=document.createElement("tr")
                    dayScheduleRow.id="dayScheduleRow"+(j)
                    dayScheduleRow.className="dayScheduleRowClass"
                    document.getElementById("dayScheduleList").appendChild(dayScheduleRow)
                
                    var dayScheduleDetail=document.createElement("td")
                    dayScheduleDetail.id="dayScheduleDetail"+(j)
                    dayScheduleDetail.className="dayScheduleDetailClass"
                    dayScheduleDetail.innerHTML= scheduleList[j][3].slice(0,5)+"<br>"+scheduleList[j][4]
                    document.getElementById("dayScheduleRow"+(j)).appendChild(dayScheduleDetail)
                
                    var switchBtnSection=document.createElement("td")
                    switchBtnSection.id="switchBtnSection"+(j)
                    switchBtnSection.className="switchBtnSectionClass"
                    document.getElementById("dayScheduleRow"+(j)).appendChild(switchBtnSection)

                    var updateBtn=document.createElement("button")
                    updateBtn.id="updateBtn"+(j)
                    updateBtn.className="updateBtnClass"
                    updateBtn.setAttribute('onclick',`update_form_btn()`)
                    document.getElementById("switchBtnSection"+(j)).appendChild(updateBtn)
                    
                    var updateBtnImg=document.createElement("img")
                    updateBtnImg.className="switchBtnImg"
                    updateBtnImg.setAttribute('src',"../image/update.png")
                    document.getElementById("updateBtn"+(j)).appendChild(updateBtnImg)

                    var deleteBtn=document.createElement("button")
                    deleteBtn.id="deleteBtn"+(j)
                    deleteBtn.className="deleteBtnClass"
                    deleteBtn.setAttribute('onclick',`delete_btn(`+j+')')
                    document.getElementById("switchBtnSection"+(j)).appendChild(deleteBtn)

                    var deleteBtnImg=document.createElement("img")
                    deleteBtnImg.className="switchBtnImg"
                    deleteBtnImg.setAttribute('src',"../image/delete.png")
                    document.getElementById("deleteBtn"+(j)).appendChild(deleteBtnImg)

    //              <form action="../action/postDeleteAction.jsp"  id="postForm">
                    //     
                    //     <input type="hidden" id="postId" name="postid_value" >
                    //     <input type="submit" value="이 버튼을 부르면 삭제가 완료됩니다" id="submitButton">
                 // </form>
                }
            }
        }
    }

     //==========기타 버튼==========//

    // if (matchMedia("screen and (max-width: 360px)").matches) {

    // // 1024px 이상에서 사용할 스크립트
    // } else {
    // // 1024px 미만에서 사용할 스크립트
    // }

    function show_sidebar(){
        sidebarList.style.display="flex"
        sidebar.style.backgroundColor="#D1DEF2"  
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
        // updateBtn1.style.backgroundColor="#38B774"
    }

    function delete_btn(j){
        localStorage.setItem('scheduleValue', scheduleList[j][0])
        window.open("deleteSchedulePage.jsp", "deleteSchedule", "width=350px, height=250px")
    }

    function day_back_btn(){
        dayScheduleSection.style.display="none"
        // newBtn.style.backgroundColor="#293E98"
    }

    function new_back_btn(){
        newScheduleSection.style.display="none"
        newBtn.style.backgroundColor="#293E98"
    }

    function update_back_btn(){
        updateScheduleSection.style.display="none"
        updateBtn1.style.backgroundColor="#4668ff"
    }

    //==========새로운 스케쥴 추가 빈칸 확인==========//

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

    //==========스케쥴 수정 빈칸 확인==========//

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