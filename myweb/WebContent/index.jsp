<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/index.css">
</head>
<body>
	<%@ include file="/header/header.jsp" %>
	<%
		//String section = (String)request.getAttribute("section");	
		String section = request.getParameter("section");
		if(section == null){
			section = "home";
		}
		String sectionStr = "/section/" + section + ".jsp";
	%>
	<jsp:include page="<%=sectionStr%>"></jsp:include>
	
	<%@ include file="/footer/footer.jsp" %>
</body>
</html>