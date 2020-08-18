<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
function addProc(actionId){
	$('#logContainer').load(actionId);
}
function editProc(actionId){
	$('#logContainer').load("action/editProc/"+actionId);
}
var actBtns = document.getElementsByClassName('actionBtn');
if('${disabled}' !== null || '${disabled}' !== ""){
	for(var btn of actBtns){
		btn.disabled = ${disabled};
	}	
}

if('${diaryList.walkvenue}' !== null && '${diaryList.walkvenue}' !== ""){
	var walk = document.getElementById('walk');
	walk.value = 'v확인';
	walk.setAttribute('onclick', 'editProc(this.id)');
}
if('${diaryList.pee}' !== null && '${diaryList.pee}' !== ""){
	var peePoo = document.getElementById('peePoo');
	peePoo.value = 'v확인';
	peePoo.setAttribute('onclick', 'editProc(this.id)');
}
if('${diaryList.eattime}' !== null && '${diaryList.eattime}' !== ""){
	var eat = document.getElementById('eat');
	eat.value = 'v확인';
	eat.setAttribute('onclick', 'editProc(this.id)');
}
if('${diaryList.weight}' !== null && '${diaryList.weight}' !== ""){
	var weight = document.getElementById('weight');
	weight.value = 'v확인';
	weight.setAttribute('onclick', 'editProc(this.id)');
}
if('${diaryList.condition}' !== null && '${diaryList.condition}' !== ""){
	var health = document.getElementById('health');
	health.value = 'v확인';
	health.setAttribute('onclick', 'editProc(this.id)');
}
</script>
<center>
<h3><font color="red">${msg }</font></h3>
<table id="diaryList">
	<tr>
		<td>산책</td>
		<td><input type="button" onclick="addProc(this.id)" class="actionBtn" id="walk" value="+추가하기" disabled="disabled"></td>
	</tr>
	<tr>
		<td>배변</td>
		<td><input type="button" onclick="addProc(this.id)" class="actionBtn" id="peePoo" value="+추가하기" disabled="disabled"></td>
	</tr>
	<tr>
		<td>식사</td>
		<td><input type="button" onclick="addProc(this.id)" class="actionBtn" id="eat" value="+추가하기" disabled="disabled"></td>
	</tr>
	<tr>
		<td>체중</td>
		<td><input type="button" onclick="addProc(this.id)" class="actionBtn" id="weight" value="+추가하기" disabled="disabled"></td>
	</tr>
	<tr>
		<td>건강상태</td>
		<td><input type="button" onclick="addProc(this.id)" class="actionBtn" id="health" value="+추가하기" disabled="disabled"></td>
	</tr>
</table>
</center>