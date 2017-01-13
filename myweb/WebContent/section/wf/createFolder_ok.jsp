<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="wf" class="yong.wf.WebFolderDAO" scope="session"/>
<%
	String folderName = request.getParameter("folderName");
	boolean result = false;
	if(folderName == null || folderName.equals("") || folderName.equals("새폴더")){
		result = wf.createFolder();
	} else {
		if(wf.isExistFolder(folderName)){
%>
			<script>
				window.alert('해당 폴더가 존재합니다 !');
				location.href = '/myweb/section/wf/webFolder2.jsp?cr=<%=wf.getCrPath()%>';
			</script>
<%
		} else {
			result = wf.createFolder(folderName);
		}
	}
	
	if(result){
%>
		<script>
			location.href = '/myweb/section/wf/webFolder2.jsp?cr=<%=wf.getCrPath()%>';
		</script>
<%
	} else {
%>
		<script>
			window.alert('폴더 생성 실패 !');
			location.href = '/myweb/section/wf/webFolder2.jsp?cr=<%=wf.getCrPath()%>';
		</script>
<%
	}
%>


