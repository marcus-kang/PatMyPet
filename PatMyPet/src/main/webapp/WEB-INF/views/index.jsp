<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="home" value="/" />
<!DOCTYPE html>
<html>
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
margin: auto;
width: 70%;
background-color: #CFE2F3;
border: 1px solid black;
border-radius: 5px;
}
</style>
<body>
<form id="frm" method="post">
	<input type="hidden" name="petId" id="petId">
	<input type="hidden" name="date" id="date">
</form>
<div id=diaryContainer>
	<table style="width:800px;height:800;">
		<tr>
			<td style="height:80px;"><%@ include file="common/top.jspf" %></td>
		</tr>
		<tr>
			<td style="height:250px;"><div id="logContainer"><c:import url="${home }${formPath }"/></div></td>
		</tr>
		<tr>
			<td></td>
		</tr>
	</table>
</div>
</body>
</html>