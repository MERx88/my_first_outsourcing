

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
