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
	<section>
		<article>
			<h2>파라미터 테스트</h2>
									<!-- 처리 페이지 -->
			<form name="fm" action="/myweb/section_ok/paramTest_ok.jsp">
			<fieldset>
				<legend>테스트 입력 목록</legend>
				<ul>
					<li>이름 : <input type="text" name="name"></li>
					<li>비밀번호 : <input type="password" name="pwd"></li>
					<li>성별 : <input type="radio" name="se" value="남자">남자
							  <input type="radio" name="se" value="여자">여자
							  <input type="radio" name="se" value="트랜스">트랜스
					</li>
					<li>취미 : <input type="checkbox" name="cb" value="독서">독서
							  <input type="checkbox" name="cb" value="공부">공부
							  <input type="checkbox" name="cb" value="운동">운동
							  <input type="checkbox" name="cb" value="게임">게임
							  <input type="checkbox" name="cb" value="잠자기">잠자기		
					</li>
				</ul>
				<p><input type="submit" value="넘기기">
					<input type="reset" value="다시작성">
				</p>
			</fieldset>	
			</form>
		</article>
	</section>
	<%@ include file="/footer/footer.jsp" %>

</body>
</html>