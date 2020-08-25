<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
input[type=button]{
background-color: #F2BED6;
border: 0px;
border-radius: 5px;
color: white;
}
#eatLog{
background-color: #EEEEEE;
border: 1px solid black;
border-radius: 5px;
}
td{
text-align: center;
padding: 5px;
}
</style>
<script>
var weight = document.getElementById('weight');
function onlyNumber() {
	if (event.keyCode<48||event.keyCode>57) {
		if (event.keyCode != 46) {
			event.returnValue = false;
		} else if(event.keyCode == 46 && !weight.value.includes(".")){
			event.returnValue = true;
		}else{event.returnValue = false;}
	}
	event.returnValue = true;
}

if('${diaryList.weight}' !== null && '${diaryList.weight}' !== ""){
	weight.value = '${diaryList.weight}';
}

function submitFrm(){
	if(weight.value == ""){
		alert('체중을 입력해주세요');
	}else{
		document.getElementById('weightFrm').action = "${home }action/weightProc";
		document.getElementById('weightFrm').submit();		
	}
}
</script>
<center>
<form id="weightFrm" method="post">
<table id="weightTable">
	<tr><td><h3>체중</h3></td></tr>
	<tr>
		<td><input type="text" name="weight" id="weight" onkeypress="onlyNumber();">kg</td>
	</tr>
	<tr><td><input type="button" id="okBtn" onclick="submitFrm()" value="완료"></td></tr>
</table>
</form>
</center>