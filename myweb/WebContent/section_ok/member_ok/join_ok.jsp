<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdto" class="yong.member.MemberDTO"/>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="yong.member.MemberDAO"/>
<%
	request.setCharacterEncoding("utf-8");
	int result = mdao.memberJoin(mdto);
	String msg = result > 0 ? "회원가입이 완료 되었습니다. 축하드립니다." : "회원가입에 실패 하였습니다.!";
%>
<script>
	window.alert('<%=msg%>');
	location.href = '/myweb/index.jsp';
</script>