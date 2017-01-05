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
		String name = request.getParameter("name");
		String age = request.getParameter("age");
	%>
	<h1>paramTest2.jsp</h1>
	<form name="param2" action="paramTest3.jsp">
		<input type="hidden" name="name" value="<%=name%>"> <!--  사용자에게 보여주지 않고 영역을 차지 하지 않는다. -->
		<input type="hidden" name="age" value="<%=age%>">
		주소 : <input type="text" name="addr"><br>
		전화번호 : <input type="text" name="tel"><br>
		<input type="submit" value="넘기기">
	</form>
</body>
</html>