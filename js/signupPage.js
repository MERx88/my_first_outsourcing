

var idValue= document.getElementById("idInsert").value
var idCheckValue=document.getElementById("idCheckBtn").value
var pwValue=document.getElementById("pwInsert").value
var pwCheckValue=document.getElementById("pwCheckInsert").value
var nameValue=document.getElementById("nameInsert").value
var contactValue=document.getElementById("contactInsert").value

function signup_check(){
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

function id_check(){
    window.open("../action/idCheckAction.jsp", "idCheck", "width=200px, height=200px")
}

function pw_view_check(i){

    var viewImgList=document.getElementsByClassName('viewImg')

    if(i==0){
        var pwValue = document.getElementById("pwInsert")
        
        if ( pwValue.type== "password"){
            pwValue.type= "text"
            viewImgList[0].style.opacity="100%"
        }
        else{
            pwValue.type= "password"
            viewImgList[0].style.opacity="10%"
        }
    }
    else{
        var pwCheckValue = document.getElementById("pwCheckInsert")

        if ( pwCheckValue.type== "password"){
            pwCheckValue.type= "text"
            viewImgList[1].style.opacity="100%"
        }
        else{
            pwCheckValue.type= "password"
            viewImgList[1].style.opacity="10%"
        }
    } 
}