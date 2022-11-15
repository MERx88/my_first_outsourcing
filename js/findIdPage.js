

var nameValue=document.getElementById("nameInsert").value
var contactValue=document.getElementById("contactInsert").value

function findIdCheck(){
    if(nameValue==""){
        alert("이름를 입력해주세요")
        return false;
    }
    if(contactValue==""){
        alert("연락처를 입력해주세요")
        return false;
    }
}

function goLogin(){
    location.href = "../html/loginPage.jsp"
}
