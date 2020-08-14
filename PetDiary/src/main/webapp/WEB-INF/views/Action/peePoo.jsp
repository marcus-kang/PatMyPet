<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
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
</style>
<script>
function selectPee(selectedId){
	var pees = document.getElementsByClassName('pee');
	for(var pee of pees){
		pee.setAttribute('style', '');
		pee.value = "";
	}
	var selectedPee = document.getElementById(selectedId);
	selectedPee.setAttribute('style', 'border: 1px solid #F839F9');
	selectedPee.value = "v";
}

function selectPoo(selectedId){
	var poos = document.getElementsByClassName('poo');
	for(var poo of poos){
		poo.setAttribute('style', '');
	}
	var selectedPoo = document.getElementById(selectedId);
	selectedPoo.setAttribute('style', 'border: 1px solid #F839F9;border-radius:5px;color:#F839F9');
}
</script>
<center>
<table id="peePooTable">
	<tr><td><h3>소변</h3></td></tr>
	<tr><td>
		<input type="button" class="pee" id="yellow" onclick="selectPee(this.id)">
		<input type="button" class="pee" id="beige" onclick="selectPee(this.id)">
		<input type="button" class="pee" id="orange" onclick="selectPee(this.id)">
		<input type="button" class="pee" id="pink" onclick="selectPee(this.id)">
		<input type="button" class="pee" id="brown" onclick="selectPee(this.id)">
		<input type="button" class="pee" id="green" onclick="selectPee(this.id)">
	</td></tr>
	<tr><td><h3>대변</h3></td></tr>
	<tr><td>
		<input type="button" class="poo" id="normal" value="보통" onclick="selectPoo(this.id)">
		<input type="button" class="poo" id="watery" value="무른변" onclick="selectPoo(this.id)">
		<input type="button" class="poo" id="diarrhea" value="설사" onclick="selectPoo(this.id)">
		<input type="button" class="poo" id="rigid" value="단단함" onclick="selectPoo(this.id)">
		<input type="button" class="poo" id="black" value="검은색" onclick="selectPoo(this.id)">
		<input type="button" class="poo" id="red" value="붉은색" onclick="selectPoo(this.id)">
	</td></tr>
	<tr><td><h3>특이사항</h3></td></tr>
	<tr>
		<td><textarea id="distanceBtn" placeholder="+입력하기"></textarea></td>
	</tr>
	<tr><td><input type="button" id="okBtn" value="완료"></td></tr>
</table>
</center>