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
	String str = "Java";
%>
<h3 style="color:red;">super.jsp 에서 출력한 문장 A</h3>
<h3 style="color:red;">super.jsp 에서 출력한 str 의 값 : <%=str%></h3>

<jsp:include page="sub.jsp">
<jsp:param value="<%=str%>" name="str"/>
</jsp:include>

<h3 style="color:red;">super.jsp 에서 출력한 문장 B</h3>
</body>
</html>