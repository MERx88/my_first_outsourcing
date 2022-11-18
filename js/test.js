
var arr = '';
var date = new Date();
var days = new Date(2022,1, 0).getDate();
// var lastDate = new Date(year, month, 0).getDate();

//해당 월
var month = date.getFullYear() + "년" + (date.getMonth() + 1) + "월 입니다.";

console.log(days);


// 해달 월 일수 나열
for (var i = 1; i <= days; i++) {
  arr += " " + i;
}
console.log(arr);