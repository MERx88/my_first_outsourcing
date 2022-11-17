


function find_password_check(){

    var idValue= document.getElementById("idInsert").value
    var nameValue=document.getElementById("nameInsert").value
    var contactValue=document.getElementById("contactInsert").value

    if(idValue==""){
        alert("ID를 입력해주세요")
        return false;
    }
    if(nameValue==""){
        alert("이름를 입력해주세요")
        return false;
    }
    if(contactValue==""){
        alert("연락처를 입력해주세요")
        return false;
    }
}

function go_login(){
    location.href = "../html/loginPage.jsp"
}
