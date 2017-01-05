<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>paramTest3.jsp</h3>
	<%
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String addr = request.getParameter("addr");
		String tel = request.getParameter("tel");
	%>
	<h4>이름 : <%=name %></h4>
	<h4>나이 : <%=age %></h4>
	<h4>주소 : <%=addr %></h4>
	<h4>전화번호 : <%=tel %></h4>
</body>
</html>