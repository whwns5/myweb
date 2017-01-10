<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/index.css">
<link rel="stylesheet" type="text/css" href="/myweb/css/section/member/join.css?ver=2">
<script>
	function returnPage() {
		location.href = '/myweb/index.jsp';
	}
	function showIdCheck() {
		window.open('/myweb/section/member/idCheck.jsp', 'idCheck', 'width=370,height=230,left=600,top=400'); // 불러올 html, 식별자, 속성
	}
</script>
</head>
<body>
	<%@ include file="/header/header.jsp" %>
	
	<section style="background-image: url('/myweb/img/join/join_background.jpg'); background-repeat: no-repeat; background-position: center, center;">
		<article>
			<form style="opacity: 0.9;" class="form-container" name="join_ok" action="/myweb/section_ok/member_ok/join_ok.jsp" >
				<div class="form-title"><h2>회원 가입</h2></div>
				
				<div class="form-title">아이디</div>
				<input class="form-field-id form-field" type="text" name="id" readonly="readonly" />
				<input class="submit-button" type="button" value="중복검사" onclick="showIdCheck();"><br />

				
				<div class="form-title">비밀번호</div>
				<input class="form-field" type="text" name="pwd"/><br />
				
				<div class="form-title">이름</div>
				<input class="form-field" type="text" name="name"/><br />
				
				<div class="form-title">전화번호</div>
				<input class="form-field" type="text" name="tel"/><br />
				
				<div class="form-title">주소</div>
				<input class="form-field" type="text" name="addr"/><br />
				
				<div class="submit-container">
				<input class="submit-button" type="submit" value="가입">
				<input class="submit-button" type="button" value="돌아가기" onclick="returnPage();">
				</div>
			
			</form>
		</article>
	</section>
	
	<%@ include file="/footer/footer.jsp" %>
</body>
</html>