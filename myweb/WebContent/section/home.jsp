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
<link rel="stylesheet" type="text/css" href="/myweb/css/index.css">
<link rel="stylesheet" type="text/css" href="/myweb/css/section/home.css">
<script>
	function popupOpen() {
		window.open('/myweb/section/popup.jsp', 'popup', 'width=285,height=300,left=600,top=400');
	}
</script>
</head>
<%
	Cookie cks[] = request.getCookies();
	boolean isckVisitTime = false;
	String popupck = null;
	//boolean isCheckNoticeNoSee = false; // 공지사항 보지 않기 속성 초기화
	String visitTime_s = null;

	
	if (cks != null) {
		for (int i = 0; i < cks.length; i++) {
			if (cks[i].getName().equals("visitTime")) { // 해당 쿠키의 이름이 visitTime 이면
				visitTime_s = URLDecoder.decode(cks[i].getValue());
				isckVisitTime = true;
			}
			if (cks[i].getName().equals("popupck")) {
				popupck = cks[i].getValue();		
			}
		}
	}
%>
<body <%= popupck == null ? "onload='popupOpen()'" : "" %> >
	<%@ include file="/header/header.jsp" %>
	
	<section> <!-- 컨텐츠 통 영역 태그(시멘트 태그) -->
		<article id="mainImg"> <!-- 컨텐츠 개별 영역 태그(시멘트 태그) -->
			<img src="/myweb/img/main.jpg">
		</article>
		<article id="mainMenu">
			<h2>여러분 화이팅합시다!</h2>
			<%
				if(isckVisitTime) {
			%>	
					<h3> 환영합니다. 마지막 방문은 <br><%= visitTime_s %> 입니다.</h3>
			<%	
				} else {
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
				<li><a href="/myweb/scopeTest.html">SCOPE 테스트</a></li>
				<li><a href="/myweb/sessionTest.jsp">SESSION 테스트</a></li>
			</ul>
		</article>
		<%
			Calendar cd = Calendar.getInstance();
			int year = cd.get(Calendar.YEAR);
			int month = cd.get(Calendar.MONTH) + 1;
			int day = cd.get(Calendar.DATE);
			
			visitTime_s = year + "년 " + month + "월 " + day + "일 ";
			visitTime_s = URLEncoder.encode(visitTime_s);
		
			Cookie ck1 = new Cookie("visitTime",visitTime_s);
			//ck1.setMaxAge(3);
			ck1.setMaxAge(60*60*24*30); // 한달간 살아있도록
			response.addCookie(ck1);
		%>
	</section>

	<%@ include file="/footer/footer.jsp" %>
</body>
</html>