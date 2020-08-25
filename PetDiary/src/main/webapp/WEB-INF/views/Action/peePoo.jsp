<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="home" value="/" />
<style>
input[type=button]{
background-color: #F2BED6;
border: 0px;
border-radius: 5px;
color: white;
}
#peeInfo{
border: 1px solid black;
border-radius: 50%;
}
.pee{
width: 30px;
height: 30px;
text-align: center;
border-radius: 50%;
border: 1px solid black;
}
#yellow{
background-color: #FFD966;
}
#beige{
background-color: #FFF2CC;
}
#orange{
background-color: #FF9900;
}
#pink{
background-color: #E06666;
}
#brown{
background-color: #7A3A3E;
}
#green{
background-color: #D1CF8D;
}
td{
text-align: center;
padding: 5px;
}
</style>
<script>
var peeStatus = 0;
var pooStatus = 0;

function selectPee(selectedId){
	var pees = document.getElementsByClassName('pee');
	for(var pee of pees){
		pee.setAttribute('style', '');
		pee.value = "";
		pee.setAttribute('name', '');
	}
	var selectedPee = document.getElementById(selectedId);
	selectedPee.setAttribute('name', 'selectedPee');
	selectedPee.setAttribute('style', 'border: 1px solid #F839F9');
	selectedPee.value = "v";
	peeStatus = 1;
}

function selectPoo(selectedId){
	var poos = document.getElementsByClassName('poo');
	for(var poo of poos){
		poo.setAttribute('style', '');
		poo.setAttribute('name', '');
	}
	var selectedPoo = document.getElementById(selectedId);
	selectedPoo.setAttribute('name', 'selectedPoo');
	selectedPoo.setAttribute('style', 'border: 1px solid #F839F9;border-radius:5px;color:#F839F9');
	pooStatus = 1;
}

function loadPeeInfo(){
	window.open("${home}peeInfo", 'window', 'width=850, height=500');
}

function submitFrm(){
	if(peeStatus == 0){
		alert('소변 상태를 체크해주세요');
	}else if(pooStatus == 0){
		alert('대변 상태를 체크해주세요');
	}else{
		document.getElementById('pee').value = document.getElementsByName('selectedPee')[0].id;
		document.getElementById('poo').value = document.getElementsByName('selectedPoo')[0].id;
		document.getElementById('peePooFrm').action = "${home }action/peePooProc";
		document.getElementById('peePooFrm').submit();
	}
}
</script>
<center>
<form id="peePooFrm" method="post">
<table id="peePooTable">
	<tr><td><h3>소변</h3></td></tr>
	<tr><td>
		<input type="button" class="pee" id="yellow" onclick="selectPee(this.id)">
		<input type="button" class="pee" id="beige" onclick="selectPee(this.id)">
		<input type="button" class="pee" id="orange" onclick="selectPee(this.id)">
		<input type="button" class="pee" id="pink" onclick="selectPee(this.id)">
		<input type="button" class="pee" id="brown" onclick="selectPee(this.id)">
		<input type="button" class="pee" id="green" onclick="selectPee(this.id)">
		<input type="button" id="peeInfo" onclick="loadPeeInfo()" value="i">
		<input type="hidden" name="pee" id="pee">
	</td></tr>
	<tr><td><h3>대변</h3></td></tr>
	<tr><td>
		<input type="button" class="poo" id="normal" value="보통" onclick="selectPoo(this.id)">
		<input type="button" class="poo" id="watery" value="무른변" onclick="selectPoo(this.id)">
		<input type="button" class="poo" id="diarrhea" value="설사" onclick="selectPoo(this.id)">
		<input type="button" class="poo" id="rigid" value="단단함" onclick="selectPoo(this.id)">
		<input type="button" class="poo" id="black" value="검은색" onclick="selectPoo(this.id)">
		<input type="button" class="poo" id="red" value="붉은색" onclick="selectPoo(this.id)">
		<input type="hidden" name="poo" id="poo">
	</td></tr>
	<tr><td><h3>특이사항</h3></td></tr>
	<tr>
		<td><textarea id="distanceBtn" name="note" placeholder="+입력하기"></textarea></td>
	</tr>
	<tr><td><input type="button" id="okBtn" onclick="submitFrm()" value="완료"></td></tr>
</table>
</form>
</center>