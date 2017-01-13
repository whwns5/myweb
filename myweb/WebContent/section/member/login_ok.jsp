<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdto" class="yong.member.MemberDTO"/>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="yong.member.MemberDAO"/>
<%
	request.setCharacterEncoding("utf-8");

	int login_result = mdao.loginCheck(mdto.getId(), mdto.getPwd());

	switch (login_result) {
	case 1: // 해당 id가 존재하지 않는 경우.
%>
		<script>
			window.alert('해당 ID가 존재하지 않습니다.');
			location.href = '/myweb/section/member/login.jsp';
		</script>
<%
		break;
	case 2: // 해당 id의 비밀번호가 틀린 경우.
%>
		<script>
			window.alert('패스워드가 틀렸습니다.');
			location.href = '/myweb/section/member/login.jsp';
		</script>
<%
		break;
	case 3: // id와 비밀번호가 모두 일치하는 경우.
%>
		<jsp:setProperty property="name" name="mdto" value="<%= mdao.getUserInfo(mdto.getId()) %>"/>
<%
		session.setAttribute("login_id", mdto.getId() );
		session.setAttribute("login_name", mdto.getName() );
		String cbSaveId = request.getParameter("cbSavaId");
		if(cbSaveId != null && cbSaveId.equals("on")){ // ID 기억 체크시
			Cookie ck1 = new Cookie("saveId", URLEncoder.encode(mdto.getId()) );
			ck1.setMaxAge(60*60*24*30);
			response.addCookie(ck1);
		} else {
			Cookie ck1 = new Cookie("saveId", "" );
			ck1.setMaxAge(0);
			response.addCookie(ck1);
		}
%>
		<script>
			window.alert('<%= mdto.getName() %> 님 환영합니다 !');
			opener.location.reload();
			window.self.close();
		</script>
<%
		break;
	default:
		break;
	}
	
%>