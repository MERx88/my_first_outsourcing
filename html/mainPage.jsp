<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
            <p id="idText" >7791</p>
        </div>
    </section>  
    
    <input id="sideMenu" type="checkbox">
    <section id="sidebarList">
        <p id="myScheduleBtn">My Schedule</p>
        <ul id="departmentList">DEPARTMENT -----------
        <li class="department">
            <p>
                Front End
            </p>
            <ul>
                <li>
                    ID #5555
                </li>
                <li>
                    ID #6666
                </li>
            </ul>
        </li>
        <li class="department">
            <p>
                Back End
            </p>
            <ul>
                <li>
                    ID #5555
                </li>
                <li>
                    ID #6666
                </li>
            </ul>
        </li>
        </ul>
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
                <form id="newScheduleForm">
                    <input type="date" id="newScheduleDateInsert" class="insert">
                    <input type="time" id="newScheduleTimeInsert" class="insert">
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
                <form id="updateScheduleForm">
                    <input type="date" id="updateDateInsert" class="insert">
                    <input type="time" id="updateTimeInsert" class="insert">
                    <textarea id="updateContentInsert" name="updateContentValue" maxlength="2048"></textarea>
                    <input type="submit" value="UPDATE" id="updateFormBtn" class="formBtn">
                </form>
            </div>
            <button onclick="update_back_btn()" class="backBtn">
                <img src="../image/left-arrow.png"  class="backBtnImg">
            </button>
        </section>

    </main>
    
    <script src="../js/mainPage.js"> </script>
</body>
</html>