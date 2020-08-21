<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
li{
text-align: left;
}
.pee{
width: 30px;
height: 30px;
text-align: center;
border-radius: 50%;
border: 1px solid black;
color: #00A651;
font: bold;
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
function highlightLi(liNo){
	var liLst = document.getElementsByClassName('li');
	for(var l=0;l<liLst.length;l++){
		liLst[l].style.background = "";
	}
	document.getElementById('li'+liNo).style.background = '#FAF4C0';
}
</script>
<center>
<h3>소변 색으로 알아보는 건강 상태</h3>
<input type="button" class="pee" id="yellow" onclick="highlightLi(this.value)" value="1">
<input type="button" class="pee" id="beige" onclick="highlightLi(this.value)" value="2">
<input type="button" class="pee" id="orange" onclick="highlightLi(this.value)" value="3">
<input type="button" class="pee" id="pink" onclick="highlightLi(this.value)" value="4">
<input type="button" class="pee" id="brown" onclick="highlightLi(this.value)" value="5">
<input type="button" class="pee" id="green" onclick="highlightLi(this.value)" value="6">
<label>←소변색을 클릭하세요</label>
<ul>
	<li class="li" id="li1">1번: 가장 이상적인 소변색</li>
	<li class="li" id="li2">2번: 색이 옅고 투명한 느낌 - 신장 기능 문제로 수분이 체외로 빠져나갈 때, 만성 신부전으로 진행될 가능성</li>
	<li class="li" id="li3">3번: 진한 노란색 - 탈수 또는 음수량 저하로 체내 수분 저하. 적은 수분으로 농축되어 색이 짙음</li>
	<li class="li" id="li4">4번: 빨간 혈뇨 - 방광염, 요로결석 등 비뇨기 질환 의심. 또는 양파 중독 가능성. 수의사와 상담 요망</li>
	<li class="li" id="li5">5번: 짙은 갈색 - 심한 방광염 또는 간 질환 의심. 간 질환의 경우 눈에 황달 증상 동반. 수의사와 상담 요망</li>
	<li class="li" id="li6">6번: 옅은 녹색 - 식단 변화에 따른 식용 색소 섭취 의심. 요로 감염증 가능성도 있으니 주의 요망</li>
</ul>
</center>