<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="edto" class="yong.emp.EmpDTO"/>
<jsp:setProperty property="*" name="edto"/>
<jsp:useBean id="edao" class="yong.emp.EmpDAO"/>
<%
	int result = edao.empUpdate(edto);
	String msg = result > 0 ? "사원 수정 성공!" : "사원 수정 실패!";
%>
<script>
	window.alert('<%=msg%>');
	location.href = '/myweb/section/emp2.jsp';
</script>