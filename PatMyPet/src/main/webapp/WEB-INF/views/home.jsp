<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
function addProc(actionId){
	console.log("/"+actionId);
	document.getElementById('frm').action = "/" + actionId;
	document.getElementById('frm').submit();
}
</script>
<center>
<table id="diaryList">
	<tr>
		<td>산책</td>
		<td><input type="button" onclick="addProc(this.id)" id="walk" value="+추가하기"></td>
	</tr>
	<tr>
		<td>배변</td>
		<td><input type="button" onclick="addProc(this.id)" id="peePoo" value="+추가하기"></td>
	</tr>
	<tr>
		<td>식사</td>
		<td><input type="button" onclick="addProc(this.id)" id="eat" value="+추가하기"></td>
	</tr>
	<tr>
		<td>체중</td>
		<td><input type="button" onclick="addProc(this.id)" id="weight" value="+추가하기"></td>
	</tr>
	<tr>
		<td>건강상태</td>
		<td><input type="button" onclick="addProc(this.id)" id="health" value="+추가하기"></td>
	</tr>
</table>
</center>