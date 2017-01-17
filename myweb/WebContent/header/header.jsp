<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/myweb/css/header/header.css?ver=3">
<script>
function loginOpen() {
	window.open('/myweb/section/member/login.jsp', 'login', 'width=400,height=335,left=600,top=400');
}
function logOut() {
	location.href = '/myweb/section/member/logOut_ok.jsp';
}
</script>
<header> <!-- 상단 영역 태그(시멘트 태그) -->
	<div>
	<%
		String login_id = (String) session.getAttribute("login_id");
		String login_name = (String) session.getAttribute("login_name");

		if(login_id != null){ // id 세션에 값이 있을 경우.. 로그인 상태
	%>
			<p><%=login_name%> 님 로그인 중~ |
	 		<a href="javascript:logOut();">로그아웃</a></p>
	<%		
		} else { // 비로그인 상태
	%>
			<p><a href="javascript:loginOpen();">로그인</a> |
	 		<a href="/myweb/section/member/join.jsp">회원가입</a></p>
	<%		
		}
	%>
	
	<h1>JSP Study Site</h1>
	<nav> <!-- 메뉴 영역 태그(시멘트 태그) -->
		<ul>
			<li><a href="/myweb/section/home.jsp">HOME</a></li>
			<li><a href="/myweb/section/profile.jsp">Profile</a></li>
			<li><a href="/myweb/section/bbs/bbsList.jsp">BBS</a></li>
			<li><a href="/myweb/section/bbs/bbsList_t.jsp">BBS2</a></li>
			<li><a href="/myweb/section/wf/webFolder.jsp">WebFolder</a></li>
			<li><a href="/myweb/section/wf/webFolder2.jsp">WebFolder2</a></li>
			<li><a href="#">GuestBook</a></li>
		</ul>
	</nav>
	<hr>
	</div>
</header>