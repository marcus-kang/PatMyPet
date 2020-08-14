<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#eatLog{
background-color: #EEEEEE;
border: 1px solid black;
border-radius: 5px;
}
</style>
<script>
function onlyNumber() {
	if (event.keyCode<48||event.keyCode>57) {
		if (event.keyCode != 46) {
			event.returnValue = false;
		} else if(event.keyCode == 46 && !document.getElementById('weightTxt').value.includes(".")){
			event.returnValue = true;
		}else{event.returnValue = false;}
	}
	event.returnValue = true;
}
</script>
<center>
<table id="weightTable">
	<tr><td><h3>체중</h3></td></tr>
	<tr>
		<td><input type="text" id="weightTxt" onkeypress="onlyNumber();">kg</td>
	</tr>
	<tr><td><input type="button" id="okBtn" value="완료"></td></tr>
</table>
</center>