<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>sessionTest.jsp</h2>
	<%
		String keys[] = session.getValueNames();
		if(keys != null){
			for(int i = 0 ; i < keys.length ; i++){
				out.println("<h3>KEY : " + keys[i] + "/ VALUES : " + session.getAttribute(keys[i]) + "</h3>");
			}
		}
	
	%>
	<hr>
	<%
		session.setAttribute("name", "홍길동");
		session.setAttribute("age", 10); // 오토 박싱 -> Integer 객체로
	%>

</body>
</html>