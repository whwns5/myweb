<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/index.css">
<link rel="stylesheet" type="text/css" href="/myweb/css/section/member/memberFind.css?ver=2">
</head>
<body>
	<%@ include file="/header/header.jsp" %>
	
	<section>
		<article>
			<div style="opacity: 0.9;" class="form-container">
				<form name="memberFind" action="/myweb/section/member/memberFind.jsp" method="post">
					<div class="form-title"><h2>회원 검색</h2></div>
					
					<select class="form-select" name="fkey">
						<option value="ID">ID</option>
						<option value="이름">이름</option>
					</select>
					
					<input class="form-field-id form-field" type="text" name="fvalue" required="required">
					<input class="submit-button" type="submit" value="검색">
				</form>
				<%
					//if(fvalue != null){
					if(request.getMethod().equals("POST")){
				%>
						<jsp:include page="/section/member/result.jsp"/>
				<%
					} else {
				%>
						<div class="form-title"><h2>위 검색칸에 검색어 입력</h2></div>
				<%					
					}
				%>
			</div>
		</article>
	</section>
	
	<%@ include file="/footer/footer.jsp" %>
</body>
</html>