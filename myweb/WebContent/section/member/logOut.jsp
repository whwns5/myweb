<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("login_id");
	session.removeAttribute("login_name");
%>
<script>
	location.href = '/myweb/section/home.jsp';
</script>