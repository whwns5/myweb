<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/section/member/idCheck.css">
<%
	
	String result = "";
	String checkId = "";
	result = request.getParameter("result");
	checkId = request.getParameter("checkId");

	if(result != null && result.equals("false")){
%>
		<script>
			opener.join_ok.id.value = '<%=checkId%>';
			window.self.close();
		</script>
<%
	}
%>
</head>
<body>
	<article>
		<form class="form-container" name="idCheck_ok" action="/myweb/section_ok/member_ok/idCheck_ok.jsp">
			<div class="form-title"> <h2>중복 검사</h2> </div>
			<div class="form-title">ID</div>
			<input class="form-field" type="text" name="id">
			<div class="submit-container">
				<input class="submit-button" type="submit" value="중복 검사">
			</div>
		</form>
	</article>
</body>
</html>