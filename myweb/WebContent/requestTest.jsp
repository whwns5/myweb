<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>requestTest.jsp</h2>
	사용자 IP : <%=request.getRemoteAddr() %> <br>
	사용자접속 Port : <%=request.getRemotePort() %> <br>
	
	서버의 이름 : <%=request.getServerName() %> <br>
	서버의 서비스포트: <%=request.getServerPort() %> <br>
	
	접속방식 : <%=request.getMethod() %> <br>
	프로토콜 정보 : <%=request.getProtocol() %> <br>
	프로젝트 이름 : <%=request.getContextPath() %> <br>
	
	
</body>
</html>