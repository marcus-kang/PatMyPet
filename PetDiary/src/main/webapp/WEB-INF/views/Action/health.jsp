<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
input[type=button]{
background-color: #F2BED6;
border: 0px;
border-radius: 5px;
color: white;
}
td{
text-align: center;
padding: 5px;
}
</style>
<script>
var condition = document.getElementById('condition');
function selectStatus(selectedId){
	var statusLst = document.getElementsByClassName('status');
	for(var status of statusLst){
		status.setAttribute('style', '');
	}
	var selectedStatus = document.getElementById(selectedId);
	selectedStatus.setAttribute('style', 'border: 1px solid #F839F9;border-radius:5px;color:#F839F9');
}

if('${diaryList.condition}' !== null && '${diaryList.condition}' !== ""){
	condition.value = '${diaryList.condition}';
}

function submitFrm(){
	if(condition.value == ""){
		alert('건강상태를 입력해주세요');
	}else{
		document.getElementById('healthFrm').action = "${home }action/healthProc";
		document.getElementById('healthFrm').submit();		
	}
}
</script>
<center>
<form id="healthFrm" method="post">
<table id="healthTable">
	<tr><td><h3>건강상태</h3></td></tr>
	<tr><td><textarea name="condition" id="condition" placeholder="+입력하기"></textarea></td></tr>
	<tr><td><h3>특이사항</h3></td></tr>
	<tr><td>
		<input type="button" class="status" id="vaccin" value="접종" onclick="selectStatus(this.id)">
		<input type="button" class="status" id="checkup" value="검진" onclick="selectStatus(this.id)">
		<input type="button" class="status" id="surgery" value="수술" onclick="selectStatus(this.id)">
	</td></tr>
	<tr><td><input type="button" id="okBtn" onclick="submitFrm()" value="완료"></td></tr>
</table>
</form>
</center>