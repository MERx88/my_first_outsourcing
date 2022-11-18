




function login_check(){
    var idValue= document.getElementById("idInsert").value
    var pwValue=document.getElementById("pwInsert").value
    
    if(idValue==""){
        alert("ID를 입력해주세요")
        return false;
    }
    if(pwValue==""){
        alert("P.W를 입력해주세요")
        return false;
    }
}
