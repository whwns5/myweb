<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<jsp:useBean id="wf" class="yong.wf.WebFolderDAO" scope="session"/>
<%
	String savepath = wf.USERS_HOME + "/" + wf.getCrPath();
	
	try{
		MultipartRequest mr = 
				new MultipartRequest(request, savepath, wf.getFreeSize(), "utf-8");
		
%>
		<script>
			window.alert('파일 업로드 성공!');
			opener.location.href = 'webFolder2.jsp?cr=<%=wf.getCrPath()%>';
			window.self.close();
		</script>
<%
	} catch(Exception e) {
%>
		<script>
			window.alert('업로드 실패!');
			window.self.close();
		</script>	
<%
	}
	
	
%>