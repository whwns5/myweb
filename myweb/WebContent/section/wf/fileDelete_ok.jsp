<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="wf" class="yong.wf.WebFolderDAO" scope="session"/>
<%
	String deleteFileName = request.getParameter("deleteFileName");
	File f = new File(wf.USERS_HOME + "/" + wf.getCrPath() + "/" + deleteFileName);

	if(f.delete()){
%>	
		<script>
			window.alert('파일 삭제 성공!');
			location.href = '/myweb/section/wf/webFolder2.jsp?cr=<%=wf.getCrPath()%>';
		</script>
<% 		
	} else {
%>
		<script>
			window.alert('해당 폴더안에 파일이 존재합니다.');
			location.href = '/myweb/section/wf/webFolder2.jsp?cr=<%=wf.getCrPath()%>';
		</script>
<%
	}
%>
