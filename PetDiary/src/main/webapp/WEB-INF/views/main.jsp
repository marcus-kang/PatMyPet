<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="home" value="/" />
<c:url var="root" value="${pageContext.request.contextPath }" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Date date = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd(E)");
String today = sdf.format(date);
%>
<style>
#diaryContainer{
margin: auto;
width: 800px;
height: auto;
background-color: #EEEEEE;
border: 1px solid black;
border-radius: 5px;
text-align: center;
}
#logContainer{
padding: 5px;
margin: auto;
width: 70%;
background-color: #CFE2F3;
border: 1px solid black;
border-radius: 5px;
}
#petList{
padding: 5px;
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
img{
width: 50px;
height: 50px;
}
</style>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript">
function selectPet(selectedId){
	var myPets = document.getElementsByName('myPet');
	for(var pet of myPets){
		pet.setAttribute('style', '');
	}
	var selectedPet = document.getElementById(selectedId);
	selectedPet.setAttribute('style', 'border: 1px solid #F839F9');
	
	$('#logContainer').load("${home}action/getPetInfo?petId="+selectedId);
}
</script>
<html>
<head>
	<title>Diary</title>
</head>
<body>
<form id="frm" method="post">
	<input type="hidden" name="petId" id="${petId }">
	<input type="hidden" name="userId" id="${userId }">
	<input type="hidden" name="date" id="date">
</form>
<div id="diaryContainer">
<h1>관리일지</h1>
<%=today %>
<div id="petList">
	<img alt="내 반려동물 사진1" src="${home }resources/images/bulldog.jpg" name="myPet" id="1" onclick="selectPet(this.id)"/>
	<img alt="내 반려동물 사진2" src="${home }resources/images/pome.jpg" name="myPet" id="2" onclick="selectPet(this.id)"/>
	<input type="button" id="addPet" value="+">
</div>
<div id="logContainer">
<c:import url="/first" />
</div>
</div>
</body>
</html>
