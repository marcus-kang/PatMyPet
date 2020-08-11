<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="home" value="/" />
<%
Date date = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd(E)");
String today = sdf.format(date);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Diary</title>
</head>
<script type="text/javascript">
function selectPet(selectedId){
	var myPets = document.getElementsByName('myPet');
	for(var pet of myPets){
		pet.setAttribute('style', '');
	}
	var selectedPet = document.getElementById(selectedId);
	selectedPet.setAttribute('style', 'border: 1px solid #F839F9');
}
function addProc(actionId){
	document.getElementById('frm').action = "/" + actionId;
	document.getElementById('frm').submit();
}
</script>
<style>
#diaryContainer{
margin: auto;
width: 800px;
background-color: #EEEEEE;
border: 1px solid black;
border-radius: 5px;
text-align: center;
}
#petList{
margin: auto;
text-align: left;
width: 70%;
height: 60px;
background-color: #CFE2F3;
border: 1px solid black;
border-radius: 5px;
}
#addPet{
width: 30px;
height: 30px;
text-align: center;
border-radius: 50%;
border: 1px solid black;
}
#logContainer{
margin: auto;
width: 70%;
background-color: #CFE2F3;
border: 1px solid black;
border-radius: 5px;
}
img{
width: 50px;
height: 50px;
}
</style>
<body>
<form id="frm" method="post">
	<input type="hidden" name="petId" id="petId">
	<input type="hidden" name="date" id="date">
</form>
<div id=diaryContainer>
	<h2>관리일지</h2>
	<%=today %>
	<div id=petList>
		<img alt="내 반려동물 사진1" src="resources/images/bulldog.jpg" name="myPet" id="petId1" onclick="selectPet(this.id)"/>
		<img alt="내 반려동물 사진2" src="resources/images/pome.jpg" name="myPet" id="petId2" onclick="selectPet(this.id)"/>
		<input type="button" id="addPet" value="+">
	</div>
	<div id="logContainer">
		<table id="diaryList">
			<tr><td colspan=2><h3>산책</h3></td></tr>
			<tr>
				<td>장소</td>
				<td><input type="button" id="placeBtn" value="+추가하기"></td>
			</tr>
			<tr>
				<td>시간</td>
				<td><input type="button" id="timeBtn" value="+추가하기"></td>
			</tr>
			<tr>
				<td>거리</td>
				<td><input type="button" id="distanceBtn" value="+추가하기"></td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>