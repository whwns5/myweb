<%@page import="java.io.File"%>
<%@page import="yong.wf.UserFileDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="wf" class="yong.wf.WebFolderDAO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/index.css">
<style>
h2{
	text-align: center;
	color: skyblue;
}
fieldset{
	width: 550px;
	margin: 0px auto;
}
section li{
	list-style-type: none;
}
label{
	width: 100px;
	float: left;
}
meter{
	width: 350px;
}
table{
	width: 500px;
	border-top: 2px double darkblue;
	border-bottom: 2px double darkbluel;
	margin: 10px auto;
}
</style>
</head>
<%
	String sid = (String) session.getAttribute("login_id");
	if(sid == null){
%>
		<script>
			window.alert('로그인후 이용가능한 서비스입니다.');
			location.href = '/myweb/index.jsp';
		</script>
<%
		return;
	}
	
	wf.setUser(sid);
	wf.userFolderExists();
	
	/*
	ArrayList<String> seArryPath = null;
	seArryPath = (ArrayList<String>) session.getAttribute("seArryPath");
	if(seArryPath == null || seArryPath.size() == 0){ // 최초 실행시
		seArryPath = new ArrayList<String>();
		seArryPath.add(wf.getUser());
		
		session.setAttribute("seArryPath", seArryPath);
	}
	
	wf.setCrPath(seArryPath);
	*/
	String path = request.getParameter("path");
	if(path == null){
		path = wf.getUser();
		String tempTag2 = "";
		
		wf.setCrPath(path);
	} else {
		wf.setCrPath(path);
	}
	
	ArrayList<UserFileDTO> arryUserFileDTO = new ArrayList<UserFileDTO>();
	arryUserFileDTO = wf.getListAll();
%>
<body>
	<%@ include file="/header/header.jsp" %>
	<section>
		<article>
			<h2>~님 Y드라이브</h2>
			<fieldset>
				<legend>기본 사용 정보</legend>
				<ul>
					<li><label>총용량</label>
						<meter value="<%=wf.getTotalSize() %>" max="<%=wf.getTotalSize() %>" min="0"></meter>
					</li>
					<li><label>사용용량</label>
						<meter value="<%=wf.getUsedSize() %>" max="<%=wf.getTotalSize() %>" min="0"></meter>
					</li>
					<li><label>남은용량</label>
						<meter value="<%=wf.getFreeSize() %>" max="<%=wf.getTotalSize() %>" min="0"></meter>
					</li>
				</ul>
			</fieldset>
		</article>
		<article>
			<fieldset>
				<legend>탐색기</legend>
				<input type="button" value="파일올리기">
				<input type="button" value="폴더만들기">
				<table>
					<thead>
						<tr>
							<th>분류</th>
							<th>파일명 및 폴더명</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<% 	
							if( !(wf.getCrPath().equals(wf.getUser())) ){
								
								String tempTag2 = "";
								
								tempTag2 = "/myweb/section/wf/webFolder.jsp?path="+path.substring(0, path.lastIndexOf("/"));
									
						%>
							<tr>
								<td><img src="/myweb/img/webfolder/back.gif"></td>
								<td><a href="<%=tempTag2%>">뒤로 돌아가기</a></td>
							</tr>
						<%  
							}
							for(int i = 0 ; i < arryUserFileDTO.size() ; i++){
								String crPath = arryUserFileDTO.get(i).getCrPath();
								String fileName = arryUserFileDTO.get(i).getFileName();
								boolean isDirectory = true;//arryUserFileDTO.get(i).isDirectory();
								
								String tempTag = "";
								tempTag += "<a href='/myweb/section/wf/webFolder.jsp?path=" + crPath + "/" + fileName + "'>" + fileName + "</a>";
									
						%>
								<tr>
									<td><%= isDirectory==true ? "<img src='/myweb/img/webfolder/folder.gif'>" : "<img src='/myweb/img/webfolder/unknown.gif'>" %></td>
									<td><%= isDirectory==true ? tempTag : "<a href='" + crPath + "/" + fileName + "'>" + fileName + "</a>" %></td>
									<td></td>
								</tr>		
						<%		
							}
						%>
					</tbody>
				</table>		
			</fieldset>
		</article>
	</section>
	<%@ include file="/footer/footer.jsp" %>
</body>
</html>