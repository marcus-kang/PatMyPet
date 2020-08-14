<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
function selectStatus(selectedId){
	var statusLst = document.getElementsByClassName('status');
	for(var status of statusLst){
		status.setAttribute('style', '');
	}
	var selectedStatus = document.getElementById(selectedId);
	selectedStatus.setAttribute('style', 'border: 1px solid #F839F9;border-radius:5px;color:#F839F9');
}
</script>
<center>
<table id="healthTable">
	<tr><td><h3>건강상태</h3></td></tr>
	<tr><td><textarea placeholder="+입력하기"></textarea></td></tr>
	<tr><td><h3>특이사항</h3></td></tr>
	<tr><td>
		<input type="button" class="status" id="vaccin" value="접종" onclick="selectStatus(this.id)">
		<input type="button" class="status" id="checkup" value="검진" onclick="selectStatus(this.id)">
		<input type="button" class="status" id="surgery" value="수술" onclick="selectStatus(this.id)">
	</td></tr>
	<tr><td><input type="button" id="okBtn" value="완료"></td></tr>
</table>
</center>