<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/section/member/login.css?ver=2">
</head>
<body style="background-image: url('/myweb/img/join/login_background.ico'); background-repeat: no-repeat; background-position: center, center;">
	<section>
	<article>
		<form style="opacity: 0.9;" class="form-container" name="login_ok" action="/myweb/section/member/login_ok.jsp" method="post">
			<div class="form-title"> <h2>로그인</h2> </div>
			<div class="form-title">ID</div>
			<%
				Cookie cks[] = request.getCookies();
				String saveId = "";
			
				if(cks != null){
					for(int i = 0 ; i < cks.length ; i++){
						if( cks[i].getName().equals("saveId") ){
							saveId = URLDecoder.decode( cks[i].getValue() );
						}
					}
				}
			%>
			<input class="form-field" type="text" name="id" value="<%=saveId%>" placeholder="아이디">
			<div class="form-title">PWD</div>
			<input class="form-field" name="pwd" placeholder="비밀번호" type="password">
			<input class="form-title" type="checkbox" name="cbSavaId" value="on" <%=saveId.equals("") ? "" : "checked"%>>ID 기억
			<div class="submit-container">
 				<input class="submit-button" type="submit" value="로그인">
			</div>
		</form>
	</article>
	</section>
</body>
</html>