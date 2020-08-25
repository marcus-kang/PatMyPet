<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="home" value="/" />
<style>
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
.typeOpt{
word-break:break-word;
}
</style>
<script>
var genderStatus = 0;
var petTypeStatus = 0;
var speciesStatus = 0;

function selectGender(selectedId){
	var genders = document.getElementsByClassName('gender');
	for(var gender of genders){
		gender.setAttribute('name', '');
		gender.checked = false;
	}
	var selectedGender = document.getElementById(selectedId);
	selectedGender.setAttribute('name', 'selectedGender');
	selectedGender.checked = true;
	genderStatus = 1;
}

function selectPetType(selectedId){
	var petTypes = document.getElementsByClassName('petType');
	for(var petType of petTypes){
		petType.checked = false;
		petType.setAttribute('name', '');
	}
	var typeOpt = document.getElementsByClassName('typeOpt');
	for(var opt of typeOpt){
		opt.style.display = "none";
	}
	document.getElementById(selectedId+'Type').style.display = "block";
	var selectedPetType = document.getElementById(selectedId);
	selectedPetType.setAttribute('name', 'selectedPetType');
	selectedPetType.checked = true;
	if(selectedPetType.id == 'dog')	petTypeStatus = 1;
	else petTypeStatus = 2;
}

function selectSpecies(selectedId){
	var dogList = document.getElementsByClassName('dogList');
	var catList = document.getElementsByClassName('catList');
	for(var dog of dogList){
		dog.setAttribute('style', '');
		dog.setAttribute('name', '');
	}
	for(var cat of catList){
		cat.setAttribute('style', '');
		cat.setAttribute('name', '');
	}
	var selectedSpecies = document.getElementById(selectedId);
	selectedSpecies.setAttribute('name', 'selectedPetSpecies');
	selectedSpecies.setAttribute('style', 'border: 1px solid #F839F9;border-radius:5px;color:#F839F9');
	if(selectedSpecies.className == 'dogList')	speciesStatus = 1;
	else speciesStatus = 2;
}

function submitFrm(){
	if(document.getElementById('petname').value ==""){
		alert('이름을 입력해주세요');
		document.getElementById('petname').focus();
	}else if(genderStatus == 0){
		alert('성별을 체크해주세요');
	}else if(petTypeStatus == 0){
		alert('반려동물 종류를 체크해주세요');
	}else if(speciesStatus == 0){
		alert('반려동물 품종을 체크해주세요');
	}else if(speciesStatus != petTypeStatus){
		alert('반려동물 품종을 체크해주세요');
	}else{
		document.getElementById('petgender').value = document.getElementsByName('selectedGender')[0].id;
		document.getElementById('pettype').value = document.getElementsByName('selectedPetType')[0].id;
		document.getElementById('petspecies').value = document.getElementsByName('selectedPetSpecies')[0].id;
		document.getElementById('addPetFrm').action = "${home }action/addPetProc";
		document.getElementById('addPetFrm').submit();
	}
}
</script>
<center>
<form id="addPetFrm" method="post">
<table id="addPetTable">
	<tr><td colspan="2"><h3>반려동물 추가</h3></td></tr>
	<tr><td>이름</td><td><input type="text" name="petname" id="petname"></td></tr>
	<tr>
	<td>생년월일</td>
	<td>
	<input type="date" name="date" id="date" value="2000-01-01">
	<%-- <select id="birthYear">
		<%for(int i=2000;i<2021;i++){ %>
			<option value="<%=i %>"><%=i %></option>
		<%} %>
	</select>년
	<select id="birthMonth">
		<%for(int i=1;i<13;i++){ %>
			<option value="<%=i %>"><%=i %></option>
		<%} %>
	</select>월
	<select id="birthDay">
		<%for(int i=1;i<32;i++){ %>
			<option value="<%=i %>"><%=i %></option>
		<%} %>
	</select>일
		<input type="hidden" name="petbirth" id="petbirth"> --%>
	</td>
	</tr>
	<tr>
	<td>성별</td>
	<td>
		남<input type="radio" class="gender" id="m" onclick="selectGender(this.id)">
		/
		여<input type="radio" class="gender" id="w" onclick="selectGender(this.id)">
		<input type="hidden" name="petgender" id="petgender">
	</td>
	</tr>
	<tr>
	<td>반려동물 종류</td>
	<td>
		반려견<input type="radio" class="petType" id="dog" onclick="selectPetType(this.id)">
		/
		반려묘<input type="radio" class="petType" id="cat" onclick="selectPetType(this.id)">
		<input type="hidden" name="pettype" id="pettype">
	</td></tr>
	<tr>
	<td>품종</td>
	<td>
	<div id="dogType" class="typeOpt" style="display:none;">
	<input type="button" class="dogList" id="maltese" value="말티즈" onclick="selectSpecies(this.id)">
	<input type="button" class="dogList" id="poodle" value="푸들" onclick="selectSpecies(this.id)">
	<input type="button" class="dogList" id="pome" value="포메라니안" onclick="selectSpecies(this.id)">
	<input type="button" class="dogList" id="shitzu" value="시츄" onclick="selectSpecies(this.id)">
	<input type="button" class="dogList" id="chihuahua" value="치와와" onclick="selectSpecies(this.id)"><br/>
	<input type="button" class="dogList" id="dachshund" value="닥스훈트" onclick="selectSpecies(this.id)">
	<input type="button" class="dogList" id="retriever" value="리트리버" onclick="selectSpecies(this.id)">
	<input type="button" class="dogList" id="corgi" value="웰시코기" onclick="selectSpecies(this.id)">
	<input type="button" class="dogList" id="bichon" value="비숑" onclick="selectSpecies(this.id)">
	<input type="button" class="dogList" id="shiba" value="시바견" onclick="selectSpecies(this.id)"><br/>
	<input type="button" class="dogList" id="spitz" value="스피츠" onclick="selectSpecies(this.id)">
	<input type="button" class="dogList" id="etcDog" value="기타" onclick="selectSpecies(this.id)">
	</div>
	<div id="catType" class="typeOpt" style="display:none;">
	<input type="button" class="catList" id="scottish" value="스코티쉬폴드" onclick="selectSpecies(this.id)">
	<input type="button" class="catList" id="russian" value="러시안블루" onclick="selectSpecies(this.id)">
	<input type="button" class="catList" id="munchkin" value="먼치킨" onclick="selectSpecies(this.id)">
	<input type="button" class="catList" id="persian" value="페르시안" onclick="selectSpecies(this.id)">
	<input type="button" class="catList" id="siamese" value="샴" onclick="selectSpecies(this.id)"><br/>
	<input type="button" class="catList" id="bengal" value="벵갈" onclick="selectSpecies(this.id)">
	<input type="button" class="catList" id="british" value="브리티쉬숏헤어" onclick="selectSpecies(this.id)">
	<input type="button" class="catList" id="turkish" value="터키쉬앙고라" onclick="selectSpecies(this.id)">
	<input type="button" class="catList" id="abyssinian" value="아비시니안" onclick="selectSpecies(this.id)">
	<input type="button" class="catList" id="sphinx" value="스핑크스" onclick="selectSpecies(this.id)"><br/>
	<input type="button" class="catList" id="etcCat" value="기타" onclick="selectSpecies(this.id)">
	</div>
	<input type="hidden" name="petspecies" id="petspecies">
	</td>
	</tr>
	<tr><td colspan="2"><input type="button" id="okBtn" onclick="submitFrm()" value="완료"></td></tr>
</table>
</form>
</center>