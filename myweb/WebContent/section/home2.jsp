<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Calendar"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/section/home.css">
</head>
<body>
<section> <!-- 컨텐츠 통 영역 태그(시멘트 태그) -->
	<article id="mainImg"> <!-- 컨텐츠 개별 영역 태그(시멘트 태그) -->
		<img src="img\main.jpg">
	</article>
	<article id="mainMenu">
		<h2>여러분 화이팅합시다!</h2>
		<%
			Cookie cks[] = request.getCookies();
			boolean is_ckVisitTime = false;
		
			if(cks != null){
				System.out.println("1");
				for(int i = 0 ; i < cks.length ; i++){
					if(cks[i].getName().equals("visitTime")){ // 해당 쿠키의 이름이 visitTime 이면
						System.out.println("2");
						String visitTime = URLDecoder.decode( cks[i].getValue() );	
						is_ckVisitTime = true;
		%>				
						<h3> 환영합니다. 마지막 방문은 <%= visitTime %> 입니다.</h3>
		<%
					}
				}
			}
			
			if(is_ckVisitTime == false) {
		%>	
				<h3> 환영합니다. 첫 방문이시군요 .</h3>
		<%	
			}
		%>
		<ul>
			<li>앞으로 수업메뉴는 여기에 추가..</li>
			<li><a href="/myweb/section/paramTest.jsp">파라미터 테스트</a></li>
			<li><a href="/myweb/section/cal.jsp">사칙 계산기</a></li>
			<li><a href="/myweb/section/emp.jsp">사원 관리 프로그램(model1)</a></li>
			<li><a href="/myweb/section/beanTest.jsp">자바빈 테스트</a></li>
			<li><a href="/myweb/section/emp2.jsp">사원관리프로그램(Beans)</a></li>
			<li><a href="/myweb/section/member/memberFind.jsp">회원 검색</a></li>
			<li><a href="/myweb/section/cookieTest.jsp">쿠키 테스트</a></li>
		</ul>
	</article>
	<%
		Calendar cd = Calendar.getInstance();
		int year = cd.get(Calendar.YEAR);
		int month = cd.get(Calendar.MONTH) + 1;
		int day = cd.get(Calendar.DATE);
		
		String visitTime_s = year + "년 " + month + "월 " + day + "일 ";
		visitTime_s = URLEncoder.encode(visitTime_s);
	
		Cookie ck1 = new Cookie("visitTime",visitTime_s);
		ck1.setMaxAge(3);
		response.addCookie(ck1);
	%>
</section>
</body>
</html>