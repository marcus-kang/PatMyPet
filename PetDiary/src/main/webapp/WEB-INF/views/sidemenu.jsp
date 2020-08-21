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
font-size: 20;
}
#menubar{
padding: 5px;
margin: auto;
width: 20%;
height: 500px;
background-color: #B1DAFF;
border: 1px solid black;
border-radius: 5px;
}
#loginInfo{
margin-top: 10px;
width:200px;
background-color: #F6F2CB;
height:120px;
border-radius: 5px;
font-size: 25px;
}
#logoutBtn{
margin: 10px;
background-color: #9DADBC;
border: 1px solid black;
border-radius: 5px;
color: white;
}
table{
padding: 10px;
}
#menuList input[type=button]{
width: 200px;
background-color: #F2BED6;
border: 0px;
border-radius: 5px;
color: white;
}
td{
text-align: center;
height: 30px;
}
</style>
<center>
<div id="menubar">
<div id="loginInfo">
<br/>ID : guest
<br/>이름 : 견주
<br/>
<input type="button" id="logoutBtn" value="logout">
</div>
<br/>
<table id="menuList">
	<tr>
		<td><input type="button" value="Home"></td>
	</tr>
	<tr>
		<td><input type="button" value="관리일지"></td>
	</tr>
	<tr>
		<td><input type="button" value="일일/주간미션"></td>
	</tr>
	<tr>
		<td><input type="button" value="주변시설찾기"></td>
	</tr>
	<tr>
		<td><input type="button" value="펫시터"></td>
	</tr>
	<tr>
		<td><input type="button" value="mypage"></td>
	</tr>
</table>
</div>
</center>