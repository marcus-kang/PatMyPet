<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
input[type=button]{
background-color: #F2BED6;
border: 0px;
border-radius: 5px;
color: white;
}
</style>
<script>
function deleteButton(deleteClassName){
	var deleteElem = document.getElementsByClassName(deleteClassName);
    while(deleteElem.length > 0){
    	deleteElem[0].parentNode.removeChild(deleteElem[0]);
    }
}

var count = 1;
var eattime = document.getElementById('eattime');
var food = document.getElementById('food');

if('${diaryList.eattime}' !== null && '${diaryList.eattime}' !== ""){
	var eattimeArr = '${diaryList.eattime}';
	var eattimeLst = eattimeArr.split('/');
	var foodArr = '${diaryList.food}';
	var foodLst = foodArr.split('/');
	
	for(var i=0;i<eattimeLst.length;i++){
		addEat(eattimeLst[i].substring(0,2), eattimeLst[i].substring(2,4), foodLst[i]);
	}
}

function addEat(eathourLog, eatminLog, foodLog){
	var addDiv = document.createElement('div');
	addDiv.className = 'a'+count;
	
	var addHour = document.createElement('select');
	var addMin = document.createElement('select');
	for(var i=0;i<24;i++){
		var opt = document.createElement('option');
		if(i<10){
			opt.value = "0"+i;
			opt.text = "0"+i;
		}else{
			opt.value = i;
			opt.text = i;
		}
		addHour.add(opt, null);
	}
	for(var i=0;i<60;i++){
		var opt = document.createElement('option');
		if(i<10){
			opt.value = "0"+i;
			opt.text = "0"+i;
		}else{
			opt.value = i;
			opt.text = i;
		}
		addMin.add(opt, null);
	}
	addHour.className = 'eathours';
	addMin.className = 'eatmins';
	
	var addFood = document.createElement('input');
	addFood.type = 'text';
	addFood.className = 'foods';
	addFood.placeholder = '식사내용';
	
	if(eathourLog !== null && eathourLog !== "" && eatminLog !== null && eatminLog !== "" && foodLog !== null && foodLog !== ""){
		addHour.value = eathourLog;
		addMin.value = eatminLog;
		addFood.value = foodLog;
	}else{
		addHour.options[0].selected == true;
		addMin.options[0].selected == true;
		addFood.value = "";
	}
	
	var deleteBtn = document.createElement('input');
	deleteBtn.type = 'button';
	deleteBtn.value = '삭제';
	deleteBtn.className = 'a'+count;
	deleteBtn.setAttribute('onclick', 'deleteButton(this.className)');
	
	addDiv.appendChild(addHour);
	addDiv.appendChild(addMin);
	addDiv.appendChild(addFood);
	addDiv.appendChild(deleteBtn);
	document.getElementById('inputEat').appendChild(addDiv);
	count++;
}

function submitFrm() {
	var eathours = document.getElementsByClassName('eathours');
	var eatmins = document.getElementsByClassName('eatmins');
	var foods = document.getElementsByClassName('foods');
	
	var okGo = 0;
	for (var i = 0; i < foods.length; i++) {
		if (foods[i].value == "") {
			alert('식사내용을 입력해주세요');
			okGo = 1;
			break;
		} else {
			if (i == 0) {
				eattime.value = eathours[i].options[eathours[i].selectedIndex].value + eatmins[i].options[eatmins[i].selectedIndex].value;
				food.value = foods[i].value;
			} else {
				eattime.value = eattime.value + "/" + eathours[i].options[eathours[i].selectedIndex].value + eatmins[i].options[eatmins[i].selectedIndex].value;
				food.value = food.value + "/" + foods[i].value;
			}
		}
	}
	
	if(okGo == 0){
		alert('eattime.value : '+eattime.value+' / food.value : '+food.value);
		document.getElementById('eatFrm').action = "${home }action/eatProc";
		document.getElementById('eatFrm').submit();
	}
}
</script>
<center>
<form id="eatFrm" method="post">
<table id="eatTable">
	<tr><td><h3>식사</h3></td></tr>
	<tr>
		<td><div id="inputEat"></div><input type="button" value="+추가하기" onclick="addEat('','','')"></td>
	</tr>
	<tr><td>
		<input type="hidden" name="eattime" id="eattime">
		<input type="hidden" name="food" id="food">
	</td></tr>
	<tr><td><input type="button" id="okBtn" onclick="submitFrm()" value="완료"></td></tr>
</table>
</form>
</center>