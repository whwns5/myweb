<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/index.css">
<link rel="stylesheet" type="text/css" href="/myweb/css/section/bbs/bbsWrite.css">
</head>
<body>
	<%@ include file="/header/header.jsp" %>
	<section>
		<article>
			<form class="form-container" name="bbsWrite_ok" action="/myweb/section/bbs/bbsWrite_ok.jsp">
			<div class="form-title"><h2>글쓰기</h2></div>
			<br />
			<div class="form-title">이름<input class="form-field form-field-id" type="text" name="writer"/>
									비밀번호<input class="form-field form-field-pwd" type="password" name="pwd"/>
			</div>
			<br />
			<div class="form-title">제목<input class="form-field form-field-subject" type="text" name="subject"/>	
			</div>
			<br />
			<div class="form-title"><textarea rows="20" cols="68" name="content"></textarea>
			</div>
			<div class="submit-container">
				<input class="submit-button" type="submit" value="작성하기">
				<input class="submit-button" type="reset" value="다시작성">
			</div>
			</form>
		</article>
	</section>
	<%@ include file="/footer/footer.jsp" %>
</body>
</html>