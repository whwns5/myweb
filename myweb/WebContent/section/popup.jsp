<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="width: 250px;height:250px;border:2px double gray;">
		<h2 style="text-align: center;">공 지 사 항</h2>
		<h3>1. 지각, 결석을 하지맙시다.</h3>
		<h3>2. 복습을 철처히 합시다.</h3>
		<h3>3. 건관관리 유의 합시다.</h3>
	</div>
	<form name="fm" action="/myweb/section/popup_ok.jsp">
		<input type="checkbox" name="popupck" value="on">오늘 하루 창 보이지 않기
		<input type="submit" value="닫기">
	</form>
</body>
</html>