<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="home" value="/" />
<script>
var walkvenue = document.getElementById('walkvenue');
var walkdistance = document.getElementById('walkdistance');
var startHr = document.getElementById('startHr');
var startMin = document.getElementById('startMin');
var stopHr = document.getElementById('stopHr');
var stopMin = document.getElementById('stopMin');

function onlyNumber() {
	if (event.keyCode<48||event.keyCode>57) {
		if (event.keyCode != 46) {
			event.returnValue = false;
		} else if(event.keyCode == 46 && !document.getElementById('distanceTxt').value.includes(".")){
			event.returnValue = true;
		}else{event.returnValue = false;}
	}
	event.returnValue = true;
}
function submitFrm(){
	walkvenue.setAttribution('required', true);
	walkdistance.setAttribution('required', true);
	document.getElementById('walkstart').value = startHr.options[startHr.selectedIndex].value +":"+ startMin.options[startMin.selectedIndex].value;
	document.getElementById('walkstop').value = stopHr.options[stopHr.selectedIndex].value +":"+ stopMin.options[stopMin.selectedIndex].value;
	
	document.getElementById('walkFrm').action = "${home }action/walkProc";
	document.getElementById('walkFrm').submit();
}

if('${diaryList.walkvenue}' !== null && '${diaryList.walkvenue}' !== ""){
	walkvenue.value = '${diaryList.walkvenue}';

	var walkstart = '${diaryList.walkstart}'.split(':');
	startHr.value = walkstart[0];
	startMin.value = walkstart[1];

	var walkstop = '${diaryList.walkstop}'.split(':');
	stopHr.value = walkstop[0];
	stopMin.value = walkstop[1];

	walkdistance.value = '${diaryList.walkdistance}';
}
</script>
<center>
<form id="walkFrm" method="post">
<table id="walkTable">
	<tr><td colspan=2><h3>산책</h3></td></tr>
	<tr>
		<td>장소</td>
		<td><input type="text" name="walkvenue" id="walkvenue" required></td>
	</tr>
	<tr>
		<td>시간</td>
		<td>
			<select id="startHr">
			<%for(int i=0;i<24;i++){ %>
				<option value="<%=String.format("%02d", i) %>"><%=String.format("%02d", i) %></option>
				<%} %>
			</select>
			<select id="startMin">
			<%for(int i=0;i<60;i++){ %>
				<option value="<%=String.format("%02d", i) %>"><%=String.format("%02d", i) %></option>
				<%} %>
			</select>
			<input type="hidden" name="walkstart" id="walkstart">
			~
			<select id="stopHr">
			<%for(int i=0;i<24;i++){ %>
				<option value="<%=String.format("%02d", i) %>"><%=String.format("%02d", i) %></option>
				<%} %>
			</select>
			<select id="stopMin">
			<%for(int i=0;i<60;i++){ %>
				<option value="<%=String.format("%02d", i) %>"><%=String.format("%02d", i) %></option>
				<%} %>
			</select>
			<input type="hidden" name="walkstop" id="walkstop">
		</td>
	</tr>
	<tr>
		<td>거리</td>
		<td><input type="text" name="walkdistance" id="walkdistance" onkeypress="onlyNumber();" required>km</td>
	</tr>
	<tr><td colspan=2><input type="submit" id="okBtn" onclick="submitFrm()" value="완료"></td></tr>
</table>
</form>
</center>