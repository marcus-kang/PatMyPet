<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#eatLog{
background-color: #EEEEEE;
border: 1px solid black;
border-radius: 5px;
}
</style>
<center>
<table id="eatTable">
	<tr><td><h3>식사</h3></td></tr>
	<tr><td><div id="eatLog">09:00<br/>A 사료 먹음</div></td></tr>
	<tr>
		<td><textarea placeholder="+추가하기"></textarea></td>
	</tr>
	<tr><td><input type="button" id="okBtn" value="완료"></td></tr>
</table>
</center>