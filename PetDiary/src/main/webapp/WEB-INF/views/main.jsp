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
@font-face {
font-family:'DXADayB';
src: url('${pageContext.request.contextPath}/resources/font/DXADayB.ttf') format('truetype');
font-weight: normal;
font-style: normal;
}
*{
font-family: DXADayB;
}
#diaryContainer{
padding: 10px;
margin: auto;
width: 800px;
height: 500px;
background-color: #9DADBC;
border: 1px solid black;
border-radius: 5px;
text-align: center;
}
#petList{
padding: 10px;
margin: auto;
text-align: left;
width: 70%;
height: 70px;
background-color: #B1DAFF;
border: 1px solid black;
border-radius: 5px;
}
span{
display: inline-block;
text-align: center;
}
#addPet{
width: 30px;
height: 30px;
text-align: center;
border-radius: 50%;
border: 1px solid transparent;
background-color: #F2BED6;
color: white;
}
img{
width: 50px;
height: 50px;
}
h1,h3{
color: white;
}
#logContainer{
padding: 10px;
margin: 10px auto;
width: 70%;
background-color: #B1DAFF;
border: 1px solid black;
border-radius: 5px;
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
	
	$('#logContainer').load("${home}action/getPetDiary?petId="+selectedId);
}
function addPet(){
	$('#logContainer').load("${home}addPet");
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
<h3><%=today %></h3>
<div id="petList">
	<span>
	<img alt="내 반려동물 사진1" src="${home }resources/images/bulldog.jpg" name="myPet" id="1" onclick="selectPet(this.id)"/>
	<br/>퍼기
	</span>
	<span>
	<img alt="내 반려동물 사진2" src="${home }resources/images/pome.jpg" name="myPet" id="2" onclick="selectPet(this.id)"/>
	<br/>포메
	</span>
	<span>
	<img alt="내 반려동물 사진3" src="${home }resources/images/retriever.jpg" name="myPet" id="3" onclick="selectPet(this.id)"/>
	<br/>리트
	</span>
	<span>
	<input type="button" id="addPet" onclick="addPet()" value="+">
	<br/>
	</span>
</div>
<div id="logContainer">
<c:import url="/first" />
</div>
</div>
</body>
</html>
