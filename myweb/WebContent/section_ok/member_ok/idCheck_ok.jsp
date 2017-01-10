<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="yong.member.MemberDAO"/>
<%
	String id = request.getParameter("id");
	boolean result = mdao.idCheck(id);
	if(result){ // true -> 해당 아이디 존재
%>
		<script>
			window.alert('이미 가입된 ID 입니다.');
			location.href = '/myweb/section/member/idCheck.jsp';
		</script>
<%					 
	} else {
%>
		<script>
			window.alert('<%=id%>는 사용 가능한 ID 입니다.');
			opener.join_ok.id.value = '<%=id%>';
			window.self.close();
		</script>	
<%
	}
%>