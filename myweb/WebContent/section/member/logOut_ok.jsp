<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session.removeAttribute("login_id");
	//session.removeAttribute("login_name");
	session.invalidate();
	response.sendRedirect("/myweb/section/home.jsp");
%>
