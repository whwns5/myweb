<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String str = request.getParameter("str");
	String str2 = "Jsp";
	String temp = request.getParameter("temp");
%>
<h3 style="color: blue">sub.jsp에서 출력한 문장 A</h3>
<h3 style="color: blue">sub.jsp에서 출력한 str2의 값 : <%=str2 %></h3>
<h3 style="color: pink">sub.jsp에서 출력한 super의 str의 값 : <%=str %></h3>
<h3 style="color: green">파라미터값 : <%=temp %></h3>
<h3 style="color: blue">sub.jsp에서 출력한 문장 B</h3>
</body>
</html>