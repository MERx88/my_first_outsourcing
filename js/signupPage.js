

var idValue= document.getElementById("idInsert").value
var idCheckValue=document.getElementById("idCheckBtn").value
var pwValue=document.getElementById("pwInsert").value
var pwCheckValue=document.getElementById("pwCheckInsert").value
var nameValue=document.getElementById("nameInsert").value
var contactValue=document.getElementById("contactInsert").value

function signupCheck(){
    if(idValue==""){
        alert("ID를 입력해주세요")
        return false;
    }
    if(checkidValue==0){
        alert("아이디중복체크를 해주세요")
        return false;
    }
    if(pwValue==""){
        alert("P.W를 입력해주세요")
        return false;
    }
    if(pwCheckValue==""){
        alert("P.W CHECK를 입력해주세요")
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

function idCheck(){
    window.open("../action/idCheckAction.jsp", "idCheck", "width=200px, height=200px")
}
