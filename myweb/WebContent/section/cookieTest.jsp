<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>cookieTest.jsp</h2>
<%
	// 1. 쿠키들을 가져옴
	Cookie cks[] = request.getCookies();

	// 2. 쿠키는 항상 널 체크를 해줘야 한다.
	if(cks != null){
		for(int i = 0 ; i < cks.length ; i++){
			String key = cks[i].getName();
			//String value = cks[i].getValue();
			String value = URLDecoder.decode(cks[i].getValue());
			out.println("<h3>KEY : " + key + " / VALUE : " + value + "</h3>"); 
		}
	}
	
	
%>
<hr>
<%
	// 1. 쿠키 생성
	String id = "hong";
	id = URLEncoder.encode(id);
	Cookie ck1 = new Cookie("id",id);
	
	// 2. 나이를 지정
	ck1.setMaxAge(60*3);
	// 3. 사용자 심기
	response.addCookie(ck1);
	
	// Cookie ck2 = new Cookie("name","honggildong");
	// 쿠키는 1바이트로만 저장하기 때문에 2바이트 문자열을 저장할 수 없다.
	// Cookie ck2 = new Cookie("name","홍길동");
	String name = "홍길동";
	name = URLEncoder.encode(name);
	Cookie ck2 = new Cookie("name",name);
	
	ck2.setMaxAge(60*3);
	response.addCookie(ck2);
%>
<h3>쿠키 설정 완료!</h3>
</body>
</html>