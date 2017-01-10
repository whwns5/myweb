<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="stest" class="yong.bean.ScopeTest" scope="application" />
	<jsp:setProperty property="count" name="stest"/>
	<h3 style="color: red;">count의 값 : <jsp:getProperty property="count" name="stest"/></h3>
	
	<a href="scopeTest_ok.jsp">다음 페이지로 ....</a>
	
</body>
</html>